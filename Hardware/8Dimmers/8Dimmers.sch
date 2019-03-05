EESchema Schematic File Version 4
LIBS:8Dimmers-cache
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
L 8Dimmers-rescue:MOC3020M U6
U 1 1 5822D3A4
P 8400 800
F 0 "U6" H 8190 990 50  0000 L CNN
F 1 "MOC3023M" H 8300 1000 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 600 50  0000 L CIN
F 3 "" H 8375 800 50  0000 L CNN
	1    8400 800 
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D1
U 1 1 5822D402
P 7950 700
F 0 "D1" H 7900 825 50  0000 L CNN
F 1 "Led" H 7900 600 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 700 50  0001 C CNN
F 3 "" V 7950 700 50  0000 C CNN
	1    7950 700 
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R2
U 1 1 5822D485
P 7700 700
F 0 "R2" H 7730 720 50  0000 L CNN
F 1 "100" H 7730 660 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 700 50  0001 C CNN
F 3 "" H 7700 700 50  0000 C CNN
	1    7700 700 
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R10
U 1 1 5822D4D8
P 8900 700
F 0 "R10" V 8980 700 50  0000 C CNN
F 1 "4k7" V 8900 700 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 700 50  0001 C CNN
F 3 "" H 8900 700 50  0000 C CNN
	1    8900 700 
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F1
U 1 1 5824323A
P 9600 700
F 0 "F1" H 9560 760 50  0000 L CNN
F 1 "F_Small" H 9480 640 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 700 50  0001 C CNN
F 3 "" H 9600 700 50  0000 C CNN
	1    9600 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 700  8750 700 
Wire Wire Line
	8700 900  9050 900 
Wire Wire Line
	9250 950  9950 950 
Wire Wire Line
	9950 700  9700 700 
Wire Wire Line
	9050 700  9250 700 
Connection ~ 9250 700 
Wire Wire Line
	7800 700  7850 700 
Wire Wire Line
	8050 700  8100 700 
Wire Wire Line
	7450 900  8100 900 
Wire Wire Line
	7450 700  7600 700 
Text Label 9750 700  0    60   ~ 0
PH_IN
Text Label 9750 950  0    60   ~ 0
PH_0
$Comp
L 8Dimmers-rescue:MOC3020M U7
U 1 1 5824369B
P 8400 1300
F 0 "U7" H 8190 1490 50  0000 L CNN
F 1 "MOC3023M" H 8300 1500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 1100 50  0000 L CIN
F 3 "" H 8375 1300 50  0000 L CNN
	1    8400 1300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D2
U 1 1 582436A1
P 7950 1200
F 0 "D2" H 7900 1325 50  0000 L CNN
F 1 "Led" H 7900 1100 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 1200 50  0001 C CNN
F 3 "" V 7950 1200 50  0000 C CNN
	1    7950 1200
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R3
U 1 1 582436A7
P 7700 1200
F 0 "R3" H 7730 1220 50  0000 L CNN
F 1 "100" H 7730 1160 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 1200 50  0001 C CNN
F 3 "" H 7700 1200 50  0000 C CNN
	1    7700 1200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R11
U 1 1 582436AD
P 8900 1200
F 0 "R11" V 8980 1200 50  0000 C CNN
F 1 "4k7" V 8900 1200 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 1200 50  0001 C CNN
F 3 "" H 8900 1200 50  0000 C CNN
	1    8900 1200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F2
U 1 1 582436B3
P 9600 1200
F 0 "F2" H 9560 1260 50  0000 L CNN
F 1 "F_Small" H 9480 1140 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 1200 50  0001 C CNN
F 3 "" H 9600 1200 50  0000 C CNN
	1    9600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1200 8750 1200
Wire Wire Line
	8700 1400 9050 1400
Wire Wire Line
	9250 1450 9950 1450
Wire Wire Line
	9950 1200 9700 1200
Wire Wire Line
	9050 1200 9250 1200
Connection ~ 9250 1200
Wire Wire Line
	7800 1200 7850 1200
Wire Wire Line
	8050 1200 8100 1200
Wire Wire Line
	7450 1400 8100 1400
Wire Wire Line
	7450 1200 7600 1200
Text Label 9750 1200 0    60   ~ 0
PH_IN
Text Label 9750 1450 0    60   ~ 0
PH_1
$Comp
L 8Dimmers-rescue:MOC3020M U8
U 1 1 582438DD
P 8400 1800
F 0 "U8" H 8190 1990 50  0000 L CNN
F 1 "MOC3023M" H 8300 2000 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 1600 50  0000 L CIN
F 3 "" H 8375 1800 50  0000 L CNN
	1    8400 1800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D3
U 1 1 582438E3
P 7950 1700
F 0 "D3" H 7900 1825 50  0000 L CNN
F 1 "Led" H 7900 1600 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 1700 50  0001 C CNN
F 3 "" V 7950 1700 50  0000 C CNN
	1    7950 1700
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R4
U 1 1 582438E9
P 7700 1700
F 0 "R4" H 7730 1720 50  0000 L CNN
F 1 "100" H 7730 1660 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 1700 50  0001 C CNN
F 3 "" H 7700 1700 50  0000 C CNN
	1    7700 1700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R12
U 1 1 582438EF
P 8900 1700
F 0 "R12" V 8980 1700 50  0000 C CNN
F 1 "4k7" V 8900 1700 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 1700 50  0001 C CNN
F 3 "" H 8900 1700 50  0000 C CNN
	1    8900 1700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F3
U 1 1 582438F5
P 9600 1700
F 0 "F3" H 9560 1760 50  0000 L CNN
F 1 "F_Small" H 9480 1640 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 1700 50  0001 C CNN
F 3 "" H 9600 1700 50  0000 C CNN
	1    9600 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1700 8750 1700
Wire Wire Line
	8700 1900 9050 1900
Wire Wire Line
	9250 1950 9950 1950
Wire Wire Line
	9950 1700 9700 1700
Wire Wire Line
	9050 1700 9250 1700
Connection ~ 9250 1700
Wire Wire Line
	7800 1700 7850 1700
Wire Wire Line
	8050 1700 8100 1700
Wire Wire Line
	7450 1900 8100 1900
Wire Wire Line
	7450 1700 7600 1700
Text Label 9750 1700 0    60   ~ 0
PH_IN
Text Label 9750 1950 0    60   ~ 0
PH_2
$Comp
L 8Dimmers-rescue:MOC3020M U9
U 1 1 5824390F
P 8400 2300
F 0 "U9" H 8190 2490 50  0000 L CNN
F 1 "MOC3023M" H 8300 2500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 2100 50  0000 L CIN
F 3 "" H 8375 2300 50  0000 L CNN
	1    8400 2300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D4
U 1 1 58243915
P 7950 2200
F 0 "D4" H 7900 2325 50  0000 L CNN
F 1 "Led" H 7900 2100 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 2200 50  0001 C CNN
F 3 "" V 7950 2200 50  0000 C CNN
	1    7950 2200
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R5
U 1 1 5824391B
P 7700 2200
F 0 "R5" H 7730 2220 50  0000 L CNN
F 1 "100" H 7730 2160 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 2200 50  0001 C CNN
F 3 "" H 7700 2200 50  0000 C CNN
	1    7700 2200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R13
U 1 1 58243921
P 8900 2200
F 0 "R13" V 8980 2200 50  0000 C CNN
F 1 "4k7" V 8900 2200 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 2200 50  0001 C CNN
F 3 "" H 8900 2200 50  0000 C CNN
	1    8900 2200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F4
U 1 1 58243927
P 9600 2200
F 0 "F4" H 9560 2260 50  0000 L CNN
F 1 "F_Small" H 9480 2140 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 2200 50  0001 C CNN
F 3 "" H 9600 2200 50  0000 C CNN
	1    9600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2200 8750 2200
Wire Wire Line
	8700 2400 9050 2400
Wire Wire Line
	9250 2450 9950 2450
Wire Wire Line
	9950 2200 9700 2200
Wire Wire Line
	9050 2200 9250 2200
Connection ~ 9250 2200
Wire Wire Line
	7800 2200 7850 2200
Wire Wire Line
	8050 2200 8100 2200
Wire Wire Line
	7450 2400 8100 2400
Wire Wire Line
	7450 2200 7600 2200
Text Label 9750 2200 0    60   ~ 0
PH_IN
Text Label 9750 2450 0    60   ~ 0
PH_3
$Comp
L 8Dimmers-rescue:MOC3020M U10
U 1 1 58243E81
P 8400 2800
F 0 "U10" H 8190 2990 50  0000 L CNN
F 1 "MOC3023M" H 8300 3000 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 2600 50  0000 L CIN
F 3 "" H 8375 2800 50  0000 L CNN
	1    8400 2800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D5
U 1 1 58243E87
P 7950 2700
F 0 "D5" H 7900 2825 50  0000 L CNN
F 1 "Led" H 7900 2600 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 2700 50  0001 C CNN
F 3 "" V 7950 2700 50  0000 C CNN
	1    7950 2700
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R6
U 1 1 58243E8D
P 7700 2700
F 0 "R6" H 7730 2720 50  0000 L CNN
F 1 "100" H 7730 2660 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 2700 50  0001 C CNN
F 3 "" H 7700 2700 50  0000 C CNN
	1    7700 2700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R14
U 1 1 58243E93
P 8900 2700
F 0 "R14" V 8980 2700 50  0000 C CNN
F 1 "4k7" V 8900 2700 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 2700 50  0001 C CNN
F 3 "" H 8900 2700 50  0000 C CNN
	1    8900 2700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F5
U 1 1 58243E99
P 9600 2700
F 0 "F5" H 9560 2760 50  0000 L CNN
F 1 "F_Small" H 9480 2640 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 2700 50  0001 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2700 8750 2700
Wire Wire Line
	8700 2900 9050 2900
Wire Wire Line
	9250 2950 9950 2950
Wire Wire Line
	9950 2700 9700 2700
Wire Wire Line
	9050 2700 9250 2700
Connection ~ 9250 2700
Wire Wire Line
	7800 2700 7850 2700
Wire Wire Line
	8050 2700 8100 2700
Wire Wire Line
	7450 2900 8100 2900
Wire Wire Line
	7450 2700 7600 2700
Text Label 9750 2700 0    60   ~ 0
PH_IN
Text Label 9750 2950 0    60   ~ 0
PH_4
$Comp
L 8Dimmers-rescue:MOC3020M U11
U 1 1 58243EB3
P 8400 3300
F 0 "U11" H 8190 3490 50  0000 L CNN
F 1 "MOC3023M" H 8300 3500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 3100 50  0000 L CIN
F 3 "" H 8375 3300 50  0000 L CNN
	1    8400 3300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D6
U 1 1 58243EB9
P 7950 3200
F 0 "D6" H 7900 3325 50  0000 L CNN
F 1 "Led" H 7900 3100 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 3200 50  0001 C CNN
F 3 "" V 7950 3200 50  0000 C CNN
	1    7950 3200
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R7
U 1 1 58243EBF
P 7700 3200
F 0 "R7" H 7730 3220 50  0000 L CNN
F 1 "100" H 7730 3160 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 3200 50  0001 C CNN
F 3 "" H 7700 3200 50  0000 C CNN
	1    7700 3200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R15
U 1 1 58243EC5
P 8900 3200
F 0 "R15" V 8980 3200 50  0000 C CNN
F 1 "4k7" V 8900 3200 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 3200 50  0001 C CNN
F 3 "" H 8900 3200 50  0000 C CNN
	1    8900 3200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F6
U 1 1 58243ECB
P 9600 3200
F 0 "F6" H 9560 3260 50  0000 L CNN
F 1 "F_Small" H 9480 3140 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 3200 50  0001 C CNN
F 3 "" H 9600 3200 50  0000 C CNN
	1    9600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3200 8750 3200
Wire Wire Line
	8700 3400 9050 3400
Wire Wire Line
	9250 3450 9950 3450
Wire Wire Line
	9950 3200 9700 3200
Wire Wire Line
	9050 3200 9250 3200
Connection ~ 9250 3200
Wire Wire Line
	7800 3200 7850 3200
Wire Wire Line
	8050 3200 8100 3200
Wire Wire Line
	7450 3400 8100 3400
Wire Wire Line
	7450 3200 7600 3200
Text Label 9750 3200 0    60   ~ 0
PH_IN
Text Label 9750 3450 0    60   ~ 0
PH_5
$Comp
L 8Dimmers-rescue:MOC3020M U12
U 1 1 58243EE5
P 8400 3800
F 0 "U12" H 8190 3990 50  0000 L CNN
F 1 "MOC3023M" H 8300 4000 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 3600 50  0000 L CIN
F 3 "" H 8375 3800 50  0000 L CNN
	1    8400 3800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D7
U 1 1 58243EEB
P 7950 3700
F 0 "D7" H 7900 3825 50  0000 L CNN
F 1 "Led" H 7900 3600 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 3700 50  0001 C CNN
F 3 "" V 7950 3700 50  0000 C CNN
	1    7950 3700
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R8
U 1 1 58243EF1
P 7700 3700
F 0 "R8" H 7730 3720 50  0000 L CNN
F 1 "100" H 7730 3660 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 3700 50  0001 C CNN
F 3 "" H 7700 3700 50  0000 C CNN
	1    7700 3700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R16
U 1 1 58243EF7
P 8900 3700
F 0 "R16" V 8980 3700 50  0000 C CNN
F 1 "4k7" V 8900 3700 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 3700 50  0001 C CNN
F 3 "" H 8900 3700 50  0000 C CNN
	1    8900 3700
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F7
U 1 1 58243EFD
P 9600 3700
F 0 "F7" H 9560 3760 50  0000 L CNN
F 1 "F_Small" H 9480 3640 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 3700 50  0001 C CNN
F 3 "" H 9600 3700 50  0000 C CNN
	1    9600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3700 8750 3700
Wire Wire Line
	8700 3900 9050 3900
Wire Wire Line
	9250 3950 9950 3950
Wire Wire Line
	9950 3700 9700 3700
Wire Wire Line
	9050 3700 9250 3700
Connection ~ 9250 3700
Wire Wire Line
	7800 3700 7850 3700
Wire Wire Line
	8050 3700 8100 3700
Wire Wire Line
	7450 3900 8100 3900
Wire Wire Line
	7450 3700 7600 3700
Text Label 9750 3700 0    60   ~ 0
PH_IN
Text Label 9750 3950 0    60   ~ 0
PH_6
$Comp
L 8Dimmers-rescue:MOC3020M U13
U 1 1 58243F17
P 8400 4300
F 0 "U13" H 8190 4490 50  0000 L CNN
F 1 "MOC3023M" H 8300 4500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 8200 4100 50  0000 L CIN
F 3 "" H 8375 4300 50  0000 L CNN
	1    8400 4300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:Led_Small D8
U 1 1 58243F1D
P 7950 4200
F 0 "D8" H 7900 4325 50  0000 L CNN
F 1 "Led" H 7900 4100 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7950 4200 50  0001 C CNN
F 3 "" V 7950 4200 50  0000 C CNN
	1    7950 4200
	-1   0    0    1   
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R9
U 1 1 58243F23
P 7700 4200
F 0 "R9" H 7730 4220 50  0000 L CNN
F 1 "100" H 7730 4160 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 4200 50  0001 C CNN
F 3 "" H 7700 4200 50  0000 C CNN
	1    7700 4200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:R R17
U 1 1 58243F29
P 8900 4200
F 0 "R17" V 8980 4200 50  0000 C CNN
F 1 "4k7" V 8900 4200 50  0000 C CNN
F 2 "Resistors_ThroughHole:RES35" V 8830 4200 50  0001 C CNN
F 3 "" H 8900 4200 50  0000 C CNN
	1    8900 4200
	0    -1   -1   0   
$EndComp
$Comp
L 8Dimmers-rescue:F_Small F8
U 1 1 58243F2F
P 9600 4200
F 0 "F8" H 9560 4260 50  0000 L CNN
F 1 "F_Small" H 9480 4140 50  0000 L CNN
F 2 "MyLibrary:Fuseholder5x20" H 9600 4200 50  0001 C CNN
F 3 "" H 9600 4200 50  0000 C CNN
	1    9600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4200 8750 4200
Wire Wire Line
	8700 4400 9050 4400
Wire Wire Line
	9250 4450 9950 4450
Wire Wire Line
	9950 4200 9700 4200
Wire Wire Line
	9050 4200 9250 4200
Connection ~ 9250 4200
Wire Wire Line
	7800 4200 7850 4200
Wire Wire Line
	8050 4200 8100 4200
Wire Wire Line
	7450 4400 8100 4400
Wire Wire Line
	7450 4200 7600 4200
Text Label 9750 4200 0    60   ~ 0
PH_IN
Text Label 9750 4450 0    60   ~ 0
PH_7
$Comp
L 8Dimmers-rescue:CONN_01X02 P2
U 1 1 58244769
P 10750 5950
F 0 "P2" H 10750 6100 50  0000 C CNN
F 1 "CONN_01X02" V 10850 5950 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10750 5950 50  0001 C CNN
F 3 "" H 10750 5950 50  0000 C CNN
	1    10750 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 5900 10250 5900
Wire Wire Line
	10550 6000 10250 6000
Text Label 10250 5900 0    60   ~ 0
PH_IN
Text Label 10250 6000 0    60   ~ 0
N
$Comp
L 8Dimmers-rescue:CONN_01X02 P3
U 1 1 58245F3A
P 10950 800
F 0 "P3" H 10950 950 50  0000 C CNN
F 1 "CONN_01X02" H 10950 650 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 800 50  0001 C CNN
F 3 "" H 10950 800 50  0000 C CNN
	1    10950 800 
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P4
U 1 1 58246032
P 10950 1300
F 0 "P4" H 10950 1450 50  0000 C CNN
F 1 "CONN_01X02" H 10950 1150 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 1300 50  0001 C CNN
F 3 "" H 10950 1300 50  0000 C CNN
	1    10950 1300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P5
U 1 1 582461BE
P 10950 1800
F 0 "P5" H 10950 1950 50  0000 C CNN
F 1 "CONN_01X02" H 10950 1650 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 1800 50  0001 C CNN
F 3 "" H 10950 1800 50  0000 C CNN
	1    10950 1800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P6
U 1 1 58246397
P 10950 2300
F 0 "P6" H 10950 2450 50  0000 C CNN
F 1 "CONN_01X02" H 10950 2150 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 2300 50  0001 C CNN
F 3 "" H 10950 2300 50  0000 C CNN
	1    10950 2300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P7
U 1 1 58246493
P 10950 2800
F 0 "P7" H 10950 2950 50  0000 C CNN
F 1 "CONN_01X02" H 10950 2650 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 2800 50  0001 C CNN
F 3 "" H 10950 2800 50  0000 C CNN
	1    10950 2800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P8
U 1 1 5824655E
P 10950 3300
F 0 "P8" H 10950 3450 50  0000 C CNN
F 1 "CONN_01X02" H 10950 3150 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 3300 50  0001 C CNN
F 3 "" H 10950 3300 50  0000 C CNN
	1    10950 3300
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P9
U 1 1 582466A0
P 10950 3800
F 0 "P9" H 10950 3950 50  0000 C CNN
F 1 "CONN_01X02" H 10950 3650 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 3800 50  0001 C CNN
F 3 "" H 10950 3800 50  0000 C CNN
	1    10950 3800
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CONN_01X02 P10
U 1 1 5824676F
P 10950 4300
F 0 "P10" H 10950 4450 50  0000 C CNN
F 1 "CONN_01X02" H 10950 4150 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10950 4300 50  0001 C CNN
F 3 "" H 10950 4300 50  0000 C CNN
	1    10950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 750  10550 750 
Wire Wire Line
	10750 850  10550 850 
Wire Wire Line
	10750 1250 10550 1250
Wire Wire Line
	10750 1350 10550 1350
Wire Wire Line
	10750 1750 10550 1750
Wire Wire Line
	10750 1850 10550 1850
Wire Wire Line
	10750 2250 10550 2250
Wire Wire Line
	10750 2350 10550 2350
Wire Wire Line
	10750 2750 10550 2750
Wire Wire Line
	10750 2850 10550 2850
Wire Wire Line
	10750 3250 10550 3250
Wire Wire Line
	10750 3350 10550 3350
Wire Wire Line
	10750 3750 10550 3750
Wire Wire Line
	10750 3850 10550 3850
Wire Wire Line
	10750 4250 10550 4250
Wire Wire Line
	10750 4350 10550 4350
Text Label 10550 4350 0    60   ~ 0
N
Text Label 10550 3850 0    60   ~ 0
N
Text Label 10550 3350 0    60   ~ 0
N
Text Label 10550 2850 0    60   ~ 0
N
Text Label 10550 2350 0    60   ~ 0
N
Text Label 10550 1850 0    60   ~ 0
N
Text Label 10550 1350 0    60   ~ 0
N
Text Label 10550 850  0    60   ~ 0
N
Text Label 10550 750  0    60   ~ 0
PH_0
Text Label 10550 1250 0    60   ~ 0
PH_1
Text Label 10550 1750 0    60   ~ 0
PH_2
Text Label 10550 2250 0    60   ~ 0
PH_3
Text Label 10550 2750 0    60   ~ 0
PH_4
Text Label 10550 3250 0    60   ~ 0
PH_5
Text Label 10550 3750 0    60   ~ 0
PH_6
Text Label 10550 4250 0    60   ~ 0
PH_7
$Comp
L 8Dimmers-rescue:LTV-814 U1
U 1 1 58248C4F
P 1450 6900
F 0 "U1" H 1250 7100 50  0000 L CNN
F 1 "LTV-814" H 1450 7100 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm_LongPads" H 1250 6700 50  0000 L CIN
F 3 "" H 1475 6900 50  0000 L CNN
	1    1450 6900
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:R_Small R1
U 1 1 582496E1
P 950 6800
F 0 "R1" H 980 6820 50  0000 L CNN
F 1 "100k" V 950 6700 50  0000 L CNN
F 2 "Resistors_ThroughHole:RES35" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0000 C CNN
	1    950  6800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1050 6800 1150 6800
Wire Wire Line
	850  6800 600  6800
Text Label 600  6800 0    60   ~ 0
PH_IN
Text Label 600  7000 0    60   ~ 0
N
$Comp
L power:GND #PWR01
U 1 1 58249DE4
P 2000 7100
F 0 "#PWR01" H 2000 6850 50  0001 C CNN
F 1 "GND" H 2000 6950 50  0000 C CNN
F 2 "" H 2000 7100 50  0000 C CNN
F 3 "" H 2000 7100 50  0000 C CNN
	1    2000 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7000 2000 7000
Wire Wire Line
	2000 7000 2000 7100
Wire Wire Line
	1750 6800 1800 6800
Text Label 1850 6800 0    60   ~ 0
ZCD
$Comp
L 8Dimmers-rescue:TRIAC_small U14
U 1 1 582446F2
P 9250 850
F 0 "U14" H 9300 950 50  0000 C CNN
F 1 "TRIAC_small" H 9250 700 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 800 60  0001 C CNN
F 3 "" H 9250 800 60  0000 C CNN
	1    9250 850 
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U15
U 1 1 582447DB
P 9250 1350
F 0 "U15" H 9300 1450 50  0000 C CNN
F 1 "TRIAC_small" H 9250 1200 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 1300 60  0001 C CNN
F 3 "" H 9250 1300 60  0000 C CNN
	1    9250 1350
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U16
U 1 1 58244945
P 9250 1850
F 0 "U16" H 9300 1950 50  0000 C CNN
F 1 "TRIAC_small" H 9250 1700 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 1800 60  0001 C CNN
F 3 "" H 9250 1800 60  0000 C CNN
	1    9250 1850
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U17
U 1 1 58244A11
P 9250 2350
F 0 "U17" H 9300 2450 50  0000 C CNN
F 1 "TRIAC_small" H 9250 2200 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 2300 60  0001 C CNN
F 3 "" H 9250 2300 60  0000 C CNN
	1    9250 2350
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U18
U 1 1 58244B87
P 9250 2850
F 0 "U18" H 9300 2950 50  0000 C CNN
F 1 "TRIAC_small" H 9250 2700 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 2800 60  0001 C CNN
F 3 "" H 9250 2800 60  0000 C CNN
	1    9250 2850
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U19
U 1 1 58244C59
P 9250 3350
F 0 "U19" H 9300 3450 50  0000 C CNN
F 1 "TRIAC_small" H 9250 3200 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 3300 60  0001 C CNN
F 3 "" H 9250 3300 60  0000 C CNN
	1    9250 3350
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U20
U 1 1 58244DFB
P 9250 3850
F 0 "U20" H 9300 3950 50  0000 C CNN
F 1 "TRIAC_small" H 9250 3700 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 3800 60  0001 C CNN
F 3 "" H 9250 3800 60  0000 C CNN
	1    9250 3850
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:TRIAC_small U21
U 1 1 58244ED9
P 9250 4350
F 0 "U21" H 9300 4450 50  0000 C CNN
F 1 "TRIAC_small" H 9250 4200 50  0000 C CNN
F 2 "Power_Integrations:TO-220" H 9250 4300 60  0001 C CNN
F 3 "" H 9250 4300 60  0000 C CNN
	1    9250 4350
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:CP C2
U 1 1 58245C6D
P 1600 1000
F 0 "C2" H 1625 1100 50  0000 L CNN
F 1 "100µF" H 1625 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1638 850 30  0001 C CNN
F 3 "" H 1600 1000 60  0000 C CNN
	1    1600 1000
	1    0    0    -1  
$EndComp
$Comp
L 8Dimmers-rescue:AP1117D33 U2
U 1 1 58345FE8
P 3050 850
F 0 "U2" H 3150 600 50  0000 C CNN
F 1 "AP1117D33" H 3050 1100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3050 850 60  0001 C CNN
F 3 "" H 3050 850 60  0000 C CNN
	1    3050 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 850  1600 850 
Wire Wire Line
	3350 850  3600 850 
Text Label 3450 850  0    60   ~ 0
3V3
$Comp
L power:GND #PWR03
U 1 1 583463C5
P 3050 1200
F 0 "#PWR03" H 3050 950 50  0001 C CNN
F 1 "GND" H 3050 1050 50  0000 C CNN
F 2 "" H 3050 1200 60  0000 C CNN
F 3 "" H 3050 1200 60  0000 C CNN
	1    3050 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1200 3050 1150
$Comp
L 8Dimmers-rescue:CP C5
U 1 1 583466BA
P 3600 1050
F 0 "C5" H 3625 1150 50  0000 L CNN
F 1 "100µF" H 3625 950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3638 900 30  0001 C CNN
F 3 "" H 3600 1050 60  0000 C CNN
	1    3600 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1200 3050 1200
Wire Wire Line
	3600 900  3600 850 
Connection ~ 3600 850 
$Comp
L 8Dimmers-rescue:CONN_01X02 P11
U 1 1 58346CA9
P 1000 1000
F 0 "P11" H 1000 1150 50  0000 C CNN
F 1 "5VIN" V 1100 1000 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1000 1000 60  0001 C CNN
F 3 "" H 1000 1000 60  0000 C CNN
	1    1000 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 950  1250 950 
Wire Wire Line
	1250 950  1250 850 
Connection ~ 1600 850 
$Comp
L power:GND #PWR04
U 1 1 583478A6
P 1600 1250
F 0 "#PWR04" H 1600 1000 50  0001 C CNN
F 1 "GND" H 1600 1100 50  0000 C CNN
F 2 "" H 1600 1250 60  0000 C CNN
F 3 "" H 1600 1250 60  0000 C CNN
	1    1600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1050 1300 1050
Wire Wire Line
	1300 1050 1300 1150
Wire Wire Line
	1300 1150 1600 1150
Connection ~ 1600 1150
Wire Wire Line
	1600 1150 1600 1250
Text Label 2000 1150 0    60   ~ 0
GND
$Comp
L 8Dimmers-rescue:R_Small R18
U 1 1 5859ABCC
P 950 7000
F 0 "R18" H 980 7020 50  0000 L CNN
F 1 "100k" V 950 6900 50  0000 L CNN
F 2 "Resistors_ThroughHole:RES35" H 950 7000 50  0001 C CNN
F 3 "" H 950 7000 50  0000 C CNN
	1    950  7000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 7000 1050 7000
Wire Wire Line
	850  7000 600  7000
Wire Wire Line
	2350 1150 2350 1200
Connection ~ 3050 1200
Wire Wire Line
	9250 700  9500 700 
Wire Wire Line
	9250 1200 9500 1200
Wire Wire Line
	9250 1700 9500 1700
Wire Wire Line
	9250 2200 9500 2200
Wire Wire Line
	9250 2700 9500 2700
Wire Wire Line
	9250 3200 9500 3200
Wire Wire Line
	9250 3700 9500 3700
Wire Wire Line
	9250 4200 9500 4200
Wire Wire Line
	3600 850  3800 850 
Wire Wire Line
	1600 1150 2350 1150
Wire Wire Line
	3050 1200 3600 1200
$Comp
L RF_Module:ESP-12F U3
U 1 1 5BAD3D65
P 1700 2850
F 0 "U3" H 1350 3600 50  0000 C CNN
F 1 "ESP-12F" H 1950 3600 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 1700 2850 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 1350 2950 50  0001 C CNN
	1    1700 2850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2803A U5
U 1 1 5BAD3EE2
P 4800 4650
F 0 "U5" H 4800 5217 50  0000 C CNN
F 1 "ULN2803A" H 4800 5126 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 4850 4000 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 4900 4450 50  0001 C CNN
	1    4800 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U4
U 1 1 5BAD40B5
P 3200 4750
F 0 "U4" H 3200 5528 50  0000 C CNN
F 1 "74HC595" H 3200 5437 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 3200 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 3200 4750 50  0001 C CNN
	1    3200 4750
	1    0    0    -1  
$EndComp
Text Label 7450 700  0    50   ~ 0
5V
Text Label 7450 1200 0    50   ~ 0
5V
Text Label 7450 1700 0    50   ~ 0
5V
Text Label 7450 2200 0    50   ~ 0
5V
Text Label 7450 2700 0    50   ~ 0
5V
Text Label 7450 3200 0    50   ~ 0
5V
Text Label 7450 3700 0    50   ~ 0
5V
Text Label 7450 4200 0    50   ~ 0
5V
Text Label 7450 900  0    50   ~ 0
C0
Text Label 7450 1400 0    50   ~ 0
C1
Text Label 7450 1900 0    50   ~ 0
C2
Text Label 7450 2400 0    50   ~ 0
C3
Text Label 7450 2900 0    50   ~ 0
C4
Text Label 7450 3400 0    50   ~ 0
C5
Text Label 7450 3900 0    50   ~ 0
C6
Text Label 7450 4400 0    50   ~ 0
C7
Wire Wire Line
	5200 4350 5450 4350
Wire Wire Line
	5200 4450 5450 4450
Wire Wire Line
	5450 4550 5200 4550
Wire Wire Line
	5450 4650 5200 4650
Wire Wire Line
	5450 4750 5200 4750
Wire Wire Line
	5450 4850 5200 4850
Wire Wire Line
	5450 4950 5200 4950
Wire Wire Line
	5450 5050 5200 5050
Wire Wire Line
	5450 5150 5200 5150
Text Label 5350 4350 0    50   ~ 0
5V
Text Label 5350 4450 0    50   ~ 0
C0
Text Label 5350 4550 0    50   ~ 0
C1
Text Label 5350 4650 0    50   ~ 0
C2
Text Label 5350 4750 0    50   ~ 0
C3
Text Label 5350 4850 0    50   ~ 0
C4
Text Label 5350 4950 0    50   ~ 0
C5
Text Label 5350 5050 0    50   ~ 0
C6
Text Label 5350 5150 0    50   ~ 0
C7
Wire Wire Line
	4800 5350 4800 5400
Wire Wire Line
	4800 5400 4550 5400
Wire Wire Line
	3200 5450 3200 5500
Wire Wire Line
	3200 5500 2900 5500
Text Label 4550 5400 0    50   ~ 0
GND
Text Label 2900 5500 0    50   ~ 0
GND
Wire Wire Line
	4200 4450 4400 4450
Wire Wire Line
	4200 4550 4400 4550
Wire Wire Line
	4200 4650 4400 4650
Wire Wire Line
	4200 4750 4400 4750
Wire Wire Line
	4200 4850 4400 4850
Wire Wire Line
	4200 4950 4400 4950
Wire Wire Line
	4200 5050 4400 5050
Wire Wire Line
	4200 5150 4400 5150
Wire Wire Line
	3750 4450 3600 4450
Wire Wire Line
	3750 4550 3600 4550
Wire Wire Line
	3750 4650 3600 4650
Wire Wire Line
	3750 4750 3600 4750
Wire Wire Line
	3600 4850 3750 4850
Wire Wire Line
	3750 4950 3600 4950
Wire Wire Line
	3750 5050 3600 5050
Wire Wire Line
	2600 4350 2800 4350
Wire Wire Line
	2600 4550 2800 4550
Wire Wire Line
	2600 4650 2800 4650
Wire Wire Line
	2600 4850 2800 4850
Wire Wire Line
	2600 4950 2800 4950
Text Label 3650 4450 0    50   ~ 0
I7
Text Label 3650 4550 0    50   ~ 0
I6
Text Label 3650 4650 0    50   ~ 0
I5
Text Label 3650 4750 0    50   ~ 0
I4
Text Label 3650 4850 0    50   ~ 0
I3
Text Label 3650 4950 0    50   ~ 0
I2
Text Label 3650 5050 0    50   ~ 0
I1
Wire Wire Line
	3750 4350 3600 4350
Text Label 3650 4350 0    50   ~ 0
I8
Text Label 4200 4450 0    50   ~ 0
I1
Text Label 4200 4550 0    50   ~ 0
I2
Text Label 4200 4650 0    50   ~ 0
I3
Text Label 4200 4750 0    50   ~ 0
I4
Text Label 4200 4850 0    50   ~ 0
I5
Text Label 4200 4950 0    50   ~ 0
I6
Text Label 4200 5050 0    50   ~ 0
I7
Text Label 4200 5150 0    50   ~ 0
I8
Text Label 2600 4350 0    50   ~ 0
SER
Text Label 2600 4550 0    50   ~ 0
SRCLK
Text Label 2600 4850 0    50   ~ 0
RCLK
Text Label 2600 4650 0    50   ~ 0
VCC
Text Label 2600 4950 0    50   ~ 0
GND
Wire Wire Line
	1600 850  2750 850 
Text Label 2300 850  0    50   ~ 0
5V
Wire Wire Line
	1700 2050 700  2050
Wire Wire Line
	700  2050 700  2450
Wire Wire Line
	700  2450 1100 2450
Connection ~ 1700 2050
Wire Wire Line
	800  2250 1100 2250
Text Label 850  2250 0    50   ~ 0
RST
$Comp
L 8Dimmers-rescue:R_Small R20
U 1 1 5BC5802C
P 3200 2250
F 0 "R20" H 3250 2300 50  0000 L CNN
F 1 "10K" H 3259 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3200 2250 50  0001 C CNN
F 3 "" H 3200 2250 50  0000 C CNN
	1    3200 2250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST_x2 SW1
U 1 1 5BC5854E
P 3200 2700
F 0 "SW1" V 3154 2798 50  0000 L CNN
F 1 "RST" V 3245 2798 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 3200 2700 50  0001 C CNN
F 3 "" H 3200 2700 50  0001 C CNN
	1    3200 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 2350 3200 2400
Wire Wire Line
	3200 2400 3850 2400
Connection ~ 3200 2400
Wire Wire Line
	3200 2400 3200 2500
Wire Wire Line
	3200 2150 3200 2050
Wire Wire Line
	3200 2050 2700 2050
Wire Wire Line
	3200 2900 3200 3550
Wire Wire Line
	3200 3550 2850 3550
Wire Wire Line
	2300 3150 2700 3150
Wire Wire Line
	2850 3150 2850 3550
Connection ~ 2850 3550
Wire Wire Line
	2850 3550 1700 3550
Text Label 3000 3550 0    50   ~ 0
GND
Text Label 3500 2400 0    50   ~ 0
RST
Wire Wire Line
	2550 2850 2300 2850
Text Label 2350 2850 0    50   ~ 0
ZCD
$Comp
L 8Dimmers-rescue:R_Small R19
U 1 1 5BCBDE4F
P 1800 6600
F 0 "R19" H 1859 6646 50  0000 L CNN
F 1 "10K" H 1859 6555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 6600 50  0001 C CNN
F 3 "" H 1800 6600 50  0000 C CNN
	1    1800 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6400 1800 6400
Wire Wire Line
	1800 6400 1800 6500
Wire Wire Line
	1800 6700 1800 6800
Connection ~ 1800 6800
Wire Wire Line
	1800 6800 2000 6800
Text Label 1700 6400 0    50   ~ 0
3V3
Wire Wire Line
	2300 3050 2550 3050
Wire Wire Line
	2300 2950 2550 2950
Wire Wire Line
	2300 3250 2550 3250
Text Label 2350 3250 0    50   ~ 0
SER
Text Label 2350 3050 0    50   ~ 0
SRCLK
Text Label 2350 2950 0    50   ~ 0
RCLK
Text Label 2750 2050 0    50   ~ 0
3V3
$Comp
L 8Dimmers-rescue:R_Small R21
U 1 1 5BAEE165
P 2700 2150
F 0 "R21" H 2759 2196 50  0000 L CNN
F 1 "10K" H 2759 2105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2700 2150 50  0001 C CNN
F 3 "" H 2700 2150 50  0000 C CNN
	1    2700 2150
	1    0    0    -1  
$EndComp
Connection ~ 2700 2050
Wire Wire Line
	1700 2050 2700 2050
Wire Wire Line
	2300 2250 2700 2250
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5BAFE95E
P 1100 4050
F 0 "J1" H 1072 4023 50  0000 R CNN
F 1 "ISP" H 1072 3932 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 1100 4050 50  0001 C CNN
F 3 "~" H 1100 4050 50  0001 C CNN
	1    1100 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	900  3950 650  3950
Wire Wire Line
	900  4050 650  4050
Wire Wire Line
	3200 4150 3200 4100
Wire Wire Line
	3200 4100 2850 4100
Text Label 2900 4100 0    50   ~ 0
3V3
Wire Wire Line
	900  4150 650  4150
Wire Wire Line
	650  4250 900  4250
Text Label 650  3950 0    50   ~ 0
3V3
Text Label 700  4050 0    50   ~ 0
TXD
Text Label 700  4150 0    50   ~ 0
RXD
Text Label 700  4250 0    50   ~ 0
GND
Wire Wire Line
	2300 2350 2550 2350
Wire Wire Line
	2300 2550 2550 2550
Text Label 2350 2350 0    50   ~ 0
TXD
Text Label 2350 2550 0    50   ~ 0
RXD
Text Label 2350 2250 0    50   ~ 0
GPIO0
$Comp
L Switch:SW_DPST_x2 SW2
U 1 1 5BC50BCE
P 2700 2450
F 0 "SW2" V 2654 2548 50  0000 L CNN
F 1 "FLASH" V 2745 2548 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_EVPBF" H 2700 2450 50  0001 C CNN
F 3 "" H 2700 2450 50  0001 C CNN
	1    2700 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 2650 2700 3150
Connection ~ 2700 3150
Wire Wire Line
	2700 3150 2850 3150
$EndSCHEMATC