module tb_comp();
    reg [3:0] A,B;
    wire A_lez_B, A_grt_B,A_eql_B;

    comp UUT(A,B,A_lez_B,A_grt_B,A_eql_B);

    initial begin
        $monitor("A=%b, B=%b  --> A_lez_B=%b,A_grt_B=%b,A_eql_B=%b", A,B,A_lez_B,A_grt_B,A_eql_B);
        repeat(5) begin
            A=$random;
            B=$random;
            #5;
        end
        #5 $finish();
    end

    initial begin
        $dumpvars(0);
        $dumpfile("comparator.vcd");
    end
endmodule
