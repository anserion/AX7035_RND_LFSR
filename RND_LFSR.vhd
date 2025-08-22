--Copyright 2025 Andrey S. Ionisyan (anserion@gmail.com)
--Licensed under the Apache License, Version 2.0 (the "License");
--you may not use this file except in compliance with the License.
--You may obtain a copy of the License at
--    http://www.apache.org/licenses/LICENSE-2.0
--Unless required by applicable law or agreed to in writing, software
--distributed under the License is distributed on an "AS IS" BASIS,
--WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--See the License for the specific language governing permissions and
--limitations under the License.
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RND_LFSR is
    Generic (seed:STD_LOGIC_VECTOR(31 downto 0):=conv_std_logic_vector(26535,32));
    Port (KEY1: in STD_LOGIC; LED1: out STD_LOGIC);
end RND_LFSR;

architecture Behavioral of RND_LFSR is
   signal rnd_reg: std_logic_vector(31 downto 0):=seed;
   signal new_bit: std_logic:='0';
begin
   LED1 <= new_bit;
   new_bit<=rnd_reg(31) xor rnd_reg(30) xor rnd_reg(29) xor
            rnd_reg(27) xor rnd_reg(25) xor rnd_reg(0);
   process(KEY1)
   begin
		if rising_edge(KEY1) then
         rnd_reg<=new_bit & rnd_reg(31 downto 1);
		end if;
	end process;
end Behavioral;
