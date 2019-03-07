#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime  = 0;
    byte outputState            = 0;
    String lastEvents           = "";
    int outputTimer[SUBNODECOUNT];    // Timer in milliSeconds for each output
    int defaultTimer[SUBNODECOUNT];    // Default timer in milliSeconds for each output
    unsigned long outputStartedMillis[SUBNODECOUNT];
    RollerAction previousAction[SUBNODECOUNT];    // What was the previous state ?
    boolean invertAction[SUBNODECOUNT];           // Should the behavior of this output inverted

/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/


void handleMqttIncomingMessage(String myTopic, String sPayload){
    String sOutNumber;
    byte outNum;
    boolean messageHandled = false;
    byte nbLines=0;
    int pos;

    blink();

    // Handle generic topics
    if (myTopic.indexOf("/setAction/")>0){
        messageHandled = true;
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        sOutNumber= myTopic.substring(myTopic.indexOf("/setAction/")+10);
        outNum = atoi(sOutNumber.c_str());

        outputTimer[outNum] = defaultTimer[outNum];

        if (outNum<0 || outNum>SUBNODECOUNT-1){
            return;
        }
        if (sPayload == "OPEN"){
            doActionRoller(outNum, Action_Open);
        }
        if (sPayload == "CLOSE"){
            doActionRoller(outNum, Action_Close);
        }
        if (sPayload == "TOGGLE"){
            // If the roller is still moving, stop it !
            if (outputStartedMillis[outNum] != 0){
                doActionRoller(outNum, Action_Stop);
            }else{
                if (previousAction[outNum] == Action_Close){
                    doActionRoller(outNum, Action_Open);
                }else{
                    doActionRoller(outNum, Action_Close);
                }
            }
        }
        if (sPayload == "STOP"){
            doActionRoller(outNum, Action_Stop);
        }

    }else if (myTopic.indexOf("/setPosition/")>0){
        messageHandled = true;
        // Extract the output number from the topic :
        sOutNumber= myTopic.substring(myTopic.indexOf("/setPosition/")+13);
        outNum = atoi(sOutNumber.c_str());
        // Set the new timer value
        // The payload contains the position in percent.
        byte percent = atoi(sPayload.c_str());
        outputTimer[outNum] = defaultTimer[outNum] * percent / 100;
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
        lastEvents += "Output " + String(outNum) + " Action " + sPayload + "<BR>\n";

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
            // Compute how much time did passed from begining of action and now :
            long timePassed = millis() - outputStartedMillis[outputNumber];
            byte percentPosition = timePassed * 100 / defaultTimer[outputNumber];
            outputStartedMillis[outputNumber] = 0;
            reportPosition(outputNumber, percentPosition);
            break;
    }

    // Report new pin State:
    reportOutputState(outputNumber, action);
}

void setOutputPin(byte numPin, boolean newValue){

    // Toggle the pin in the output Buffer:
    bitWrite(outputState, numPin, newValue);

    // flush the output to the serial register
	digitalWrite(PIN_RCLK, LOW);                             // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, LSBFIRST, outputState);     // Push bits
    digitalWrite(PIN_RCLK, HIGH);                            // Unlock latch

}   // End setOutput


void reportPosition(byte numPin, byte currentPositionPercent){
    String reportTopic="";
    String payload="";

    reportTopic = baseTopic +   "/position/" + String(numPin);
    payload = currentPositionPercent;
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportPosition



void reportOutputState(byte numPin, RollerAction currentAction){
    String reportTopic="";
    String payload="";

    reportTopic = baseTopic +   "/state/" + String(numPin);
    switch(currentAction){
        case Action_Open:
            payload = "OPENING";
        case Action_Close:
            payload = "CLOSING";
        case Action_Stop:
            payload = "STOPPED";
    }
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportOutputState


void handleBoardSettings(){
    // Output Inverted
    // Output Default Timer
}

void boardSetup(){
    String fileName;
    // Set pins mode :
    pinMode( PIN_SRCLK, OUTPUT);
    pinMode( PIN_SER, OUTPUT);
    pinMode( PIN_RCLK, OUTPUT);

    for (int i=0; i<SUBNODECOUNT; i++){
        setOutputPin(i*2, 0);
        setOutputPin(i*2 +1 , 0);
        // read defaultTimer in files :
        fileName = "/defaultTimer" + String(i) + ".txt";
        defaultTimer[i]        = atoi(loadStringFromFile(fileName.c_str(),"0").c_str());    // Timer in SECONDS for each output
        outputStartedMillis[i] = 0;
        previousAction[i]      = Action_Close;
        outputTimer[i]         = 0;
    }

    // The board is subscribed to his own baseTopic, in the baseBoardSetup function.
    // There is no need to subscribe to subTopics.

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
