module tb_array_multiplier();
    reg [3:0] a,b;
    wire [7:0] z;

    array_multiplier UUT (a,b,z);

    initial begin
        $monitor("A=%b, B=%b  --> Z=%b", a,b,z);
        a=5;b=6;
        #5 a=3;b=2;
        #5 a=3;b=4;
        #5 $finish();
    end
    initial begin
        $dumpvars(0);
        $dumpfile("multiplier.vcd");
        end
endmodule