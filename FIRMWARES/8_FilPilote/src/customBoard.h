#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :

      #define SUBNODECOUNT    8       // how many sub-nodes should we present

      #define PIN_SRCLK    12
      #define PIN_SER      13
      #define PIN_RCLK     14

      #define ON_VALUE      1
      #define OFF_VALUE     0

// Board specific variables :

      extern      unsigned long previousTime ;
      extern      byte outputState;
      extern      String lastEvents;
      extern      int outputTimer[SUBNODECOUNT];    // Timer in SECONDS for each output
      extern      unsigned long outputStartedMillis[SUBNODECOUNT];    // Timer in SECONDS for each output

/*  Board specific MANDATORY functions :
    These functions must be implemented :
      void boardSetup()
      void boardLoop()
      void mqttSendHassDiscovery()    // if HASS_AUTODISCOVERY defined
      void handleBoardSettings()
*/

            void boardSetup();
            void boardLoop();
            void handleBoardSettings();
            void mqttSendHassDiscovery();
            void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length);

      // Board specific custom functions :

            void setOutput(byte numPin, boolean newValue);
            void reportOutputState(byte numPin);


#endif
