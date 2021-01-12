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
           0  cartridge ram is readable and writable
bits 4-7   unused        
```

## Control Register in $A7CB (with jumpers)
```
bits 0-1   bank number
bit 2      1 = ram visible
           0 = basic
bit 3      1 cartridge ram is readable and writable
           0  cartridge ram is readable and writable
bit 4-6    extend the bank number
bit 7      unused
```

## PCB
the pcb can be ordered from oshpark [link]

## Bill of Materials
* 1 x socket  dip 32  600mil
* 3 x sockets dip 20  300mil
* 1 74LS273
* 1 RAM Alliance AS6C4008
* 2 GAL Lattice 16v8D
* 1 diode 1N4148
* 5 resistor 10k    1206
* 5 capacitor 100nf 1206

## GAL Programming
the GALS can be easily programmed with a TL866-II plus programmer
GAL-16V8D-AC7B is going in the horizontal socket  (check the marking)
GAL-16V8D-MO512K is going in the vertical socket

the 2 16v8d GALS (.jed) can be programmed for example with a TL866 II programmer

the 2 vhd files can be modified and recompiled with ISPLever Classic
from Lattice web site 






