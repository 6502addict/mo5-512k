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
To test this chip we will use a simple basic program
and the 8 channels analyser

it is not really possible to connect wires on this GAL
so we connect the wire to the second GAL  (vertical)
GND of the analyser to pin 10 of the GAL<br>
CH1 to pin 5
<br>
you should get the following pattern
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/debug/A7CB.PNG)
<br>


## Check the GAL16V8D-MO512k latch control signals

## Check the 74LS273 functions


## Check the GAL16V8D-MO512K RAM control signals
