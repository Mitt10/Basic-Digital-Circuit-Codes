`timescale 1ns/1ps

module par_array_mult #(parameter N=4)(
    input [N-1:0] a,b,
    output [2*N-1:0] z
);

wire [2*N-1:0] partial [N-1:0] ;
wire [2*N-1:0] sum [N-1:0];

genvar i;
generate
    for (i=0;i<N;i=i+1)
    begin
        assign partial[i] = (a & {N{b[i]}}) << i;
    end
endgenerate

assign sum[0] = partial[0] + partial[1];

generate
    for(i=2;i<N;i=i+1)
    begin
       assign sum[i-1] = sum[i-2] + partial[i]; 
    end
endgenerate
    
assign z= sum[N-2];

endmodule
