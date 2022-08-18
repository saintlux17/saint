`timescale 1ns / 1ps


//module for parallel operation

module mul_new
    #(parameter N=144)
    (
    input clk,
    input[8*N-1:0] weight1,
    input[8*N-1:0] weight2,
    input[4*N-1:0] data,
    output[16*N-1:0] mul_out1,
    output[16*N-1:0] mul_out2
    );

genvar i;

generate
for (i = 1; i <= N; i=i+1) begin
    dsp_new dsp(
    .clk(clk), 
    .in_1(weight1[(8*i-1) -: 8]), 
    .in_2(weight2[(8*i-1) -: 8]), 
    .in_3(data[(8*i-1) -:8]), 
    .out1(mul_out1[(16*i-1) -: 16]), 
    .out2(mul_out2[(16*i-1) -: 16]));
    end
endgenerate


endmodule
