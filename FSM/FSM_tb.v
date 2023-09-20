`timescale 1 ns / 100 ps
module FSM_tb();
	reg w;
	reg clock;
	wire [2:0] STATE;
	wire [2:0] STATE_mo;
	wire count_me;
	wire count_mo;
	wire reset;
	//reg [2:0] state;
	//reg [2:0] next_state;
	
	FSM test_counter (clock,reset,w,count_me,count_mo, STATE,STATE_mo);
	
	initial begin
			$display($time, "simulation start");
			clock = 1'b0;
			@(negedge clock);
			w = 1'b0;
			@(negedge clock);
			w = 1'b1;
			@(negedge clock);
			w = 1'b1;			
			@(negedge clock);
			w = 1'b1;			
			@(negedge clock);
			w = 1'b1;
			@(negedge clock);
			w = 1'b1;
			@(negedge clock);
			w = 1'b1;
			@(negedge clock);
			w = 1'b1;
			#100 w=1'b0;
			#40 w=1'b1;
			@(negedge clock);
			$stop;
			
	end
	always
			#10 clock = ~clock;
endmodule
