
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:47:07 04/05/2017
-- Design Name:   fsm_mealy_mod
-- Module Name:   D:/saurav/elecbits original/Xilinx/indiv program/fsm_mealy/fsm_test_bench.vhd
-- Project Name:  fsm_mealy
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fsm_mealy_mod
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY fsm_test_bench_vhd IS
END fsm_test_bench_vhd;

ARCHITECTURE behavior OF fsm_test_bench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT fsm_mealy_mod
	PORT(
		reset : IN std_logic;
		clk : IN std_logic;
		x : IN std_logic;          
		z : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL reset :  std_logic := '0';
	SIGNAL clk :  std_logic := '0';
	SIGNAL x :  std_logic := '0';

	--Outputs
	SIGNAL z :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: fsm_mealy_mod PORT MAP(
		reset => reset,
		clk => clk,
		x => x,
		z => z
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
