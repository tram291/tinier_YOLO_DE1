library verilog;
use verilog.vl_types.all;
entity float_convert is
    port(
        d               : in     vl_logic_vector(15 downto 0);
        f               : out    vl_logic_vector(15 downto 0)
    );
end float_convert;
