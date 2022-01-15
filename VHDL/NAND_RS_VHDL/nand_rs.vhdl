--libraries
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

--entity
ENTITY nand_rs IS
    PORT (
        rn, sn : IN STD_LOGIC;
        qn, q : OUT STD_LOGIC
    );
END ENTITY;

--Architecture
ARCHITECTURE v1 OF nand_rs IS
    SIGNAL qn_internal : STD_LOGIC;

BEGIN
    PROCESS (rn, sn)
    BEGIN
        IF (rn = '0') THEN
            qn_internal <= '1';
        ELSIF (sn = '0') THEN
            qn_internal <= '0';
        END IF;
    END PROCESS;

    q <= NOT qn_internal;
    qn <= qn_internal;
END ARCHITECTURE;