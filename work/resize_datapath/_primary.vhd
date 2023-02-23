library verilog;
use verilog.vl_types.all;
entity resize_datapath is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        data_in1        : in     vl_logic_vector(15 downto 0);
        data_in2        : in     vl_logic_vector(15 downto 0);
        scale           : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end resize_datapath;
