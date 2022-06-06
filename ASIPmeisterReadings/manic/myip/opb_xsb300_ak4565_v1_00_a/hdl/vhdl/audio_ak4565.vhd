library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity audio_ak4565 is

port	(
	   CLK : in std_logic;
		RST : in std_logic;

		audio_bram_clk : out std_logic;
		audio_bram_addr_dac : out std_logic_vector(11 downto 0);
		audio_bram_addr_adc : out std_logic_vector(11 downto 0);

		audio_bram_dacdata : in std_logic;
		audio_bram_adcdata : out std_logic;

		interrupt : out std_logic;
		audio_fifohalf : out std_logic;

		AU_CSN_N : out std_logic;
        AU_BCLK : out std_logic;
        AU_MCLK : out std_logic;
        AU_LRCK : out std_logic;
        AU_SDTI : out std_logic;
        AU_SDTO0 : in std_logic
	  );
end audio_ak4565;


architecture Behavioral of audio_ak4565 is

component RAMB4_S1_S16
--
  generic (
       INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
       INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
		 );
--
  port (DIA    : in STD_LOGIC_VECTOR (0 downto 0);
        DIB    : in STD_LOGIC_VECTOR (15 downto 0);
        ENA    : in STD_logic;
        ENB    : in STD_logic;
        WEA    : in STD_logic;
        WEB    : in STD_logic;
        RSTA   : in STD_logic;
        RSTB   : in STD_logic;
        CLKA   : in STD_logic;
        CLKB   : in STD_logic;
        ADDRA  : in STD_LOGIC_VECTOR (11 downto 0);
        ADDRB  : in STD_LOGIC_VECTOR (7 downto 0);
        DOA    : out STD_LOGIC_VECTOR (0 downto 0);
        DOB    : out STD_LOGIC_VECTOR (15 downto 0)); 
end component;

signal clkcnt : std_logic_vector(4 downto 0);
signal audiocnt_dac, audiocnt_adc : std_logic_vector(11 downto 0);

signal audio_clk : std_logic;
signal lrck : std_logic;

begin

AU_CSN_N <= '1'; -- no chip select as we don't write the ctrl regs

-- generate the 3 clocks: master, serial, frame

process(CLK, RST)
begin
	if rst = '1' then 
		clkcnt <= "00000";
	elsif clk'event and clk='1' then
		clkcnt <= clkcnt + 1;
	end if;
end process;
AU_MCLK <= clkcnt(1); -- master clock, 12.5 MHz
audio_clk <= clkcnt(4); -- this is the serial clock, 1.5625 Mhz
AU_BCLK <= not audio_clk; -- dont't ask but read AK4565 specs

process(audio_clk, RST)
begin
	if rst = '1' then 
	audiocnt_dac <= "000000000000";
	audiocnt_adc <= "111111111111";
	lrck <= '0';
	elsif audio_clk'event and audio_clk='1' then
		audiocnt_dac <= audiocnt_dac + 1;
		audiocnt_adc <= audiocnt_adc + 1;
		lrck <= not audiocnt_dac(4);
	end if;
end process;
AU_LRCK <= lrck; -- audio clock, 48.828 kHz 

interrupt <= not audiocnt_dac(10);
audio_fifohalf <= audiocnt_dac(11);

audio_bram_addr_dac <= audiocnt_dac;
audio_bram_addr_adc <= audiocnt_adc;
audio_bram_clk <= audio_clk;

AU_SDTI <= audio_bram_dacdata;
audio_bram_adcdata <= AU_SDTO0;

end architecture;

