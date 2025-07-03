`timescale 1ns / 1ps

module tb_universal_shift_reg();

    reg clk,rst;
    reg [1:0] select;
    reg [3:0] p_din;
    reg s_left_din;
    reg s_right_din;
    wire [3:0] p_dout;
    wire s_left_dout;
    wire s_right_dout;
    
    universal_shift_reg UUT(clk,rst,select,p_din,s_left_din,s_right_din,p_dout,s_left_dout,s_right_dout);
    
    initial clk=1;
    always #5 clk=~clk;
    
    initial begin
        rst=0;select=0;p_din=0;s_left_din=0;
        s_right_din=0;
        #5 rst=1;
        select=2'b11;
        p_din=4'hB;
        #10 select = 2'b01;
        s_right_din=1'b1;
        #10 s_right_din=1'b0;
        #10 s_right_din=1'b1;
        #10 s_right_din=1'b0;
        #10 select=2'b10;
        #10 s_left_din=1'b1;
        #10 s_left_din=1'b0;
        #10 s_left_din=1'b1;
        #10 s_left_din=1'b0;
        #10 $finish;
    end
    
    initial begin
        $dumpvars (0,tb_universal_shift_reg);
        $dumpfile ("universal shift reg.vcd");
    end

endmodule
