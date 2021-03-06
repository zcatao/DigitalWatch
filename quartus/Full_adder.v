


module Full_adder(
	a,b,c,out,cout);
	
	input a,b,c;
	output out,cout;
	
	wire t1;
	wire t2;
	wire t3;
	
	
	half_adder u1(.a(a),.b(b),.out(t1),.cout(t2));
	
	half_adder u2(.a(t1),.b(c),.out(out),.cout(t3));
	
	assign cout = t2 | t3;

endmodule 