library verilog;
use verilog.vl_types.all;
entity lab6pt3_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        En              : in     vl_logic;
        resetA          : in     vl_logic;
        resetB          : in     vl_logic;
        resetFSM        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab6pt3_vlg_sample_tst;
