/*
    MEAS.h - My ESP Are Smart

    This library will  ...

    To use this library, you also need/////

    Ludovic LEMARINEL
    2019-04-18 : Initial version

    MEAS Library by Ludovic LEMARINEL is licensed under GPL


*/

#ifndef MEAS_h
#define MEAS_h


#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#include <WiFiUdp.h>
#include <ESP8266WebServer.h>
#include <ESP8266HTTPUpdateServer.h>// To upload through terminal you can use: curl -F "image=@firmware.bin" esp8266-webupdate.local/update
#include <FS.h>
#include <DNSServer.h>              // Needed for WiFiManager library
#include <WiFiManager.h>            // https://github.com/tzapu/WiFiManager
#include <EspSaveCrash.h>           // https://github.com/krzychb/EspSaveCrash
#include <RTClib.h>                 // https://github.com/adafruit/RTClib


#define MEAS_Port 8266
#define MEAS_UDP_Port 8366
// WARNING ! Enable UseSerial on this board conflicts with MUX_PIN_A !
// #define UseSerial
#define USE_LED
#define LED_PIN       2


extern ESP8266WebServer server;
extern ESP8266HTTPUpdateServer httpUpdater;      // Web updater
extern unsigned int httpReportFrequency;          // delay in seconds between health Reports
extern boolean SPIFFSAvailable;
extern boolean needReboot;
extern String myHostName;
extern unsigned long wifiLostTime;            // This variable is set when wifi is lost
extern unsigned long previoushttpReportTime;
extern byte numCarte;
extern unsigned int disconnectCount;
extern unsigned long tcpReceived;
extern unsigned long tcpSent;
extern unsigned long disconnectDuration;

extern WiFiClient espClient;
extern WiFiUDP udpClient;
extern EspSaveCrash _saveCrash;                   // Save crashes informations to EEPROM to retrieve later !
extern WiFiManager _wifiManager;

extern String staticIP;
extern String staticGW;
extern String staticSN;


void handleReboot();
String getBuildDateTime();

void baseBegin();
void blink();
void healthReport();
void baseWork();
void callHttpUrl(String url);
void sendUdpMessage(String message);
void handleAdvSettings();
void handleSetNewSetting();
void handleGetStats();
void handleBoardSettings();
void handleReboot();
boolean createFileIfNotExist(String fileName);

void saveLineToFile(const char* fileName, const char* data);
String loadStringFromFile(const char*  fileName,  const char* defaultValue);

#endif
