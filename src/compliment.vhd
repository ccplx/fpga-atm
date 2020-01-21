library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity compliment is
    Port ( bitin : in STD_LOGIC_VECTOR (15 downto 0);
           sub : in STD_LOGIC;
           bitout : out STD_LOGIC_VECTOR (15 downto 0));
end compliment;

architecture dataflow of compliment is

begin

bitout <= not bitin when sub='1' else bitin;

end dataflow;
