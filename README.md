# mo5-512k
MO5 512K Cartridge

BEWARE THIS A WORK IN PROGRESS
TIL NOW, THIS BOARD HAS NOT BEEN TESTED

this cartridge is compatible with thomson MO5 64k cartrige
this is a new design
the $A7CB register controlling a MO5 64 cartrige is extended
to permit the access to 512k of memory

in strict compatibility mode (64k)  (3 jumpers removed)
bits 0-1   bank number
bit 2      1 = ram visible
           0 = basic
bit 3      1 cartridge ram is readable and writable
           0  cartridge ram is readable and writable
bits 4-7   unused        

in extended mode (512k)  (3  jumpers in place)
bits 0-3   same as above
bit 4-6    combined with bits 0-1 to extend the bank number
bit 7      unused


the 2 GALS 16v8d can be programmed for example with a TL866 II programmer

the 2 vhd files can be modified and recompiled with ISPLever Classic
from Lattice web site






