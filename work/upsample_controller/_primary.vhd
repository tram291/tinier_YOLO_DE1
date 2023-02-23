library verilog;
use verilog.vl_types.all;
entity upsample_controller is
    generic(
        WIDTH_SRC       : integer := 12;
        HEIGHT_SRC      : integer := 12;
        DEPTH_SRC       : integer := 128;
        STRIDE          : integer := 2
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        done            : out    vl_logic;
        src_addr        : out    vl_logic_vector(22 downto 0);
        des_addr        : out    vl_logic_vector(22 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH_SRC : constant is 1;
    attribute mti_svvh_generic_type of HEIGHT_SRC : constant is 1;
    attribute mti_svvh_generic_type of DEPTH_SRC : constant is 1;
    attribute mti_svvh_generic_type of STRIDE : constant is 1;
end upsample_controller;
