module pri_encoder(
    input[7:0] in,
    input valid,
    output [2:0] out
);

reg [2:0] out;
assign valid = |in;
always @(in) 
begin
    casex(in)
        8'b1xxxxxxx: out=7;
        8'b01xxxxxx: out=6;
        8'b001xxxxx: out=5;
        8'b0001xxxx: out=4;
        8'b00001xxx: out=3;
        8'b000001xx: out=2;
        8'b0000001x: out=1;
        default: out=0
    endcase    
end

endmodule
