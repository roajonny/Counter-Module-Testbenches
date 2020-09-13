----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/11/2020 09:12:09 PM
-- Design Name: 
-- Module Name: Clock_Div_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Div_TB is
--  Port ( );
end Clock_Div_TB;

architecture Behavioral of Clock_Div_TB is

component Clock_Divider is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_mod : out STD_LOGIC);
end component;

signal clk_tst, rst_tst, clk_mod_tst : STD_LOGIC;
constant cp : time := 10 ns;

begin
UUT: Clock_Divider
port map (clk => clk_tst, rst => rst_tst, clk_mod => clk_mod_tst);

reset: process
begin
    rst_tst <= '1';
        wait for cp;
    rst_tst <= '0';
        wait;
end process reset;

clock: process
begin
    clk_tst <= '1';
        wait for cp/2;
    clk_tst <= '0';
        wait for cp/2;
end process clock;

end Behavioral;
