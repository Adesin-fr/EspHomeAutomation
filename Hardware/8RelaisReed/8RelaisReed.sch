EESchema Schematic File Version 4
LIBS:8RelaisReed-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 8RelaisReed-rescue:AMS1117-mySensors_8RelaisReed-rescue U1
U 1 1 58764782
P 1950 950
F 0 "U1" H 2050 700 50  0000 R BNN
F 1 "AMS1117" H 1850 1200 50  0000 C TNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 1850 1000 60  0001 C CNN
F 3 "" H 1850 1000 60  0000 C CNN
	1    1950 950 
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P1
U 1 1 58764921
P 800 1000
F 0 "P1" H 800 1150 50  0000 C CNN
F 1 "5VIN" V 900 1000 50  0000 C CNN
F 2 "Connectors:bornier2" H 800 1000 50  0001 C CNN
F 3 "" H 800 1000 50  0000 C CNN
	1    800  1000
	-1   0    0    1   
$EndComp
Text Label 2700 950  0    60   ~ 0
3V3
$Comp
L 8RelaisReed-rescue:C-mySensors_8RelaisReed-rescue C2
U 1 1 58764C44
P 2400 1100
F 0 "C2" H 2425 1200 50  0000 L CNN
F 1 "10uF" H 2425 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2438 950 50  0001 C CNN
F 3 "" H 2400 1100 50  0000 C CNN
	1    2400 1100
	1    0    0    -1  
$EndComp
Text Label 2450 950  0    60   ~ 0
VCC
$Comp
L 8RelaisReed-rescue:C-mySensors_8RelaisReed-rescue C1
U 1 1 587650E8
P 1350 1100
F 0 "C1" H 1375 1200 50  0000 L CNN
F 1 "10uF" H 1375 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 950 50  0001 C CNN
F 3 "" H 1350 1100 50  0000 C CNN
	1    1350 1100
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R1
U 1 1 58766F32
P 8150 1150
F 0 "R1" H 8150 1150 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 1650 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 1150 60  0001 C CNN
F 3 "" H 8150 1150 60  0001 C CNN
	1    8150 1150
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P4
U 1 1 5876743C
P 8900 900
F 0 "P4" H 8900 1050 50  0000 C CNN
F 1 "CONN_01X02" V 9000 900 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 900 50  0001 C CNN
F 3 "" H 8900 900 50  0000 C CNN
	1    8900 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1050 1100 1050
Wire Wire Line
	1100 1050 1100 1250
Wire Wire Line
	1100 1250 1350 1250
Wire Wire Line
	1850 1250 1850 1200
Connection ~ 1350 1250
Connection ~ 1850 1250
Wire Wire Line
	8700 850  8400 850 
Wire Wire Line
	8400 950  8700 950 
Wire Wire Line
	7350 1050 7800 1050
Text Label 7550 1050 0    60   ~ 0
5V
Wire Wire Line
	7350 750  7800 750 
Text Label 7550 750  0    60   ~ 0
S0
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R2
U 1 1 587679A2
P 8150 1750
F 0 "R2" H 8150 1750 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 2250 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 1750 60  0001 C CNN
F 3 "" H 8150 1750 60  0001 C CNN
	1    8150 1750
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P5
U 1 1 587679A8
P 8900 1500
F 0 "P5" H 8900 1650 50  0000 C CNN
F 1 "CONN_01X02" V 9000 1500 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 1500 50  0001 C CNN
F 3 "" H 8900 1500 50  0000 C CNN
	1    8900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1450 8400 1450
Wire Wire Line
	8400 1550 8700 1550
Wire Wire Line
	7350 1650 7800 1650
Text Label 7550 1650 0    60   ~ 0
5V
Wire Wire Line
	7350 1350 7800 1350
Text Label 7550 1350 0    60   ~ 0
S1
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R3
U 1 1 58767BEA
P 8150 2350
F 0 "R3" H 8150 2350 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 2850 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 2350 60  0001 C CNN
F 3 "" H 8150 2350 60  0001 C CNN
	1    8150 2350
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P6
U 1 1 58767BF0
P 8900 2100
F 0 "P6" H 8900 2250 50  0000 C CNN
F 1 "CONN_01X02" V 9000 2100 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 2100 50  0001 C CNN
F 3 "" H 8900 2100 50  0000 C CNN
	1    8900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2050 8400 2050
Wire Wire Line
	8400 2150 8700 2150
Wire Wire Line
	7350 2250 7800 2250
Text Label 7550 2250 0    60   ~ 0
5V
Wire Wire Line
	7350 1950 7800 1950
Text Label 7550 1950 0    60   ~ 0
S2
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R4
U 1 1 58767BFC
P 8150 2950
F 0 "R4" H 8150 2950 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 3450 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 2950 60  0001 C CNN
F 3 "" H 8150 2950 60  0001 C CNN
	1    8150 2950
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P7
U 1 1 58767C02
P 8900 2700
F 0 "P7" H 8900 2850 50  0000 C CNN
F 1 "CONN_01X02" V 9000 2700 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 2700 50  0001 C CNN
F 3 "" H 8900 2700 50  0000 C CNN
	1    8900 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2650 8400 2650
Wire Wire Line
	8400 2750 8700 2750
Wire Wire Line
	7350 2850 7800 2850
Text Label 7550 2850 0    60   ~ 0
5V
Wire Wire Line
	7350 2550 7800 2550
Text Label 7550 2550 0    60   ~ 0
S3
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R5
U 1 1 58767E7A
P 8150 3550
F 0 "R5" H 8150 3550 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 4050 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 3550 60  0001 C CNN
F 3 "" H 8150 3550 60  0001 C CNN
	1    8150 3550
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P8
U 1 1 58767E80
P 8900 3300
F 0 "P8" H 8900 3450 50  0000 C CNN
F 1 "CONN_01X02" V 9000 3300 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 3300 50  0001 C CNN
F 3 "" H 8900 3300 50  0000 C CNN
	1    8900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3250 8400 3250
Wire Wire Line
	8400 3350 8700 3350
Wire Wire Line
	7350 3450 7800 3450
Text Label 7550 3450 0    60   ~ 0
5V
Wire Wire Line
	7350 3150 7800 3150
Text Label 7550 3150 0    60   ~ 0
S4
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R6
U 1 1 58767E8C
P 8150 4150
F 0 "R6" H 8150 4150 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 4650 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 4150 60  0001 C CNN
F 3 "" H 8150 4150 60  0001 C CNN
	1    8150 4150
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P9
U 1 1 58767E92
P 8900 3900
F 0 "P9" H 8900 4050 50  0000 C CNN
F 1 "CONN_01X02" V 9000 3900 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 3900 50  0001 C CNN
F 3 "" H 8900 3900 50  0000 C CNN
	1    8900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3850 8400 3850
Wire Wire Line
	8400 3950 8700 3950
Wire Wire Line
	7350 4050 7800 4050
Text Label 7550 4050 0    60   ~ 0
5V
Wire Wire Line
	7350 3750 7800 3750
Text Label 7550 3750 0    60   ~ 0
S5
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R7
U 1 1 58767E9E
P 8150 4750
F 0 "R7" H 8150 4750 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 5250 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 4750 60  0001 C CNN
F 3 "" H 8150 4750 60  0001 C CNN
	1    8150 4750
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P10
U 1 1 58767EA4
P 8900 4500
F 0 "P10" H 8900 4650 50  0000 C CNN
F 1 "CONN_01X02" V 9000 4500 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 4500 50  0001 C CNN
F 3 "" H 8900 4500 50  0000 C CNN
	1    8900 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4450 8400 4450
Wire Wire Line
	8400 4550 8700 4550
Wire Wire Line
	7350 4650 7800 4650
Text Label 7550 4650 0    60   ~ 0
5V
Wire Wire Line
	7350 4350 7800 4350
Text Label 7550 4350 0    60   ~ 0
S6
$Comp
L 8RelaisReed-rescue:RELAY_SIP-1A05-mySensors_8RelaisReed-rescue R8
U 1 1 58767EB0
P 8150 5350
F 0 "R8" H 8150 5350 60  0000 C CNN
F 1 "RELAY_SIP-1A05" H 8150 5850 60  0000 C CNN
F 2 "MyLibrary:SIP4_5.08" H 8150 5350 60  0001 C CNN
F 3 "" H 8150 5350 60  0001 C CNN
	1    8150 5350
	1    0    0    -1  
$EndComp
$Comp
L 8RelaisReed-rescue:CONN_01X02-mySensors_8RelaisReed-rescue P11
U 1 1 58767EB6
P 8900 5100
F 0 "P11" H 8900 5250 50  0000 C CNN
F 1 "CONN_01X02" V 9000 5100 50  0000 C CNN
F 2 "Connectors:bornier2" H 8900 5100 50  0001 C CNN
F 3 "" H 8900 5100 50  0000 C CNN
	1    8900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5050 8400 5050
Wire Wire Line
	8400 5150 8700 5150
Wire Wire Line
	7350 5250 7800 5250
Text Label 7550 5250 0    60   ~ 0
5V
Wire Wire Line
	7350 4950 7800 4950
Text Label 7550 4950 0    60   ~ 0
S7
Wire Wire Line
	1000 950  1200 950 
Wire Wire Line
	1200 950  1200 900 
Wire Wire Line
	1200 900  1350 900 
Wire Wire Line
	1500 900  1500 950 
Wire Wire Line
	1500 950  1550 950 
Wire Wire Line
	1350 950  1350 900 
Connection ~ 1350 900 
Connection ~ 2400 1250
Text Label 2700 1250 0    60   ~ 0
GND
Wire Wire Line
	2150 950  2400 950 
Connection ~ 2400 950 
Wire Wire Line
	1350 1250 1850 1250
Wire Wire Line
	1850 1250 2400 1250
Wire Wire Line
	1350 900  1500 900 
Wire Wire Line
	2400 1250 2950 1250
Wire Wire Line
	2400 950  2950 950 
$Comp
L RF_Module:ESP-12F U2
U 1 1 5BA9EA25
P 2150 3700
F 0 "U2" H 2500 4500 50  0000 C CNN
F 1 "ESP-12F" H 2450 4450 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 2150 3700 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1800 3800 50  0001 C CNN
	1    2150 3700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST SW1
U 1 1 5BA9F050
P 750 3350
F 0 "SW1" V 796 3162 50  0000 R CNN
F 1 "SW_DPST" V 705 3162 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 750 3350 50  0001 C CNN
F 3 "" H 750 3350 50  0001 C CNN
	1    750  3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	850  3550 650  3550
Wire Wire Line
	850  3550 850  4500
Wire Wire Line
	850  4500 2150 4500
Wire Wire Line
	2150 4500 2150 4400
Connection ~ 850  3550
Wire Wire Line
	850  3150 850  3100
Wire Wire Line
	850  3100 1550 3100
$Comp
L Device:R_Small R9
U 1 1 5BAA4777
P 850 2950
F 0 "R9" H 909 2996 50  0000 L CNN
F 1 "10K" H 909 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 850 2950 50  0001 C CNN
F 3 "~" H 850 2950 50  0001 C CNN
	1    850  2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3050 850  3100
Connection ~ 850  3100
Wire Wire Line
	850  2850 850  2800
Wire Wire Line
	2150 2800 2150 2900
Wire Wire Line
	850  2800 1400 2800
Wire Wire Line
	1550 3300 1400 3300
Wire Wire Line
	1400 3300 1400 2800
Connection ~ 1400 2800
Wire Wire Line
	1400 2800 2150 2800
Wire Wire Line
	2750 3100 2850 3100
Wire Wire Line
	2850 2800 2150 2800
Connection ~ 2150 2800
Wire Wire Line
	2750 4000 2850 4000
Wire Wire Line
	2850 4000 2850 4500
Wire Wire Line
	2850 4500 2150 4500
Connection ~ 2150 4500
Text Label 2350 4500 0    50   ~ 0
GND
Text Label 2400 2800 0    50   ~ 0
3V3
$Comp
L 74xx:74HCT595 U3
U 1 1 5BAB231B
P 4500 1450
F 0 "U3" H 4700 800 50  0000 C CNN
F 1 "74HCT595" H 4700 2000 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 4500 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 4500 1450 50  0001 C CNN
	1    4500 1450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2803A U4
U 1 1 5BAB243B
P 5900 1250
F 0 "U4" H 5900 1817 50  0000 C CNN
F 1 "ULN2803A" H 5900 1726 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 5950 600 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 6000 1050 50  0001 C CNN
	1    5900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1950 5900 2050
Wire Wire Line
	5900 2050 5600 2050
Wire Wire Line
	6300 950  6400 950 
Wire Wire Line
	6400 950  6400 550 
Wire Wire Line
	6400 550  5950 550 
Text Label 1250 900  0    50   ~ 0
5V
Text Label 6000 550  0    50   ~ 0
5V
Wire Wire Line
	6600 1050 6300 1050
Wire Wire Line
	6600 1150 6300 1150
Wire Wire Line
	6600 1250 6300 1250
Wire Wire Line
	6600 1350 6300 1350
Wire Wire Line
	6600 1450 6300 1450
Wire Wire Line
	6600 1550 6300 1550
Wire Wire Line
	6600 1650 6300 1650
Wire Wire Line
	6600 1750 6300 1750
Text Label 6400 1050 0    50   ~ 0
S0
Text Label 6400 1150 0    50   ~ 0
S1
Text Label 6400 1250 0    50   ~ 0
S2
Text Label 6400 1350 0    50   ~ 0
S3
Text Label 6400 1450 0    50   ~ 0
S4
Text Label 6400 1550 0    50   ~ 0
S5
Text Label 6400 1650 0    50   ~ 0
S6
Text Label 6400 1750 0    50   ~ 0
S7
Wire Wire Line
	4500 850  4500 800 
Wire Wire Line
	4500 800  4200 800 
Wire Wire Line
	4500 2150 4500 2200
Text Label 4250 2200 0    50   ~ 0
GND
Text Label 5700 2050 0    50   ~ 0
GND
Text Label 4300 800  0    50   ~ 0
3V3
Wire Wire Line
	4100 1650 4100 2200
Wire Wire Line
	4100 2200 4500 2200
Wire Wire Line
	3800 1550 4100 1550
Wire Wire Line
	3800 1350 4100 1350
Wire Wire Line
	3800 1250 4100 1250
Wire Wire Line
	3800 1050 4100 1050
Text Label 3900 1050 0    50   ~ 0
SER
Text Label 3850 1250 0    50   ~ 0
SRCLK
Text Label 3850 1350 0    50   ~ 0
RCLK
Text Label 3850 1550 0    50   ~ 0
3V3
Wire Wire Line
	2750 3900 3000 3900
Wire Wire Line
	2750 3700 3000 3700
Wire Wire Line
	3000 3800 2750 3800
Text Label 2800 3900 0    50   ~ 0
SER
Text Label 2800 3700 0    50   ~ 0
SRCLK
Text Label 2800 3800 0    50   ~ 0
RCLK
Wire Wire Line
	4900 1050 5100 1050
Wire Wire Line
	5100 1150 4900 1150
Wire Wire Line
	5100 1250 4900 1250
Wire Wire Line
	5100 1350 4900 1350
Wire Wire Line
	5100 1450 4900 1450
Wire Wire Line
	5100 1550 4900 1550
Wire Wire Line
	5100 1650 4900 1650
Wire Wire Line
	5100 1750 4900 1750
Wire Wire Line
	5300 1050 5500 1050
Wire Wire Line
	5300 1150 5500 1150
Wire Wire Line
	5300 1250 5500 1250
Wire Wire Line
	5300 1350 5500 1350
Wire Wire Line
	5300 1450 5500 1450
Wire Wire Line
	5300 1550 5500 1550
Wire Wire Line
	5300 1650 5500 1650
Wire Wire Line
	5300 1750 5500 1750
Text Label 4950 1050 0    50   ~ 0
O8
Text Label 4950 1150 0    50   ~ 0
O7
Text Label 4950 1250 0    50   ~ 0
O6
Text Label 4950 1350 0    50   ~ 0
O5
Text Label 4950 1450 0    50   ~ 0
O4
Text Label 4950 1550 0    50   ~ 0
O3
Text Label 4950 1650 0    50   ~ 0
O2
Text Label 4950 1750 0    50   ~ 0
O1
Text Label 5300 1050 0    50   ~ 0
O1
Text Label 5300 1150 0    50   ~ 0
O2
Text Label 5300 1250 0    50   ~ 0
O3
Text Label 5300 1350 0    50   ~ 0
O4
Text Label 5300 1450 0    50   ~ 0
O5
Text Label 5300 1550 0    50   ~ 0
O6
Text Label 5300 1650 0    50   ~ 0
O7
Text Label 5300 1750 0    50   ~ 0
O8
$Comp
L Device:R_Small R10
U 1 1 5BBE06F1
P 2850 2950
F 0 "R10" H 2909 2996 50  0000 L CNN
F 1 "10K" H 2909 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2850 2950 50  0001 C CNN
F 3 "~" H 2850 2950 50  0001 C CNN
	1    2850 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2850 2850 2800
$Comp
L Switch:SW_DPST SW2
U 1 1 5BBE52FA
P 3450 3300
F 0 "SW2" V 3496 3112 50  0000 R CNN
F 1 "FLASH" V 3405 3112 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 3450 3300 50  0001 C CNN
F 3 "" H 3450 3300 50  0001 C CNN
	1    3450 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 3500 3350 3500
Wire Wire Line
	2850 3050 2850 3100
Wire Wire Line
	2850 3100 3350 3100
Connection ~ 2850 3100
Wire Wire Line
	3350 3500 3350 4500
Wire Wire Line
	3350 4500 2850 4500
Connection ~ 3350 3500
Connection ~ 2850 4500
Wire Wire Line
	3350 3100 3550 3100
Connection ~ 3350 3100
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5BBFE474
P 4100 4300
F 0 "J1" H 4072 4273 50  0000 R CNN
F 1 "ISP" H 4072 4182 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4100 4300 50  0001 C CNN
F 3 "~" H 4100 4300 50  0001 C CNN
	1    4100 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 4500 3350 4500
Connection ~ 3350 4500
Wire Wire Line
	3900 4200 3900 2800
Wire Wire Line
	3900 2800 3150 2800
Connection ~ 2850 2800
Wire Wire Line
	3900 4300 3700 4300
Wire Wire Line
	3700 4400 3900 4400
Wire Wire Line
	3000 3200 2750 3200
Text Label 2850 3200 0    50   ~ 0
TXD
Text Label 2850 3400 0    50   ~ 0
RXD
Text Label 3750 4300 0    50   ~ 0
TXD
Text Label 3750 4400 0    50   ~ 0
RXD
$Comp
L Device:R_Small R11
U 1 1 5C80A805
P 3150 2950
F 0 "R11" H 3209 2996 50  0000 L CNN
F 1 "10K" H 3209 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 2950 50  0001 C CNN
F 3 "~" H 3150 2950 50  0001 C CNN
	1    3150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2850 3150 2800
Connection ~ 3150 2800
Wire Wire Line
	3150 2800 2850 2800
Wire Wire Line
	2750 3300 3150 3300
Wire Wire Line
	3150 3300 3150 3050
Wire Wire Line
	2750 3400 3150 3400
$EndSCHEMATC
