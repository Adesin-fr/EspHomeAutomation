/*
    MEAS.h - My ESP Are Smart

    This library will  ...

    To use this library, you also need/////

    Ludovic LEMARINEL
    2019-04-18 : Initial version

    MEAS Library by Ludovic LEMARINEL is licensed under GPL


*/

#include <MEAS.h>

unsigned int httpReportFrequency;          // delay in seconds between health Reports
boolean SPIFFSAvailable;
boolean needReboot;
String myHostName;
unsigned long wifiLostTime;            // This variable is set when wifi is lost
unsigned long previoushttpReportTime;
byte numCarte;
unsigned int disconnectCount;
unsigned long tcpReceived;
unsigned long tcpSent;
unsigned long disconnectDuration ;

WiFiClient espClient;
EspSaveCrash _saveCrash;                   // Save crashes informations to EEPROM to retrieve later !
WiFiManager _wifiManager;
ESP8266WebServer server(MEAS_Port);
ESP8266HTTPUpdateServer httpUpdater(true);      // Web updater

String staticIP="";
String staticGW="";
String staticSN="";


boolean createFileIfNotExist(String fileName){
    if (SPIFFSAvailable){
        if (!SPIFFS.exists(fileName.c_str()) ) {
            File ftouch = SPIFFS.open(fileName.c_str(),"w");
            ftouch.close();
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}


void handleAdvSettings(){
        blink();
        tcpReceived++;
        String output="";

        output += "<div align='center'><h1>Advanced Settings</h1></div><br>";
        output += "<table border=1><th>Setting Name</th><th>Value</th>";


        // TODO : Apply variables without reboot ?
        output += "<form action='/setNewSetting'><tr><td>Static IP :</td><td><input name='staticIP' value='" + staticIP + "'> <input type=submit value='Change'></td></tr></form>";
        output += "<form action='/setNewSetting'><tr><td>Static GateWay :</td><td><input name='staticGW' value='" + staticGW + "'> <input type=submit value='Change'></td></tr></form>";
        output += "<form action='/setNewSetting'><tr><td>Static SubNet :</td><td><input name='staticSN' value='" + staticSN + "'> <input type=submit value='Change'></td></tr></form>";
        output += "<form action='/setNewSetting'><tr><td>Hostname :</td><td><input name='myHostName' value='" + myHostName + "'> <input type=submit value='Change'></td></tr></form>";
        output += "<form action='/setNewSetting'><tr><td>UDP Report frequency :</td><td><input name='httpReportFrequency' value='" + String(httpReportFrequency) + "'> <input type=submit value='Change'></td></tr></form>";

        output += "</table><br>";
        output += "<form action='/reboot' ><input type=submit value='Reboot'></form><br><br><br>";
        output += "<a href='/resetWifi'>Reset wifi settings</a><br>";
        output += "<br><a href='/update'>Update firmware</a><br>";

        if (needReboot){
            output += "<font color='red'><b>Settings has changed, a reboot is needed !</b></font>";
        }

        server.send(200, "text/html", output);
    }


void handleResetWifi(){
    blink();
    _wifiManager.resetSettings();

    delay(1000);
    ESP.reset();

}


void handleReboot(){
    blink();
    String output="";

    output += "<div align='center'><h1>Rebooting ! Please wait !</h1></div><br>";

    server.send(200, "text/html", output);

    delay(1000);
    ESP.reset();

}

void handleGetStats(){
    blink();
    tcpReceived++;
    String output="";
    char dbuf[9];


    unsigned long T=millis()/1000;
    unsigned long D=T / 86400;
    byte H =(T / 3600) % 24 ;
    byte M =(T / 60) % 60;
    byte S = T % 60 ;
    String day = "";
    if (D > 0){
        day = String (D) + String(" days ");
    }

    sprintf(dbuf, "%02d:%02d:%02d",H,M,S);

    output  = String("<h1>Board stats</h1>");
    output += String("<table border=1>");
    output += String("<tr><td>Up Time :</td><td>") + day + String(dbuf)  + String("</td></tr>");
    output += String("<tr><td>RSSI :</td><td>") + String(WiFi.RSSI()) + String("</td></tr>");
    output += String("<tr><td>Free Heap Space :</td><td>") + String(ESP.getFreeHeap()) + String("</td></tr>");
    output += String("<tr><td>Wifi disconnects count :</td><td>") + String(disconnectCount) + String("</td></tr>");
    output += String("<tr><td>Last disconnect duration :</td><td>") + String( disconnectDuration ) + String("</td></tr>");
    output += String("<tr><td>TCP queries Received  :</td><td>") + String(tcpReceived) + String("</td></tr>");
    output += String("<tr><td>TCP queries Sent :</td><td>") + String(tcpSent) + String("</td></tr>");
    output += String("</table>");

    server.send(200, "text/html", output);

}

void baseBegin(){
        //blink LED quickly 5 times on startup
        #ifdef UseLed
            pinMode(LED_PIN, OUTPUT);
            for(int x=0; x<=5;x++){
                blink();
                delay(100);
            }
        #endif

        #ifdef UseSerial
            Serial.begin(115200);
            delay(10);
            Serial.println('\n');
        #endif

        // Mount the SPIFFS storage :
        if (SPIFFS.begin()){
            SPIFFSAvailable=true;
            #ifdef UseSerial
                Serial.println("SPIFFS begin OK!");
            #endif
            // Read settings from files :
            myHostName =loadStringFromFile("/myHostName.txt", "newESP");
            httpReportFrequency = atoi(loadStringFromFile("/httpReportFrequency.txt", "300").c_str());
        }else{
            #ifdef UseSerial
                Serial.println("Error opening SPIFFS !");
            #endif
            SPIFFSAvailable=false;
            myHostName="newMEASDevice";
        }
        WiFi.hostname(myHostName.c_str());

        // Disable serial output if needed
        #ifdef UseSerial
          _wifiManager.setDebugOutput(true);
        #else
          _wifiManager.setDebugOutput(false);
        #endif

        // Set Static IP if defined :
        staticIP = loadStringFromFile("/staticIP.txt","");
        staticGW = loadStringFromFile("/staticGW.txt","");    // Gateway
        staticSN = loadStringFromFile("/staticSN.txt","");    // SubNet

        if (!staticIP.equals("")){
            IPAddress _ip,_gw,_sn;
            _ip.fromString(staticIP);
            _gw.fromString(staticGW);
            _sn.fromString(staticSN);
            _wifiManager.setSTAStaticIPConfig(_ip, _gw, _sn);
        }

        // 5 minutes timeout : if the setup wifi is not available on startup,
        // we setup a captive portal, then we reboot to check again if wifi is back.
        _wifiManager.setConfigPortalTimeout(300);
        if (!_wifiManager.autoConnect("newESP")){
            #ifdef UseSerial
                Serial.println("Wifi connection failed! Resetting !");
            #endif
           delay(3000);
           ESP.reset();
        }

        #ifdef UseSerial
            Serial.print("Connected to ");
            Serial.println(WiFi.SSID());
            Serial.print("IP address:\t");
            Serial.println(WiFi.localIP());
            Serial.print("Hostname:\t");
            Serial.println(WiFi.hostname());
        #endif
        // Set numCarte :
        numCarte = WiFi.localIP()[3];

        // Set auto reconnect :
        WiFi.setAutoReconnect(true);

        // Updater page :
        httpUpdater.setup(&server);

        // Start the server
        server.begin(MEAS_Port);
        server.on("/handleBoardSettings",handleBoardSettings);
        server.on("/advSettings", handleAdvSettings);
        server.on("/setNewSetting", handleSetNewSetting);
        server.on("/getStats", handleGetStats);
        server.on("/",handleBoardSettings);
        server.on("/reboot",handleReboot);
        server.on("/resetWifi",handleResetWifi);


        #ifdef UseSerial
            Serial.print("Web server started at ");
            Serial.print(WiFi.localIP());
            Serial.print(":");
            Serial.println(MEAS_Port);
        #endif

        //Wait 1 second then send udp messages:
        delay(1000);

        // Send reset cause :
        String reportTopic;
        reportTopic = "MQTTUDP://IN16/Report/" + String(numCarte);
        reportTopic += "/resetReason " +  ESP.getResetReason();
        sendUdpMessage(reportTopic);


        // Send last crash informations :
        // Save first the crash to a file.
        File fw = SPIFFS.open("/crash.txt", "w");
        _saveCrash.print(fw);
        fw.close();
        // Clear the crash from eeprom
        _saveCrash.clear();

        // Then send the crash info via MQTT.
        File fr = SPIFFS.open("/crash.txt","r");
        String lineData;

        while(fr.available()) {
            lineData = fr.readStringUntil('\n');
            // Send last crash :
            reportTopic = "MQTTUDP://IN16/Report/" + String(numCarte);
            reportTopic += "/lastCrash " +  lineData;
            sendUdpMessage(reportTopic);
        }
        // Always send a health Report at startup
        healthReport();


    }


void blink(){
  #ifdef UseLed
            // Blink the LED.
            digitalWrite(LED_PIN, HIGH);   // Set the LED ON
            delay(10);                  // Let it ON for 10ms
            digitalWrite(LED_PIN, LOW);   // Set the LED OFF
#endif
    }

/**
*  Returns a string YYYY/MM/DD HH:MM:SS which contains the firmware build date/time.
*/
String getBuildDateTime(){
            char tformat[20]; // 2019/03/05 20:44:02

            DateTime dtc=DateTime(F(__DATE__), F(__TIME__));

            sprintf(tformat,"%d/%02d/%02d %02d:%02d:%02d",
              dtc.year(),
              dtc.month(),
              dtc.day(),
              dtc.hour(),
              dtc.minute(),
              dtc.second()
              );

            return String(tformat);
          }


void healthReport(){
      String udpMess = "";
      String sNumCarte = String(numCarte);
      udpMess = String("MQTTUDP://IN16/Report/") + sNumCarte + String("/Uptime ") + ((int)millis()/1000);
      sendUdpMessage(udpMess);

      udpMess = String("MQTTUDP://IN16/Report/") + sNumCarte +  String("/Rssi ") + (WiFi.RSSI());
      sendUdpMessage(udpMess);

      udpMess = String("MQTTUDP://IN16/Report/") + sNumCarte + String("/FreeHeap ") + (ESP.getFreeHeap());
      sendUdpMessage(udpMess);

      udpMess = String("MQTTUDP://IN16/Report/") + sNumCarte + String("/DisconnectCount ") + String(disconnectCount);
      sendUdpMessage(udpMess);

      udpMess = String("MQTTUDP://IN16/Report/") + sNumCarte + String("/FirmwareBuildDate ") + getBuildDateTime();
      sendUdpMessage(udpMess);

    }


String loadStringFromFile(const char*  fileName,  const char* defaultValue){
          String fname;
          String fileData;

          if (fileName[0]!='/'){
              fname = '/' +  fileName;
          }else{
              fname = String(fileName);
          }
          if (SPIFFSAvailable){

            #ifdef UseSerial
              Serial.print("Reading from ");
              Serial.println(fname);
            #endif
            // this opens the file "f.txt" in read-mode
            File fileread = SPIFFS.open(fname, "r");

            if (!fileread) {
                #ifdef UseSerial
                    Serial.println("File doesn't exist yet. Creating it");
                #endif

                // open the file in write mode
                File fileread = SPIFFS.open(fname, "w");
                if (!fileread) {
                    #ifdef UseSerial
                        Serial.println("file creation failed");
                    #endif
                }
                fileread.print(defaultValue);
                fileData = defaultValue;
            } else {
                // we could open the file
                while(fileread.available()) {
                    //open its content
                    fileData = fileread.readString();
                }
            }
            fileread.close();
          }
          return fileData;
      }


void saveLineToFile(const char* fileName, const char* data){
          String fname = fileName;


          if (fileName[0]!='/'){
              fname = '/' + fileName;
          }

          #ifdef UseSerial
            Serial.print("Saving to ");
            Serial.println(fname);
          #endif

          if (SPIFFSAvailable){
              File fw = SPIFFS.open(fname, "w");
              if (!fw) {
                  #ifdef UseSerial
                      Serial.println("file creation failed");
                  #endif
              }else{
                  fw.print(data);
                  fw.close();
                  #ifdef UseSerial
                      Serial.println("file closed");
                  #endif
              }
        }
    }


void callHttpUrl(String url){
    HTTPClient http;

    tcpSent++;

    http.setTimeout(500);
    // WiFiClient , url
    http.begin(espClient, url);

    http.GET();

}


void sendUdpMessage(String message){
    IPAddress broadcastIp;
    broadcastIp[0] = ~WiFi.subnetMask()[0] | WiFi.gatewayIP()[0];
    broadcastIp[1] = ~WiFi.subnetMask()[1] | WiFi.gatewayIP()[1];
    broadcastIp[2] = ~WiFi.subnetMask()[2] | WiFi.gatewayIP()[2];
    broadcastIp[3] = ~WiFi.subnetMask()[3] | WiFi.gatewayIP()[3];

    WiFiUDP udpClient;

    if (udpClient.beginPacket(broadcastIp, MEAS_UDP_Port)){
        udpClient.write(message.c_str(), message.length());
        udpClient.endPacket();
    }
}


void baseWork(){
        // Check if Wifi is still connected :
        if (WiFi.status() != WL_CONNECTED)
        {

            // keep the time at which we lost connection.
            if (wifiLostTime==0) {
              wifiLostTime=millis();
              disconnectCount++;
            }

            // if we couldnt reconnect within 60s, Reset.
            if (millis() - wifiLostTime >= 60000){
                #ifdef UseSerial
                    Serial.println("Wifi disconnected. Reseting !");
                #endif
                ESP.restart();
            }
        }else{
            if (wifiLostTime!=0)
            {
                disconnectDuration = millis() - wifiLostTime;
                wifiLostTime=0;
                // We recovered wifi,
                // restart the web server :
                server.begin();

                // and send an UDP message to inform about blackout duration
                String udpMess = String("MQTTUDP://IN16/Report/") + String(numCarte) + String("/DisconnectDuration ") + String(disconnectDuration);
                sendUdpMessage(udpMess);

            }

            // Should we post a health report ?
            if(millis() - previoushttpReportTime > (httpReportFrequency*1000)) {
                healthReport();
                previoushttpReportTime = millis();
            }

            // Handle http client requests:
            server.handleClient();
        }
    }
