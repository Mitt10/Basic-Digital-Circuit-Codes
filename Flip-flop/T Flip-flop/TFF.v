`timescale 1ns/1ps

module TFF(
    input t,clk,rst,
    output reg q,
    output q_bar
);

assign q_bar = ~q;
always @(posedge clk)
begin
    if (!rst)
        q<=0;
    else begin
        q <= (t?~q:q);
    end
end

endmodule
