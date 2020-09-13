
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Fib_TB is
--  Port ( );
end Fib_TB;

architecture Behavioral of Fib_TB is

component Fib_Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_tst, rst_tst, pause_tst : STD_LOGIC;
signal q_tst : STD_LOGIC_VECTOR (7 downto 0);
constant cp : time := 6 ns;

begin
UUT: Fib_Counter
port map(clk => clk_tst, rst => rst_tst, pause => pause_tst, q (7 downto 0) => q_tst (7 downto 0));

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

--pause: process
--begin
--    pause_tst <= '0';
--        wait for 12 ns;
--    pause_tst <= '1';
--        wait for 12 ns;
--    pause_tst <= '0';
--        wait; 
--end process pause;

end Behavioral;
