module Convert_12_32(input12,output32);

input [11:0] input12;
output [31:0] output32;
assign output32={{20'b0},input12};

endmodule

module Convert_32_12(input32,output12);
input [31:0] input32;
output [11:0] output12;

assign output12 = input32[11:0];
endmodule
