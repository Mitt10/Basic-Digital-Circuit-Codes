`timescale 1ns / 1ps

module binarytogray #(parameter WIDTH=4)(
	input[WIDTH-1:0] binary,
	output[WIDTH-1:0] gray 
);

genvar i;
generate
	for (i=0; i<WIDTH-1; i=i+1) begin
		assign gray [i] = binary[i] + binary[i+1];
    end
endgenerate

assign gray[WIDTH-1] = binary[WIDTH-1];
endmodule


//Aleternative and compact approach
//module binarytogray #(parameter WIDTH=4)(
//	input[WIDTH-1:0] binary,
//	output[WIDTH-1:0] gray 
//);
//assign gray = binary ^ (binary >>1);
//endmodule