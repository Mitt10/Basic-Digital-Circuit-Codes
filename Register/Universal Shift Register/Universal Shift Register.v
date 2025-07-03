`timescale 1ns / 1ps

module universal_shift_reg(
    input clk,rst,
    input[1:0] select,
    input [3:0] p_din,
    input s_left_din,
    input s_right_din,
    output reg [3:0] p_dout,
    output s_left_dout,
    output s_right_dout
    );
    
always @(posedge clk)
begin
    if (!rst)
        p_dout <=0;
    else
    begin
        case(select)
            2'b01: p_dout <= {s_right_din, p_dout[3:1]};
            2'b10: p_dout <= {p_dout[2:0], s_left_din};
            2'b11: p_dout <= p_din;
            default: p_dout <= p_dout;
        endcase
    end
end

assign s_left_dout = p_dout[3];
assign s_right_dout = p_dout[0];

endmodule
    