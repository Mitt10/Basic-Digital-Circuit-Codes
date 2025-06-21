module tb_decoder_3x8();
	reg [2:0] i;
	wire [7:0] o;
	
	decoder_3x8 UUT (i,o);
	
	initial begin
		$monitor("i=%b --> o=%b",i,o);
		i=3'b000;
		#5 i=3'b001;
		#5 i=3'b010;
		#5 i=3'b011;
		#5 i=3'b100;
		#5 i=3'b101;
		#5 i=3'b110;
		#5 i=3'b111;
		#5 i=4'b1xx1;
		#5 $finish();
	end
	
	initial begin
		$dumpfile("decoder.vcd");
		$dumpvars(0);
	end
	
endmodule