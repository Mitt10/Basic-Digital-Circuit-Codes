module comp(
    input [3:0] A,B,
    output reg A_lez_B, A_grt_B,A_eql_B
);

always @(*)
begin
    A_lez_B=0;
    A_grt_B=0;
    A_eql_B=0;
    if (A>B)
        A_grt_B=1;
    else if (A<B)
        A_lez_B=1;
    else
        A_eql_B=1;
end
endmodule

