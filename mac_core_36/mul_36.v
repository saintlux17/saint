`timescale 1ns / 1ps


//module for parallel operation

module mul_36
    #(parameter N=36)
    (
    input clk,
    input[8*N-1:0] in_1,
    input[8*N-1:0] in_2,
    input[8*N-1:0] in_3,
    output[16*N-1:0] out1,
    output[16*N-1:0] out2
    );

genvar i;

generate
for (i = 1; i <= N; i=i+1) begin
    dsp_new dsp(
    .clk(clk), 
    .in_1(in_1[(8*i-1) -: 8]), 
    .in_2(in_2[(8*i-1) -: 8]), 
    .in_3(in_3[(8*i-1) -:8]), 
    .out1(out1[(16*i-1) -: 16]), 
    .out2(out2[(16*i-1) -: 16]));
    end
endgenerate


endmodule
