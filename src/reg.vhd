
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (15 downto 0);
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end reg;

architecture Behavioral of reg is
    signal qsig : std_logic_vector(15 downto 0);
begin

process(clk)
begin
    if rising_edge(clk) then
        if (rst = '1') then
            qsig <= x"0000";
        elsif (en = '1') then
            qsig <= D;
        end if;
    end if;


end process;

Q <= qsig;

end Behavioral;
