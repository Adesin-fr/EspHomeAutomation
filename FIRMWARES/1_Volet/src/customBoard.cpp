#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime  = 0;
    byte outputState            = 0;
    String lastEvents           = "";
    int outputTimer;                                    // Timer in SECONDS left for this cover
    byte setupTimer;                                    // Timer in SECONDS setup for this cover
    unsigned long outputStartedMillis;                  // At which time we did started the timer ?
    unsigned long LastReportMillis;                     // At which time did we report status ?
    byte previouslyOpening;                             // Were we opening last time we moved ?
    byte HighValue              = 1;                    // Values used to set the H Bridge
    byte LowValue               = 0;                    // Can be reversed in settings

/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/


void handleBoardSettings() {
      blink();
      String output="";
      String lineData;
      String reportTopic;
      String payload;

      output += "<div align='center'><h1>Settings</h1></div><br>";
      output += "<br>Current settings :<br>";

      if (SPIFFSAvailable){
          /*
            TODO : Settings to implement :
                Reverse direction
                Opening time
          */
          // output += "Payload : <input type=text name=pload><input type=submit value='Save'></form><br>";
      }else{
        output += "<font color='red'><b>SPIFFS NOT AVAILABLE !</b></font>";
      }
      output += "Last events :<br>";
      output += "<blockquote>" + lastEvents + "</blockquote>";

      output += "<br><br><a href='/advSettings'>Advanced Settings</a>";

      output += "<br><br><font size='-5'><a href='/ClearAll'>Clear all settings</a></font>";


      server.send(200, "text/html", output);
} // End handleBoardSettings


void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length){
    String sPayload="";
    String myTopic= topic;
    String sOutNumber;

    for (unsigned int i = 0; i < length; i++) {
        sPayload += (char)payload[i];
    }

    blink();

    if (myTopic.indexOf("/action")){
        // The topic should be like /myboard/action [OPEN|CLOSE|TOGGLE]
        // Toggle the power relay ON
        if (sPayload == "OPEN"){
            lastEvents += "Received an OPEN action\n";
            openCover();
        }
        if (sPayload == "CLOSE"){
            lastEvents += "Received a CLOSE action\n";
            closeCover();
        }
        if (sPayload == "STOP"){
            lastEvents += "Received a STOP action\n";
            stopCover();
        }
        if (sPayload == "TOGGLE"){
            lastEvents += "Received a TOGGLE action: ";
            // We are already moving, so stop the cover !
            if (outputStartedMillis!=0){
                lastEvents += "Stopping the cover\n";
                stopCover();
            }else{
                // We are not moving, move now.
                if (previouslyOpening){
                    lastEvents += "Closing the cover\n";
                    closeCover();
                }else{
                    lastEvents += "Opening the cover\n";
                    openCover();
                }
            }
        }

    }else if  (myTopic.indexOf("/setPosition/")){
        // Set the output timer :
        // TODO: convert the percent position to timer :
        outputTimer = atoi(sPayload.c_str());
        if (outputTimer > setupTimer){
            outputTimer = setupTimer;
        }
        if (outputTimer!=0 ){
            lastEvents += "Received a SETPOSITION to action\n";
            outputStartedMillis = millis();
            flushOutput();
        }
    }

}   // End handleMqttIncomingMessage


void flushOutput(){
    byte nbLines=0;
    int pos;

    // flush the output to the serial register
	digitalWrite(PIN_RCLK, LOW);                             // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, outputState);     // Push bits
    digitalWrite(PIN_RCLK, HIGH);                            // Unlock latch

    // Trim the lastEvents logs :
    // Keep track of the last 10 events :
    // Count how many \n we have, if we have more thant 10, remove the first line
    for (unsigned int i=0; i<lastEvents.length(); i++){
        if (lastEvents.c_str()[i]=='\n'){
            nbLines++;
        }
    }
    if (nbLines>10){
        pos=lastEvents.indexOf('\n');           // Get the position of the first carriage return
        lastEvents = lastEvents.substring(pos); // Take the string after the first carriage.
    }

}   // End setOutput


void openCover(){
    bitWrite(outputState, 7, HighValue);
    bitWrite(outputState, 6, LowValue);
    bitWrite(outputState, 5, HighValue);
    previouslyOpening = true;

    // Start the timer.
    outputStartedMillis = millis();
    outputTimer = setupTimer;
    flushOutput();
}


void closeCover(){
    bitWrite(outputState, 7, HighValue);
    bitWrite(outputState, 6, HighValue);
    bitWrite(outputState, 5, LowValue);
    previouslyOpening = false;

    // Start the timer.
    outputStartedMillis = millis();
    outputTimer = setupTimer;
    flushOutput();
}


void stopCover(){
    bitWrite(outputState, 7, LowValue);
    bitWrite(outputState, 6, LowValue);
    bitWrite(outputState, 5, LowValue);

    flushOutput();

    previouslyOpening = false;
    outputStartedMillis = 0;
    reportOutputState();
}



void reportOutputState(){
    String reportTopic="";
    String payload="";

    /*
     * Currently, we only report two states.
     * Later, we should report the percentage of opening.
     */

    reportTopic = baseTopic + "/state";
    if (previouslyOpening == true){
        payload = "OPENED";
    }else{
        payload = "CLOSED";
    }
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportOutputState


void boardSetup(){
    // Set pins mode :
    pinMode( PIN_SRCLK, OUTPUT);
    pinMode( PIN_SER, OUTPUT);
    pinMode( PIN_RCLK, OUTPUT);

    // read default outputTimer in file :
    setupTimer         = atoi(loadLineFromFile("/setupTimer.txt","0").c_str());    // Timer in SECONDS for each output
    outputStartedMillis = 0;

    // The board is subscribed to his own baseTopic, in the baseBoardSetup function.


} // End boardSetup



void boardLoop(){
    // Should we shut off any output that timer as ended ?
    if (outputStartedMillis!=0){
        // This timer needs to be checked ;
        if (outputStartedMillis + outputTimer <= millis() ){
            // The timer has expired, stop it !
            outputStartedMillis = 0;
            // Set the output to OFF.
            bitWrite(outputState, 7, LowValue);
            bitWrite(outputState, 6, LowValue);
            bitWrite(outputState, 5, LowValue);
            flushOutput();
            reportOutputState();
        }

        // We are moving, so refresh our state :
        if (millis() > LastReportMillis+1000 ){
            LastReportMillis = millis();
            // TODO : evaluate opening percentage....
            // reportOutputState();

        }
    }

} // End boardLoop
