----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:38:27 04/05/2017 
-- Design Name: 
-- Module Name:    fsm_mealy_mod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_mealy_mod is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC);
end fsm_mealy_mod;

architecture Behavioral of fsm_mealy_mod is
type state_type is (S0, S1);
signal state, next_state : state_type;

begin
SYNC_PROC : process (clk)
begin
 if rising_edge(clk) then
 if (reset = '1') then
 state <= S0;
 else
 state <= next_state;
 end if;
 end if;
end process;
NEXT_STATE_DECODE : process (state, x)
begin
 z <= '0';
 case (state) is
 when S0 =>
 if (x = '1') then
 z <= '1';
 next_state <= S1;
 else
 next_state <= S0;
 end if;
 when S1 =>
 if (x = '1') then
 next_state <= S0;
 else
 z <= '1';
 next_state <= S1;
 end if;
 when others =>
 next_state <= S0;
 end case;
end process; 



end Behavioral;

