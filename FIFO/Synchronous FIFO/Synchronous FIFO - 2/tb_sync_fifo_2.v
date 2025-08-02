module tb_sync_fifo_2 ();
    parameter DATA_WIDTH=8;
    parameter DEPTH = 8;
    
    reg clk,rst;
    reg w_en,r_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full,empty;

    reg [7:0] rand_data;
    reg [31:0] delay_val;

     synchronous_fifo_2 UUT (
    .clk(clk),
    .rst(rst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  always #2 clk=~clk;

  initial begin
    clk=1;rst=0;
    w_en=0; r_en=0;
    data_in=0;
    rand_data=0;
    delay_val=0;
    #3 rst=1;
    delay_val=20;
    drive();
    delay_val=40;
    drive();
    $finish;
  end

  task push;
    begin
        if (!full) begin
            rand_data = $random % 256;
            data_in = rand_data;
            w_en = 1;
            #1;
            $display("Push In: w_en=%b, r_en=%b, data_in=%h", w_en,r_en,data_in);
        end else begin
            $display("FIFO Full!! Cannot push data_in=%h",data_in);
        end
    end
    
  endtask

  task pop;
    begin
        if (!empty) begin
            r_en= 1;
            #1;
            $display ("Pop Out: w_en=%b, r_en=%b, data_out=%h", w_en,r_en,data_out);
        end else begin
            $display("FIFO Empty!! Cannot pop data");
        end
    end
  endtask

  task drive;
    integer i;
    reg[31:0] local_delay;
    begin
        local_delay = delay_val;
        w_en=0;
        r_en=0;
        fork
            begin
                for(i=0; i<10; i=i+1) begin
                    @(posedge clk);
                    push;
                end
                w_en = 0;
            end
            begin
                #(local_delay);
                for ( i=0; i<10;i=i+1) begin
                    @(posedge clk);
                    pop;
                end
                r_en=0;
            end
        join
    end
  endtask
  
   // Dump waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sync_fifo_2);
  end
  
endmodule