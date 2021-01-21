# MO5 512k Cartridge Debug Procedure
WORK IN PROGRESS !!!
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
in the basic load  "A7CB-CS"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
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
- CH3 to pin  5    "ATCB"
- CH4 to pin 19    "CLK" 

Program to run
Start he MO5 and select "test512k.sd" in sddrive menu
<br>
in the basic load  "LATCH-CLK"
<br>
run the basic program
<br>
<br>
Capture the data with the analyser
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/CLK.PNG)
<br>

## Check the 74LS273 functions


## Check the GAL16V8D-MO512K RAM control signals
