`timescale 1ns / 1ps

module tb_SR_FF();
	reg clk,rst,S,R;
	wire Q,Q_bar;
	
	SR_FF UUT (clk,rst,S,R,Q,Q_bar);
	
	initial clk=1;
	always #5 clk = ~clk;
	
	task drive;
        input [1:0] ip;
        begin
            @(posedge clk);
            {S, R} = ip;
            #1 $display("s=%b, r=%b --> q=%b, q_bar=%b", S, R, Q, Q_bar);
        end
    endtask
	
	initial begin
		rst=0;
		S=0;R=0;
		$display("Reset=%b --> q=%b, q_bar=%b", rst, Q, Q_bar);
		#5 rst = 1;
		$display("Reset=%b --> q=%b, q_bar=%b", rst, Q, Q_bar);
		
		drive (2'b00);
		#5 drive (2'b01);
		#5 drive (2'b10);
		#5 drive (2'b11);
		#10 $finish;
		end
		
	initial begin
		$dumpvars (0);
		$dumpfile("SR FF.vcd");
	end
endmodule
