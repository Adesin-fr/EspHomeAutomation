#include "customBoard.h"

    // Board specific variables

    unsigned long previousTime = millis();
    unsigned long pushTime[SUBNODECOUNT];
    byte pushState[SUBNODECOUNT];
    byte justPushed[SUBNODECOUNT];
    byte justReleasedShortPush[SUBNODECOUNT];
    byte justLongPushed[SUBNODECOUNT];
    byte justReleasedLongPushed[SUBNODECOUNT];
    String lastEvents="";
/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/

void boardSetup(){
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

    // Board specific http handles :
    server.on("/setTargetMqtt", handleInputSettings);
    server.on("/delInRule", handleDelInRule);
    server.on("/ClearAll", handleClearAllRules);


    if (SPIFFSAvailable){
        if (!SPIFFS.exists("/inputSettings.dat")){
            File ftouch = SPIFFS.open("/inputSettings.dat","w");
            ftouch.close();
        }
    }



} // End boardSetup


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
    int pos;
    byte nbLines=0;



    reportTopic =  baseTopic + "/" + numpin + "/state";

    switch (actionType){
        case 0:
            payload =  "PUSH";  // simple push
            actionChar = "P";
            break;
        case 1:
            payload =  "ON";  // push & holded
            actionChar = "H";
            break;
        case 2:
            payload =  "OFF"; // released
            actionChar = "R";
            break;
    }

    myMqtt.publish(reportTopic.c_str(), payload.c_str());

    // Keep track of the 10 last events :
    // Append in the lastEvents logs :
    // Keep track of the last 10 events :
    // Count how many \n we have, if we have more thant 10, remove the first line
    for (unsigned int i=0; i<lastEvents.length(); i++){
        if (lastEvents.c_str()[i]=='\n'){
            nbLines++;
        }
    }
    if (nbLines>10){
        pos=lastEvents.indexOf('\n');
        lastEvents = lastEvents.substring(pos);
    }
    lastEvents += "Input " + String(numpin) + ", Action " + payload + "<br>\n";

    // Check for settings :

    File fileread = SPIFFS.open("/inputSettings.dat", "r");
    while(fileread.available()) {
        //open its content
        dataLine= fileread.readStringUntil('\n');

        // Line is as following :
        // 01|A|/topic/publishingto/state|payload

        if (atoi(dataLine.substring(0,2).c_str())==numpin){
            if (dataLine.substring(3,4)==actionChar){
                // Get position of next pipe (end of topic)
                pos = dataLine.indexOf("|", 5);

                reportTopic = dataLine.substring(5,pos);
                payload = dataLine.substring(pos+1);

                myMqtt.publish(reportTopic.c_str(), payload.c_str());
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


void handleBoardSettings() {
      blink();
      String output="";
      String lineData;
      String reportTopic;
      String payload;
      int lineNum=0;
      int pos;

      output += "<div align='center'><h1>Settings</h1></div><br>";
      output += "<br>Current settings :<br>";

      if (SPIFFSAvailable){

          output += "<table border=1><th>Input Number</th><th>Trigger</th><th>Topic</th><th>Payload</th><th>Action</th>";

          // List here the already definded mqtt targets...
          File fileread = SPIFFS.open("/inputSettings.dat", "r");
          while(fileread.available()) {
              String ln=String(lineNum);
              //open its content
              lineData= fileread.readStringUntil('\n');

              // Get position of next pipe (end of topic)
              pos = lineData.indexOf("|", 5);

              reportTopic = lineData.substring(5,pos);
              payload = lineData.substring(pos+1);

              output +=  "<tr>";
              output +=  "<td>" + lineData.substring(0,2) +"</td>";
              output +=  "<td>" + lineData.substring(3,4) +"</td>";
              output +=  "<td>" + reportTopic +"</td>";
              output +=  "<td>" + payload +"</td>";
              output += "<td><a href=/delInRule?ln=" + ln + ">Delete</a><td>";
              output +=  "</tr>";
              lineNum++;
          }
          fileread.close();
          output += "</table>";

          output += "<br>";

          output += "<form action='/setTargetMqtt'>New input settings : <select name=id>";
          for (int x=0; x<SUBNODECOUNT; x++){
            String sx = String(x);
            output += "<option value=" + sx + + ">" + sx + "</option>";
          }
          output += "</select><br>";
          output += "Trigger : <select name=ac><option value='P'>Push</option><option value='H'>Hold</option><option value='R'>Release</option></select><br>Topic : <input type=text name=topic></br>";
          output += "Payload : <input type=text name=pload><input type=submit value='Save'></form><br>";
      }else{
        output += "<font color='red'><b>SPIFFS NOT AVAILABLE !</b></font>";
      }
      output += "Last events :<br>";
      output += "<blockquote>" + lastEvents + "</blockquote>";

      output += "<br><br><a href='/advSettings'>Advanced Settings</a>";


      output += "<br><br><font size='-5'><a href='/ClearAll'>Clear all settings</a></font>";


      server.send(200, "text/html", output);
} // End handleBoardSettings


void handleInputSettings(){
    blink();

    String inputNumber= server.arg("id");
    String actionType= server.arg("ac");
    String topic = server.arg("topic");
    String pload = server.arg("pload");

    File filew = SPIFFS.open("/inputSettings.dat", "a");
    if (filew){
        filew.printf("%02d|%s|%s|%s\n", atoi(inputNumber.c_str()), actionType.c_str(),topic.c_str(),pload.c_str());
    }
    filew.close();


    handleBoardSettings();
}   // End handleInputSettings


void handleClearAllRules(){
    blink();
    SPIFFS.remove("/inputSettings.dat");
    File ftouch = SPIFFS.open("/inputSettings.dat","w");
    ftouch.close();

    handleBoardSettings();

}   // End  handleClearAllRules



void handleDelInRule(){
    String lineData;
    int lineNum =0;
    int DelNumber = atoi(server.arg("ln").c_str());

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


void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length){
    // This function must be defined, even if left empty
}


void mqttSendHassDiscovery(){
      String reportTopic;

      blink();

      // Present every sub-node we have :
      for (int nodeId = 0; nodeId < SUBNODECOUNT; nodeId++){

          reportTopic = baseTopic + "/" + nodeId + "/config";
          String payload;
          payload  = "{'name':'" + myHostName + nodeId + "', ";
          payload += "'device_class':'switch',";            // light, switch, cover
          payload += "'state_topic':'" + baseTopic + "/" + nodeId + "/state',";
          payload += "'command_topic':'" + baseTopic + "/" + nodeId + "/set',";
          payload += "}";

          myMqtt.publish(reportTopic.c_str(), payload.c_str());
      }

} // End mqttSendHassDiscovery


void boardLoop(){

    // Check pulses and handle them:
    checkPushes();

    // Check each pin and send events :
    for (int numpin=0; numpin<SUBNODECOUNT; numpin++){
      if (justReleasedShortPush[numpin]==1){
        // Clear event :
        justReleasedShortPush[numpin]=0;
        SendSensorStatus(numpin, 0);	// Handle Pulse Event type
      }

      if (justLongPushed[numpin]==1){
        // Clear event :
        justLongPushed[numpin]=0;
        SendSensorStatus(numpin, 1);	// Handle Hold Event type
      }

      if (justReleasedLongPushed[numpin]==1){
        // Clear event :
        justReleasedLongPushed[numpin]=0;
        SendSensorStatus(numpin, 2);	// Handle Release Event type
      }
    }

} // End boardLoop
