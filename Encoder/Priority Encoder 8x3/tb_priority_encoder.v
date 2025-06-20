module tb_pri_encoder();
    reg[7:0] in_tb;
    wire valid_tb;
    wire[2:0] out_tb;

    pri_encoder UUT (.in(in_tb), .valid(valid_tb), .out(out_tb));

    initial begin
        $monitor("in=%b, valid=%b  --> out=%b", in_tb,valid_tb,out_tb);
        in_tb=8'b10000001;
        #5 in_tb=8'b01010100;
        #5 in_tb=8'b00101001;
        #5 in_tb=8'b00010111;
        #5 in_tb=8'b00001001;
        #5 in_tb=8'b00000101;
        #5 in_tb=8'b00000010;
        #5 in_tb=8'b00000001;
        #5 in_tb=8'b00000000;
        #5 $finish();
    end

endmodule