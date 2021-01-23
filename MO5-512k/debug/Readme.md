# MO5 512k Cartridge Debug Procedure
<br>
## Description
If the cartridge is not working, with Daniel's tests
<br>
http://dcmoto.free.fr/programmes/test512k-mo5/index.html
<br>
we will check step by step  the components of the board.

## Tools
We will do that with 2 tools
1/  a TL866 II plus programmer
2/  a 8 channels logic analyser  (around 10€ on amazon)

# Component Check

## Check the 74LS273
Select "logic test" on the programmer and clic on "autofind"
<br>
the programmer should detect a "74273"

## Check the RAM chip
Select device "SRAM/VRAM" then select "Standard RAM"
<br>
and choose 628512 and press "select"
<br>
then in the new windows click on "TEST"
<br>

## Check the GAL16V8D-A7CB
the GAL16V8D-A7CB (horizontal) produce a chip select when the latch 74LS273 is accessed
as it is not possible to connect the analyser directly on this GAL
we will test it on the entry of this signal on the GAL16V8D-MO512K (vertical)

Connections to realise between the logic analyser and the GAL
- GND to pin 10   "GND"
- CH1 to pin 5    "A7CB"     

Program to run
Start he MO5 and select "test512k.sd" in sddrive menu
<br>
in the basic load  "A7CB"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
<br>
with the following settings:
<br>
https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/setup-A7CB.logicsettings
<br>
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/A7CB.PNG)
<br>
if the you have not a similar probleme check the following signals:
- the address lines from the MO5 connector to the GAL-A7CB pins
- check the solders of the GAL chip
- eventually program another GAL with GAL16V8D-A7CB.jed

## Check the GAL16V8D-MO512k latch control signals
the GAL 16V8D-MO512K controls 3 functions
- the generation of CLR and CLK signals for the 74LS273
- the generation of the control signals for the ram chip

Connections to realise between the logic analyser and the GAL
- GND to pin 10    "GND"
- CH1 to pin  2    "E" 
- CH2 to pin  3    "R/W"
- CH3 to pin  5    "A7CB"
- CH4 to pin 19    "CLK" 

Program to run
Start he MO5 and select "test512k.sd" in sddrive menu
<br>
in the basic load  "CLK"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
<br>
with the following settings:
<br>
https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/setup-CLK.logicsettings
<br>
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/CLK.PNG)
<br>
if the you have not a similar probleme check the following signals:
- the lines: E, A7CB and R/W
- check the solders of the GAL chip
- eventually program another GAL with GAL16V8D-MO512K.jed

## Check the 74LS273 functions
the 74LS273 select the active bank as well as the cartridge/basic acces
and protect from the write to the ram chip

Connections to realise between the logic analyser and the GAL
- GND to pin 10    "GND"
- CH1 to pin 11    "CLK" 
- CH2 to pin  2    "BANK0"
- CH3 to pin  5    "BANK1"
- CH4 to pin  6    "BASIC/CART" 
- CH5 to pin  9    "WEN" 
- CH6 to pin  12   "BANK2" 
- CH7 to pin  15   "BANK3" 
- CH7 to pin  16   "BANK4" 

Program to run
Start he MO5 and select "test512k.sd" in sddrive menu
<br>
in the basic load  "74LS273"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
<br>
with the following settings:
<br>
https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/setup-74LS273.logicsettings
<br>
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/74LS273.PNG)
<br>
if the you have not a similar probleme check the following signals:
- the lines: D0 to D7, CLK and CLR
- check the solders of the GAL chip

## Check the GAL16V8D-MO512K RAM control signals
the GAL GAL16V8D-MO512K also control the control signals for the ram chip


Connections to realise between the logic analyser and the GAL
- GND to pin 10    "GND"
- CH1 to pin  1    "WEN" 
- CH2 to pin  2    "E"
- CH3 to pin  3    "R/W"
- CH4 to pin  4    "CSC" 
- CH5 to pin  5    "A7CB 
- CH6 to pin  17   "RCE" 
- CH7 to pin  16   "ROE" 
- CH7 to pin  15   "RWE" 

Program to run
Start he MO5 and select "test512k.sd" in sddrive menu
<br>
in the basic load  "RAMCTRL"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
<br>
with the following settings:
<br>
https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/setup-RAMCTRL.logicsettings
<br>
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/RAMCTRL.PNG)
<br>
This one needs a bit more explanations
<br>
there are 2 phases
- in the first phase wen is set to 1 and a read and a write occurs
- in the second phase wen is set to 0 and a read occurs but a write is blocked (no signal on RWE)
<br>
if the you have not a similar probleme check the following signals:
- the lines: WEN, E, R/W, CSC, A7CB
- check the solders of the GAL chip
