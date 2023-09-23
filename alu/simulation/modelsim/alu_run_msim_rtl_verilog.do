transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/alu.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/and_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/or_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/xor_32_1.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/rca_8.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/csa_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/mux.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/csa_16.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/sll.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/sra.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/zero_det.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/alu {D:/intelFPGA_lite/17.0/ECE550D/alu/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
