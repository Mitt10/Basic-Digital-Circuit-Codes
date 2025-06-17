`timescale 1ns / 1ps


module demux_1x4(
  input [1:0] sel,
  input  i,
  output reg y0, y1, y2, y3
);

  always @(*) begin
  {y0, y1, y2, y3} = 4'b0000; // reset

  casez(sel)
    2'b00: {y0, y1, y2, y3} = {i, 3'b000};
    2'b01: {y0, y1, y2, y3} = {1'b0, i, 2'b00};
    2'b10: {y0, y1, y2, y3} = {2'b00, i, 1'b0};
    2'b11: {y0, y1, y2, y3} = {3'b000, i};
    default: begin
      `ifndef SYNTHESIS
        $display("Invalid sel input: %b", sel);
      `endif
    end
  endcase
end
endmodule