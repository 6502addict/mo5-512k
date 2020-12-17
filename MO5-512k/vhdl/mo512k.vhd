library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

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


attribute LOC : string;
attribute LOC of wen       : signal is "P1";
attribute LOC of e         : signal is "P2";
attribute LOC of csc       : signal is "P1";
attribute LOC of a7cb      : signal is "P1";
attribute LOC of clrn      : signal is "P6";
-- P10 GND
attribute LOC of spare0    : signal is "P12";
attribute LOC of spare1    : signal is "P13";
attribute LOC of spare2    : signal is "P14";
attribute LOC of rwe       : signal is "P15";
attribute LOC of roe       : signal is "P15";
attribute LOC of rce       : signal is "P15";
attribute LOC of clr       : signal is "P15";
attribute LOC of clk       : signal is "P15";
-- P20 VCC

end;

architecture behavioral of MO512K is
begin
	spare0 <= 'H';
	spare1 <= 'H';
	spare2 <= 'H';

	
	rwe <= '0' when (rw = '1')   and (wen = '1')              else '1';
	rce <= '0' when (csc = '0')  and (e = '1')                else '1';
	roe <= '0' when (csc = '0')  and (e = '1') and (rw = '1') else '1';
	clk <= '0' when (a7cb = '0') and (rw = '0')               else '1';
	clr <= '1' when (clrn = '0')                              else '0';
	 
end behavioral;
