module FSM(clk, reset, w, out_me, out_mo, me_reg, mo_reg);

	input clk,reset;
	input w;
	output reg out_me;
	output reg out_mo;
	output reg [2:0] me_reg;
	output reg [2:0] mo_reg;
	reg out_mo_reg;
	
	localparam [2:0]
		me_0 = 3'b000,
		me_1 = 3'b001,
		me_2 = 3'b010,
		me_3 = 3'b011,
		me_4 = 3'b100,
		me_5 = 3'b101,
		me_6 = 3'b110,
		me_7 = 3'b111;
		
	localparam [2:0]
		mo_0 = 3'b000,
		mo_1 = 3'b001,
		mo_2 = 3'b010,
		mo_3 = 3'b011,
		mo_4 = 3'b100,
		mo_5 = 3'b101,
		mo_6 = 3'b110,
		mo_7 = 3'b111;
		
	reg [2:0] me_next;//, me_reg;
	reg [2:0] mo_next;
	
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			begin
				me_reg <= me_0;
				mo_reg <= mo_0;
			end
		else
			begin
				me_reg <= me_next;
				mo_reg <= mo_next;
				out_mo <= out_mo_reg;
			end
	end

	always @(me_reg, w)	
	begin
		if(w && me_reg==me_4)
			begin
				out_me = 1'b1;
			end
		else
			begin
				out_me = 1'b0;
			end
	end

	//mealy
	always @(me_reg, w)
	begin
		me_next = me_reg;
		//out_me = 1'b0;
		case(me_reg)
			me_0:
				if(w)
					begin
						me_next = me_1;
						//out_me = 1'b0;
					end
			me_1:
				if(w)
					begin
						me_next = me_2;
						//out_me = 1'b0;
					end
			me_2:
				if(w)
					begin
						me_next = me_3;
						//out_me = 1'b0;
					end			
			me_3:
				if(w)
					begin
						me_next = me_4;
						//out_me = 1'b0;
					end
			me_4:
				if(w)
					begin
						me_next = me_0;
						//out_me = 1'b1;
					end
			me_5:
				if(w)
					begin
						me_next = me_0;
						//out_me = 1'b0;
					end
			me_6:
				if(w)
					begin
						me_next = me_0;
						//out_me = 1'b0;
					end
			me_7:
				if(w)
					begin
						me_next = me_0;
						//out_me = 1'b0;
					end
			default: 
				if(w)
					begin
						me_next = me_0;
						//out_me = 1'b0;
					end
		endcase
		
	end
	
	
	always @(mo_reg, w)
	begin
		mo_next = mo_reg;
		//out_mo_reg = 1'b0;
		case(mo_reg)
			mo_0:
            begin
                out_mo_reg = 1'b0; 
                if(w) // if level is 1, 
                    mo_next = mo_1; // go to state one,
            end
			mo_1:
            begin
                out_mo_reg = 1'b0; 
                if(w) // if level is 1, 
                    mo_next = mo_2; // go to state one,
            end
			mo_2:
            begin
                out_mo_reg = 1'b0; 
                if(w) // if level is 1, 
                    mo_next = mo_3; // go to state one,
            end	
			mo_3:
            begin
                out_mo_reg = 1'b0; 
                if(w) // if level is 1, 
                    mo_next = mo_4; // go to state one,
            end
			mo_4:
            begin
                out_mo_reg = 1'b1; 
                if(w) // if level is 1, 
                    mo_next = mo_0; // go to state one,
            end
			default:
				begin
					out_mo_reg = 1'b0;
					if(w)
						begin	
							mo_next = mo_0;
						end
				end
		endcase
	end
	

endmodule
