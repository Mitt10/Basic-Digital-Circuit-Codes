
module clock_divider #(parameter N=4) (

	input wire clk_in,
  	input wire rst_in,
  	output wire clk_out
);
  generate
    if (N < 1) begin
      initial $fatal (1, "N must be equal >= 1");
      assign clk_out = 1'b0;
    end 
    else if (N==1) begin
    	assign clk_out = clk_in;
    end
    else if (N%2 == 0) begin
    	localparam HALF = N/2;
      localparam W = (HALF > 1) ? $clog2(HALF) : 1;
      
      reg [W-1:0] count;
      reg clk_div;
      
      always_ff@(posedge clk_in or negedge rst_in) begin
        if (!rst_in) begin
        	count <= HALF - 1;
          	clk_div <= 0;
        end else if (count == HALF -1) begin
          	count <= 0;
            clk_div <= ~clk_div;
          end else begin
          	count <= count + 1;
          end
      end
    assign clk_out = clk_div;
    end
    
    //Odd Division factor
    else begin
      localparam W = $clog2(N);
      
      reg[W-1:0] count;
      reg clk_pos;
      reg clk_neg;
      
      always_ff@(posedge clk_in or negedge rst_in) begin
        if (!rst_in) begin
        	count <= 0;
          	clk_pos <= 0;
        end else begin
          if (count == N-1)
            count <=0;
          else
            count <= count + 1;
          
        clk_pos <= (count < (N/2));
          end
    end
       // Delay clk_pos by half an input-clock period
      always_ff@(negedge clk_in or negedge rst_in) begin
        if (!rst_in) begin
        	clk_neg <= 0;
        end else begin
        	clk_neg <= clk_pos;
        end
        
        assign clk_out = clk_pos | clk_neg;
      end
  endgenerate
  
endmodule
