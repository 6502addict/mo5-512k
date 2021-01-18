library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;

-- first we defined the signals used
entity MO512K is
	PORT (
		wen        : in   std_logic;
		e          : in   std_logic;
		rw	   : in   std_logic;
		csc	   : in   std_logic;
		a7cb	   : in   std_logic;
		clrn	   : in   std_logic;
		spare0     : out  std_logic;
		spare1     : out  std_logic;
		spare2     : out  std_logic;
		rwe	   : out  std_logic;
	        roe	   : out  std_logic;
		rce        : out  std_logic;
		clr	   : out  std_logic;
		clk	   : out  std_logic
	);

-- then we associate the signals with a pin number
attribute LOC : string;
attribute LOC of wen       : signal is "P1";
attribute LOC of e         : signal is "P2";
attribute LOC of rw        : signal is "P3";
attribute LOC of csc       : signal is "P4";
attribute LOC of a7cb      : signal is "P5";
attribute LOC of clrn      : signal is "P6";
-- P10 GND
attribute LOC of spare0    : signal is "P12";
attribute LOC of spare1    : signal is "P13";
attribute LOC of spare2    : signal is "P14";
attribute LOC of rwe       : signal is "P15";
attribute LOC of roe       : signal is "P16";
attribute LOC of rce       : signal is "P17";
attribute LOC of clr       : signal is "P18";
attribute LOC of clk       : signal is "P19";
-- P20 VCC

end;

architecture behavioral of MO512K is
begin
	-- we connect the unused pins to GND
	spare0 <= '0';
	spare1 <= '0';
	spare2 <= '0';

	-- *** control signals form the ram chip ***
	-- we create the ram WE signal from 6809 R/W and WEN coming from the 74LS273
	-- rwe is '0' only if rw is '0' and wen is '1'  (not write protected)
	rwe <= '0' when (rw = '0')   and (wen = '1')               else '1';

	-- we create the ram chip select CE
        -- rce is '0' csc is '0'  (cartridge in use) and 6809 E phase is '1'	
	rce <= '0' when (csc = '0')  and (e = '1')                 else '1';

	-- we create the output enable OE for the ram chip
	-- roe is '0' only if the cartridge is in use, and 6809 E phase is '1' and 6809 rw signal in read mode ('1')
	roe <= '0' when (csc = '0')  and (e = '1') and (rw = '1')  else '1';
	-- *****************************************


	-- *** control signals form the 74LS273 ***
	-- in the original chip 74LS173 clr was using a positive logic and had to be inverted
	-- with the 74LS273 clr is using negative logic, so we just connect CLR to CLRN
	clr <= clrn;

	-- we create the CLK signal for the LS273  (74LS273 is using  a positive logic for CLK)
        -- so CLK is '1' only if the address $A7CB is selected (atcb = '0')
        -- a write is performed (rw = '0')
        -- and 6809 e phase is '1'
	clk <= '1' when (a7cb = '0') and (rw = '0') and (e = '1')  else '0';
	-- *****************************************

end behavioral;
