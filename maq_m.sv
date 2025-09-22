module maq_m(
	input logic clk,
	input logic rst,
	input logic incrementa_minuto,
	output logic [3:0] bcd_m_lsd,	// unidade
	output logic [2:0] bcd_m_msd,	// dezena
	output logic incrementa_hora	// flag
);

always_ff @(posedge clk or negedge rst) begin
	if (!rst) begin
		bcd_m_lsd <= 4'd0;
		bcd_m_msd <= 3'd0;
	end else begin
		if(incrementa_minuto)begin
			if (bcd_m_lsd == 9) begin
				bcd_m_lsd <= 0;
				if(bcd_m_msd == 5) begin
					bcd_m_msd <= 0;
				end else begin
					bcd_m_msd <= bcd_m_msd + 1;
				end
			end else begin
				bcd_m_lsd <= bcd_m_lsd + 1;
			end		
		end
	end
end

assign incrementa_hora = incrementa_minuto && (bcd_m_lsd == 9 && bcd_m_msd == 5);

endmodule
