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
    an : inout STD_LOGIC
  );
end PROJECT1;

architecture Behavioral of PROJECT1 is
    signal numL : integer;  --number low
    signal numH : integer;  --number high
    signal numR : integer;  --number result
    signal num0 : STD_LOGIC_VECTOR <= "11111100";
    signal num1 : STD_LOGIC_VECTOR <= "01100000";
    signal num2 : STD_LOGIC_VECTOR <= "11011010";
    signal num3 : STD_LOGIC_VECTOR <= "11110010";
    signal num4 : STD_LOGIC_VECTOR <= "01100110";
    signal num5 : STD_LOGIC_VECTOR <= "10110110";
    signal num6 : STD_LOGIC_VECTOR <= "10111110";
    signal num7 : STD_LOGIC_VECTOR <= "11100000";
    signal num8 : STD_LOGIC_VECTOR <= "11111110";
    signal num9 : STD_LOGIC_VECTOR <= "11100110";
    signal A : STD_LOGIC_VECTOR <= "11101110";
    signal B : STD_LOGIC_VECTOR <= "11111110";
    signal C : STD_LOGIC_VECTOR <= "10011100";
    signal D : STD_LOGIC_VECTOR <= "11111100";
    signal E : STD_LOGIC_VECTOR <= "10011110";
    signal F : STD_LOGIC_VECTOR <= "10001110";
    
begin
    ledL <= swL;
    ledH <= swH;
    numL <= to_integer(unsigned(swL));
    numH <= to_integer(unsigned(swH));

    process(btnC)
    begin
        --if button pressed
        if (btnC = '1') then
            --if button pushed (active high) add two numbers
            numR <= numL + numH;     
        end if;
    end process;
end Behavioral;

