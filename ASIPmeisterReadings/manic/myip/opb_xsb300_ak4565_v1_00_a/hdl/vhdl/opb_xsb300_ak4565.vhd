library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity opb_xsb300_ak4565 is
  generic (
    C_OPB_AWIDTH    : integer := 32;
    C_OPB_DWIDTH    : integer := 32;
    C_BASEADDR      : std_logic_vector(31 downto 0) := X"FEFE_0000";
    C_HIGHADDR      : std_logic_vector(31 downto 0) := X"FEFE_FFFF"
    );

    Port ( 	OPB_Clk : in std_logic;
			OPB_Rst : in std_logic;
			OPB_ABus : in std_logic_vector (31 downto 0);
			OPB_BE : in std_logic_vector (3 downto 0);
			OPB_DBus : in std_logic_vector (31 downto 0);
			OPB_RNW : in std_logic;
			OPB_select : in std_logic;
			OPB_seqAddr : in std_logic;

			UIO_DBus : out std_logic_vector (31 downto 0);
			UIO_errAck : out std_logic;
			UIO_retry : out std_logic;
			UIO_toutSup : out std_logic;
			UIO_xferAck : out std_logic;

		    Interrupt : out std_logic;

            AU_CSN_N : out std_logic;
            AU_BCLK : out std_logic;
            AU_MCLK : out std_logic;
            AU_LRCK : out std_logic;
            AU_SDTI : out std_logic;
            AU_SDTO0 : in std_logic
	 		   );
end opb_xsb300_ak4565;

architecture Behavioral of opb_xsb300_ak4565 is

component audio_ak4565 port	(
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

end component;

signal cs, xfer, xfer_1, xfer_2 : std_logic;

signal rnw : std_logic;
signal addr : std_logic_vector (15 downto 0); 	
signal wdata : std_logic_vector (31 downto 0);

signal rdata : std_logic_vector (31 downto 0);
signal opb_ad_ce : std_logic;

signal we, a0, ce0, ce1 : std_logic;
signal bram_rdata, bram_wdata : std_logic_vector(15 downto 0); -- as the CPU sees them
signal bram_rdata_rev, bram_wdata_rev : std_logic_vector(15 downto 0); -- reversed !
signal bram_addr : std_logic_vector(7 downto 0);

signal audio_bram_clk : std_logic;
signal audio_bram_addr_dac, audio_bram_addr_adc : std_logic_vector(11 downto 0);
signal audio_bram_dacdata : std_logic;
signal audio_bram_adcdata : std_logic;
signal audio_bram_dacdata_v : std_logic_vector(0 downto 0);
signal audio_bram_adcdata_v : std_logic_vector(0 downto 0);

signal audio_fifohalf : std_logic;
signal temp : std_logic_vector(7 downto 0);
signal temp1 : std_logic_vector(15 downto 0);
signal flag : std_logic_vector(1 downto 0);
--signal temp2 : std_logic_vector(31 downto 0);

begin

process(OPB_Rst, OPB_Clk)
begin  
        
-- register adresses, data write, rnw
   if OPB_Rst = '1' then
          addr <=  X"0000";
          wdata <= X"0000_0000";
          rnw <= '0';
		  flag <= X"00";
	elsif OPB_Clk'event and OPB_Clk ='1' then
          if opb_ad_ce = '1' then
			 	 wdata <= OPB_DBus;
				 addr <= OPB_ABus(15 downto 0);
          	 rnw <= OPB_RNW;
			 end if;
	end if;

-- register data read
   if OPB_Rst = '1' then
			rdata <= X"0000_0000";
	elsif OPB_Clk'event and OPB_Clk ='1' then
			 if(ce0='1') then rdata(15 downto 0) <= bram_rdata; end if;
			 if(ce1='1') then rdata(31 downto 16) <= bram_rdata; end if;
	end if;

end process;

-- very important	
-- TO DO
-- when writing, the read data can corrupe the DBus
	UIO_DBus <= rdata when xfer = '1' else X"0000_0000";


cs <= OPB_Select when OPB_ABus(31 downto 16)=X"FEFE" else '0';

-- the 1st ff -- FDR
process(OPB_Clk)
begin
	if OPB_Clk'event and OPB_Clk ='1' then
		if (xfer or xfer_1) = '1' then xfer <='0'; else xfer <= cs; end if;
	end if;
end process;

process (OPB_Rst, OPB_Clk)
begin
	if OPB_Rst = '1' then
       xfer_1 <= '0';
		 xfer_2 <= '0';
   elsif OPB_Clk'event and OPB_Clk ='1' then
		 xfer_1 <= xfer;
		 xfer_2 <= xfer_1 and not rnw;
	end if;
end process;

-- combinational logic for BRAM
we <= (xfer or xfer_1) and not rnw;
ce0 <= xfer_1 and not rnw;
ce1 <= xfer_2;
a0 <= xfer_1;
opb_ad_ce <= not xfer;

bram_addr <= (not audio_fifohalf) & addr(7 downto 2) & a0;
bram_wdata <= wdata(31 downto 16) when a0='0' else wdata(15 downto 0);

--temp <= wdata(31 downto 24) when flag = "00" else wdata(23 downto 16) when flag ="01" else wdata( 15 downto 8) when flag = "10" else wdata(7 downto 0);
--temp1 <= temp(7 downto 0) & "00000000" ;
--bram_wdata <= temp1 & temp1;
--flag <= flag+1;

-- tie unused to ground
UIO_errAck <= '0';
UIO_retry <= '0';
UIO_toutSup <= '0';
UIO_xferAck <= xfer;


-- instantiate the BRAMS
process (bram_rdata_rev) begin
	for i in 0 to 15 loop
		bram_rdata(i)<=bram_rdata_rev(15-i);
	end loop;
end process;

process(bram_wdata) begin
	for i in 0 to 15 loop
		bram_wdata_rev(i)<=bram_wdata(15-i);
	end loop;
end process;

audio_bram_dacdata <= audio_bram_dacdata_v(0);
dac_bram : RAMB4_S1_S16 port map (
		  DIA    => "0" ,
        ENA    => '1',
		  WEA    => '0',
        RSTA   => '0',
		  CLKA   => audio_bram_clk,
		  ADDRA  => audio_bram_addr_dac,
		  DOA    => audio_bram_dacdata_v,

		  DIB    => bram_wdata_rev,
        ENB    => '1',
        WEB    => we,
		  RSTB   => '0',
        CLKB   => OPB_Clk,
        ADDRB  => bram_addr,
        DOB    => open
);

audio_bram_adcdata_v(0) <= audio_bram_adcdata ;
adc_bram : RAMB4_S1_S16 port map (
		  DIA    => audio_bram_adcdata_v,
        ENA    => '1',
		  WEA    => '1',
        RSTA   => '0',
		  CLKA   => audio_bram_clk,
		  ADDRA  => audio_bram_addr_adc,
		  DOA    => open,

		  DIB    => X"0000",
        ENB    => '1',
        WEB    => '0',
		  RSTB   => '0',
        CLKB   => OPB_Clk,
        ADDRB  => bram_addr,
        DOB    => bram_rdata_rev
);




-- the sound stuff

audio : audio_ak4565 port map(

	CLK => OPB_Clk,
   RST => OPB_Rst,

	audio_bram_clk => audio_bram_clk,
	audio_bram_addr_dac => audio_bram_addr_dac,
	audio_bram_addr_adc => audio_bram_addr_adc,
	audio_bram_dacdata => 	audio_bram_dacdata,
	audio_bram_adcdata => audio_bram_adcdata,
	
	interrupt => interrupt,
	audio_fifohalf => audio_fifohalf,

	AU_CSN_N => AU_CSN_N,
   AU_BCLK => AU_BCLK, 
   AU_MCLK => AU_MCLK, 
   AU_LRCK => AU_LRCK, 
   AU_SDTI => AU_SDTI, 
   AU_SDTO0 => AU_SDTO0 
);

end Behavioral;
