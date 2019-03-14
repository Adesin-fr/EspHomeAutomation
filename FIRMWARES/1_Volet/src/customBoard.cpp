#include "customBoard.h"

    // Board specific variables


    unsigned long previousTime ;
    byte outputState;
    String lastEvents;
    int outputTimer;    // Timer in SECONDS for each output
    int defaultTimer;    // Default timer in SECONDS for each output
    unsigned long outputStartedMillis;    // Timer in SECONDS for each output
    RollerAction previousAction;    // What was the previous state ?
    boolean invertAction;           // Should the behavior of this output inverted

/*
        Minimum functions to be implemented :
        void boardSetup()
        void boardLoop()
        void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
        void handleBoardSettings()
*/


void handleMqttIncomingMessage(String myTopic, String sPayload){

    blink();

    // Load default timer value :
    if (defaultTimer==0){
        defaultTimer = atoi(loadStringFromFile("/defaultTimer.txt", "5").c_str());
    }


    // Handle generic topics
    if (myTopic.indexOf("/setPower")>0){
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        if (sPayload == "ON"){
            setOutputPin(0, ON_VALUE);
        }
        if (sPayload == "OFF"){
            setOutputPin(0, OFF_VALUE);
        }
    }
    if (myTopic.indexOf("/setAction")>0){
        // Extract the output number from the topic :
        // The topic should be like /myboard/setPower/7 , ie to toggle output 7
        if (sPayload == "STOP" ){
            setOutputPin(0, OFF_VALUE);
            setOutputPin(1, OFF_VALUE);
            setOutputPin(2, OFF_VALUE);
            // Start the timer
            outputStartedMillis = 0;
            reportOutputState();
        }
        if (sPayload == "ON" || sPayload == "OPEN"){
            setOutputPin(0, ON_VALUE);
            setOutputPin(1, ON_VALUE);
            setOutputPin(2, OFF_VALUE);
            // Start the timer
            outputStartedMillis = millis();
            outputTimer = defaultTimer * 1000;
            previousAction = Action_Open;
        }
        if (sPayload == "OFF" || sPayload == "CLOSE"){
            setOutputPin(0, ON_VALUE);
            setOutputPin(1, OFF_VALUE);
            setOutputPin(2, ON_VALUE);
            // Start the timer
            outputStartedMillis = millis();
            previousAction = Action_Close;
            outputTimer = defaultTimer * 1000;
        }
        if (sPayload == "TOGGLE"){
            if (outputStartedMillis!=0){
                // Stop now...
                setOutputPin(0, OFF_VALUE);
                setOutputPin(1, OFF_VALUE);
                setOutputPin(2, OFF_VALUE);
                // Start the timer
                outputStartedMillis = 0;
                reportOutputState();
            }else{
                // Toggle...
                setOutputPin(0, ON_VALUE);
                if (previousAction == Action_Open){
                    setOutputPin(1, OFF_VALUE);
                    setOutputPin(2, ON_VALUE);
                    previousAction = Action_Close;
                    outputTimer = defaultTimer * 1000;
                }else{
                    setOutputPin(1, ON_VALUE);
                    setOutputPin(2, OFF_VALUE);
                    previousAction = Action_Open;
                    outputTimer = defaultTimer * 1000;
                }
                // Start the timer
                outputStartedMillis = millis();
            }
        }

    }

}   // End handleMqttIncomingMessage

void setOutputPin(byte numPin, boolean newValue){

    // Toggle the pin in the output Buffer:
    bitWrite(outputState, numPin, newValue);

    // flush the output to the serial register
    digitalWrite(PIN_RCLK, LOW);                             // Lock latch
    shiftOut(PIN_SER, PIN_SRCLK, LSBFIRST, outputState);     // Push bits
    digitalWrite(PIN_RCLK, HIGH);                            // Unlock latch

}   // End setOutputPin


void reportOutputState(){
    String reportTopic="";
    String payload="";

    reportTopic = baseTopic +   "/state";
    if (previousAction == Action_Open){
        payload = "OPEN";
    }else{
        payload = "CLOSED";
    }
    myMqtt.publish(reportTopic.c_str(), payload.c_str());

}   // End reportOutputState



void handleBoardSettings() {
    blink();
    String output="";

    output += "<div align='center'><h1>Board Settings</h1></div><br>";
    output += "<table border=1><th>Setting Name</th><th>Value</th>";

    output += "<form action='/setNewSetting'><tr><td>Cover movement timer (seconds) :</td><td><input name='defaultTimer' value='" + String(defaultTimer) + "'> <input type=submit value='Change'></td></tr></form>";

    output += "</table><br>";
    output += "<form action='/reboot' ><input type=submit value='Reboot'></form><br><br><br>";

    if (needReboot){
        output += "<font color='red'><b>Settings has changed, a reboot is needed !</b></font>";
    }

    server.send(200, "text/html", output);

} // End handleBoardSettings


void boardSetup(){
    String fileName;
    // Set pins mode :
    pinMode( PIN_SRCLK, OUTPUT);
    pinMode( PIN_SER, OUTPUT);
    pinMode( PIN_RCLK, OUTPUT);

    outputState=0;

    // read default outputTimer in files :
    outputTimer         = 0;    // Timer in SECONDS for each output
    outputStartedMillis = 0;

    // Reset all outputs to OFF
    setOutputPin(0, OFF_VALUE);


} // End boardSetup



void boardLoop(){
    // Should we shut off any output that timer as ended ?
    if (outputStartedMillis != 0){
        // This timer needs to be checked ;
        if (outputStartedMillis + outputTimer <= millis() ){
            // The timer has expired, stop it !
            outputStartedMillis = 0;
            outputTimer = 0;
            // Toggle the output.
            setOutputPin(0, OFF_VALUE);
            setOutputPin(1, OFF_VALUE);
            setOutputPin(2, OFF_VALUE);
            reportOutputState();
        }
    }

} // End boardLoop
