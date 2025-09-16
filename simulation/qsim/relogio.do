onerror {quit -f}
vlib work
vlog -work work relogio.vo
vlog -work work relogio.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.relogio_vlg_vec_tst
vcd file -direction relogio.msim.vcd
vcd add -internal relogio_vlg_vec_tst/*
vcd add -internal relogio_vlg_vec_tst/i1/*
add wave /*
run -all
