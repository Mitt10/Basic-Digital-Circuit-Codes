`timescale 1ns / 1ps

module tb_universal_shift_reg();

    parameter WIDTH = 8;  // Change this value to test different widths

    reg clk, rst;
    reg [1:0] select;
    reg [WIDTH-1:0] p_din;
    reg s_left_din;
    reg s_right_din;
    wire [WIDTH-1:0] p_dout;
    wire s_left_dout;
    wire s_right_dout;

    // DUT instantiation with parameterized WIDTH
    universal_shift_reg #(.WIDTH(WIDTH)) UUT (
        .clk(clk),
        .rst(rst),
        .select(select),
        .p_din(p_din),
        .s_left_din(s_left_din),
        .s_right_din(s_right_din),
        .p_dout(p_dout),
        .s_left_dout(s_left_dout),
        .s_right_dout(s_right_dout)
    );

    // Clock generation
    initial clk = 1;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        rst = 0;
        select = 2'b00;
        p_din = {WIDTH{1'b0}};   // All zeros
        s_left_din = 0;
        s_right_din = 0;

        #5 rst = 1;

        // Parallel Load
        select = 2'b11;
        p_din = { {(WIDTH-4){1'b0}}, 4'b1011 }; // padded version of 4'hB for wider widths
        #10;

        // Shift Right
        select = 2'b01;
        s_right_din = 1;
        #10 s_right_din = 0;
        #10 s_right_din = 1;
        #10 s_right_din = 0;

        // Shift Left
        select = 2'b10;
        s_left_din = 1;
        #10 s_left_din = 0;
        #10 s_left_din = 1;
        #10 s_left_din = 0;

        #10 $finish;
    end

    // VCD Dump
    initial begin
        $dumpfile("universal_shift_reg.vcd");
        $dumpvars(0, tb_universal_shift_reg);
    end

endmodule
