#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime  = 0;
    byte outputState            = 0;
    String lastEvents           = "";
    int outputTimer[SUBNODECOUNT];    // Timer in SECONDS for each output
    unsigned long outputStartedMillis[SUBNODECOUNT];    // Timer in SECONDS for each output
    RollerAction previousAction[SUBNODECOUNT];    // What was the previous state ?
    boolean invertAction[SUBNODECOUNT];           // Should the behavior of this output inverted

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
    boolean messageHandled = false;
    byte nbLines=0;
    int pos;

    for (unsigned int i = 0; i < length; i++) {
        sPayload += (char)payload[i];
    }

    blink();

    // Handle generic topics
    if (myTopic.indexOf("/setPower/")){
        messageHandled = true;
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPower/")+10);
        numPin = atoi(sOutNumber.c_str());
        if (sPayload == "OPEN"){
            doActionRoller(numPin, Action_Open);
        }
        if (sPayload == "CLOSE"){
            doActionRoller(numPin, Action_Close);
        }
        if (sPayload == "TOGGLE"){
            // If the roller is still moving, stop it !
            if (outputStartedMillis[numPin] != 0){
                doActionRoller(numPin, Action_Stop);
            }else{
                if (previousAction[numPin] == Action_Close){
                    doActionRoller(numPin, Action_Open);
                }else{
                    doActionRoller(numPin, Action_Close);
                }
            }
        }
        if (sPayload == "STOP"){
            doActionRoller(numPin, Action_Stop);
        }

    }else if (myTopic.indexOf("/setPosition/")){
        messageHandled = true;
        // Extract the output number from the topic :
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPosition/")+13);
        numPin = atoi(sOutNumber.c_str());
        // Set the new timer value
        // The payload contains the position in percent.
        //  atoi(sPayload.c_str());
    }

    // Only record this event if we could handle it !
    if ( messageHandled == true){
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
        lastEvents += "Output " + String(numPin) + " Action " + sPayload + "<BR>\n";

        // Report new pin State:
        reportOutputState(numPin);
    }

}   // End handleMqttIncomingMessage


void doActionRoller(byte outputNumber, RollerAction action){
    boolean outONValue  = ON_VALUE;
    boolean outOFFValue = OFF_VALUE;

    if (invertAction[outputNumber]){
        outONValue  = OFF_VALUE;
        outOFFValue = ON_VALUE;
    }

    switch (action){
        case Action_Close:
            previousAction[outputNumber] = Action_Close;
            setOutputPin(outputNumber * 2    , outONValue);
            setOutputPin(outputNumber * 2 +1 , outOFFValue);
            outputStartedMillis[outputNumber] = millis();
            break;
        case Action_Open:
            previousAction[outputNumber] = Action_Open;
            setOutputPin(outputNumber * 2    , outOFFValue);
            setOutputPin(outputNumber * 2 +1 , outONValue);
            outputStartedMillis[outputNumber] = millis();
            break;
        case Action_Stop:
            setOutputPin(outputNumber * 2    , OFF_VALUE);
            setOutputPin(outputNumber * 2 +1 , OFF_VALUE);
            outputStartedMillis[outputNumber] = 0;
            break;
    }
}

void setOutputPin(byte numPin, boolean newValue){

    // Toggle the pin in the output Buffer:
    bitWrite(outputState, numPin, newValue);

    // flush the output to the serial register
	digitalWrite(PIN_RCLK, LOW);                             // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, outputState);     // Push bits
    digitalWrite(PIN_RCLK, HIGH);                            // Unlock latch

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


void handleBoardSettings(){
    // Output Inverted
    // Output Timer 
}

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
        outputTimer[i]         = atoi(loadStringFromFile(fileName.c_str(),"0").c_str());    // Timer in SECONDS for each output
        outputStartedMillis[i] = 0;
        previousAction[i]      = Action_Close;
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
                doActionRoller(i, Action_Stop);
            }
        }
    }

} // End boardLoop
