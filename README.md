# mo5-512k
MO5 512K Cartridge
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/photo/MO512K.PNG)
<br>
## Description
this cartridge is compatible with thomson MO5 64k cartridge
it's not a exact copy of the original cartridge<br>
but rather a rebuild from the manual
<br>
the $A7CB register controlling a MO5 64 cartrige is extended
to permit the access to 512k of memory
<br>
without the 3 jumpers the cartridge is behaving as the 
original thomson MEMO5 cartridge
<br>
with the jumpers set the cartridge 4 address 512k or memory
<br>

## Control Register in $A7CB (without jumpers)
```
bits 0-1   bank number
bit 2      1 = ram visible
           0 = basic
bit 3      1 cartridge ram is readable and writable
           0  cartridge ram is readable and read only
bits 4-7   unused        
```

## Control Register in $A7CB (with jumpers)
```
bits 0-1   bank number
bit 2      1 = ram visible
           0 = basic
bit 3      1 cartridge ram is readable and writable
           0  cartridge ram is readable and read only
bit 4-6    extend the bank number
bit 7      unused
```

## PCB
the pcb can be ordered from oshpark<br>
https://oshpark.com/shared_projects/5IyPA9KX

## Bill of Materials
* 1 x socket  dip 32  600mil
* 3 x sockets dip 20  300mil
* 1 74LS273
* 1 RAM Alliance AS6C4008
* 2 GAL Lattice 16v8D
* 1 diode 1N4148
* 5 resistor 10k    1206
* 5 capacitor 100nf 1206
* 1 block of 3 jumpers

## GAL programming
the GALS can be easily programmed with a TL866-II plus programmer<br>
GAL-16V8D-AC7B is going in the horizontal socket  (check the marking)<br>
GAL-16V8D-MO512K is going in the vertical socket

## GAL compiling
The .JED files are sufficent to build the board<br>
they can be recompiled from the .VHD by using:<br>
"Lattice ispLEVER Classic"

## Build of the board
the easiest is to solder the component in the following order<br>
1. 5 100nf capacitor (back of the board)<br>
2. 5 10k resistor (back of the board)<br>
3. 4 sockets<br
4. BC547B<br>
5. 1N4148<br>
6. jumpers<br>







