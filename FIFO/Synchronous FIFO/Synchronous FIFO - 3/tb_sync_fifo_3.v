module tb_sync_fifo_3 ();
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 8;
    parameter ADDR_WIDTH = 3;

    reg clk,rst;
    reg w_en,r_en;
    reg [DATA_WIDTH-1:0] data_in;
    reg [DATA_WIDTH-1:0] data_out;
    wire full,empty ;
    
    //Expected memory for checking correctness
    reg [DATA_WIDTH-1:0] exp_mem [0:DEPTH-1];
    integer w_ptr, r_ptr;
    integer i;

    synchronous_fifo_3 UUT #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    )
    (
        .clk(clk),
        .rst(rst),
        .w_en(w_en),
        .r_en(r_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
  );

    always #5 clk = ~clk;

    initial begin
        clk=1;
        rst = 0;
        w_en =0;
        r_en =0;
        data_in = 0;
        w_ptr = 0;
        r_ptr = 0;

        #50 rst = 1;

        //Write phase
        for (int i=0;i<60;i=i+1) begin
            @(posedge clk);
            if(i%2==0) begin
                w_en = 1;
                if(!full) begin
                    data_in = $random;
                    exp_mem[w_ptr] = data_in;
                    w_ptr = w_ptr + 1;
                end
            end else begin
                w_en = 0;
            end
        end

        w_en=0;
        #50;

        //Read Phase
        for (int i=0; i<60; i=i+1) begin
            @(posedge clk);
            if (i%2==0) begin
                r_en = 1;
                if (!empty) begin
                    #1;
                    if (data_out != exp_mem[r_ptr]) begin
                        $display("Time = %0t: Mismatch! Expected = %h, Got=%h", $time, exp_mem[r_ptr], data_out);
                    end else begin
                        $display("Time = %0t: Match! Expected = %h,  Got=%h", $time, exp_mem[r_ptr], data_out);
                    end
                    r_ptr = r_ptr + 1;
                end                
            end else begin
                r_en = 0;
            end
        end
    r_en = 0;
    #20 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_sync_fifo_3);
    end
    

endmodule