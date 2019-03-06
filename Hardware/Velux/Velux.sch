EESchema Schematic File Version 4
LIBS:Velux-cache
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
L RF_Module:ESP-12F U3
U 1 1 5BA7F006
P 2050 2600
F 0 "U3" H 2400 3350 50  0000 C CNN
F 1 "ESP-12F" H 2350 3450 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 2050 2600 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1700 2700 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U1
U 1 1 5BA7F131
P 1800 5250
F 0 "U1" H 1800 6028 50  0000 C CNN
F 1 "74HCT595" H 1800 5937 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 1800 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 1800 5250 50  0001 C CNN
	1    1800 5250
	1    0    0    -1  
$EndComp
$Comp
L Relay:UMS05-1A80-75L K1
U 1 1 5BA89EA9
P 6000 1200
F 0 "K1" H 6280 1246 50  0000 L CNN
F 1 "UMS05-1A80-75L" H 6280 1155 50  0000 L CNN
F 2 "MyLibrary:SANYOU-SJ-S" H 6300 1150 50  0001 L CNN
F 3 "https://standexelectronics.com/de/produkte/ums-reed-relais/" H 6000 1200 50  0001 C CNN
	1    6000 1200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2803A U4
U 1 1 5BA8A5D0
P 3950 5250
F 0 "U4" H 3950 5817 50  0000 C CNN
F 1 "ULN2803A" H 3950 5726 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 4000 4600 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 4050 5050 50  0001 C CNN
	1    3950 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5BA8A7E8
P 7400 1150
F 0 "J2" H 7427 1126 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7427 1035 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7400 1150 50  0001 C CNN
F 3 "~" H 7400 1150 50  0001 C CNN
	1    7400 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5BA8AC96
P 950 750
F 0 "J1" H 844 935 50  0000 C CNN
F 1 "5VIN" H 844 844 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 950 750 50  0001 C CNN
F 3 "~" H 950 750 50  0001 C CNN
	1    950  750 
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP1117-33 U2
U 1 1 5BA8B022
P 2050 750
F 0 "U2" H 2050 992 50  0000 C CNN
F 1 "AP1117-33" H 2050 901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2050 950 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 2150 500 50  0001 C CNN
	1    2050 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 750  1400 750 
Wire Wire Line
	1150 850  1150 1100
Wire Wire Line
	1150 1100 1400 1100
Wire Wire Line
	2050 1100 2050 1050
Wire Wire Line
	2050 1100 2450 1100
Connection ~ 2050 1100
Wire Wire Line
	2650 750  2450 750 
Text Label 2500 750  0    50   ~ 0
3V3
Text Label 1450 750  0    50   ~ 0
5V
Text Label 1500 1100 0    50   ~ 0
GND
Wire Wire Line
	5800 900  5800 850 
Text Label 5600 850  0    50   ~ 0
5V
Wire Wire Line
	5800 1500 5800 1550
Text Label 5500 1550 0    50   ~ 0
OUT1
Wire Wire Line
	4550 5050 4350 5050
Wire Wire Line
	4550 5150 4350 5150
Wire Wire Line
	4550 5250 4350 5250
Wire Wire Line
	3950 5950 3950 6000
Wire Wire Line
	3950 6000 3700 6000
Wire Wire Line
	4350 4950 4550 4950
Text Label 4400 4950 0    50   ~ 0
5V
Text Label 4400 5050 0    50   ~ 0
OUT1
Text Label 4400 5150 0    50   ~ 0
OUT2
Text Label 4400 5250 0    50   ~ 0
OUT3
Text Label 3750 6000 0    50   ~ 0
GND
Wire Wire Line
	3150 5050 3550 5050
Wire Wire Line
	3150 5150 3550 5150
Wire Wire Line
	3150 5250 3550 5250
Wire Wire Line
	3150 5350 3550 5350
Wire Wire Line
	3150 5450 3550 5450
Wire Wire Line
	3150 5550 3550 5550
Wire Wire Line
	3150 5650 3550 5650
Wire Wire Line
	3150 5750 3550 5750
Wire Wire Line
	1800 5950 1800 6000
Text Label 1550 6000 0    50   ~ 0
GND
Text Label 1600 4650 0    50   ~ 0
3V3
Text Label 1500 1700 0    50   ~ 0
3V3
Wire Wire Line
	2050 3300 2050 3350
Text Label 1750 3350 0    50   ~ 0
GND
Wire Wire Line
	6200 900  7200 900 
Wire Wire Line
	7200 900  7200 1150
Wire Wire Line
	6200 1500 7200 1500
Wire Wire Line
	7200 1500 7200 1250
$Comp
L Switch:SW_DPST SW1
U 1 1 5BABD564
P 700 2350
F 0 "SW1" V 746 2162 50  0000 R CNN
F 1 "RESET" V 655 2162 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 700 2350 50  0001 C CNN
F 3 "" H 700 2350 50  0001 C CNN
	1    700  2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	800  2550 600  2550
Wire Wire Line
	600  2550 600  3350
Wire Wire Line
	600  3350 2050 3350
Connection ~ 600  2550
Wire Wire Line
	600  2150 600  2000
Wire Wire Line
	600  2000 800  2000
Wire Wire Line
	800  2150 800  2000
Connection ~ 800  2000
Wire Wire Line
	800  2000 1450 2000
$Comp
L Device:R_Small R1
U 1 1 5BAC7D95
P 600 1800
F 0 "R1" H 659 1846 50  0000 L CNN
F 1 "10k" H 659 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 600 1800 50  0001 C CNN
F 3 "~" H 600 1800 50  0001 C CNN
	1    600  1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  2000 600  1900
Connection ~ 600  2000
Wire Wire Line
	2050 1700 2050 1800
Wire Wire Line
	600  1700 2050 1700
Wire Wire Line
	1400 5450 1300 5450
Wire Wire Line
	1300 5450 1300 6000
Wire Wire Line
	1300 6000 1800 6000
Wire Wire Line
	1400 5150 950  5150
Wire Wire Line
	950  5150 950  4650
Wire Wire Line
	950  4650 1800 4650
Wire Wire Line
	1400 4850 1150 4850
Wire Wire Line
	1150 5050 1400 5050
Wire Wire Line
	1150 5350 1400 5350
Text Label 1150 4850 0    50   ~ 0
SER
Text Label 1150 5050 0    50   ~ 0
SRCLK
Text Label 1150 5350 0    50   ~ 0
RCLK
Wire Wire Line
	1450 2200 1150 2200
Text Label 1200 2200 0    50   ~ 0
3V3
Wire Wire Line
	2650 2000 3000 2000
Wire Wire Line
	3000 1700 2050 1700
Connection ~ 2050 1700
Wire Wire Line
	2650 2900 3000 2900
Wire Wire Line
	3000 2900 3000 3350
Wire Wire Line
	3000 3350 2050 3350
Connection ~ 2050 3350
Wire Wire Line
	2650 2600 3000 2600
Wire Wire Line
	2650 2700 3000 2700
Wire Wire Line
	2650 2800 3000 2800
Text Label 2700 2600 0    50   ~ 0
SRCLK
Text Label 2700 2700 0    50   ~ 0
SER
Text Label 2700 2800 0    50   ~ 0
RCLK
$Comp
L Device:C_Small C2
U 1 1 5BAF9AB3
P 2450 950
F 0 "C2" H 2542 996 50  0000 L CNN
F 1 "100nF" H 2542 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 950 50  0001 C CNN
F 3 "~" H 2450 950 50  0001 C CNN
	1    2450 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5BAF9B61
P 1400 950
F 0 "C1" H 1492 996 50  0000 L CNN
F 1 "1uF" H 1492 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 950 50  0001 C CNN
F 3 "~" H 1400 950 50  0001 C CNN
	1    1400 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1050 1400 1100
Connection ~ 1400 1100
Wire Wire Line
	1400 1100 2050 1100
Wire Wire Line
	1400 850  1400 750 
Connection ~ 1400 750 
Wire Wire Line
	1400 750  1750 750 
Wire Wire Line
	2450 850  2450 750 
Connection ~ 2450 750 
Wire Wire Line
	2450 750  2350 750 
Wire Wire Line
	2450 1050 2450 1100
Connection ~ 2450 1100
Wire Wire Line
	2450 1100 2650 1100
$Comp
L Device:LED D1
U 1 1 5BB1662C
P 5200 1050
F 0 "D1" V 5238 933 50  0000 R CNN
F 1 "LED" V 5147 933 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5200 1050 50  0001 C CNN
F 3 "~" H 5200 1050 50  0001 C CNN
	1    5200 1050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5BB16633
P 5200 1400
F 0 "R2" H 5259 1446 50  0000 L CNN
F 1 "290" H 5259 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5200 1400 50  0001 C CNN
F 3 "~" H 5200 1400 50  0001 C CNN
	1    5200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1200 5200 1300
Wire Wire Line
	5200 900  5200 850 
Wire Wire Line
	5200 850  5800 850 
Wire Wire Line
	5200 1500 5200 1550
Wire Wire Line
	5200 1550 5800 1550
Wire Wire Line
	2450 4850 2200 4850
Wire Wire Line
	2450 4950 2200 4950
Wire Wire Line
	2450 5050 2200 5050
Wire Wire Line
	2450 5150 2200 5150
Wire Wire Line
	2450 5250 2200 5250
Wire Wire Line
	2450 5350 2200 5350
Wire Wire Line
	2450 5450 2200 5450
Wire Wire Line
	2450 5550 2200 5550
Text Label 2300 4850 0    50   ~ 0
L8
Text Label 2300 4950 0    50   ~ 0
L7
Text Label 2300 5050 0    50   ~ 0
L6
Text Label 2300 5150 0    50   ~ 0
L5
Text Label 2300 5250 0    50   ~ 0
L4
Text Label 2300 5350 0    50   ~ 0
L3
Text Label 2300 5450 0    50   ~ 0
L2
Text Label 2300 5550 0    50   ~ 0
L1
Text Label 3150 5050 0    50   ~ 0
L1
Text Label 3150 5150 0    50   ~ 0
L2
Text Label 3150 5250 0    50   ~ 0
L3
Text Label 3150 5350 0    50   ~ 0
L4
Text Label 3150 5450 0    50   ~ 0
L5
Text Label 3150 5550 0    50   ~ 0
L6
Text Label 3150 5650 0    50   ~ 0
L7
Text Label 3150 5750 0    50   ~ 0
L8
$Comp
L Relay:SANYOU_SRD_Form_C K3
U 1 1 5BAA9C77
P 10300 2750
F 0 "K3" V 9733 2750 50  0000 C CNN
F 1 "SANYOU_SRD_Form_C" V 9824 2750 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 10750 2700 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 10300 2750 50  0001 C CNN
	1    10300 2750
	0    1    1    0   
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K2
U 1 1 5BAAC33D
P 8950 3150
F 0 "K2" V 9517 3150 50  0000 C CNN
F 1 "SANYOU_SRD_Form_C" V 9426 3150 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9400 3100 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8950 3150 50  0001 C CNN
	1    8950 3150
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5BAAC684
P 10000 900
F 0 "J4" H 10027 876 50  0000 L CNN
F 1 "24V_IN" H 10027 785 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10000 900 50  0001 C CNN
F 3 "~" H 10000 900 50  0001 C CNN
	1    10000 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 900  9800 900 
Wire Wire Line
	9550 1000 9800 1000
Text Label 9600 900  0    50   ~ 0
24+
Text Label 9600 1000 0    50   ~ 0
24-
Wire Wire Line
	8350 2850 8650 2850
Wire Wire Line
	8350 3050 8650 3050
Wire Wire Line
	10900 2850 10600 2850
Wire Wire Line
	10900 3050 10600 3050
Text Label 10650 2850 0    50   ~ 0
24+
Text Label 10650 3050 0    50   ~ 0
24-
Text Label 8450 2850 0    50   ~ 0
24+
Text Label 8450 3050 0    50   ~ 0
24-
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5BABACB0
P 9600 3150
F 0 "J3" H 9627 3126 50  0000 L CNN
F 1 "Velux_OUT" H 9627 3035 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 9600 3150 50  0001 C CNN
F 3 "~" H 9600 3150 50  0001 C CNN
	1    9600 3150
	0    -1   1    0   
$EndComp
Wire Wire Line
	9700 2950 10000 2950
Wire Wire Line
	9600 2950 9250 2950
Wire Wire Line
	8650 3350 8300 3350
Wire Wire Line
	9250 3350 9350 3350
$Comp
L Device:LED D2
U 1 1 5BAC58A6
P 8300 3550
F 0 "D2" V 8338 3433 50  0000 R CNN
F 1 "LED" V 8247 3433 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 3550 50  0001 C CNN
F 3 "~" H 8300 3550 50  0001 C CNN
	1    8300 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5BAC58AD
P 8300 3900
F 0 "R3" H 8359 3946 50  0000 L CNN
F 1 "290" H 8359 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 3900 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
	1    8300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3700 8300 3800
Wire Wire Line
	8300 3400 8300 3350
Wire Wire Line
	8300 4000 8300 4050
$Comp
L Device:LED D3
U 1 1 5BAC894B
P 10600 1600
F 0 "D3" V 10638 1483 50  0000 R CNN
F 1 "LED" V 10547 1483 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 1600 50  0001 C CNN
F 3 "~" H 10600 1600 50  0001 C CNN
	1    10600 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5BAC8952
P 10600 1950
F 0 "R4" H 10659 1996 50  0000 L CNN
F 1 "290" H 10659 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 1950 50  0001 C CNN
F 3 "~" H 10600 1950 50  0001 C CNN
	1    10600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1750 10600 1850
Wire Wire Line
	10600 1450 10600 1400
Wire Wire Line
	10600 2050 10600 2100
Wire Wire Line
	10000 2550 9750 2550
Wire Wire Line
	9750 2550 9750 1400
Wire Wire Line
	9750 1400 10600 1400
Text Label 10350 1400 0    50   ~ 0
5V
Wire Wire Line
	10600 2550 11000 2550
Wire Wire Line
	11000 2550 11000 2100
Wire Wire Line
	11000 2100 10600 2100
Text Label 10750 2100 0    50   ~ 0
OUT2
Wire Wire Line
	8300 4050 9350 4050
Wire Wire Line
	9350 3350 9350 4050
Text Label 8800 4050 0    50   ~ 0
OUT3
Text Label 8450 3350 0    50   ~ 0
5V
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 5BAE8BAD
P 4200 3700
F 0 "J5" H 4173 3673 50  0000 R CNN
F 1 "FLASH" H 4173 3582 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4200 3700 50  0001 C CNN
F 3 "~" H 4200 3700 50  0001 C CNN
	1    4200 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3750 3600 4000 3600
Wire Wire Line
	3750 3700 4000 3700
Wire Wire Line
	3750 3800 4000 3800
Wire Wire Line
	3750 3900 4000 3900
Text Label 3750 3900 0    50   ~ 0
GND
Text Label 3750 3600 0    50   ~ 0
3V3
Text Label 3750 3700 0    50   ~ 0
TXD
Text Label 3750 3800 0    50   ~ 0
RXD
Wire Wire Line
	2850 2100 2650 2100
Wire Wire Line
	2850 2300 2650 2300
Text Label 2750 2100 0    50   ~ 0
TXD
Text Label 2750 2300 0    50   ~ 0
RXD
$Comp
L Device:R_Small R5
U 1 1 5BAFE42C
P 3000 1800
F 0 "R5" H 3059 1846 50  0000 L CNN
F 1 "10K" H 3059 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3000 1800 50  0001 C CNN
F 3 "~" H 3000 1800 50  0001 C CNN
	1    3000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1900 3000 2000
Connection ~ 3000 2000
Text Label 3100 2000 0    50   ~ 0
GPIO0
$Comp
L Switch:SW_DPST SW2
U 1 1 5BB04E82
P 3650 2300
F 0 "SW2" V 3696 2112 50  0000 R CNN
F 1 "FLASH" V 3605 2112 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 3650 2300 50  0001 C CNN
F 3 "" H 3650 2300 50  0001 C CNN
	1    3650 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 2100 3750 2000
Wire Wire Line
	3000 2000 3550 2000
Wire Wire Line
	3750 2500 3750 2650
Wire Wire Line
	3750 3350 3000 3350
Connection ~ 3000 3350
Wire Wire Line
	3550 2500 3550 2650
Wire Wire Line
	3550 2650 3750 2650
Connection ~ 3750 2650
Wire Wire Line
	3750 2650 3750 3350
Wire Wire Line
	3550 2100 3550 2000
Connection ~ 3550 2000
Wire Wire Line
	3550 2000 3750 2000
$Comp
L Device:R_Small R6
U 1 1 5C84F39A
P 3350 1800
F 0 "R6" H 3409 1846 50  0000 L CNN
F 1 "10K" H 3409 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 1800 50  0001 C CNN
F 3 "~" H 3350 1800 50  0001 C CNN
	1    3350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1700 3350 1700
Connection ~ 3000 1700
Wire Wire Line
	3350 1900 3350 2200
Wire Wire Line
	3350 2200 2650 2200
$EndSCHEMATC
