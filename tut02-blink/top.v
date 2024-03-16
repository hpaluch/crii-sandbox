`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  Henryk Paluch
// 
// Create Date:    03/16/2024 
// Design Name: Simple blinking LEDs LD0 to LD3
// Module Name:  top 
// Project Name: tut02-blink
// Target Devices: xc2c256-6TQ144
// Tool versions: ISE 14.7
// Description: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input PCLK,      // on-board 8MHz clock, connected to GCK2 pin 
    input [1:0] BTN, // on-board buttons 
    output [3:0] LD  // on-board LEDs
    );


wire clk_half_mhz; // 0.5 MHz (1/2=half) clock

// we use integrated ClockDivider on XC2C256 chip
// to divide input 8MHz (from GCK2 pin) by 16 to 0.5Mhz
CLK_DIV16 U1 ( .CLKIN(PCLK), .CLKDV(clk_half_mhz) ); 

reg [20:0] counter  = 0; // stateful counter

always @(posedge clk_half_mhz)
	counter <= counter + 1;

assign LD[3:0] = counter[20:17]; 

endmodule
