library verilog;
use verilog.vl_types.all;
entity reorg_layer is
    generic(
        WIDTH           : integer := 12;
        HEIGHT          : integer := 12;
        DEPTH           : integer := 256;
        WIDTH_IN        : integer := 24;
        HEIGHT_IN       : integer := 24;
        DEPTH_IN        : integer := 64;
        STRIDE          : integer := 2
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        to_addr         : out    vl_logic_vector(22 downto 0);
        from_addr       : out    vl_logic_vector(22 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of HEIGHT : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of WIDTH_IN : constant is 1;
    attribute mti_svvh_generic_type of HEIGHT_IN : constant is 1;
    attribute mti_svvh_generic_type of DEPTH_IN : constant is 1;
    attribute mti_svvh_generic_type of STRIDE : constant is 1;
end reorg_layer;
