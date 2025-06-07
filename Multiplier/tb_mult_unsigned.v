
`timescale 1ns / 1ps

module tb_unsigned_mult_generate;

    // === Parameters ===
    parameter WIDTHA = 4;
    parameter WIDTHB = 8;
    parameter PIPELINE = 3;

    // === DUT I/O ===
    reg clk, rst;
    reg [WIDTHA-1:0] A;
    reg [WIDTHB-1:0] B;
    wire [WIDTHA + WIDTHB - 1:0] result;

    // === DUT Instance ===
    mult_unsigned #(
        .WIDTHA(WIDTHA),
        .WIDTHB(WIDTHB),
        .PIPELINE(PIPELINE)
    ) UUT (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .result(result)
    );

    // === Clock Generation ===
    initial clk = 0;
    always #5 clk = ~clk;

  // === Assignment Task with Inlined Width Checks ===
    task assign_checked_input;
        input integer valA, valB;
        begin
            if (valA >= (1 << WIDTHA)) begin
                $display("ERROR: Value %0d does not fit in WIDTHA = %0d bits!", valA, WIDTHA);
                $finish;
            end
            if (valB >= (1 << WIDTHB)) begin
                $display("ERROR: Value %0d does not fit in WIDTHB = %0d bits!", valB, WIDTHB);
                $finish;
            end
            A = valA;
            B = valB;
        end
    endtask

    initial begin
        rst = 1;
        A = 0;
        B = 0;
        #12 rst = 0;

        assign_checked_input(10, 50);  //Safe
        #10;

        assign_checked_input(7, 200);  // Safe
        #10;

        assign_checked_input(15, 255); //Safe
        #10;

        // Uncomment to test overflow case
        // assign_checked_input(20, 256);  //Should fail if WIDTHA=4 or WIDTHB=8

        #100;
        $finish;
    end

    initial begin
        $dumpfile("tb_unsigned_mult_generate.vcd");
        $dumpvars(0, tb_unsigned_mult_generate);
    end

endmodule
