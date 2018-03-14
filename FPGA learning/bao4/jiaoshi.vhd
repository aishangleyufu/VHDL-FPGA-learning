LIBRARY ieee;			--库调用说明

USE ieee.std_logic_1164.all;	--程序包调用说明
USE ieee.std_logic_unsigned.all;

ENTITY jiaoshi IS			--实体开始
	PORT 			--端口说明
	(clk,ld,en1:IN std_logic;
	nclr:IN std_logic;
	 Q0H: buffer std_logic_vector(3 downto 0);
	 Q0L: buffer std_logic_vector(3 downto 0);
	 Q1H: buffer std_logic_vector(3 downto 0);
	 Q1L: buffer std_logic_vector(3 downto 0);
	 Q2H: buffer std_logic_vector(3 downto 0);
	 Q2L: buffer std_logic_vector(3 downto 0);
	 din1: IN std_logic_vector(7 downto 0);
	 din2: IN std_logic_vector(7 downto 0);
	 din0: IN std_logic_vector(7 downto 0);

	co0: INOUT std_logic;
	co1: INOUT std_logic;
	co2: OUT std_logic;
	BUZZ:OUT std_logic;
	BAOSHI:OUT std_logic;
	C0,C1,C2,C3,C4,C5:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	
	);
END jiaoshi; 			--实体结束

ARCHITECTURE behave OF jiaoshi IS	--结构体开始


	BEGIN			--功能描述

	co0<='1'when(Q0H="0101" AND Q0L="1001" AND en1='1')else'0';
	co1<='1'when(Q1H="0101" AND Q1L="1001" AND co0='1')else'0';
	co2<='1'when(Q2H="0010" AND Q2L="0100" AND co1='1')else'0';
	PROCESS(clk,nclr,co1)
    VARIABLE var1:integer:=1;
    VARIABLE var2:integer:=1;
	BEGIN
	if (clk'EVENT AND cLK='1')then
	if (Q1H=5 AND Q1L=9 AND Q0H=5 AND Q0L=9)THEN
	    BAOSHI<='1';
	ELSE
	    BAOSHI<='0'; 
	END IF;
	END IF;  
	 
	IF (clk'EVENT AND clk='1') THEN
        var1:=var1+1;
          if (var1=5000) then
             var1:=1;
             var2:=var2+1;
                    if(var2=10000) then
              --           var2:=1;
              --      end if;
           --end if;
  
	
	
	
		
	if(nclr='0')then
	Q2H<="0000";
	Q2L<="0000";
	ELSif(clk'EVENT AND clk='1')then
	  IF(ld='1')then
	  Q2H<=din2(7 DOWNTO 4);
      Q2L<=din2(3 DOWNTO 0);
      ELSIF(co1='1')then
	       IF(Q2H=2 AND Q2L=3)THEN
	          Q2H<="0000";
	          Q2L<="0000";
	       ELSIF(Q2L=9)then
	        Q2L<="0000";
	           IF(Q2H=0 OR Q2H=1) THEN
	               Q2H<=Q2H+1;
	           END IF;
	       ELSE 
	             Q2L<=Q2L+1;
	       END IF;             
	  END IF;  
	END IF;  
	
	  
	if(nclr='0')then
	Q1H<="0000";
	Q1L<="0000";
	ELSif(clk'EVENT AND clk='1')then
	  IF(ld='1')then
	  Q1H<=din1(7 DOWNTO 4);
      Q1L<=din1(3 DOWNTO 0);
      ELSIF(co0='1')then
	   IF(Q1L=9)then
	      Q1L<="0000";
	      IF(Q1H=5)then
	           Q1H<="0000";
	      ELSE
	           Q1H<=Q1H+1;
	      END IF;          
	    ELSE
	    Q1L<=Q1L+1;
	    END IF;
	  END IF;
	END IF; 
	
    if(nclr='0')then
	Q0H<="0000";
	Q0L<="0000";
	ELSif(clk'EVENT AND clk='1')then
	  IF(ld='1')then

      ELSIF(en1='1')then
	   IF(Q0L=9)then
	      Q0L<="0000";
	      IF(Q0H=5)then
	           Q0H<="0000";
	      ELSE 
	           Q0H<=Q0H+1;
	      END IF;          
	    ELSE
	    Q0L<=Q0L+1;
	    END IF;
	    
	  END IF;
	END IF; 
	
	                  var2:=1;
                    end if;
           end if;
     END IF;    
	END PROCESS;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	WITH Q0L SELECT
C0<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;

WITH Q0H SELECT
C1<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;


WITH Q1L SELECT
C2<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;


WITH Q1H SELECT
C3<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;


WITH Q2L SELECT
C4<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;


WITH Q2H SELECT
C5<="00000011" WHEN"0000",
    "10011111" WHEN"0001",
    "00100101" WHEN"0010",
    "00001101" WHEN"0011",
    "10011001" WHEN"0100",
    "01001001" WHEN"0101",
    "01000001" WHEN"0110",
    "00011111" WHEN"0111",
    "00000001" WHEN"1000",
    "00001001" WHEN"1001",
    "11111111" WHEN others;

END behave ;