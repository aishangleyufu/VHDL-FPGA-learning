library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith;


ENTITY fsm IS
PORT
(CLK:IN STD_LOGIC;
 W:IN STD_LOGIC;
 Z:OUT STD_LOGIC;
 LED:OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
);
END fsm;

ARCHITECTURE behave of fsm IS
SIGNAL STATE:INTEGER RANGE 0 TO 8:=0;
BEGIN
PROCESS(CLK)
BEGIN
IF CLK'EVENT AND CLK='1' THEN
   CASE STATE IS 
     WHEN 0=>
       IF W='0' THEN STATE<=1;ELSE STATE<=2;END IF;
     WHEN 1=>
       IF W='0' THEN STATE<=3;ELSE STATE<=2;END IF;
     WHEN 2=>
       IF W='0' THEN STATE<=1;ELSE STATE<=4;END IF;
     WHEN 3=>
       IF W='0' THEN STATE<=5;ELSE STATE<=2;END IF;
     WHEN 4=>
       IF W='0' THEN STATE<=1;ELSE STATE<=6;END IF;
     WHEN 5=>
       IF W='0' THEN STATE<=7;ELSE STATE<=2;END IF;
     WHEN 6=>
       IF W='0' THEN STATE<=1;ELSE STATE<=8;END IF;     
     WHEN 7=>    
       IF W='0' THEN STATE<=7;ELSE STATE<=2;END IF;
     WHEN 8=>
       IF W='0' THEN STATE<=1;ELSE STATE<=8;END IF;
  END CASE;
END IF;
END PROCESS;

Z<='1' WHEN (STATE=7)  OR (STATE=8)
       ELSE '0';
WITH STATE SELECT
LED<="000000001" WHEN 0,
     "000000010" WHEN 1,
     "000000100" WHEN 2,
     "000001000" WHEN 3,
     "000010000" WHEN 4,
     "000100000" WHEN 5,
     "001000000" WHEN 6,
     "010000000" WHEN 7,
     "100000000" WHEN 8;
END BEHAVE;