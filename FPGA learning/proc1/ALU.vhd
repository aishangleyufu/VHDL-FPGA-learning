LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_ARITH.all;
ENTITY ALU IS
PORT ( ADDSUB:IN STD_LOGIC;
RESULT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
A,B:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
CLOCK:IN STD_LOGIC
);
END ALU;
ARCHITECTURE Behavior OF ALU IS

BEGIN
PROCESS(CLOCK)
BEGIN
IF (ADDSUB='0') THEN
RESULT<=A-B;
ELSE
RESULT<=A+B;
END IF;
END PROCESS;




END Behavior;