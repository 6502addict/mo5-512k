# mo5-512k
MO5 512K Cartridge
<br>
![al-tag](https://github.com/6502addict/mo5-512k/blob/main/MO5-512k/photo/MO512K.PNG)
<br>
## Description
this cartridge is compatible with thomson MO5 64k cartridge
it's not a exact copy of the original cartridge
but a rebuild from the manual
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



the 2 16v8d GALS (.jed) can be programmed for example with a TL866 II programmer

the 2 vhd files can be modified and recompiled with ISPLever Classic
from Lattice web site 






