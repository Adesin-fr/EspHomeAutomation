#include "baseBoard.h"
#include "customBoard.h"

String baseTopic;
boolean mqttConnected=false;
String mqttServer;
unsigned int mqttPort;
unsigned int webServerPort;
unsigned int MQTT_NUM_TRIES;      // How many times should we try to connect to mqtt broker ?
boolean SPIFFSAvailable=false;
boolean needReboot=false;
WiFiClient espClient;
PubSubClient myMqtt(espClient);
String myHostName;
ESP8266WebServer server(webServerPort);
EspSaveCrash SaveCrash;                   // Save crashes informations to EEPROM to retrieve later !
ESP8266HTTPUpdateServer httpUpdater;
WiFiManager wifiManager;


void blink(){
      #ifdef UseLED
          // Blink the LED.
          digitalWrite(BlueLED, LED_ON);   // Set the LED ON
          delay(10);                  // Let it ON for 10ms
          digitalWrite(BlueLED, LED_OFF);   // Set the LED OFF
      #endif
    }


void handleResetWifi(){
        wifiManager.resetSettings();
    }


void handleReboot() {
    blink();
    String output="";

    output += "<div align='center'><h1>Rebooting, please wait...</h1></div>";
    output += "<script>setTimeout(function(){window.location.href='/advSettings';},5000);</script>";  // Reload after 5 seconds

    server.send(200, "text/html", output);
    delay(1000);

    ESP.restart();
}


void handleSettingChange(){
    String arg;
    String fileName;

    if (server.args() == 1) {
        arg=server.arg(0);
        fileName="/" + server.argName(0) + ".txt";
        saveLineToFile(fileName.c_str(), arg.c_str());
        needReboot = true;
    }else{
    return server.send(500, "text/plain", "There must be only one setting.");
    }
    handleAdvancedSettings();
}



void handleAdvancedSettings(){
    blink();
    String output="";

    output += "<div align='center'><h1>Advanced Settings</h1></div><br>";
    output += "<table border=1><th>Setting Name</th><th>Value</th>";

    output += "<form action='/setNewSetting'><tr><td>Hostname :</td><td><input name='hostname' value='" + myHostName + "'> <input type=submit value='Change'><td></tr></form>";
    output += "<form action='/setNewSetting'><tr><td>Web Server Port :</td><td><input name='webServerPort' value='" + String(webServerPort) + "'> <input type=submit value='Change'></td></tr></form>";
    output += "<form action='/setNewSetting'><tr><td>Mqtt Server ip :</td><td><input name='mqttServer' value='" + mqttServer + "'> <input type=submit value='Change'></td></tr></form>";
    output += "<form action='/setNewSetting'><tr><td>Mqtt Server Port :</td><td><input name='mqttServerPort' value='" + String(mqttPort) + "'> <input type=submit value='Change'></td></tr></form>";
    output += "<form action='/setNewSetting'><tr><td>Mqtt Base Topic :</td><td><input name='mqttBaseTopic' value='" + baseTopic + "'> <input type=submit value='Change'></td></tr></form>";
    output += "<form action='/setNewSetting'><tr><td>Mqtt Connection tries :</td><td><input name='mqttNumTries' value='" + String(MQTT_NUM_TRIES) + "'> <input type=submit value='Change'></td></tr></form>";

    output += "</table><br>";
    output += "<form action='/reboot' ><input type=submit value='Reboot'></form><br><br><br>";
    output += "<a href='/resetWifi'>Reset wifi settings</a><br>";

    if (needReboot){
        output += "<font color='red'><b>Settings has changed, a reboot is needed !</b></font>";
    }

    server.send(200, "text/html", output);

}


String loadLineFromFile(const char*  fileName,  const char* defaultValue){
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


void mqttReport(){
      String reportTopic="";
      String payload="";

      if (mqttConnected){

          /*
              Send status report :
                  esp/#devicename#/system/rssi								// sends device's RSSI in dBm
                  esp/#devicename#/system/ipaddress							// sends device's IP
                  esp/#devicename#/system/subnetmask							// sends device's subnet mask
                  esp/#devicename#/system/gatewayip							// sends device's gateway IP
                  esp/#devicename#/system/dnsip								// sends device's DNS IP
                  esp/#devicename#/system/macaddress							// sends device's MAC address
             */

           reportTopic = baseTopic + "/system/freeHeap";
           payload = ESP.getFreeHeap();
           myMqtt.publish(reportTopic.c_str(), payload.c_str());

           int uptime = millis()/1000;
           reportTopic = baseTopic + "/system/uptime";
           payload = uptime;
           myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/rssi";
          payload = WiFi.RSSI();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/ipaddress";
          payload = WiFi.localIP().toString();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/subnetmask";
          payload = WiFi.subnetMask().toString();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/gatewayip";
          payload = WiFi.gatewayIP().toString();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/dnsip";
          payload = WiFi.dnsIP().toString();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

          reportTopic = baseTopic + "/system/macaddress";
          payload = WiFi.macAddress();
          myMqtt.publish(reportTopic.c_str(), payload.c_str());

       }
       blink();

  }  // End mqttReport


void handleHttpRoot(){
          blink();
          String output="";

          output += "<div align='center'><h1><a href='/baseSettings'>Board Settings</a></h1></<br>";
          output += "<h1><a href='/advSettings'>Advanced Settings</a></h1></div>";

          server.send(200, "text/html", output);
      }


void mqttMessageArrived(char* topic, byte* payload, unsigned int length) {
          /*
           * Handling incoming MQTT messages
           */

          String sPayload="";
          String myTopic= topic;

          for (unsigned int i = 0; i < length; i++) {
              sPayload += (char)payload[i];
          }

          blink();

          // Handle generic topics
          if (myTopic==(baseTopic + "/report")){
              mqttReport();
          }else if  (myTopic==(baseTopic + "/system/reboot")){
              // Reboot this host
              ESP.restart();
          }
          // Now, handle node-specific topics ...
          handleMqttIncomingMessage(topic, payload, length);
      } // End mqttMessageArrived



void baseSetup(){

        unsigned int mqttConnectTries=0;
        //blink LED quickly 5 times on startup
        #ifdef UseLED
            pinMode(BlueLED, OUTPUT);
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
                myHostName = loadLineFromFile("/hostname.txt", "newESP");
                mqttServer = loadLineFromFile("/mqttServer.txt", "192.168.8.1");
                webServerPort = atoi(loadLineFromFile("/webServerPort.txt", "8000").c_str());
                mqttPort =  atoi(loadLineFromFile("/mqttServerPort.txt", "1883").c_str());
                MQTT_NUM_TRIES =  atoi(loadLineFromFile("/mqttNumTries.txt", "5").c_str());

                baseTopic = String("/esp/") + myHostName;
                baseTopic = loadLineFromFile("/mqttBaseTopic.txt", baseTopic.c_str());
                #ifdef UseSerial
                    Serial.print("Base Topic set to ");
                    Serial.println(baseTopic);                        // Tell us what network we're connected to
                #endif

            }else{
                #ifdef UseSerial
                    Serial.println("Error opening SPIFFS !");
                #endif
                SPIFFSAvailable=false;
                myHostName="newESP";
            }

            WiFi.hostname(myHostName.c_str());

            if (SPIFFSAvailable){
                if (!SPIFFS.exists("/inputSettings.dat")){
                    File ftouch = SPIFFS.open("/inputSettings.dat","w");
                    ftouch.close();
                }
            }

            // Disable serial output if needed
            #ifdef UseSerial
              wifiManager.setDebugOutput(true);
            #else
              wifiManager.setDebugOutput(false);
            #endif

            wifiManager.setConfigPortalTimeout(300);
            if (!wifiManager.autoConnect("newESP")){
                #ifdef UseSerial
                    Serial.println("Wifi connection failed! Resetting !");
                #endif
               delay(3000);
               ESP.reset();
            }

            #ifdef UseSerial
                Serial.print("Connected to ");
                Serial.println(WiFi.SSID());                        // Tell us what network we're connected to
                Serial.print("IP address:\t");
                Serial.println(WiFi.localIP());
                Serial.print("Hostname:\t");
                Serial.println(WiFi.hostname());
            #endif


            /*
             *  Set the MQTT Client
             */
            myMqtt.setServer(mqttServer.c_str(), mqttPort);
            myMqtt.setCallback(mqttMessageArrived);

            while (!myMqtt.connected() && mqttConnectTries<MQTT_NUM_TRIES) {
                mqttConnectTries++;
                #ifdef UseSerial
                    Serial.print("Connecting to MQTT (try ");
                    Serial.print(mqttConnectTries);
                    Serial.print(")... ");
                #endif

                if (myMqtt.connect(myHostName.c_str())) {
                    mqttConnected = true;
                    #ifdef UseSerial
                        Serial.println("Connected !");
                    #endif
                } else {
                    #ifdef UseSerial
                        Serial.print("Failed with state ");
                        Serial.println(myMqtt.state());
                    #endif
                    delay(2000);
                }

            }

            // if we managed to connect to mqtt server, send report and subscribe. Else continue without mqtt connection...
            if (mqttConnected){
                // Always send a MQTT Report at startup
                mqttReport();

                #ifdef HASS_AUTODISCOVERY
                    // Send MQTT Home assistant Discovery messages
                    mqttSendHassDiscovery();
                #endif


                // Subscribe to the topic we are interrested in :
                String subscribedTopic;
                subscribedTopic = baseTopic + "/#";
                myMqtt.subscribe(subscribedTopic.c_str());

                // Send crash informations :
                File fw = SPIFFS.open("/crash.txt", "w");
                SaveCrash.print(fw);
                fw.close();
                SaveCrash.clear();
                File fr = SPIFFS.open("/crash.txt","r");
                String lineData;
                String reportTopic;
                reportTopic =  baseTopic + "/crash";
                while(fr.available()) {
                    lineData = fr.readStringUntil('\n');
                    myMqtt.publish(reportTopic.c_str(), lineData .c_str());
                }
            }



                if (!MDNS.begin(myHostName.c_str())) {             // Start the mDNS responder for hostname.local
                    #ifdef UseSerial
                        Serial.println("Error setting up MDNS responder!");
                    #endif
                }
                #ifdef UseSerial
                    Serial.println("mDNS responder started");
                #endif

                MDNS.addService("http", "tcp", webServerPort);


                server.on("/", handleHttpRoot);
                server.on("/reboot", handleReboot);
                server.on("/setNewSetting", handleSettingChange);
                server.on("/baseSettings", handleBoardSettings);
                server.on("/advSettings", handleAdvancedSettings);
                server.on("/resetWifi", handleResetWifi);

                // Updater page :
                httpUpdater.setup(&server);
                // Start the server
                server.begin(webServerPort);

                #ifdef UseSerial
                    Serial.print("Web server started at ");
                    Serial.print(WiFi.localIP());
                    Serial.print(":");
                    Serial.println(webServerPort);
                #endif
}

void baseLoop(){
    // Check if Wifi is still connected :
    if (WiFi.status() != WL_CONNECTED){
        #ifdef UseSerial
            Serial.println("Wifi disconnected. Reseting !");
        #endif
        delay(100);
        ESP.restart();
    }
    // Handle http client requests:
    server.handleClient();

    // Handle MQTT incoming messages :
    if (mqttConnected){
        myMqtt.loop();
    }

    // Should we post a mqtt report ?
    unsigned long diff = millis() - previousTime;
    if(diff > (mqttReportInterval*1000)) {
        mqttReport();
        previousTime = millis();
    }

}
