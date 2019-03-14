#ifndef customBoard_h
#define customBoard_h

#include "baseBoard.h"

// Board specific defines :

      #define PIN_SRCLK    12
      #define PIN_SER      13
      #define PIN_RCLK     14

      #define ON_VALUE      1
      #define OFF_VALUE     0

// Board specific variables :

    enum RollerAction {
                Action_Open,
                Action_Close,
                Action_Stop
          };

    extern      unsigned long previousTime ;
    extern      byte outputState;
    extern      String lastEvents;
    extern      int outputTimer;    // Timer in SECONDS for each output
    extern      int defaultTimer;    // Default timer in SECONDS for each output
    extern      unsigned long outputStartedMillis;    // Timer in SECONDS for each output
    extern      RollerAction previousAction;    // What was the previous state ?
    extern      boolean invertAction;           // Should the behavior of this output inverted




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

            void setOutputPin(byte numPin, boolean newValue);
            void doActionRoller(byte outputNumber, RollerAction action);
            void reportOutputState(byte numPin, RollerAction currentAction);
            void reportPosition(byte numPin, byte currentPositionPercent);


#endif
