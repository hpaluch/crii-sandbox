`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   N/A
// Engineer:  Henryk Paluch
// 
// Create Date:    16:12:58 03/14/2024 
// Design Name: Trivial Logic - control LEDs using Buttons
// Module Name:    top 
// Project Name: tut01-swleds
// Target Devices: xc2c256-6TQ144
// Tool versions: ISE 14.7
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input [1:0] BTN,
    output [3:0] LD
    );

assign LD[0] = BTN[0];
assign LD[1] = ~BTN[0];
assign LD[2] = BTN[1];
assign LD[3] = ~BTN[1];

endmodule
