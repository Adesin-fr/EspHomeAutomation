#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :

      #define SUBNODECOUNT    16       // how many sub-nodes should we present

// Board specific variables :

      extern      String lastEvents;




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
            void handleMqttIncomingMessage(String topic, String payload);

      // Board specific custom functions :

#endif
