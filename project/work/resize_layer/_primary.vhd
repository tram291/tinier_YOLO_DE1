library verilog;
use verilog.vl_types.all;
entity resize_layer is
    generic(
        SRC_WIDTH       : integer := 640;
        SRC_HEIGHT      : integer := 480;
        SRC_DEPTH       : integer := 3;
        DES_WIDTH       : integer := 384;
        DES_HEIGHT      : integer := 384;
        WIDTH_SCALE     : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi0);
        HEIGHT_SCALE    : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        src_addr1       : out    vl_logic_vector(31 downto 0);
        src_addr2       : out    vl_logic_vector(31 downto 0);
        des_addr        : out    vl_logic_vector(22 downto 0);
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SRC_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of SRC_HEIGHT : constant is 1;
    attribute mti_svvh_generic_type of SRC_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of DES_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DES_HEIGHT : constant is 1;
    attribute mti_svvh_generic_type of WIDTH_SCALE : constant is 1;
    attribute mti_svvh_generic_type of HEIGHT_SCALE : constant is 1;
end resize_layer;
