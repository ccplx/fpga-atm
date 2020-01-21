
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath is
    Port ( sel : in STD_LOGIC_VECTOR(1 downto 0);
           subtract : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           sel_out : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end datapath;

architecture structural of datapath is
    signal mux_out, ones_comp, counter, reg_out, hex_out, addr_out, reg2_out : STD_LOGIC_VECTOR(15 downto 0);
begin

    with sel select
        mux_out <= x"0001" when "00",
                   x"0005" when "01",
                   x"000A" when "10",
                   x"0014" when "11",
                   x"0000" when others;
               
    comp : entity work.compliment(dataflow)
           port map(bitin => mux_out,
                    sub => subtract,
                    bitout => ones_comp
                    );
           
    add : entity work.adder(dataflow)
          port map(in1 => ones_comp,
                   in2 => counter,
                   cin => subtract,
                   addout => addr_out
                   );
                   
    reg1: entity work.reg(behavioral)
          port map(clk => clk, en => en, rst => rst,
                   D => addr_out,
                   Q => counter
                   );
                   
    reg2 : entity work.reg(behavioral)
          port map(clk => clk, en => en, rst => rst,
                   D => mux_out,
                   Q => reg2_out
                   );
                   
    hex_out <= counter when (sel_out = '0') else reg2_out;   

    ssd1 : entity work.ssd_driver(structural)
           port map(hex => hex_out,
                    clk => clk,
                    rst => rst,
                    seg => seg,
                    an => an
                    );
    

end structural;
