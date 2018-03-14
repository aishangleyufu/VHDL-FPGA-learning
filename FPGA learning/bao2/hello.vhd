library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith;


ENTITY hello IS
PORT
(CLK:IN STD_LOGIC;
P:BUFFER STD_LOGIC;
C0,C1,C2,C3,C4,C5,C6,C7:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
L7:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
L6:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
L5:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
L4:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
L3:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
L2:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
L1:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
L0:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0):="0101"
);
end hello;

ARCHITECTURE behave of HELLO IS

BEGIN

PROCESS(CLK)
VARIABLE var1:integer:=1;
VARIABLE var2:integer:=1;
BEGIN
IF (CLK='1') THEN
   var1:=var1+1;
          if (var1=5) then
             var1:=1;
             var2:=var2+1;
                    if(var2=10) then
                         L0<=L0-1;
                         L1<=L1-1;
                         L2<=L2-1;
                         L3<=L3-1;
                         L4<=L4-1;
                         L5<=L5-1;
                         L6<=L6-1;
                         L7<=L7-1;

                      var2:=1;
                    end if;
           end if;

                         IF(L0=0) THEN L0<="1000"; END IF;
                         IF(L1=0) THEN L1<="1000"; END IF;
                         IF(L2=0) THEN L2<="1000"; END IF;
                         IF(L3=0) THEN L3<="1000"; END IF;    
                         IF(L4=0) THEN L4<="1000"; END IF;
                         IF(L5=0) THEN L5<="1000"; END IF; 
                         IF(L6=0) THEN L6<="1000"; END IF;
                         IF(L7=0) THEN L7<="1000"; END IF; 
END IF;
END PROCESS; 


WITH L5 SELECT
C5<="10010001" WHEN"0001",    --H
    "01100001" WHEN"0010",    --E
    "11100011" WHEN"0011",    --L 
    "11100011" WHEN"0100",    --L
    "00000011" WHEN"0101",    --O
    "11111111" WHEN others;

WITH L6 SELECT
C6<="10010001" WHEN"0010",    --H
    "01100001" WHEN"0011",    --E
    "11100011" WHEN"0100",    --L 
    "11100011" WHEN"0101",    --L
    "00000011" WHEN"0110",    --O
    "11111111" WHEN others;

WITH L7 SELECT
C7<="10010001" WHEN"0011",    --H
    "01100001" WHEN"0100",    --E
    "11100011" WHEN"0101",    --L 
    "11100011" WHEN"0110",    --L
    "00000011" WHEN"0111",    --O
    "11111111" WHEN others;

WITH L0 SELECT
C0<="10010001" WHEN"0100",    --H
    "01100001" WHEN"0101",    --E
    "11100011" WHEN"0110",    --L 
    "11100011" WHEN"0111",    --L
    "00000011" WHEN"1000",    --O
    "11111111" WHEN others;

WITH L1 SELECT
C1<="10010001" WHEN"0101",    --H
    "01100001" WHEN"0110",    --E
    "11100011" WHEN"0111",    --L 
    "11100011" WHEN"1000",    --L
    "00000011" WHEN"0001",    --O
    "11111111" WHEN others;



WITH L2 SELECT
C2<="10010001" WHEN"0110",    --H
    "01100001" WHEN"0111",    --E
    "11100011" WHEN"1000",    --L 
    "11100011" WHEN"0001",    --L
    "00000011" WHEN"0010",    --O
    "11111111" WHEN others;


WITH L3 SELECT
C3<="10010001" WHEN"0111",    --H
    "01100001" WHEN"1000",    --E
    "11100011" WHEN"0001",    --L 
    "11100011" WHEN"0010",    --L
    "00000011" WHEN"0011",    --O
    "11111111" WHEN others;


WITH L4 SELECT
C4<="10010001" WHEN"1000",    --H
    "01100001" WHEN"0001",    --E
    "11100011" WHEN"0010",    --L 
    "11100011" WHEN"0011",    --L
    "00000011" WHEN"0100",    --O
    "11111111" WHEN others;
end behave;