

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_tb is
--  Port ( );
end top_level_tb;

architecture testbench of top_level_tb is
    constant T : time := 10ns; --period
    signal clk, btnc, btnu, btnd, btnl, btnr : STD_LOGIC := '0';
    signal sw : STD_LOGIC_VECTOR(15 downto 0) := (OTHERS => '0');
    signal seg, led : STD_LOGIC_VECTOR(6 downto 0) := (OTHERS => '0');
    signal an : STD_LOGIC_VECTOR(3 downto 0) := (OTHERS => '0');
begin


    uut : entity work.top_level(structural)
          port map( clk => clk,
                    btnc => btnc,
                    btnu => btnu,
                    btnd => btnd,
                    btnl => btnl,
                    btnr => btnr,
                    sw => sw,
                    seg => seg,
                    an => an
                    );
                    
   clk <= not clk after T/2;                 
                    
   process
   begin
    
   sw(15) <= '1';
   wait for 5*T;
   
   sw(15) <= '0';
   btnr <= '1';
   btnl <= '1';
   --sw(7 downto 0) <= x"AB";
   wait for 10*T;
   
   btnr <= '0';
   btnl <= '0';
   wait for 10*T;
   
   sw(7 downto 0) <= x"AB";
   wait for T;
   
   btnc <= '1';
   wait for 5*T;
   
   btnc <= '0';
   wait for 40*T;
   
   
--   btnc <= '1';
--   wait for T;
   
--   btnc <= '0';
--   wait for 40*T;
   
--   btnu <= '1';
--   wait for T;
   
--   btnu <= '0';
--   wait for 40*T;
   
--   btnc <= '1';
--   wait for T;
    
--   btnc <= '0';
--   wait for 20*T;
      
   
   btnd <= '1';
   wait for 5*T;
   
--   btnc <= '1';
--   wait for T;
   
--   btnc <= '0';
--   wait for 40*T;
   
   btnd <= '0';
   wait for 40*T;
   
   
   
    btnd <= '1';
   wait for 5*T;
   
   btnc <= '1';
   wait for T;
   
   btnc <= '0';
   wait for 40*T;
   
   btnd <= '0';
   wait for 40*T;
   
   btnu <= '1';
   wait for 5*T;
   
   btnu <= '0';
   wait for 40*T;
   
   btnc <= '1';
   wait for 5*T;
   
   btnc <= '0';
   wait for 40*T;
   
--   btnd <= '1';
--   wait for 5*T;
   
--   btnd <= '0';
--   wait for 40*T;
   
--   btnd <= '1';
--   wait for 5*T;
   
   
--   btnd <= '0';
--   wait for 40*T;
   
--   btnd <= '1';
--   wait for 5*T;
   
--   btnd <= '0';
--   wait for 40*T;
   
--   btnd <= '1';
--   wait for 5*T;
   
--   btnd <= '0';
--   wait for T;
   
--   btnd <= '1';
--   wait for T;
   
--   btnd <= '0';
--   wait for 40*T;
   
--   btnc <= '1';
--   wait for T;
   
--   btnc <= '0';
--   wait for 5*T;
   
--   btnd <= '1';
--   wait for T;
   
--   btnd <= '0';
--   wait for T;
   
   
   
   
   
   assert false
    report "Simulation complete"
    severity failure;
   
   end process;                


end testbench;
