LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SHIFTREGISTER IS
    PORT (
        clk, S : IN STD_LOGIC;
        P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch OF SHIFTREGISTER IS
    SIGNAL P_in : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    PROCESS (clk)
    BEGIN

        P_in(0) <= S;
        P_in(1) <= P_in(0);
        P_in(2) <= P_in(1);
        P_in(3) <= P_in(2);
        P_in(4) <= P_in(3);
        P_in(5) <= P_in(4);
        P_in(6) <= P_in(5);
        P_in(7) <= P_in(6);

    END PROCESS;

    P <= P_in;

END arch;