`timescale 1ns / 1ps

module DFF_Async1(
    input clk,rst,d,
    output reg q
    );


always @(posedge clk or posedge rst)
begin
    if (rst)
        q<=0;
    else
        q<=d;
end

endmodule

module DFF_Async2(
    input clk,rst,d,
    output reg q
    );


always @(posedge clk or negedge rst)
begin
    if (!rst)
        q<=0;
    else
        q<=d;
end

endmodule
