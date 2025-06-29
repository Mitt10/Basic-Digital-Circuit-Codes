`timescale 1ns / 1ps

module tb_DFF_Sync();
    reg clk,rst,d;
    wire q;
    
    DFF_Sync1 UUT(.clk(clk), .rst(rst), .d(d), .q(q));
    
    initial clk=1;
    always #5 clk=~clk;
    
    initial begin
    rst =1;
     d = 0;
    
    #5 rst = 0;
    
    repeat(6) begin
      d = $urandom_range(0, 1);
      #10;
    end
    rst = 1; #5;
    rst = 0;
    repeat(6) begin
      d = $urandom_range(0, 1);
      #10;
    end
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule