`timescale 1 ns / 100 ps
module tb ();

	reg clk = 1'b0;

	wire DS_EN1;
	wire DS_EN2;
	wire DS_EN3;
	wire DS_EN4;
	
   wire DS_A;
	wire DS_B;
	wire DS_C;
	wire DS_D;
	wire DS_E;
	wire DS_F;
	wire DS_G;
	wire DS_DP;
	
top top(.CLK(clk), .DS_EN1(DS_EN1), .DS_EN2(DS_EN2), .DS_EN3(DS_EN3), .DS_EN4(DS_EN4), .DS_A(DS_A), .DS_B(DS_B), .DS_C(DS_C), .DS_D(DS_D), .DS_E(DS_E), .DS_F(DS_F), .DS_G(DS_G), .DS_DP(DS_DP) );	

always
	#1 clk = ~clk;

	
//Initial Block
initial
begin 
	$display($time, " << Starting Simulation >> ");
   #80000000
	$display($time, "<< Simulation Complete >>");
	$stop;
end

endmodule