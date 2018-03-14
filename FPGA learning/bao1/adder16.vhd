library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith;


ENTITY ADDER16 IS
PORT
(CLK:IN STD_LOGIC;
 CLR:IN STD_LOGIC;
ENA:IN STD_LOGIC;
T:BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
Q:BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
C0,C1,C2,C3:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
L0,L1,L2,L3:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END ADDER16;

ARCHITECTURE behave of ADDER16 IS
COMPONENT tflip
PORT(
CLK:IN STD_LOGIC;
CLR:IN STD_LOGIC;
TT:IN STD_LOGIC;
Q:BUFFER STD_LOGIC
);
END COMPONENT;

BEGIN 
T(0)<=ENA;
T(1)<=Q(0) AND T(0);
T(2)<=Q(1) AND T(1);
T(3)<=Q(2) AND T(2);
T(4)<=Q(3) AND T(3);
T(5)<=Q(4) AND T(4);
T(6)<=Q(5) AND T(5);
T(7)<=Q(6) AND T(6);
T(8)<=Q(7) AND T(7);
T(9)<=Q(8) AND T(8);
T(10)<=Q(9) AND T(9);
T(11)<=Q(10) AND T(10);
T(12)<=Q(11) AND T(11);
T(13)<=Q(12) AND T(12);
T(14)<=Q(13) AND T(13);
T(15)<=Q(14) AND T(14);

TA0:TFLIP PORT MAP(CLK,CLR,T(0),Q(0));
TA1:TFLIP PORT MAP(CLK,CLR,T(1),Q(1));
TA2:TFLIP PORT MAP(CLK,CLR,T(2),Q(2));
TA3:TFLIP PORT MAP(CLK,CLR,T(3),Q(3));
TA4:TFLIP PORT MAP(CLK,CLR,T(4),Q(4));
TA5:TFLIP PORT MAP(CLK,CLR,T(5),Q(5));
TA6:TFLIP PORT MAP(CLK,CLR,T(6),Q(6));
TA7:TFLIP PORT MAP(CLK,CLR,T(7),Q(7));
TA8:TFLIP PORT MAP(CLK,CLR,T(8),Q(8));
TA9:TFLIP PORT MAP(CLK,CLR,T(9),Q(9));
TA10:TFLIP PORT MAP(CLK,CLR,T(10),Q(10));
TA11:TFLIP PORT MAP(CLK,CLR,T(11),Q(11));
TA12:TFLIP PORT MAP(CLK,CLR,T(12),Q(12));
TA13:TFLIP PORT MAP(CLK,CLR,T(13),Q(13));
TA14:TFLIP PORT MAP(CLK,CLR,T(14),Q(14));
TA15:TFLIP PORT MAP(CLK,CLR,T(15),Q(15));

L0<=Q(3 DOWNTO 0);
L1<=Q(7 DOWNTO 4);
L2<=Q(11 DOWNTO 8);
L3<=Q(15 DOWNTO 12);

WITH L0 SELECT
C0<="11000000" WHEN"0000",
    "11111001" WHEN"0001",
    "10100100" WHEN"0010",
    "10110000" WHEN"0011",
    "10011001" WHEN"0100",
    "10010010" WHEN"0101",
    "10000010" WHEN"0110",
    "11111000" WHEN"0111",
    "10000000" WHEN"1000",
    "10010000" WHEN"1001",
    "11111111" WHEN others;

WITH L1 SELECT
C1<="11000000" WHEN"0000",
    "11111001" WHEN"0001",
    "10100100" WHEN"0010",
    "10110000" WHEN"0011",
    "10011001" WHEN"0100",
    "10010010" WHEN"0101",
    "10000010" WHEN"0110",
    "11111000" WHEN"0111",
    "10000000" WHEN"1000",
    "10010000" WHEN"1001",
    "11111111" WHEN others;

WITH L2 SELECT
C2<="11000000" WHEN"0000",
    "11111001" WHEN"0001",
    "10100100" WHEN"0010",
    "10110000" WHEN"0011",
    "10011001" WHEN"0100",
    "10010010" WHEN"0101",
    "10000010" WHEN"0110",
    "11111000" WHEN"0111",
    "10000000" WHEN"1000",
    "10010000" WHEN"1001",
    "11111111" WHEN others;

WITH L3 SELECT
C3<="11000000" WHEN"0000",
    "11111001" WHEN"0001",
    "10100100" WHEN"0010",
    "10110000" WHEN"0011",
    "10011001" WHEN"0100",
    "10010010" WHEN"0101",
    "10000010" WHEN"0110",
    "11111000" WHEN"0111",
    "10000000" WHEN"1000",
    "10010000" WHEN"1001",
    "11111111" WHEN others;

END behave;