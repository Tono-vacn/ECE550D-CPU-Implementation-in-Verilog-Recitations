transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/regfile.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/dffe.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/reg_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/decoder_5_32.v}
vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/tri_state_buff.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/regfile {D:/intelFPGA_lite/17.0/ECE550D/regfile/regfile_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  regfile_tb

add wave *
view structure
view signals
run -all
