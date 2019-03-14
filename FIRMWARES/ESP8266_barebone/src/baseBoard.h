#ifndef baseBoard_h
#define baseBoard_h

#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <ESP8266HTTPUpdateServer.h>// To upload through terminal you can use: curl -F "image=@firmware.bin" esp8266-webupdate.local/update
#include <PubSubClient.h>           // for the MQTT client
#include <DNSServer.h>              // Needed for WiFiManager library
#include <WiFiManager.h>            //https://github.com/tzapu/WiFiManager
#include <EspSaveCrash.h>
#include <FS.h>
#include <ArduinoOTA.h>
#include "RTClib.h"


    #define BlueLED         2       // This led is on the ESP12F board
    #define LED_ON          0
    #define LED_OFF         1


    // Variables need to be extern ! They are initialized in the .cpp file
    // Thanks to L. Gosset for pointing me to the good forum thread

    // All global variables:
    extern    String baseTopic;
    extern    boolean mqttConnected;
    extern    String mqttServer;
    extern    unsigned int mqttPort;
    extern    unsigned int webServerPort;
    extern    unsigned int MQTT_NUM_TRIES;      // How many times should we try to connect to mqtt broker ?
    extern    unsigned int mqttReportFrequency;  // delay in seconds between MQTT Reports
    extern    boolean SPIFFSAvailable;
    extern    boolean needReboot;
    extern    WiFiClient espClient;
    extern    PubSubClient myMqtt;
    extern    String myHostName;
    extern    ESP8266WebServer server;
    extern    EspSaveCrash SaveCrash;                   // Save crashes informations to EEPROM to retrieve later !
    extern    WiFiManager wifiManager;

    void blink();
    void handleReboot();
    void handleHostNameChange();
    void handleWebServerPortChange();
    void handleMqttServerChange();
    void handleAdvancedSettings();
    void handleResetWifi();
    void handleHttpRoot();
    void saveLineToFile(const char* fileName, const char* data);
    void mqttReport();
    void baseSetup();
    void baseLoop();
    void mqttMessageArrived(char* topic, byte* payload, unsigned int length);
    String loadStringFromFile(const char*  fileName,  const char* defaultValue);
    String getBuildDateTime();


#endif
