`timescale 1ns/1ps

module tb_sync_fifo_1();
  parameter DATA_WIDTH = 8;    // Width of data in FIFO
  parameter DEPTH = 16;        // Depth of FIFO (number of entries)

  // Testbench signals
  reg clk, rst;                // Clock and reset
  reg w_en, r_en;              // Write enable and read enable
  reg [DATA_WIDTH-1:0] data_in; // Input data to FIFO
  wire [DATA_WIDTH-1:0] data_out; // Output data from FIFO
  wire full, empty;            // Status flags from FIFO

  // Scoreboard memory (stores expected data for comparison)
  reg [DATA_WIDTH-1:0] exp_mem [0:DEPTH-1];
  integer w_ptr, r_ptr, exp_count; // write pointer, read pointer, and count

  // Instantiate the FIFO module under test
  synchronous_fifo_1 UUT (
    .clk(clk),
    .rst(rst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Generate clock: toggles every 5 ns (period = 10 ns)
  always #5 clk = ~clk;
  integer k;
  // ------------------------------------------------------------
  // INITIAL RESET BLOCK
  // ------------------------------------------------------------
  initial begin
   
    clk = 1'b1;
    rst = 0;      // keep FIFO in reset initially
    w_en = 0;
    r_en = 0;
    data_in = 0;
    w_ptr = 0;
    r_ptr = 0;
    exp_count = 0;
    for (k = 0; k < DEPTH; k = k + 1) begin
        exp_mem[k] = 0;
    end

    // Hold reset for 10 clock cycles
    repeat(10) @(posedge clk);
    rst = 1;      // release reset, FIFO is now active
  end

  // ------------------------------------------------------------
  // WRITE PROCESS
  // Repeatedly write data into FIFO on every alternate clock
  // ------------------------------------------------------------
  initial begin : WRITE_PROCESS
    integer i;
    // Wait until reset is released
    wait(rst == 1);

    // Perform two bursts of 30 write attempts each
    repeat(2) begin
      for (i = 0; i < 5; i = i + 1) begin
        @(posedge clk);                    // synchronize to clock
        w_en = (i % 2 == 0) ? 1 : 0;       // enable write every other cycle
        if (w_en && !full) begin           // only write if FIFO not full
          data_in = $random;               // generate random data
          exp_mem[w_ptr] = data_in;        // store data in expected-memory array
          w_ptr = (w_ptr + 1) % DEPTH;     // increment write pointer with wraparound
          exp_count = exp_count + 1;       // increment expected count
        end
      end
      #50;                                 // wait some time between bursts
    end
    w_en = 0;                              // stop writing after bursts
  end

  // ------------------------------------------------------------
  // READ PROCESS
  // Repeatedly read data from FIFO and compare with expected
  // ------------------------------------------------------------
  initial begin : READ_PROCESS
    integer j;
    reg [DATA_WIDTH-1:0] expected;
    // Wait until reset is released
    wait(rst == 1);

    // Perform two bursts of 30 read attempts each
    repeat(2) begin
      for (j = 0; j < 5; j = j + 1) begin
        @(posedge clk);                    // synchronize to clock
        r_en = (j % 2 == 0) ? 1 : 0;       // enable read every other cycle
        if (r_en && !empty) begin          // only read if FIFO not empty
          #1;                              // small delay to let data_out settle
          expected = exp_mem[r_ptr];       // get expected data from scoreboard
          r_ptr = (r_ptr + 1) % DEPTH;     // increment read pointer with wraparound
          exp_count = exp_count - 1;       // decrement expected count
          // Compare actual FIFO output with expected data
          if (data_out != expected)
            $display("**ERROR** Time=%0t Expected=%h Got=%h", $time, expected, data_out);
          else
            $display("PASS Time=%0t, Expected=%h, Data=%h", $time, expected, data_out);
        end
      end
      #50;                                 // wait some time between bursts
    end
    r_en = 0;                              // stop reading after bursts
    $finish;                               // end simulation
  end

  // ------------------------------------------------------------
  // DUMP WAVEFORMS
  // ------------------------------------------------------------
  initial begin
    $dumpfile("fifo_tb.vcd");              // dump file name
    $dumpvars(0, tb_sync_fifo_1);          // dump all signals in this module
  end

endmodule