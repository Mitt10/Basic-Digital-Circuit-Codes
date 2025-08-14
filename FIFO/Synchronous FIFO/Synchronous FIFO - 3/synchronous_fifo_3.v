// Method 3
// The synchronous FIFO can also be implemented using a common counter that can be incremented or decremented based on write to the FIFO or read from the FIFO respectively.

// Empty condition
// count == 0 i.e. FIFO contains nothing.

// Full condition
// count == FIFO_DEPTH i.e. counter value has reached till the depth of FIFO

`timescale 1ns/1ps

module synchronous_fifo_3 #(
    parameter DEPTH = 8,
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
) (
    input clk,rst,
    input w_en,r_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,empty
);

reg [ADDR_WIDTH-1:0] w_ptr,r_ptr ;
reg [ADDR_WIDTH-1:0] count ;
reg [DATA_WIDTH-1:0] fifo[DEPTH:0];

//Set default values on reset
always @(posedge clk) begin
    if(!rst) begin
        w_ptr <= 0;
        r_ptr <= 0;
        count <= 0;
        data_out <= 0;
    end
    else begin
        case ({w_en,r_en})
            2'b00, 2'b11: count <= count;
            2'b01: count <= count - 1;
            2'b10: count <= count + 1;
        endcase
    end    
end

//To write data into FIFO
always @(posedge clk) begin
    if(w_en & !full) begin
        fifo[w_ptr] <= data_in;
        w_ptr <= w_ptr + 1;
    end
end

//To read data from FIFO
always @(posedge clk) begin
    if(r_en & !empty) begin
        data_out <= fifo[r_ptr];
        r_ptr <= r_ptr + 1;
    end
end

assign full = (count == DEPTH);
assign empty = (count ==0); 

    
endmodule