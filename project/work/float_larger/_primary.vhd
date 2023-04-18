library verilog;
use verilog.vl_types.all;
entity float_larger is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        isLarger        : out    vl_logic
    );
end float_larger;
