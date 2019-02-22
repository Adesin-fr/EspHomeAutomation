#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :

      #define SUBNODECOUNT    16       // how many sub-nodes should we present
      #define SHORTPULSE      60		         // Temps pour un appui court en ms
      #define LONGPULSE       500		         // Temps pour un appui long en ms

      #define PIN_MUX1    16
      #define PIN_MUX2    14
      #define MUXA	      3
      #define MUXB	      5
      #define MUXC	      4

      #define BUTTON_STATUS_NONE 0
      #define BUTTON_STATUS_PULSE_BEGIN 1
      #define BUTTON_STATUS_PULSE_END 2
      #define BUTTON_STATUS_HOLD_BEGIN 3
      #define BUTTON_STATUS_HOLD_END 4

// Board specific variables :

      extern      unsigned long previousTime ;
      extern      unsigned long pushTime[SUBNODECOUNT];
      extern      byte pushState[SUBNODECOUNT];
      extern      byte justPushed[SUBNODECOUNT];
      extern      byte justReleasedShortPush[SUBNODECOUNT];
      extern      byte justLongPushed[SUBNODECOUNT];
      extern      byte justReleasedLongPushed[SUBNODECOUNT];
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
            void handleMqttIncomingMessage(char* topic, byte* payload, unsigned int length);

    // Board specific custom functions :

            boolean lirePin(byte numPin);
            void SendSensorStatus(byte numpin, byte actionType);
            void checkPushes();
            void handleDelInRule();
            void handleInputSettings();
            void handleClearAllRules();


#endif
