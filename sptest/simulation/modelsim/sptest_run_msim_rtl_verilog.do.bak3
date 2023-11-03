transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/sx.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/skeleton.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/reg_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/rca_12.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/dffe.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/ctrlLogic.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/clock_divider.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vacn/Desktop/checkpoint4 {C:/Users/Vacn/Desktop/checkpoint4/dmem.v}

vlog -vlog01compat -work work +incdir+D:/intelFPGA_lite/17.0/ECE550D/sptest {D:/intelFPGA_lite/17.0/ECE550D/sptest/sptest.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sptest

add wave *
view structure
view signals
run -all
