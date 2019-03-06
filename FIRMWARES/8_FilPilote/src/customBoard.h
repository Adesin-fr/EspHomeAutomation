#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :

      #define SUBNODECOUNT    8       // how many sub-nodes should we present

      #define PIN_SRCLK    12
      #define PIN_RCLK     13
      #define PIN_SER      14

      #define ON_VALUE      1
      #define OFF_VALUE     0

// Board specific variables :

    enum OrdreFilPilote {
              Ordre_Confort,
              Ordre_Confort_1,
              Ordre_Confort_2,
              Ordre_Eco,
              Ordre_HorsGel,
              Ordre_Arret
          };

      extern      unsigned long previousTime ;
      extern      int outputState;
      extern      String lastEvents;
      extern      unsigned long outputTimer[SUBNODECOUNT];    // First Timer in SECONDS for each output
      extern      unsigned long outputStartedMillis[SUBNODECOUNT];    // Timer in SECONDS for each output
      extern      OrdreFilPilote outputStateKeeper[SUBNODECOUNT];     // Keep track of the output state.


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
            void handleMqttIncomingMessage(String myTopic, String sPayload);

      // Board specific custom functions :

            void flushOutput();
            void setOutput(byte numPin, OrdreFilPilote newValue);
            void reportOutputState(byte numPin);
            void changeOutput(byte numPin, OrdreFilPilote newValue);


#endif
