module rca_16(a,b,cin,sum,cout);
	input [15:0]a,b;
	input cin;
	output [15:0]sum;
	output cout;
	
	wire [14:0]out;
	
	full_adder fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(out[0]));
	
	generate
		genvar i;
		for(i=1;i<15;i=i+1) begin:loop_rca16
			full_adder fa(.a(a[i]),.b(b[i]),.cin(out[i-1]),.sum(sum[i]),.cout(out[i]));
		end
	endgenerate
		
	full_adder fa1(.a(a[15]),.b(b[15]),.cin(out[14]),.sum(sum[15]),.cout(cout));
endmodule

module rca_16_overflow(a,b,cin,sum,cout,of);
	input [15:0]a,b;
	input cin;
	output [15:0]sum;
	output cout,of;
	
	wire [14:0]out;
	
	full_adder fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(out[0]));
	
	generate
		genvar i;
		for(i=1;i<15;i=i+1) begin:loop_rca16
			full_adder fa(.a(a[i]),.b(b[i]),.cin(out[i-1]),.sum(sum[i]),.cout(out[i]));
		end
	endgenerate
		
	full_adder fa1(.a(a[15]),.b(b[15]),.cin(out[14]),.sum(sum[15]),.cout(cout));
	
	xor testof(of,cout,out[14]);
endmodule