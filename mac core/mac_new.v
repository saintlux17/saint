`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/17 14:59:51
// Design Name: 
// Module Name: mac_new
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mac_new #(parameter N=1152)(
    input clk,
    input rstn,
    input[4*N-1:0] din,
    input[8*N-1:0] weight
    );
    
mul_new
endmodule
