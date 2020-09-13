

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_level_TB is
--  Port ( );
end Top_level_TB;

architecture Behavioral of Top_level_TB is

component Top_Level is
 Port (clk: in STD_LOGIC;
       pause : in STD_LOGIC;
       rst: in STD_LOGIC;
       sel: in STD_LOGIC_VECTOR (2 downto 0);
       q: out STD_LOGIC_VECTOR (7 downto 0)
       );
end component;

signal clk_tst, pause_tst, rst_tst : STD_LOGIC;
signal sel_tst : STD_LOGIC_VECTOR (2 downto 0);
signal q_tst : STD_LOGIC_VECTOR (7 downto 0);
constant cp : time := 10 ns;

begin

UUT: Top_Level
port map (clk => clk_tst, pause => pause_tst, rst => rst_tst, sel => sel_tst, q => q_tst);

reset: process
begin
    rst_tst <= '1';
        wait for cp;
    rst_tst <= '0';
        wait for cp*49;
end process reset;

clock: process
begin
    clk_tst <= '1';
        wait for cp/2;
    clk_tst <= '0';
        wait for cp/2;
end process clock;

ctr_sel: process
begin
    sel_tst <= "000";
        wait for cp*50;
    sel_tst <= "001";
        wait for cp*50;
    sel_tst <= "010";
        wait for cp*50;
    sel_tst <= "011";
        wait for cp*50;
    sel_tst <= "100";
        wait for cp*50;
    sel_tst <= "101";
        wait;
end process ctr_sel;

end Behavioral;
