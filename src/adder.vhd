

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port ( in1 : in STD_LOGIC_VECTOR (15 downto 0);
           in2 : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           addout : out STD_LOGIC_VECTOR (15 downto 0));
end adder;

architecture dataflow of adder is
    signal ucin : unsigned(0 downto 0);
    signal sin2 : unsigned(15 downto 0);
    signal a : std_logic_vector(16 downto 0);
begin

ucin(0) <= cin;
sin2 <= unsigned(in1)+ cin;
a <= std_logic_vector(signed('0' & in2)+signed(sin2));

addout <= a(15 downto 0);

end dataflow;
