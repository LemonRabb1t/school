library verilog;
use verilog.vl_types.all;
entity lab6pt3 is
    port(
        lower           : out    vl_logic_vector(0 to 6);
        clk             : in     vl_logic;
        resetA          : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        resetB          : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        En              : in     vl_logic;
        resetFSM        : in     vl_logic;
        sign            : out    vl_logic_vector(0 to 6);
        student_id      : out    vl_logic_vector(0 to 6);
        upper           : out    vl_logic_vector(0 to 6);
        \y/n\           : out    vl_logic_vector(0 to 6)
    );
end lab6pt3;
