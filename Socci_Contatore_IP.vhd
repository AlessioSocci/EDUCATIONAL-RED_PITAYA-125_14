library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity Socci_Contatore_IP is
Port 
(
    A , RESET : in std_logic;
    B : out std_logic_vector (7 downto 0)
);
end Socci_Contatore_IP;

architecture Behavioral of Socci_Contatore_IP is
signal cnt : std_logic_vector (7 downto 0);
signal add: std_logic_vector (23 downto 0):= "000000000000000000000000";
begin
process (A)
    begin
    if RESET='1' then
        cnt <= "00000000";
    elsif rising_edge (A) then
        add <= add + 1; 
        if(add = "111111111111111111111111") then
            add <= "000000000000000000000000";
            cnt <= cnt + "00000001";
        end if;
    end if;
end process;
B <= cnt;
end Behavioral;
