#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :
/*
 * 3 pins de l'ULN sont utilisés : OUT1,2,3. Cela correspond aux bits 7,6,5 du shift register.
    OUT1 correspond au relais d'alimentation
    OUT2 et 3 pilotent le pont en H
 */

      #define SUBNODECOUNT    1       // how many sub-nodes should we present


      #define PIN_SRCLK    12
      #define PIN_SER      13
      #define PIN_RCLK     14

      #define ON_VALUE      1
      #define OFF_VALUE     0

// Board specific variables :

      extern      unsigned long previousTime ;
      extern      byte outputState;
      extern      String lastEvents;                    // Save the last 10 events for logging
      extern      byte setupTimer;                      // Timer in SECONDS setup for this cover
      extern      int outputTimer;                      // Timer in SECONDS left for this cover
      extern      unsigned long outputStartedMillis;    // at which time we did started the timer ?
      extern      unsigned long LastReportMillis;       // At which time did we report status ?
      extern      byte previouslyOpening;               // Were we opening last time we moved ?

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

            void openCover();
            void closeCover();
            void stopCover();

            void flushOutput();
            void reportOutputState();


#endif
