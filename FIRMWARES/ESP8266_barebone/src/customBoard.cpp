#include "customBoard.h"

    // Board specific variables

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

} // End boardSetup


void handleBoardSettings() {
      blink();
      String output="";
      output += "<div align='center'><h1>Settings</h1></div><br>";

      server.send(200, "text/html", output);
} // End handleBoardSettings


void handleMqttIncomingMessage(String topic, String payload){
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


} // End boardLoop
