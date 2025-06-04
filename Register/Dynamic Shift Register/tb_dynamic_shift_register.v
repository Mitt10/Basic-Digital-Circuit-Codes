`timescale 1ns / 1ps

module tb_dynamic_shift_register();
// Testbench signals
    reg clk_tb;
    reg rst_tb;
    reg clken_tb;
    reg SI_tb;
    reg [2:0] SEL_tb;
    wire DO_tb;

    // Instantiate the DUT (Device Under Test)
    dynamic_shift_register dut (
        .clk(clk_tb),
        .clken(clken_tb),
        .rst(rst_tb),
        .SI(SI_tb),
        .SEL(SEL_tb),
        .DO(DO_tb)
    );

    // Clock generation: 10 ns period
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    // Stimulus
    initial begin
        // Initial state
        rst_tb = 1;
        clken_tb = 0;
        SI_tb = 0;
        SEL_tb = 3'd2;  // Start by observing bit position 2
        #12;

        // Release reset and enable shifting
        rst_tb = 0;
        clken_tb = 1;

        // Apply serial bits: 1 0 1 1 0 0 1 0
        SI_tb = 1; #10;
        SI_tb = 0; #10;
        SI_tb = 1; #10;
        SI_tb = 1; #10;
        SI_tb = 0; #10;
        SI_tb = 0; #10;
        SI_tb = 1; #10;
        SI_tb = 0; #10;

        // Change SEL to observe other tap positions
        SEL_tb = 3'd0; #10;  // LSB
        SEL_tb = 3'd7; #10;  // MSB
        SEL_tb = 3'd4; #10;  // Middle

        // Stop simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | SI=%b | SEL=%0d | DO (data[SEL])=%b | Data=%b",
                 $time, SI_tb, SEL_tb, DO_tb, dut.data);
    end

initial begin
$dumpvars (0, tb_dynamic_shift_register);
$dumpfile ("dynamic_shift_register.vcd");
end

endmodule
