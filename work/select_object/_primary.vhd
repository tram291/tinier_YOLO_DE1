library verilog;
use verilog.vl_types.all;
entity select_object is
    generic(
        THRESHOLD       : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        object_val      : in     vl_logic_vector(15 downto 0);
        over_thres      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of THRESHOLD : constant is 1;
end select_object;
