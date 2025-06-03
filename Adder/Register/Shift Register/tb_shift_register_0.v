`timescale 1ns / 1ps

module tb_shift_register_0();
  reg clk_tb, clken_tb, rst_tb, SI_tb;
  wire SO_tb;

  shift_register_0 UUT(.clk (clk_tb), .clken (clken_tb), .SI(SI_tb), .SO(SO_tb), .rst(rst_tb));

  initial clk_tb=0;
  always #5 clk_tb = ~clk_tb;

  initial begin
    //Initialize values
    rst_tb=1;
    clken_tb=0;
    SI_tb=0;
    //release reset
    #15 rst_tb=0;
    clken_tb=1;
    
    #10 SI_tb=1;
    #10 SI_tb=0;
    #10 SI_tb=1;
    #10 SI_tb=1;
    #10 SI_tb=0;
    #10 SI_tb=1;
    #10 SI_tb=0;
    //Trigger another reset
    #80 rst_tb=1;
    clken_tb=0;
    #10 rst_tb=0;
    
    #10 $finish;
  end

  initial begin
    $dumpvars(0);
    $dumpfile ("shift register.v");
  end

endmodule
