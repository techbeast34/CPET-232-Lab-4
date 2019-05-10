LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Lab4 IS
	PORT(x,y,z,w  		:IN STD_LOGIC;
		 hex_disp_case  :OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		 hex_disp_if 	:OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END Lab4;

ARCHITECTURE model OF Lab4 IS
	SIGNAL inputs  	   :STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL output_case :STD_LOGIC_VECTOR (6 DOWNTO 0);
	SIGNAL output_if   :STD_LOGIC_VECTOR (6 DOWNTO 0);
	CONSTANT zero 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "1000000";
	CONSTANT one			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111001";
	CONSTANT two 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0100100";
	CONSTANT three 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0110000";
	CONSTANT four 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0011001";
	CONSTANT five 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0010010";
	CONSTANT six 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000010";
	CONSTANT seven 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111000";
	CONSTANT eight 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0000000";
	CONSTANT nine 			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0011000";
	CONSTANT dash			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "0111111";
	CONSTANT blank			: STD_LOGIC_VECTOR (6 DOWNTO 0) := "1111111";
	
	BEGIN
	
	inputs <= x & y & z & w;
	
	hexdisplay_case: PROCESS(inputs)
		BEGIN
			CASE inputs IS
				WHEN "0000" => output_case <= five;
				WHEN "0001" => output_case <= zero;
				WHEN "0010" => output_case <= eight;
				WHEN "0011" => output_case <= dash;
				WHEN "0100" => output_case <= three;
				WHEN "0101" => output_case <= three;
				WHEN "0110" => output_case <= two;
				WHEN "0111" => output_case <= dash;
				WHEN "1000" => output_case <= six;
				WHEN "1001" => output_case <= four;
				WHEN "1010" => output_case <= four;
				WHEN "1011" => output_case <= four;
				WHEN OTHERS => output_case <= blank;
			END CASE;
		END PROCESS;
	hex_disp_case <= output_case;
	
	PROCESS(inputs)
		BEGIN
			IF (inputs = "0000") THEN output_if <= five;
			ELSIF (inputs = "0001") THEN output_if <= zero;
			ELSIF (inputs = "0010") THEN output_if <= eight;
			ELSIF (inputs = "0011") THEN output_if <= dash;
			ELSIF (inputs = "0100") THEN output_if <= three;
			ELSIF (inputs = "0101") THEN output_if <= three;
			ELSIF (inputs = "0110") THEN output_if <= two;
			ELSIF (inputs = "0111") THEN output_if <= dash;
			ELSIF (inputs = "1000") THEN output_if <= six;
			ELSIF (inputs = "1001") THEN output_if <= four;
			ELSIF (inputs = "1010") THEN output_if <= four;
			ELSIF (inputs = "1011") THEN output_if <= four;
			ELSE output_if <= blank;
		END IF;
	END PROCESS;
	hex_disp_if <= output_if;
	
END model;