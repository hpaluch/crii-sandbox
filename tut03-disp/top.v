`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Henryk Paluch
// 
// Create Date:    03/17/2024 
// Design Name:    4 digit Display counter demo
// Module Name:    top
// Project Name:   tut03-disp
// Target Devices: xc2c256-6TQ144
// Tool versions:  ISE 14.7
// Description: 
// * TODO
//
// Revision: 0.01
// Revision  0.01 - early prototype, hardcoded display output, very slow mux (for debug)
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input PCLK,       // on-board 8MHz clock, connected to GCK2 pin 
    input [1:0] BTN,  // on-board buttons
    output [3:0] LD,  // on-board LEDs
	 output [3:0] ANO,  // 4-digit display, anodes
	 output [7:0] CAT   // 4-digit display, invidiual segments (catodes)
    );

reg [3:0] disp_mux;
assign ANO = disp_mux;

reg [7:0] disp_segments;
assign CAT = disp_segments;

wire reset; // reset, active 1
assign reset = ~ BTN[0]; // BTN0 is RESET, but it is active 0 - using "~" operator

wire ce; // counter enable, active 1
assign ce = BTN[1]; // inverted logic: when BTN0 is pressed => ce=0 (counter stopped = HOLD)

wire clk; // 0.5 MHz (1/2=half) clock

// we use integrated ClockDivider on XC2C256 chip
// to divide input 8MHz (from GCK2 pin) by 16 to 0.5Mhz
CLK_DIV16 U1 ( .CLKIN(PCLK), .CLKDV(clk) ); 

reg [20:0] counter  = 0; // stateful counter

always @(posedge clk)
	if (reset)
		counter <= 0;
	else if (ce)
		counter <= counter + 1;

// display MUX handling
wire [1:0] muxin;
assign muxin = counter[18:17];

always @(muxin)
begin
	case ( muxin )
		2'd0: begin disp_mux = 4'b1110; disp_segments = 8'b11111110; end
		2'd1: begin disp_mux = 4'b1101; disp_segments = 8'b11111101; end
		2'd2: begin disp_mux = 4'b1011; disp_segments = 8'b11111011; end
		2'd3: begin disp_mux = 4'b0111; disp_segments = 8'b11110111; end
	endcase
end

// LED LD0-3 are "inverted" when grounded they are On. So using "~" operator:
assign LD[3:0] = ~ counter[20:17];

endmodule
