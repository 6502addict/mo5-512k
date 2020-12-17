library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MO5A7CB is
	PORT (
		a          : in   std_logic_vector(15 downto 0);
		cs_a7cb    : out  std_logic;
		spare      : out  std_logic
	);


attribute LOC : string;
--attribute LOC of a       : signal is "P12, P13, P14, P17, P18, P19, P11, P9, P8, P7, P6, P5, P4, P3, P2, P1"; 
attribute LOC of a       : signal is "P1, P2, P3, P4, P5, P6, P7, P8, P9, P11, P19, P18, P17, P14, P13, P12";
-- P10 GND
attribute LOC of spare   : signal is "P15";
attribute LOC of cs_a7cb : signal is "P16";
-- P20 VCC

end;

architecture behavioral of MO5A7CB is
begin
	spare <= 'H';
	cs_a7cb <= '0' when a = x"A7CB" else '1';
end behavioral;
