LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
ENTITY mux IS
PORT (  ROUT:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        GOUT,DINOUT: IN STD_LOGIC;
        R0,R1,R2,R3,R4,R5,R6,R7,G,DIN:IN STD_LOGIC_VECTOR(15 DOWNTO 0);  
        BUSWIRES : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        CLOCK:IN STD_LOGIC);
END mux;
ARCHITECTURE Behavior OF mux IS

BEGIN
PROCESS(CLOCK)
BEGIN
IF(ROUT(0)='1') THEN BUSWIRES<=R0; END IF;
IF(ROUT(1)='1') THEN BUSWIRES<=R1; END IF;
IF(ROUT(2)='1') THEN BUSWIRES<=R2; END IF;
IF(ROUT(3)='1') THEN BUSWIRES<=R3; END IF;
IF(ROUT(4)='1') THEN BUSWIRES<=R4; END IF;
IF(ROUT(5)='1') THEN BUSWIRES<=R5; END IF;
IF(ROUT(6)='1') THEN BUSWIRES<=R6; END IF;
IF(ROUT(7)='1') THEN BUSWIRES<=R7; END IF;
IF(DINOUT='1') THEN BUSWIRES<=DIN; END IF;
IF(GOUT='1')  THEN BUSWIRES<=G; END IF;


END PROCESS;





END Behavior;
