#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime  = 0;
    byte outputState            = 0;
    String lastEvents           = "";
    int outputTimer[SUBNODECOUNT];    // Timer in SECONDS for each output
    unsigned long outputStartedMillis[SUBNODECOUNT];    // Timer in SECONDS for each output

/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/


void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length){
    String sPayload="";
    String myTopic= topic;
    String sOutNumber;
    byte numPin;

    for (unsigned int i = 0; i < length; i++) {
        sPayload += (char)payload[i];
    }

    blink();

    // Handle generic topics
    if (myTopic.indexOf("/setPower/")){
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPower/")+10);
        numPin = atoi(sOutNumber.c_str());
        if (sPayload == "ON"){
            setOutput(numPin, ON_VALUE);
        }
        if (sPayload == "OFF"){
            setOutput(numPin, OFF_VALUE);
        }
        if (sPayload == "TOGGLE"){
            if (bitRead(outputState, numPin) == ON_VALUE){
                setOutput(numPin, OFF_VALUE);
            }else{
                setOutput(numPin, ON_VALUE);
            }
        }

    }else if  (myTopic.indexOf("/setTimed/")){
        // Extract the output number from the topic :
        sOutNumber= myTopic.substring(myTopic.indexOf("/setTimed/")+10);
        numPin = atoi(sOutNumber.c_str());
        // Set the output timer :
        if (outputTimer[numPin]!=0 ){
            outputStartedMillis[numPin] = millis();
            setOutput(numPin, ON_VALUE);
        }

    }else if (myTopic.indexOf("/setTimerValue/")){
        // Extract the output number from the topic :
        sOutNumber= myTopic.substring(myTopic.indexOf("/setTimerValue/")+15);
        numPin = atoi(sOutNumber.c_str());
        // Set the new timer value
        outputTimer[numPin] = atoi(sPayload.c_str());
    }

}   // End handleMqttIncomingMessage

void setOutput(byte numPin, boolean newValue){
    byte nbLines=0;
    int pos;

    // Toggle the pin in the output Buffer:
    bitWrite(outputState, numPin, newValue);

    // flush the output to the serial register
	digitalWrite(PIN_RCLK, LOW);                             // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, outputState);     // Push bits
    digitalWrite(PIN_RCLK, HIGH);                            // Unlock latch

    // Append in the lastEvents logs :
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
    // Append the event at the end of the string.
    lastEvents += "Output " + String(numPin) + ", New value " + (newValue?"On":"Off") + "\n";

    // Report new pin State:
    reportOutputState(numPin);

}   // End setOutput


void reportOutputState(byte numPin){
    String reportTopic="";
    String payload="";

    reportTopic = baseTopic +   "/state/" + String(numPin);
    if (bitRead(outputState, numPin)==ON_VALUE){
        payload = "ON";
    }else{
        payload = "OFF";
    }
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportOutputState


void boardSetup(){
    String fileName;
    // Set pins mode :
    pinMode( PIN_SRCLK, OUTPUT);
    pinMode( PIN_SER, OUTPUT);
    pinMode( PIN_RCLK, OUTPUT);

    for (int i=0; i<SUBNODECOUNT; i++){
        bitWrite(outputState, i, OFF_VALUE);

        // read default outputTimer in files :
        fileName = "/outputTimer" + String(i) + ".txt";
        outputTimer[SUBNODECOUNT]         = atoi(loadLineFromFile(fileName.c_str(),"0").c_str());    // Timer in SECONDS for each output
        outputStartedMillis[SUBNODECOUNT] = 0;
    }

    // The board is subscribed to his own baseTopic, in the baseBoardSetup function.



} // End boardSetup



void boardLoop(){
    // Should we shut off any output that timer as ended ?
    for (int i=0; i<SUBNODECOUNT; i++){
        if (outputStartedMillis[i]!=0){
            // This timer needs to be checked ;
            if (outputStartedMillis[i] + outputTimer[i] <= millis() ){
                // The timer has expired, stop it !
                outputStartedMillis[i] = 0;
                // Set the output to OFF.
                setOutput(i, OFF_VALUE);
            }
        }
    }

} // End boardLoop
