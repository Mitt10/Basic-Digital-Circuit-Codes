module tb_array_multiplier();
    reg [1:0] a,b;
    wire [3:0] z;

    array_multiplier UUT (a,b,z);

    initial begin
        $monitor("A=%b, B=%b  --> Z=%b", a,b,z);
        a=1;b=2;
        #5 a=3;b=2;
        #5 a=3;b=1;
    end
endmodule