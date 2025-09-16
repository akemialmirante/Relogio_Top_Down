library verilog;
use verilog.vl_types.all;
entity relogio_vlg_check_tst is
    port(
        bcd_h_dez       : in     vl_logic_vector(6 downto 0);
        bcd_h_unid      : in     vl_logic_vector(6 downto 0);
        bcd_m_dez       : in     vl_logic_vector(6 downto 0);
        bcd_m_unid      : in     vl_logic_vector(6 downto 0);
        bcd_s_dez       : in     vl_logic_vector(6 downto 0);
        bcd_s_unid      : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end relogio_vlg_check_tst;
