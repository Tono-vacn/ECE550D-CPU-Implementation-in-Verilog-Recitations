
module converter(addr,x,y);
	input wire [18:0] addr;
	output reg [9:0]x,y;
	
	always @(addr) begin
		x<=addr/(10'd640);
		y<=addr%(10'd640);
	end
	
endmodule
