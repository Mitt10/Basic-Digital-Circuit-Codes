`timescale 1ns / 1ps


module decoder_3x8 #(parameter WIDTH = 3)(
    input  [WIDTH-1:0] i,
    output reg [(1 << WIDTH) - 1:0] o
);

    integer j;

    always @(*) begin
        o = 0;  // Default: all zeros
        for (j = 0; j < (1 << WIDTH); j = j + 1) begin
            if (j == i)
                o[j] = 1'b1;
        end
    end

endmodule