module maq_m(
	input logic clk,
	input logic rst,
	input logic incrementa_minuto,	// vem do maq_s
	output logic [3:0] bcd_m_lsd,		// unidade
	output logic [2:0] bcd_m_msd,		// dezena
	output logic incrementa_hora		// flag pro maq_h
);

always_ff @(posedge clk or negedge rst) begin
	if (!rst) begin
		//bcd_m_lsd <= 4'd0;
		//bcd_m_msd <= 3'd0;
		bcd_m_lsd <= 4'd9;
		bcd_m_msd <= 3'd5;
		incrementa_hora <=1'b0;
	end else begin
		incrementa_hora <= 1'b0; //default
		
		if(incrementa_minuto)begin //so entra no codigo por conta da flag
         if (bcd_m_lsd == 9) begin
			   bcd_m_lsd <= 0;
		
			   if(bcd_m_msd == 5) begin
				   bcd_m_lsd <= 0;
				   incrementa_hora <= 1'b1; //flag hora
			   end else begin
				   bcd_m_msd <= bcd_m_msd + 1;
			   end
		   end else begin
			   bcd_m_lsd <= bcd_m_lsd + 1;
		   end		
		end
	end
end

endmodule