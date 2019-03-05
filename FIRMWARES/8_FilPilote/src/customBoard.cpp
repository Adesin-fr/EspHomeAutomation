#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime  = 0;
    int outputState             = 0;
    String lastEvents           = "";
    unsigned long outputTimer[SUBNODECOUNT];    // First Timer in SECONDS for each output
    unsigned long outputStartedMillis[SUBNODECOUNT];    // Timer in SECONDS for each output
    OrdreFilPilote outputStateKeeper[SUBNODECOUNT];

/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/


void handleBoardSettings(){}

void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length){
    String sPayload="";
    String myTopic= topic;
    String sOutNumber;
    byte numPin, pctPower;

    for (unsigned int i = 0; i < length; i++) {
        sPayload += (char)payload[i];
    }

    blink();

    // Handle topics
    if (myTopic.indexOf("/setPower/")){
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPower/")+10);
        numPin = atoi(sOutNumber.c_str());
        if (sPayload == "ON" || sPayload == "CONF"){
            setOutput(numPin, Ordre_Confort);
        }
        if (sPayload == "CONF-1"){
            setOutput(numPin, Ordre_Confort_1);
        }
        if (sPayload == "CONF-2"){
            setOutput(numPin, Ordre_Confort_2);
        }
        if (sPayload == "ECO"){
            setOutput(numPin, Ordre_Eco);
        }
        if (sPayload == "HG"){
            setOutput(numPin, Ordre_HorsGel);
        }
        if (sPayload == "OFF" || sPayload == "ARRET"){
            setOutput(numPin, Ordre_Arret);
        }
    }
    if (myTopic.indexOf("/setPercent/")){
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPower/")+10);
        numPin = atoi(sOutNumber.c_str());
        pctPower = atoi(sPayload.c_str());
        if (pctPower > 50){
            setOutput(numPin, Ordre_Confort);
        }
        if (pctPower >= 41 && pctPower <= 50 ){
            setOutput(numPin, Ordre_Confort_1);
        }
        if (pctPower >= 31 && pctPower <= 40 ){
            setOutput(numPin, Ordre_Confort_2);
        }
        if (pctPower >= 21 && pctPower <= 30 ){
            setOutput(numPin, Ordre_Eco);
        }
        if (pctPower >= 11 && pctPower <= 20 ){
            setOutput(numPin, Ordre_HorsGel);
        }
        if (pctPower >= 0 && pctPower <= 10 ){
            setOutput(numPin, Ordre_Arret);
        }
    }

}   // End handleMqttIncomingMessage

void changeOutput(byte numPin, OrdreFilPilote newValue){
    byte nbLines=0;
    int pos;

    // Change the output state :
    setOutput(numPin, newValue);

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
    lastEvents += "Output " + String(numPin) + " New value " + newValue + "<br>\n";

    // Report new pin State:
    reportOutputState(numPin);
}

void setOutput(byte numPin, OrdreFilPilote newValue){
    byte bit1,bit2;

    bit1 = numPin*2;
    bit2 = bit1 + 1;

    outputStateKeeper[numPin] = newValue;

    // Stop the existing timers if there is any
    outputTimer[numPin] = 0;

    // Toggle the pin in the output Buffer:
    switch(newValue){
        case Ordre_Confort:
            // Confort is NO SIGNAL
            bitWrite(outputState, bit1, 0);
            bitWrite(outputState, bit2, 0);
            break;
        case Ordre_Confort_1:
            // Confort_1 is NO SIGNAL for 297 seconds, then 220V for 3 seconds
            bitWrite(outputState, bit1, 0);
            bitWrite(outputState, bit2, 0);
            outputTimer[numPin] = 297000;
            outputStartedMillis[numPin] = millis();
            break;
        case Ordre_Confort_2:
            // Confort_2 is NO SIGNAL for 293 seconds, then 220V for 7 seconds
            bitWrite(outputState, bit1, 0);
            bitWrite(outputState, bit2, 0);
            outputTimer[numPin] = 293000;
            outputStartedMillis[numPin] = millis();
            break;
        case Ordre_Eco:
            // Eco is FULL 220V
            bitWrite(outputState, bit1, 1);
            bitWrite(outputState, bit2, 1);
            break;
        case Ordre_HorsGel:
            // HORS GEL is Negative wave
            bitWrite(outputState, bit1, 0);
            bitWrite(outputState, bit2, 1);
            break;
        case Ordre_Arret:
            // ARRET is Positive wave
            bitWrite(outputState, bit1, 1);
            bitWrite(outputState, bit2, 0);
            break;
    }

    flushOutput();

}   // End setOutput

void flushOutput(){
    // flush the output to the serial register
    digitalWrite(PIN_RCLK, LOW);                                    // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, outputState & 0xff00);   // Push higher bits
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, outputState & 0x00ff);   // Push lower bits
    digitalWrite(PIN_RCLK, HIGH);                                   // Unlock latch
}

void reportOutputState(byte numPin){
    String reportTopic="";
    String payload="";

    reportTopic = baseTopic +   "/state/" + String(numPin);
    switch(outputStateKeeper[numPin]){
        case Ordre_Confort:
            payload = "CONF";
            break;
        case Ordre_Confort_1:
            payload = "CONF-1";
            break;
        case Ordre_Confort_2:
            payload = "CONF-2";
            break;
        case Ordre_Eco:
            payload = "ECO";
            break;
        case Ordre_HorsGel:
            payload = "HG";
            break;
        case Ordre_Arret:
            payload = "ARRET";
            break;
    }
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportOutputState


void boardSetup(){
    String fileName;
    // Set pins mode :
    pinMode( PIN_SRCLK, OUTPUT);
    pinMode( PIN_SER, OUTPUT);
    pinMode( PIN_RCLK, OUTPUT);

    outputState = 0;
    for (int i=0; i<SUBNODECOUNT; i++){
        outputStateKeeper[i]   = Ordre_Confort;
        outputTimer[i]        = 0;
        outputStartedMillis[i] = 0;
    }

    // Set all outputs to ZERO.
    digitalWrite(PIN_RCLK, LOW);                 // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, 0);   // Push higher bits
    shiftOut(PIN_SER, PIN_SRCLK, MSBFIRST, 0);   // Push lower bits
    digitalWrite(PIN_RCLK, HIGH);                // Unlock latch

    // The board is subscribed to his own baseTopic, in the baseBoardSetup function.

} // End boardSetup


void boardLoop(){
    // Handle CONF_1 and CONF_2 command timers :
    for (int i=0; i<SUBNODECOUNT; i++){
        byte bit1, bit2;
        bit1 = i * 2;
        bit2 = bit1 + 1;

        if (outputTimer[i] > 7000 && (millis() > outputTimer[i] + outputStartedMillis[i] )){
            // First timer has expired !
            // Set second timer now.
            bitWrite(outputState, bit1, 1);
            bitWrite(outputState, bit2, 1);
            flushOutput();
            if (outputTimer[i]==293000){
                outputTimer[i]=7000;
            }else{
                outputTimer[i]=3000;
            }
        }

        if (outputTimer[i] <= 7000 && (millis() > outputTimer[i] + outputStartedMillis[i] )){
            // Second timer has expired !
            setOutput(i, outputStateKeeper[i]);
        }

    }

} // End boardLoop
