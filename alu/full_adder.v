module full_adder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	
	wire w1,w2,w3,w4;
	
	xor xor1(w1,a,b);
	xor xor2(sum,w1,cin);
	
	and and1(w2, a, cin);
	and and2(w3, a,b);
	and and3(w4,b,cin);
	or or1(cout, w2, w3,w4);
endmodule
