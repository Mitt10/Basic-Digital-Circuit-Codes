`timescale 1ns / 1ps

module DFF_Sync1(
    input clk,rst,d,
    output reg q
    );
    
    always @(posedge clk)
    begin
        if (rst)
            q<=0;
        else
            q<=d;
    end
endmodule

module DFF_Sync2(
    input clk,rst,d,
    output reg q
    );
    
    always @(posedge clk)
    begin
        if (!rst)
            q<=0;
        else
            q<=d;
    end
endmodule
