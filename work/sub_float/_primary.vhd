library verilog;
use verilog.vl_types.all;
entity sub_float is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        c               : out    vl_logic_vector(15 downto 0)
    );
end sub_float;
