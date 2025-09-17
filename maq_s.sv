module maq_s(
	input logic clk,
	input logic rst,
	output logic [3:0] bcd_s_lsd,	//unidade
	output logic [2:0] bcd_s_msd,	//dezena
	output logic incrementa_minuto	//flag
);

always_ff @(posedge clk, negedge rst) begin
	if (!rst) begin
		bcd_s_lsd <= 4'd0;
		bcd_s_msd <= 3'd0;
	end else begin	
		if (bcd_s_lsd == 9) begin
			bcd_s_lsd <= 0;
			if(bcd_s_msd == 5) begin
				bcd_s_msd <= 0;
			end else begin
				bcd_s_msd <= bcd_s_msd + 1;
			end
		end else begin
			bcd_s_lsd <= bcd_s_lsd + 1;
		end
	end
end

assign incrementa_minuto = (bcd_s_lsd == 9 && bcd_s_msd == 5);

endmodule
