-- for testing PADD

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity padd_tb is
--  Port ( );
end padd_tb;

architecture testbench of padd_tb is
    constant T : time := 50 ns;
    signal A, B : STD_LOGIC_VECTOR(15 downto 0);
    signal A_out, B_out : STD_LOGIC_VECTOR(19 downto 0);
begin

    uut : entity work.padd(dataflow)
          port map(A => A,
                   B => B,
                   A_out => A_out,
                   B_out => B_out
                   );
                   
     
     
     process
     begin
     
     
     
     A <= x"000A"; -- 10
     B <= x"0014"; -- 20
     wait for T;
     
     A <= x"001E"; -- 30
     B <= x"000F"; -- 15
     wait for T;
     
     A <= x"0064"; -- 100
     B <= x"00FA"; -- 250
     wait for T;
     
     
     
     assert false
        report "simulation complete"
     severity failure;
     
     
     end process;
    


end testbench;
