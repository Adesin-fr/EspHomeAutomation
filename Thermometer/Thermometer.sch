EESchema Schematic File Version 4
LIBS:Thermometer-cache
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
L ESP32:ESP-32S U1
U 1 1 5C0F8D6E
P 5100 3500
F 0 "U1" H 5075 4887 60  0000 C CNN
F 1 "ESP-32S" H 5075 4781 60  0000 C CNN
F 2 "ESP32-footprints-Lib:ESP-32S" H 5450 4850 60  0001 C CNN
F 3 "" H 4650 3950 60  0001 C CNN
	1    5100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4150 6000 4150
Text Label 6050 4150 0    50   ~ 0
BOOT
Wire Wire Line
	6000 3350 6300 3350
Wire Wire Line
	6300 3050 6000 3050
Text Label 6050 3050 0    50   ~ 0
SCL
Text Label 6050 3350 0    50   ~ 0
SDA
Wire Wire Line
	3850 2800 4150 2800
Wire Wire Line
	3850 2900 4150 2900
Text Label 3900 2800 0    50   ~ 0
GND
Text Label 3900 2900 0    50   ~ 0
3V3
Wire Wire Line
	6300 3150 6000 3150
Wire Wire Line
	6300 3250 6000 3250
Text Label 6050 3150 0    50   ~ 0
TX
Text Label 6050 3250 0    50   ~ 0
RX
$Comp
L Device:C_Small C1
U 1 1 5C0F984A
P 1800 1150
F 0 "C1" H 1892 1196 50  0000 L CNN
F 1 "C_Small" H 1892 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1800 1150 50  0001 C CNN
F 3 "~" H 1800 1150 50  0001 C CNN
	1    1800 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5C0F98D4
P 1050 1200
F 0 "J1" H 970 875 50  0000 C CNN
F 1 "Conn_01x02" H 970 966 50  0000 C CNN
F 2 "Battery:BatteryHolder_Keystone_1058_1x2032" H 1050 1200 50  0001 C CNN
F 3 "~" H 1050 1200 50  0001 C CNN
	1    1050 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 1200 1250 1200
Text Label 1350 1100 0    50   ~ 0
3V3
Text Label 1350 1200 0    50   ~ 0
GND
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 5C0F9E51
P 8900 3950
F 0 "J3" H 8980 3942 50  0000 L CNN
F 1 "BME280" H 8980 3851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 8900 3950 50  0001 C CNN
F 3 "~" H 8900 3950 50  0001 C CNN
	1    8900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3950 8700 3950
Wire Wire Line
	8400 4050 8700 4050
Wire Wire Line
	8400 4150 8700 4150
Wire Wire Line
	8400 4250 8700 4250
Text Label 8450 3950 0    50   ~ 0
SDA
Text Label 8450 4050 0    50   ~ 0
SCL
Text Label 8450 4150 0    50   ~ 0
GND
Wire Wire Line
	1650 1100 1650 1050
Wire Wire Line
	1250 1100 1650 1100
Wire Wire Line
	1550 1200 1550 1250
Wire Wire Line
	6000 2750 6300 2750
Text Label 6050 2750 0    50   ~ 0
GND
Wire Wire Line
	4650 4550 4650 5050
Text Label 4650 4850 1    50   ~ 0
GND
Wire Wire Line
	3850 3100 4150 3100
Text Label 3900 3100 0    50   ~ 0
VBAT
$Comp
L Device:R_Small R1
U 1 1 5C0FB402
P 2650 1050
F 0 "R1" H 2709 1096 50  0000 L CNN
F 1 "100k" H 2709 1005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 1050 50  0001 C CNN
F 3 "~" H 2650 1050 50  0001 C CNN
	1    2650 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5C0FB512
P 2650 1350
F 0 "R2" H 2709 1396 50  0000 L CNN
F 1 "27K" H 2709 1305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 1350 50  0001 C CNN
F 3 "~" H 2650 1350 50  0001 C CNN
	1    2650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1150 2650 1200
Wire Wire Line
	2650 1200 3300 1200
Connection ~ 2650 1200
Wire Wire Line
	2650 1200 2650 1250
Text Label 3100 1200 0    50   ~ 0
VBAT
$Comp
L Sensor_Optical:LDR03 R3
U 1 1 5C0FD694
P 2500 2800
F 0 "R3" H 2312 2754 50  0000 R CNN
F 1 "LDR03" H 2312 2845 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 2675 2800 50  0001 C CNN
F 3 "http://www.elektronica-componenten.nl/WebRoot/StoreNL/Shops/61422969/54F1/BA0C/C664/31B9/2173/C0A8/2AB9/2AEF/LDR03IMP.pdf" H 2500 2750 50  0001 C CNN
	1    2500 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5C0FD80E
P 2500 3150
F 0 "R4" H 2559 3196 50  0000 L CNN
F 1 "10K" H 2559 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2500 3150 50  0001 C CNN
F 3 "~" H 2500 3150 50  0001 C CNN
	1    2500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2950 2500 3000
Wire Wire Line
	2500 3000 3000 3000
Connection ~ 2500 3000
Wire Wire Line
	2500 3000 2500 3050
Wire Wire Line
	2500 3250 2500 3400
Wire Wire Line
	2500 3400 3000 3400
Wire Wire Line
	2500 2650 2500 2550
Wire Wire Line
	2500 2550 3000 2550
Text Label 2600 2550 0    50   ~ 0
LDR_ON
Text Label 2700 3000 0    50   ~ 0
VLDR
Text Label 2700 3400 0    50   ~ 0
GND
Wire Wire Line
	3850 3200 4150 3200
Text Label 3900 3200 0    50   ~ 0
VLDR
Wire Wire Line
	3850 3300 4150 3300
Text Label 3850 3300 0    50   ~ 0
LDR_ON
$Comp
L Switch:SW_Push SW1
U 1 1 5C118454
P 3450 3250
F 0 "SW1" V 3496 3202 50  0000 R CNN
F 1 "SW_Push" V 3405 3202 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_RS282G05A3" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0001 C CNN
	1    3450 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5C11855B
P 3450 2800
F 0 "R5" H 3509 2846 50  0000 L CNN
F 1 "10K" H 3509 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 2800 50  0001 C CNN
F 3 "~" H 3450 2800 50  0001 C CNN
	1    3450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3000 4150 3000
Wire Wire Line
	3450 2900 3450 3000
Connection ~ 3450 3000
Wire Wire Line
	3450 3000 3450 3050
Wire Wire Line
	3450 3450 3650 3450
Text Label 3500 3450 0    50   ~ 0
GND
Wire Wire Line
	3450 2700 3450 2600
Wire Wire Line
	3450 2600 3650 2600
Text Label 3500 2600 0    50   ~ 0
3V3
Wire Wire Line
	5550 5050 5550 4550
Text Label 5550 5000 1    50   ~ 0
IO2
Wire Wire Line
	8350 3750 8700 3750
Wire Wire Line
	8400 3850 8700 3850
Text Label 8450 3750 0    50   ~ 0
IO2
Text Label 8450 3850 0    50   ~ 0
IO4
Wire Wire Line
	6300 4050 6000 4050
Text Label 6050 4050 0    50   ~ 0
IO4
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5C132CEE
P 1050 1900
F 0 "J4" H 970 1575 50  0000 C CNN
F 1 "Conn_01x02" H 970 1666 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 1900 50  0001 C CNN
F 3 "~" H 1050 1900 50  0001 C CNN
	1    1050 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 1800 1250 1800
Wire Wire Line
	1550 1900 1250 1900
Text Label 1300 1800 0    50   ~ 0
3V3
Text Label 1300 1900 0    50   ~ 0
GND
Text Label 8450 4250 0    50   ~ 0
3V3
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5C1377E9
P 9500 2850
F 0 "J2" H 9580 2892 50  0000 L CNN
F 1 "Conn_01x03" H 9580 2801 50  0000 L CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x03_P2.00mm_Vertical_SMD_Pin1Right" H 9500 2850 50  0001 C CNN
F 3 "~" H 9500 2850 50  0001 C CNN
	1    9500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 2750 9300 2750
Wire Wire Line
	9000 2850 9300 2850
Wire Wire Line
	9000 2950 9300 2950
Text Label 9050 2750 0    50   ~ 0
BOOT
Text Label 9050 2850 0    50   ~ 0
RX
Text Label 9050 2950 0    50   ~ 0
TX
Wire Wire Line
	1650 1050 1800 1050
Wire Wire Line
	1550 1250 1800 1250
Wire Wire Line
	2650 1450 2650 1500
Wire Wire Line
	2650 1500 3300 1500
Wire Wire Line
	2650 950  2650 850 
Wire Wire Line
	2650 850  3300 850 
Text Label 3100 1500 0    50   ~ 0
GND
Text Label 3000 850  0    50   ~ 0
VBAT_ON
Wire Wire Line
	6000 3850 6300 3850
Text Label 6050 3850 0    50   ~ 0
VBAT_ON
$EndSCHEMATC
