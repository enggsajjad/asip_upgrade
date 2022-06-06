module clkgen(
FPGA_CLK1,

sys_clk,
pixel_clock,
fpga_reset

);

input FPGA_CLK1;
output sys_clk, pixel_clock, fpga_reset;


wire clk1x, clk05x;

wire clk_ibuf, clk1x_i, clk05x_i;
wire locked;

IBUFG clkibuf(.I(FPGA_CLK1), .O(clk_ibuf));
BUFG bg1 (.I(clk1x_i), .O(sys_clk));
BUFG bg05 (.I(clk05x_i), .O(pixel_clock));

// synopsys translate_off
defparam vdll.CLKDV_DIVIDE = 2.0 ;
// synopsys translate_on
// synthesis attribute CLKDV_DIVIDE of vdll is 2
CLKDLL vdll(.CLKIN(clk_ibuf), .CLKFB(sys_clk), .CLK0(clk1x_i), .CLKDV(clk05x_i), .RST(1'b0), .LOCKED(locked));

assign fpga_reset = ~locked;


endmodule
