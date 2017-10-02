----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2017 12:52:51 PM
-- Design Name: 
-- Module Name: PROJECT1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PROJECT1 is
  --mapping Switches to LEDs on board (one to on
  Port (
    ledL : out STD_LOGIC_VECTOR(0 to 7);
    ledH : out STD_LOGIC_VECTOR(0 to 7);
    swL : in STD_LOGIC_VECTOR(0 to 7);
    swH : in STD_LOGIC_VECTOR(0 to 7);
    seg : out STD_LOGIC_VECTOR(0 to 7);
    btnC : in STD_LOGIC;
    an : inout STD_LOGIC;
    clk : in STD_LOGIC
  );
end PROJECT1;

architecture Behavioral of PROJECT1 is
    type matrix_t is array(0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal digits : matrix_t;
    signal numL : integer;  --number low
    signal numH : integer;  --number high
    signal numR : integer;  --number result
    signal numR_0 : integer;    -- numR % 10 1st time, numR = numR / 10
    signal numR_1 : integer;    -- numR % 10 2nd time, numR = numR / 10
    signal numR_2 : integer;    -- numR % 10 3rd time, numR = numR / 10
    signal numR_3 : integer;    -- numR % 10
    component SEVEN_SEG is 
        port(
            digit0 : in STD_LOGIC_VECTOR(7 downto 0);
            digit1 : in STD_LOGIC_VECTOR(7 downto 0);
            digit2 : in STD_LOGIC_VECTOR(7 downto 0);
            digit3 : in STD_LOGIC_VECTOR(7 downto 0);
            strobe_clk : in STD_LOGIC
            );
    end component;
begin
    ledL <= swL;
    ledH <= swH;
    numL <= to_integer(unsigned(swL));
    numH <= to_integer(unsigned(swH));
    
    digits(0) <= "11111100";
    digits(1) <= "01100000";
    digits(2) <= "11011010";
    digits(3) <= "11110010";
    digits(4) <= "01100110";
    digits(5) <= "10110110";
    digits(6) <= "10111110";
    digits(7) <= "11100000";
    digits(8) <= "11111110";
    digits(9) <= "11100110";
    digits(10) <= "11101110";
    digits(11) <= "11111110";
    digits(12) <= "10011100";
    digits(13) <= "11111100";
    digits(14) <= "10011110";
    digits(15) <= "10001110";

    process(btnC)
    begin
        --if button pressed
        if (btnC = '1') then
            --if button pushed (active high) add two numbers
            numR <= numL + numH;
            numR_0 <= numR mod 10;
            numR <= numR / 10;
            
            numR_1 <= numR mod 10;
            numR <= numR / 10;
            
            numR_2 <= numR mod 10;
            numR <= numR / 10;
            
            numR_3 <= numR mod 10;
            
            
        end if;
    end process;
    
    seven_seg_0 : SEVEN_SEG port map(,clk);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SEVEN_SEG is
    port(
        digit0 : in STD_LOGIC_VECTOR(7 downto 0);
        digit1 : in STD_LOGIC_VECTOR(7 downto 0);
        digit2 : in STD_LOGIC_VECTOR(7 downto 0);
        digit3 : in STD_LOGIC_VECTOR(7 downto 0);
        strobe_clk : in STD_LOGIC
        );
end SEVEN_SEG;

architecture Behavioral of SEVEN_SEG is
signal counter : integer;
signal slow_clk : STD_LOGIC;

begin
    process(strobe_clk)
        begin
            if (strobe_clk = '1') then
                counter <= counter + 1;
            end if;
            if (counter = 833333) then
                slow_clk <= slow_clk;
                counter <= 0;
            end if;
        end process;
end Behavioral;