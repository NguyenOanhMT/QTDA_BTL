library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decoder7seg is
	port(
		I: in std_logic_vector(3 downto 0);
		a: out std_logic;
		b: out std_logic;
		c: out std_logic;
		d: out std_logic;
		e: out std_logic;
		f: out std_logic;
		g: out std_logic
		);
end decoder7seg;

architecture behavitor of decoder7seg is
	signal tmp: std_logic_vector(6 downto 0);
begin
	-- Giải mã tín hiệu đầu vào
	decode: process(I)
	begin
		case I is 
			when "0000" => tmp <= "0000001";
			when "0001" => tmp <= "1001111";
			when "0010" => tmp <= "0010010";
			when "0011" => tmp <= "0000110";
			when "0100" => tmp <= "0100100";
			when "0101"	=> tmp <= "0100100";	  
			when "0110"	=> tmp <= "0100000";	  
			when "0111"	=> tmp <= "0001111";	 
			when "1000"	=> tmp <= "0000000";	   
			when "1001"	=> tmp <= "0000100";	  
			when "1010"	=> tmp <= "0000010";	  
			when "1011"	=> tmp <= "1100000";
			when "1100"	=> tmp <= "0110001";
			when "1101"	=> tmp <= "1000010";	  
			when "1110"	=> tmp <= "0010000";	  
			when "1111"	=> tmp <= "0111000";	
			when others	=> tmp <=(others => 'Z');
		end case;
	end process decode;
	
	-- Phân tích tín hiệu led 7 đoạn
	a <= tmp(0);
	b <= tmp(1);
	c <= tmp(2);
	d <= tmp(3);
	e <= tmp(4);
	f <= tmp(5);
	g <= tmp(6);
end behavitor;

-- Giải mã led chuyển sang số

architecture convert of decoder7seg is
begin
	integerprocess: process(I)
	variable value: integer;
	begin
		value := CONV_INTEGER(I);
		-- Giải mã đoạn a
		if(value = 0) or (value = 2) or (value = 3)
			or (value = 5) or (value = 6) or (value = 7)
			or (value = 8) or (value = 9) or (value = 10)
			or (value = 14) or (value = 15)
		then
			a <= '0';
		else 
			a <= '1';
		end if;
		
		-- Giải mã đoạn b
		if(value = 0) or (value = 1) or (value = 2)
			or (value = 3) or (value = 4) or (value = 7)
			or (value = 8) or (value = 9) or (value = 10)
			or (value = 13) 
		then
			b <= '0';
		else
			b <= '1';
		end if;
		
		-- Giải mã đoạn c
		if(value = 0) or (value = 1) or (value = 3)
			or (value = 4) or (value = 5) or (value = 6)
			or (value = 7) or (value = 8) or (value = 9)
			or (value = 10) or (value = 11) or (value = 13)
		then
			c <= '0';
		else
			c <= '1';
		end if;
		
		-- Giải mã đoạn d
		if(value = 0) or (value = 2) or (value = 3)
			or (value = 5) or (value = 6) or (value = 8)
			or (value = 9) or (value = 11) or (value = 12)
			or (value = 13) or (value = 14)
		then
			d <= '0';
		else
			d <= '1';
		end if;
		
		-- Giải mã đoạn e
		if(value = 0) or (value = 2) or (value =6)
			or (value = 8) or (value = 10) or (value = 11)
			or (value = 12) or (value = 13) or (value = 14)
			or (value = 15) 
		then
			e <= '0';
		else
			e <= '1';
		end if;
		
		-- Giải mã đoạn f
		if(value = 0) or (value = 4) or (value = 5)
			or (value = 6) or (value = 8) or (value = 9)
			or (value = 10) or (value = 11) or (value = 14)
			or (value = 15)
		then
			f <= '0';
		else
			f <= '1';
		end if;
		
		-- Giải mã đoạn g
		if(value = 2) or (value = 3) or (value = 4)
			or (value = 5) or (value = 6) or (value = 8)
			or (value = 9) or (value = 10) or (value = 11)
			or (value = 12) or (value = 13) or (value = 14)
			or (value = 15)
		then
			g <= '0';
		else
			g <= '1';
		end if;
	end process integerprocess;
end convert;
	