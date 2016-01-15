

module Digitalwatch(
	input clk_50M,
	input rst,
	input start,
	input stop,
	input time_out,
	output[23:0] dispout
	);
	
	wire clk_1Khz;
	wire[23:0] dispbuf;
	clk_div(.clk_50M(clk_50M),.rst(rst),.clk_1Khz(clk_1Khz));

	watch(.clk_1Khz(clk_1Khz),
		.rst(rst),
		.start(start),
		.stop(stop),
		.time_out(time_out),
		.dispbuf(dispbuf));

	
	

endmodule 