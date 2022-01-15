--libraries
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--entity
ENTITY nand_rs_tb IS
END ENTITY;

--architecture
ARCHITECTURE tb OF nand_rs_tb IS
    COMPONENT nand_rs
        PORT (
            rn, sn : IN STD_LOGIC;
            qn, q : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL rn_tb, sn_tb, qn_tb, q_tb : STD_LOGIC;

BEGIN

    --port mapping
    tb : nand_rs PORT MAP(
        rn => rn_tb,
        sn => sn_tb,
        qn => qn_tb,
        q => q_tb
    );

    --testbench
    PROCESS BEGIN
        rn_tb <= '1';
        sn_tb <= '1';
        WAIT FOR 1 ns;

        rn_tb <= '0';
        sn_tb <= '1';
        WAIT FOR 1 ns;

        rn_tb <= '1';
        sn_tb <= '1';
        WAIT FOR 1 ns;

        rn_tb <= '1';
        sn_tb <= '0';
        WAIT FOR 1 ns;

        rn_tb <= '1';
        sn_tb <= '1';
        WAIT FOR 1 ns;

        rn_tb <= '1';
        sn_tb <= '0';
        WAIT FOR 1 ns;

        rn_tb <= '1';
        sn_tb <= '1';
        WAIT FOR 1 ns;

        rn_tb <= '0';
        sn_tb <= '1';
        WAIT FOR 2 ns;

    END PROCESS;

END tb;