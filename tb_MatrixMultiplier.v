//testbench for homework1
//tb_MatrixMultiplier

`timescale 1ns/100ps

module tb_MatrixMultiplier;

reg [7:0] mc,mi;
wire [7:0] mm_product;
reg clk, rst;

integer cycle;

MatrixMultiplier mm (rst, clk, mc, mi, mm_product);


//clock signal
 initial begin
    clk =1'b0;
	cycle=1'b0;
    forever  begin #5 clk=~clk; end
	
end

//write results on terminal
initial begin
    
	forever begin 
		#10
		cycle=cycle+1'b1;
		
		if(cycle== 128'd67) begin
			$finish;
		end
	
		if(cycle[1:0] == 2'b10) begin
	
			if(cycle[3:0] == 4'b0010) begin
				$write("%h\n ", mm_product) ;
			end		
			else begin
				$write("%h ", mm_product) ;
			end	
		end
	
	end
end

//inverse matrix calcualtion
/*

2 3 1 1			14 11 13 9			1 0 0 0
1 2 3 1		*	9 14 11 13		=	0 1 0 0
1 1 2 3			13 9 14 11			0 0 1 0
3 1 1 2			11 13 9 14			0 0 0 1


*/
initial begin
//row1
	#10 rst=1'b0;
	#10 rst=1'b1;
	
	mc =8'd2; mi = 8'd14;
	#10 mc =8'd3; mi =8'd9;
	#10 mc =8'd1; mi =8'd13;
	#10 mc =8'd1; mi =8'd11; 

	#10 mc =8'd2; mi = 8'd11;
	#10 mc =8'd3; mi =8'd14;
	#10 mc =8'd1; mi =8'd9;
	#10 mc =8'd1; mi =8'd13; 
	
	#10 mc =8'd2; mi = 8'd13;
	#10 mc =8'd3; mi =8'd11;
	#10 mc =8'd1; mi =8'd14;
	#10 mc =8'd1; mi =8'd9;

	#10 mc =8'd2; mi = 8'd9;
	#10 mc =8'd3; mi =8'd13;
	#10 mc =8'd1; mi =8'd11;
	#10 mc =8'd1; mi =8'd14; 
//row2
	#10 mc =8'd1; mi = 8'd14;
	#10 mc =8'd2; mi =8'd9;
	#10 mc =8'd3; mi =8'd13;
	#10 mc =8'd1; mi =8'd11; 

	#10 mc =8'd1; mi = 8'd11;
	#10 mc =8'd2; mi =8'd14;
	#10 mc =8'd3; mi =8'd9;
	#10 mc =8'd1; mi =8'd13; 
	
	#10 mc =8'd1; mi = 8'd13;
	#10 mc =8'd2; mi =8'd11;
	#10 mc =8'd3; mi =8'd14;
	#10 mc =8'd1; mi =8'd9; 

	#10 mc =8'd1; mi = 8'd9;
	#10 mc =8'd2; mi =8'd13;
	#10 mc =8'd3; mi =8'd11;
	#10 mc =8'd1; mi =8'd14; 
//row3
	#10 mc =8'd1; mi = 8'd14;
	#10 mc =8'd1; mi =8'd9;
	#10 mc =8'd2; mi =8'd13;
	#10 mc =8'd3; mi =8'd11; 

	#10 mc =8'd1; mi = 8'd11;
	#10 mc =8'd1; mi =8'd14;
	#10 mc =8'd2; mi =8'd9;
	#10 mc =8'd3; mi =8'd13; 
	
	#10 mc =8'd1; mi = 8'd13;
	#10 mc =8'd1; mi =8'd11;
	#10 mc =8'd2; mi =8'd14;
	#10 mc =8'd3; mi =8'd9; 

	#10 mc =8'd1; mi = 8'd9;
	#10 mc =8'd1; mi =8'd13;
	#10 mc =8'd2; mi =8'd11;
	#10 mc =8'd3; mi =8'd14; 
//row4
	#10 mc =8'd3; mi = 8'd14;
	#10 mc =8'd1; mi =8'd9;
	#10 mc =8'd1; mi =8'd13;
	#10 mc =8'd2; mi =8'd11;

	#10 mc =8'd3; mi = 8'd11;
	#10 mc =8'd1; mi =8'd14;
	#10 mc =8'd1; mi =8'd9;
	#10 mc =8'd2; mi =8'd13; 
	
	#10 mc =8'd3; mi = 8'd13;
	#10 mc =8'd1; mi =8'd11;
	#10 mc =8'd1; mi =8'd14;
	#10 mc =8'd2; mi =8'd9; 

	#10 mc =8'd3; mi = 8'd9;
	#10 mc =8'd1; mi =8'd13;
	#10 mc =8'd1; mi =8'd11;
	#10 mc =8'd2; mi =8'd14; 


end 
endmodule
