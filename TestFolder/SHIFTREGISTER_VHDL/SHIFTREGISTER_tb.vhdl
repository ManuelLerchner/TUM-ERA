LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SHIFTREGISTER_TB IS
END SHIFTREGISTER_TB;

ARCHITECTURE arch OF SHIFTREGISTER_TB IS

    COMPONENT SHIFTREGISTER IS
        PORT (
            clk, S : IN STD_LOGIC;
            P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL S : STD_LOGIC := '0';
    SIGNAL P : STD_LOGIC_VECTOR(7 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 fs;

BEGIN

    sr : SHIFTREGISTER PORT MAP(clk => clk, S => S, P => P);

    PROCESS
    BEGIN

        clk <= '0';
        WAIT FOR clk_period/2;

        S <= '1';
        WAIT FOR clk_period/2;

        clk <= '1';

        WAIT FOR clk_period/2;

        S <= '0';

        WAIT FOR clk_period/2;

        clk <= '0';

        WAIT FOR clk_period;

        clk <= '1';

        WAIT FOR clk_period;

        clk <= '0';

        WAIT FOR clk_period/2;

        S <= '1';

        WAIT FOR clk_period/2;

        clk <= '1';

        WAIT FOR clk_period;

        clk <= '0';

        WAIT FOR clk_period;

        clk <= '1';

        WAIT FOR clk_period;

        clk <= '0';

        WAIT FOR clk_period;

        clk <= '1';

        WAIT FOR clk_period/2;

        S <= '0';

        WAIT FOR clk_period/2;

        S <= '1';
        clk <= '0';

        WAIT FOR clk_period/2;

        S <= '0';

        WAIT FOR clk_period/2;

        clk <= '1';

        WAIT FOR clk_period/2;

        S <= '1';

        WAIT FOR clk_period/2;

        clk <= '0';

        WAIT FOR clk_period/2;

        S <= '0';

        WAIT FOR clk_period/2;

        clk <= '1';

        WAIT FOR clk_period/2;

        S <= '1';

        WAIT FOR clk_period/2;

        clk <= '0';

        WAIT FOR clk_period;

        clk <= '1';

        WAIT FOR clk_period;

        clk <= '0';

        WAIT FOR clk_period;

        clk <= '1';

        WAIT FOR clk_period/2;

        S <= '0';

        WAIT FOR clk_period/2;

        clk <= '0';

        WAIT FOR clk_period;

    END PROCESS;


END arch;