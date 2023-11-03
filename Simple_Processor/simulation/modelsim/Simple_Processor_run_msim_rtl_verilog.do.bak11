transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/alu_test.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/skeleton.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/regfile.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/processor.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/dffe.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/reg_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/full_adder.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/mux.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/sx.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/pc.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/rca_12.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/ctrlLogic.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/imem.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/dmem.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/clock_divider.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/convert_12_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/brgen.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor {D:/intelFPGA_lite/17.0/ECE550D/Simple_Processor/skeleton_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_tb

add wave *
view structure
view signals
run -all
