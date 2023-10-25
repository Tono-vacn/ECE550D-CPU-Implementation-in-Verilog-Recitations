module rca_12 (A, B, c_in, c_out, sum);//, last_in);

	input [11:0] A,B;
	input c_in;
	output [11:0] sum;
	output c_out;//, last_in;
	
	wire [10:0] connection;
	
	//4
	full_adder FA1(.a(A[0]), .b(B[0]), .cin(c_in), 
			 .sum(sum[0]), .cout(connection[0])
			);
			
	full_adder FA2(.a(A[1]), .b(B[1]), .cin(connection[0]), 
			 .sum(sum[1]), .cout(connection[1])
			);
	
	full_adder FA3(.a(A[2]), .b(B[2]), .cin(connection[1]), 
			 .sum(sum[2]), .cout(connection[2])
			);
	
	full_adder FA4(.a(A[3]), .b(B[3]), .cin(connection[2]), 
			 .sum(sum[3]), .cout(connection[3])
			);
	
	//8
	full_adder FA5(.a(A[4]), .b(B[4]), .cin(connection[3]), 
			 .sum(sum[4]), .cout(connection[4])
			);
			
	full_adder FA6(.a(A[5]), .b(B[5]), .cin(connection[4]), 
			 .sum(sum[5]), .cout(connection[5])
			);
	full_adder FA7(.a(A[6]), .b(B[6]), .cin(connection[5]), 
			 .sum(sum[6]), .cout(connection[6])
			);
	full_adder FA8(.a(A[7]), .b(B[7]), .cin(connection[6]), 
			 .sum(sum[7]), .cout(connection[7])
			);
	
	//12
	full_adder FA9(.a(A[8]), .b(B[8]), .cin(connection[7]), 
			 .sum(sum[8]), .cout(connection[8])
			);
			
	full_adder FA10(.a(A[9]), .b(B[9]), .cin(connection[8]), 
			 .sum(sum[9]), .cout(connection[9])
			);
	full_adder FA11(.a(A[10]), .b(B[10]), .cin(connection[9]), 
			 .sum(sum[10]), .cout(connection[10])
			);
	//and (last_in, connection[10],1'b1);
	full_adder FA12(.a(A[11]), .b(B[11]), .cin(connection[10]), 
			 .sum(sum[11]), .cout(c_out)
			);

endmodule

	