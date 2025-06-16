`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2025 06:13:03 PM
// Design Name: 
// Module Name: 2x1_multiplexer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_2x1(
    input sel,i0,i1,
    output y
    );
    
assign y = sel ? i1:i0;
//using if statement
//reg y;
//always @ (sel or i0 or i1)
    //begin:
      //  if (sel == 1'b0)
        //    y = i0
      //  else
        //    y = i1
    //end
            
//using case statement
//reg y;
    //always @(sel or i0 or i1)
        //begin:
          //  case (sel)
            //    1'b0: y=i0;
              //  1'b1: y=i1;
            //endcase
       // end
        

endmodule
