library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- first we define the signals used
entity MO5A7CB is
	PORT (
		a          : in   std_logic_vector(15 downto 0);
		cs_a7cb    : out  std_logic;
		spare      : out  std_logic
	);

-- then the pin mapping
attribute LOC : string;
attribute LOC of a       : signal is "P1, P2, P3, P4, P5, P6, P7, P8, P9, P11, P19, P18, P17, P14, P13, P12";
-- P10 GND
attribute LOC of spare   : signal is "P15";
attribute LOC of cs_a7cb : signal is "P16";
-- P20 VCC

end;

architecture behavioral of MO5A7CB is
begin
	-- we connect the unused pins to GND
	spare <= '0';

	-- we create the A7CB chip select  (74LS273)
	-- cs_a7cb is low only if we find "A7CB" on the address lines
	cs_a7cb <= '0' when a = x"A7CB" else '1';

end behavioral;
