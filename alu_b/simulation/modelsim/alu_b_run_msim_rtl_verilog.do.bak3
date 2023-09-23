transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu_b {D:/intelFPGA_lite/17.0/ECE550D/alu_b/alu_b.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu_b {D:/intelFPGA_lite/17.0/ECE550D/alu_b/alu_b_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_b_tb

add wave *
view structure
view signals
run -all
