library verilog;
use verilog.vl_types.all;
entity relogio is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        bcd_s_unid      : out    vl_logic_vector(6 downto 0);
        bcd_s_dez       : out    vl_logic_vector(6 downto 0);
        bcd_m_unid      : out    vl_logic_vector(6 downto 0);
        bcd_m_dez       : out    vl_logic_vector(6 downto 0);
        bcd_h_unid      : out    vl_logic_vector(6 downto 0);
        bcd_h_dez       : out    vl_logic_vector(6 downto 0)
    );
end relogio;
