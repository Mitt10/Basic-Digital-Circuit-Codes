`timescale 1ns/1ps

module synchronous_fifo_2 #(
    parameter DEPTH=8,
    parameter DATA_WIDTH =8,
    parameter ADDR_WIDTH = 3  // log2(DEPTH) calculated manually
) (
    input clk,rst,
    input w_en,r_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,empty
);

reg [ADDR_WIDTH:0] w_ptr,r_ptr; //additional but in write & read pointers to check full & empty conditions
reg [DATA_WIDTH-1:0] fifo [DEPTH:0];
reg wrap_around;

//Set Dfault values on reset
always @(posedge clk)
begin
    if(!rst) 
    begin
        w_ptr <= 0;
        r_ptr <= 0;
        data_out <= 0;
    end
end

//To write data to FIFO
always @(posedge clk) begin
    if (w_en & !full) begin
        fifo[w_ptr[ADDR_WIDTH-1:0]] <= data_in;
        w_ptr <= w_ptr + 1;
    end
end

//To read data from FIFO
always @(posedge clk) begin
    if (r_en & !empty) begin
        data_out <= fifo[r_ptr[ADDR_WIDTH-1:0]];
        r_ptr <= r_ptr + 1;
    end
end

assign full = ({~w_ptr[3],w_ptr[2:0]} == r_ptr[3:0]);
assign empty = (w_ptr[3:0] == r_ptr[3:0]);
endmodule