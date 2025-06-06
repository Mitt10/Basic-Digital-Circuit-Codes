// Unsigned multiplication with pipeline stages using generate block
module unsigned_mult_generate #(
    parameter WIDTHA = 16,
    parameter WIDTHB = 24,
    parameter PIPELINE = 4
)(
    input clk,
    input rst,
    input [WIDTHA-1:0] A,
    input [WIDTHB-1:0] B,
    output [WIDTHA + WIDTHB - 1:0] result
);

    reg [WIDTHA-1:0] rA;
    reg [WIDTHB-1:0] rB;
    reg [WIDTHA + WIDTHB - 1:0] M [0:PIPELINE - 1];
    
    integer i;

    // Input registration and first pipeline stage (multiply)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rA <= 0;
            rB <= 0;
            for (i = 0; i < PIPELINE; i = i + 1)
                M[i] <= 0;
        end else begin
            rA <= A;
            rB <= B;
            M[0] <= rA * rB;
        end
    end

    // Generate remaining pipeline stages
    genvar j;
    generate
        for (j = 1; j < PIPELINE; j = j + 1) begin : pipeline_stages
            always @(posedge clk or posedge rst) begin
                if (rst)
                    M[j] <= 0;
                else
                    M[j] <= M[j-1];
            end
        end
    endgenerate

    assign result = M[PIPELINE - 1];

endmodule