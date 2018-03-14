library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith;

entity tflip IS
PORT(
CLK:IN STD_LOGIC;
CLR:IN STD_LOGIC;
TT:IN STD_LOGIC;
Q:BUFFER STD_LOGIC
);
END tflip;

architecture behave of tflip IS
BEGIN
PROCESS(CLK,CLR)
BEGIN
 IF(CLR='0') then Q<='0';
  ELSE IF (CLK'EVENT AND CLK='1') THEN
     IF (TT='1') THEN
        Q<= NOT Q;
     
     END IF;
  END IF;
 END IF;
END PROCESS;
END behave;