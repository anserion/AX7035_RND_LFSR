LIBRARY ieee; USE ieee.std_logic_1164.ALL; use IEEE.STD_LOGIC_ARITH.ALL;
ENTITY tb_RND_LFSR IS
END tb_RND_LFSR;
ARCHITECTURE behavior OF tb_RND_LFSR IS 
COMPONENT RND_LFSR 
  Generic (seed:STD_LOGIC_VECTOR(31 downto 0));
  PORT(KEY1: IN std_logic; LED1: OUT std_logic);
END COMPONENT;
   signal KEY1 : std_logic;  --Inputs
   signal LED1 : std_logic; --Outputs
BEGIN
   uut: RND_LFSR GENERIC MAP (conv_std_logic_vector(1,32)) PORT MAP (KEY1,LED1);
   tb_proc: process
   begin		
	  KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     KEY1<='0'; WAIT FOR 50ns; KEY1<='1'; WAIT FOR 50ns;
     WAIT;
   end process;
END;