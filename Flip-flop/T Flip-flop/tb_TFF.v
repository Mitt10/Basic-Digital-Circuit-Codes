`timescale 1ns / 1ps

module tb_TFF();
   reg clk, rst;
  reg t;
  wire q, q_bar;
  
  TFF UUT(t,clk, rst, q, q_bar);
  
  always #5 clk = ~clk;
  initial begin
    clk = 1; rst= 0;t=0;
    $display("Reset=%b --> q=%b, q_bar=%b", rst, q, q_bar);
    #3 rst=1;
    $display("Reset=%b --> q=%b, q_bar=%b", rst, q, q_bar);
    
    drive(0); // Same as previous output
    drive(1); // Toggles previous output
    drive(1); // Toggles previous output
    drive(1); // Toggles previous output
    drive(0); // Same as previous output
    #5;
    $finish;
  end
  
 
  task drive;
	input [1:0] bit;
	begin
		@(posedge clk)
		t = bit;
        #1 $display("t=%b --> q=%b, q_bar=%b",t, q, q_bar);
	end
	endtask
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
