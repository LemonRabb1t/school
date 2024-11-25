onerror {exit -code 1}
vlib work
vlog -work work lab4b.vo
vlog -work work CLRB.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.data_path_vlg_vec_tst -voptargs="+acc"
vcd file -direction lab4b.msim.vcd
vcd add -internal data_path_vlg_vec_tst/*
vcd add -internal data_path_vlg_vec_tst/i1/*
run -all
quit -f
