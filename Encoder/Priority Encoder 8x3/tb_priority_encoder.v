module tb_pri_encoder();
    reg[7:0] in_tb;
    reg valid_tb;
    wire[2:0] out_tb;

    pri_encoder UUT (.in(in_tb), .valid(valid_tb), .out(out_tb));

    initial begin
        $monitor("in=%b, valid=%b  --> out=%b", in_tb,valid_tb,out_tb);
        valid=0;in_tb=8'h66;
        #1 valid=1;in_tb = 8'h43;
        #5 in_tb=8'h115;
        #5 in_tb=8'h175;
        #5 in_tb=8'h205;
        #5 in_tb=8'h256;
        #5 in_tb=8'h0;
        #5 $finish();
    end

endmodule