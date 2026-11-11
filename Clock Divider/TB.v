module tb();
	reg clk_in;
  reg rst_in;
  wire clk_out;
  
  parameter N=5;
  
  clock_divider #(.N(N)) DUT ( .clk_in(clk_in), .rst_in(rst_in), .clk_out(clk_out));
  
  initial clk_in = 0;
  always #5 clk_in = ~clk_in;

  initial begin
  rst_in = 0;
    #2 rst_in = 1;
    
    #1000;
    $finish();
  end
  
  initial begin
  	$monitor("Time=%0t | rst_n=%b | clk_in=%b | clk_out=%b", $time, rst_in, clk_in, clk_out);
  end
  
  initial begin
    $dumpvars(0, tb);
    $dumpfile("my_vcd");
  end
endmodule