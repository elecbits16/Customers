--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : fsm_testbench_waveform.vhw
-- /___/   /\     Timestamp : Wed Apr 05 00:58:46 2017
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: fsm_testbench_waveform
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY fsm_testbench_waveform IS
END fsm_testbench_waveform;

ARCHITECTURE testbench_arch OF fsm_testbench_waveform IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT fsm_mealy_mod
        PORT (
            reset : In std_logic;
            clk : In std_logic;
            x : In std_logic;
            z : Out std_logic
        );
    END COMPONENT;

    SIGNAL reset : std_logic := '0';
    SIGNAL clk : std_logic := '0';
    SIGNAL x : std_logic := '0';
    SIGNAL z : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : fsm_mealy_mod
        PORT MAP (
            reset => reset,
            clk => clk,
            x => x,
            z => z
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                x <= '1';
                -- -------------------------------------
                WAIT FOR 1100 ns;

            END PROCESS;

    END testbench_arch;

