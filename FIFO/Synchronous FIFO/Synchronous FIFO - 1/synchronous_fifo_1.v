`timescale 1ns / 1ps


module synchronous_fifo_1 #(
    parameter DEPTH = 8,
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3   // log2(DEPTH) manually provided
)(
    input clk,
    input rst,                 // active low reset
    input w_en,
    input r_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,
    output empty
);

reg [ADDR_WIDTH-1:0] w_ptr, r_ptr;
reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];

// Synchronous reset
always @(posedge clk) begin
    if (!rst) begin
        w_ptr  <= 0;
        r_ptr  <= 0;
        data_out <= 0;
    end
end

// Write
always @(posedge clk) begin
    if (w_en && !full) begin
        fifo[w_ptr] <= data_in;
        w_ptr <= w_ptr + 1'b1;
    end
end

// Read
always @(posedge clk) begin
    if (r_en && !empty) begin
        data_out <= fifo[r_ptr];
        r_ptr <= r_ptr + 1'b1;
    end
end

assign full  = ((w_ptr + 1'b1) == r_ptr);
assign empty = (w_ptr == r_ptr);

endmodule