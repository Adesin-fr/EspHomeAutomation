#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <ESP8266HTTPUpdateServer.h>  //  To upload through terminal you can use: curl -F "image=@firmware.bin" esp8266-webupdate.local/update
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <PubSubClient.h>           // for the MQTT client
#include <DNSServer.h>              // Needed for WiFiManager library
#include <WiFiManager.h>            //https://github.com/tzapu/WiFiManager
#include <EspSaveCrash.h>
#include <FS.h>
#include "baseBoard.h"
#include "customBoard.h"

/*

    TODO : Load the inputSettings.dat file in memory

*/

 // Global defines

#define HASS_AUTODISCOVERY      // Sould Enable Home Assistant auto-discovery

#define UseLED                  // Is the LED used ?
// #define UseSerial             // Use serial connection for debugging?

    // All functions prototypes :

void setup() {

    boardSetup();
    baseSetup();

} // End setup

void loop() {
    // Handle board loop needed stuff
    baseLoop();

    // Handle MQTT incoming messages :
    if (mqttConnected){
        boardLoop();
    }

} // End Loop
