`timescale 1ns/1ps

module tb_sync_fifo_2 ();
    parameter DATA_WIDTH=8;
    parameter DEPTH = 16;
    parameter ADDR_WIDTH = 4;  // log2(DEPTH) calculated manually
    
    reg clk,rst;
    reg w_en,r_en;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;
    wire full,empty;

    reg [31:0] delay_val;

    synchronous_fifo_2  #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH)
    ) UUT (
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
            data_in= $random % 256; 
            w_en = 1;
            #1;
            $display("Push In: w_en=%b, r_en=%b, data_in=%h, at time=%t", w_en,r_en,data_in, $time);
        end else begin
            $display("FIFO Full!! Cannot push data_in=%h, at time=%t",data_in, $time);
        end
    end
    
  endtask

  task pop;
    begin
        if (!empty) begin
            r_en= 1;
            #1;
            $display ("Pop Out: w_en=%b, r_en=%b, data_out=%h at time=%t", w_en,r_en,data_out,$time);
        end else begin
            $display("FIFO Empty!! Cannot pop data at time=%t",$time);
        end
    end
  endtask

  task drive;
    integer i;
    begin
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
                #(delay_val);
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