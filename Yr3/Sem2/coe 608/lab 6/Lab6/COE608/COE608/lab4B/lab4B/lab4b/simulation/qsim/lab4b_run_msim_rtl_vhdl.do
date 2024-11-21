transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/register32.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/pc.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/mux2to1.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/fulladd.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/data_mem.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/alu.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/adder32.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/adder16.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/adder4.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/add.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/LZE.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/UZE.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/RED.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/mux4to1.vhd}
vcom -93 -work work {/home/student2/pxyang/coe608/lab4B/lab4b/data_path.vhd}

