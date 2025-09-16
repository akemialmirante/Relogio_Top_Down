module relogio(input rst,
					input clk,
					output logic [6:0] bcd_s_unid,
					output logic [6:0] bcd_s_dez,
					output logic [6:0] bcd_m_unid,
					output logic [6:0] bcd_m_dez,
					output logic [6:0] bcd_h_unid,
					output logic [6:0] bcd_h_dez);
					
logic clk_1hz;

divisor u_divisor (
	.rst(rst),          // conecta o reset
	.clk_in(clk),          // conecta o clock de entrada
	.clk_out(clk_1hz)  // saída vira o novo clock dividido
 );
 
logic[3:0] seg_lsd;
logic[2:0] seg_msd;

logic incrementa_minuto;

maq_s segundos (
	.rst (rst),
	//.clk (clk_1hz),
	.clk (clk), //debug
	.bcd_s_lsd (seg_lsd),
	.bcd_s_msd (seg_msd),
	.incrementa_minuto (incrementa_minuto)
 );
 
logic[3:0] min_lsd;
logic[2:0] min_msd;

logic incrementa_hora;

maq_m minutos (
	.rst (rst),
	//.clk (clk_1hz),
	.clk (clk), //debug
	.bcd_m_lsd (min_lsd),
	.bcd_m_msd (min_msd),
	.incrementa_hora (incrementa_hora),
	.incrementa_minuto (incrementa_minuto)
 );
 
logic[3:0] hr_lsd;
logic[1:0] hr_msd;
 
maq_h horas ( 
	.rst (rst),
	//.clk (clk_1hz),
	.clk (clk), //debug
	.bcd_h_lsd (hr_lsd),
	.bcd_h_msd (hr_msd),
	.incrementa_hora (incrementa_hora)
 );
 
bcd disp0 (.bcd_in(seg_lsd), .display(bcd_s_unid));
bcd disp1 (.bcd_in(seg_msd), .display(bcd_s_dez));
bcd disp2 (.bcd_in(min_lsd), .display(bcd_m_unid));
bcd disp3 (.bcd_in(min_msd), .display(bcd_m_dez));
bcd disp4 (.bcd_in(hr_lsd),  .display(bcd_h_unid));
bcd disp5 (.bcd_in(hr_msd),  .display(bcd_h_dez));

endmodule