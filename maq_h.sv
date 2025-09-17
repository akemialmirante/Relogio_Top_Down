module maq_h (input logic clk,
				  input logic rst,
				  input logic incrementa_hora, 
				  output logic [3:0] bcd_h_lsd, 
				  output logic [1:0] bcd_h_msd);

always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
        bcd_h_lsd <= 4'd0;
        bcd_h_msd <= 2'd0;
    end else begin
	     if(incrementa_hora) begin 
            if (bcd_h_msd == 2 && bcd_h_lsd == 3) begin
					bcd_h_msd <= 0;
					bcd_h_lsd <= 0;

			  end else if (bcd_h_lsd == 9) begin
					bcd_h_lsd <= 0;
					bcd_h_msd <= bcd_h_msd + 1;

			  end else begin
					bcd_h_lsd <= bcd_h_lsd + 1;
			  end
			
		  end

    end
end

endmodule