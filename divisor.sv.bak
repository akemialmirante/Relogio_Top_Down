module divisor(
	input rst, clk_in, 
	output logic clk_out
);
	
logic [25:0] count;
	
always_ff @(posedge clk_in or negedge rst) begin
	if (!rst) begin
		count <= 26'd0;
	end else begin
		if (count == 26'd49999999) begin 
			count <= 26'd0;
	  	end else begin
			count <= count + 26'd1; 
	end
end

assign clk_out = (count == 26'd49999999);

endmodule

