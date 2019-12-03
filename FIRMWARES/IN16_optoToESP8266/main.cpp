#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <ESP8266HTTPUpdateServer.h>  //  To upload through terminal you can use: curl -F "image=@firmware.bin" esp8266-webupdate.local/update
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <DNSServer.h>              // Needed for WiFiManager library
#include <WiFiManager.h>            //https://github.com/tzapu/WiFiManager
#include <EspSaveCrash.h>
#include <FS.h>
#include "MEAS.h"

#define UseLED                          // Is the LED used ?
#define SUBNODECOUNT    16              // how many sub-nodes should we present
#define SHORTPULSE      60		        // Temps pour un appui court en ms
#define LONGPULSE       500		        // Temps pour un appui long en ms

#define PIN_MUX1    16
#define PIN_MUX2    14
#define MUXA	      3
#define MUXB	      5
#define MUXC	      4

#define BUTTON_STATUS_NONE 0
#define BUTTON_STATUS_PULSE_BEGIN 1
#define BUTTON_STATUS_PULSE_END 2
#define BUTTON_STATUS_HOLD_BEGIN 3
#define BUTTON_STATUS_HOLD_END 4



unsigned long previousTime = millis();
unsigned long pushTime[SUBNODECOUNT];
byte pushState[SUBNODECOUNT];
byte justPushed[SUBNODECOUNT];
byte justReleasedShortPush[SUBNODECOUNT];
byte justLongPushed[SUBNODECOUNT];
byte justReleasedLongPushed[SUBNODECOUNT];
File fsUploadFile;

// #define UseSerial             // Use serial connection for debugging?

    // All functions prototypes :

    boolean lirePin(byte numPin){
        // set MUXer pins MUXA/B/C
        digitalWrite(MUXA, bitRead(numPin,0));
        digitalWrite(MUXB, bitRead(numPin,1));
        digitalWrite(MUXC, bitRead(numPin,2));

        // Wait a few microseconds for the MUXer to actually change :
        //delayMicroseconds(1);
        delay(1);

        // Lire l'entrée
        if (numPin<8){
            return digitalRead(PIN_MUX1);
        }else{
            return digitalRead(PIN_MUX2);
        }
    } // End lirePin


     void SendSensorStatus(byte numpin, byte actionType){
        String reportTopic="";
        String payload="";
        String actionChar;
        String dataLine;


        switch (actionType){
            case 0:
                payload =  "PUSH";  // simple push
                actionChar = "P";
                break;
            case 1:
                payload =  "HOLD";  // push & holded
                actionChar = "H";
                break;
            case 2:
                payload =  "OFF"; // released
                actionChar = "R";
                break;
        }

        String udpMess = String("MQTTUDP://IN16/Event/") + String(numCarte)
                        + String("/") + String(numpin)
                        + " " + payload;
        sendUdpMessage(udpMess);

        // Check for settings :

        File fileread = SPIFFS.open("/inputSettings.dat", "r");
        while(fileread.available()) {
            //open its content
            dataLine= fileread.readStringUntil('\n');

            // Line is as following :
            // 01|A|UrlToCall

            if (atoi(dataLine.substring(0,2).c_str())==numpin){
                if (dataLine.substring(3,4)==actionChar){
                    reportTopic = dataLine.substring(5);
                    callHttpUrl(reportTopic);
                }
            }
        }
        fileread.close();

    }   // End SendSensorStatus


    void checkPushes(){
    	for (int numpin=0; numpin<SUBNODECOUNT; numpin++){
    		if (lirePin(numpin)==LOW){
    			// Si on a pas encore enregistré d'heure d'appui, on l'enregistre.
    			if (pushTime[numpin]==0){
    					pushTime[numpin]=millis();
    			}else{
    				// On vérifie depuis combien de temps le bouton est appuyé. Si plus de SHORTPULSE alors on enregistre l'appui dans le tableau :
    				if (millis() >= (pushTime[numpin]+SHORTPULSE)	&& justPushed[numpin]==0 && pushState[numpin]==BUTTON_STATUS_NONE){
    				#ifdef UseSerial
          		            Serial.print("Push begin button");
    						Serial.println(numpin);
    					#endif
    					pushState[numpin]=BUTTON_STATUS_PULSE_BEGIN;
    				}
    				// On a deja enregistré l'etat 1, passer au 2 ?
    				if (millis() >= (pushTime[numpin]+LONGPULSE)	&& pushState[numpin]==BUTTON_STATUS_PULSE_BEGIN ){
    						pushState[numpin]=BUTTON_STATUS_HOLD_BEGIN;
    						justLongPushed[numpin]=1;
    				}
    			}
    		}else{
    			if (pushState[numpin]==BUTTON_STATUS_HOLD_BEGIN){
    				justReleasedLongPushed[numpin]=1;
    			}
    			if (pushState[numpin]==BUTTON_STATUS_PULSE_BEGIN){
    				#ifdef UseSerial
    					Serial.print("Push end button");
    					Serial.println(numpin);
    				#endif
    				justReleasedShortPush[numpin]=1;
    			}
    			pushTime[numpin]=0;
    			justPushed[numpin]=0;
    			pushState[numpin]=BUTTON_STATUS_NONE;
    		}
    	}
    }   // End checkPushes



    void HandleUploadNewSettings()      // upload a new settings file to the SPIFFS
    { 
        tcpReceived++;

        HTTPUpload& upload = server.upload();
        
        if(upload.status == UPLOAD_FILE_START){
            String filename = "/inputSettings.dat";
            
            fsUploadFile = SPIFFS.open(filename, "w");            // Open the file for writing in SPIFFS (create if it doesn't exist)
            
        } else if(upload.status == UPLOAD_FILE_WRITE)
        {
            if(fsUploadFile)
                fsUploadFile.write(upload.buf, upload.currentSize); // Write the received bytes to the file
        } else if(upload.status == UPLOAD_FILE_END)
        {
            if(fsUploadFile) {                                    // If the file was successfully created
                fsUploadFile.close();                               // Close the file again
                server.sendHeader("Location","/");      // Redirect the client to the success page
                server.send(303);
            } else {
                server.send(500, "text/plain", "500: couldn't create file");
            }
        }
    }


    void handleBoardSettings() {
          String output="";
          String lineData;
          String reportTopic;
          int lineNum=0;

          tcpReceived++;
          blink();

          output += "<div align='center'><h1>Settings</h1></div><br>";
          output += "<br>Current settings :<br>";

          if (SPIFFSAvailable){

              output += "<table border=1><th>Input Number</th><th>Trigger</th><th>Url</th><th>Action</th>";

              // List here the already definded mqtt targets...
              File fileread = SPIFFS.open("/inputSettings.dat", "r");
              while(fileread.available()) {
                  String ln=String(lineNum);
                  //open its content
                  lineData= fileread.readStringUntil('\n');

                  // Get position of next pipe (end of topic)

                  reportTopic = lineData.substring(5);

                  output +=  "<tr>";
                  output +=  "<td>" + lineData.substring(0,2) +"</td>";
                  output +=  "<td>" + lineData.substring(3,4) +"</td>";
                  output +=  "<td>" + reportTopic +"</td>";
                  output += "<td><a href=/delInRule?ln=" + ln + ">Delete</a></td>";
                  output +=  "</tr>";
                  lineNum++;
              }
              fileread.close();
              output += "</table>";

              output += "<br>";

              // Uploading form :
              output += "<br>Upload a new <a href=\"/getSettingsFile\">settings file</a> :<br>";
              output += "<form method=\"post\" enctype=\"multipart/form-data\" action=uploadNewSettings>";
              output += "<input type=\"file\" name=\"filename\">";
              output += "<input class=\"button\" type=\"submit\" value=\"Upload\">";
              output += "</form>";


              output += "<form action='/setTargetHttp'>New input settings : <select name=id>";
              for (int x=0; x<SUBNODECOUNT; x++){
                String sx = String(x);
                output += "<option value=" + sx + + ">" + sx + "</option>";
              }
              output += "</select><br>";
              output += "Trigger : <select name=ac><option value='P'>Push</option><option value='H'>Hold</option><option value='R'>Release</option></select><br>Url : <input type=text name=topic></br>";
              output += "<input type=submit value='Save'></form><br>";
          }else{
            output += "<font color='red'><b>SPIFFS NOT AVAILABLE !</b></font>";
          }

          output += "<br><br><a href='/advSettings'>Advanced Settings</a>";

          output += "<br><br><font size='-5'><a href='/ClearAll'>Clear all settings</a></font>";

          server.send(200, "text/html", output);
    } // End handleBoardSettings


    void setTargetHttp(){
        blink();
        tcpReceived++;

        String inputNumber= server.arg("id");
        String actionType= server.arg("ac");
        String topic = server.arg("topic");

        File filew = SPIFFS.open("/inputSettings.dat", "a");
        if (filew){
            filew.printf("%02d|%s|%s\n", atoi(inputNumber.c_str()), actionType.c_str(),topic.c_str());
        }
        filew.close();


        handleBoardSettings();
    }   // End setTargetHttp


    void handleGetSettingsFile()
    {
        blink();
        tcpReceived++;

        String contentType = "text/html";
        File file = SPIFFS.open("/inputSettings.dat", "r");    // Open the file
        server.streamFile(file, contentType);                  // Send it to the client
        file.close();                                          // Close the file again
    }

    void handleClearAllRules(){
        blink();
        tcpReceived++;


        SPIFFS.remove("/inputSettings.dat");
        createFileIfNotExist("/inputSettings.dat");

        handleBoardSettings();

    }   // End  handleClearAllRules


    void handleSetNewSetting(){
          String arg;
          String fileName;
          tcpReceived++;

          if (server.args() == 1) {
            arg=server.arg(0);
            fileName="/" + server.argName(0) + ".txt";
            saveLineToFile(fileName.c_str(), arg.c_str());
          }else{
            return server.send(500, "text/plain", "There must be only one setting.");
          }
          handleAdvSettings();
      }



    void handleDelInRule(){
        String lineData;
        int lineNum =0;
        int DelNumber = atoi(server.arg("ln").c_str());
        tcpReceived++;

        blink();

        // Read all line, and copy all data EXCEPT line number to newData file.
        File fileread = SPIFFS.open("/inputSettings.dat", "r");
        File filewrite = SPIFFS.open("/newData", "w");
        while(fileread.available()) {
            lineData= fileread.readStringUntil('\n');
            if (lineNum != DelNumber){
                filewrite.printf("%s\n", lineData.c_str());
            }
            lineNum++;
        }
        filewrite.close();
        fileread.close();

        SPIFFS.remove("/inputSettings.dat");
        SPIFFS.rename("/newData", "/inputSettings.dat");


        handleBoardSettings();

    }   // End handleDelInRule



void setup() {
    
    // Set pins mode :
    pinMode( PIN_MUX1, INPUT_PULLUP);
    pinMode( PIN_MUX2, INPUT_PULLUP);
    pinMode( MUXA, OUTPUT);
    pinMode( MUXB, OUTPUT);
    pinMode( MUXC, OUTPUT);

    // Set arrays
    for (int i=0; i< SUBNODECOUNT; i++) {
        pushTime[i]=0;
        justPushed[i]=0;
    }

    staticIP = loadStringFromFile("staticIP.txt","");
    staticGW = loadStringFromFile("staticGW.txt","");    // Gateway
    staticSN = loadStringFromFile("staticSN.txt","");    // SubNet


    baseBegin();

    // Board specific http handles :
    server.on("/setTargetHttp", setTargetHttp);
    server.on("/delInRule", handleDelInRule);
    server.on("/ClearAll", handleClearAllRules);
    server.on("/getSettingsFile", handleGetSettingsFile);
    
    server.on("/uploadNewSettings", HTTP_POST, HandleUploadNewSettings);

    createFileIfNotExist("/inputSettings.dat");

} // End setup

void loop() {
    // Check pulses and handle them:
    checkPushes();

    // Check each pin and send events :
    for (int numpin=0; numpin<SUBNODECOUNT; numpin++){
          if (justReleasedShortPush[numpin]==1){
                // Clear event :
                justReleasedShortPush[numpin]=0;
                SendSensorStatus(numpin, 0);	// Handle Pulse Event type
            }else if (justLongPushed[numpin]==1){
                // Clear event :
                justLongPushed[numpin]=0;
                SendSensorStatus(numpin, 1);	// Handle Hold Event type
            }else if (justReleasedLongPushed[numpin]==1){
                // Clear event :
                justReleasedLongPushed[numpin]=0;
                SendSensorStatus(numpin, 2);	// Handle Release Event type
          }
    }

    baseWork();

} // End Loop
