onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_tb1/clk
add wave -noupdate /CPU_tb1/rst
add wave -noupdate /CPU_tb1/read
add wave -noupdate /CPU_tb1/write
add wave -noupdate -radix hexadecimal -childformat {{{/CPU_tb1/memIn[7]} -radix binary} {{/CPU_tb1/memIn[6]} -radix binary} {{/CPU_tb1/memIn[5]} -radix binary} {{/CPU_tb1/memIn[4]} -radix binary} {{/CPU_tb1/memIn[3]} -radix binary} {{/CPU_tb1/memIn[2]} -radix binary} {{/CPU_tb1/memIn[1]} -radix binary} {{/CPU_tb1/memIn[0]} -radix binary}} -subitemconfig {{/CPU_tb1/memIn[7]} {-height 15 -radix binary} {/CPU_tb1/memIn[6]} {-height 15 -radix binary} {/CPU_tb1/memIn[5]} {-height 15 -radix binary} {/CPU_tb1/memIn[4]} {-height 15 -radix binary} {/CPU_tb1/memIn[3]} {-height 15 -radix binary} {/CPU_tb1/memIn[2]} {-height 15 -radix binary} {/CPU_tb1/memIn[1]} {-height 15 -radix binary} {/CPU_tb1/memIn[0]} {-height 15 -radix binary}} /CPU_tb1/memIn
add wave -noupdate -radix binary -childformat {{{/CPU_tb1/memOut[7]} -radix binary} {{/CPU_tb1/memOut[6]} -radix binary} {{/CPU_tb1/memOut[5]} -radix binary} {{/CPU_tb1/memOut[4]} -radix binary} {{/CPU_tb1/memOut[3]} -radix binary} {{/CPU_tb1/memOut[2]} -radix binary} {{/CPU_tb1/memOut[1]} -radix binary} {{/CPU_tb1/memOut[0]} -radix binary}} -subitemconfig {{/CPU_tb1/memOut[7]} {-height 15 -radix binary} {/CPU_tb1/memOut[6]} {-height 15 -radix binary} {/CPU_tb1/memOut[5]} {-height 15 -radix binary} {/CPU_tb1/memOut[4]} {-height 15 -radix binary} {/CPU_tb1/memOut[3]} {-height 15 -radix binary} {/CPU_tb1/memOut[2]} {-height 15 -radix binary} {/CPU_tb1/memOut[1]} {-height 15 -radix binary} {/CPU_tb1/memOut[0]} {-height 15 -radix binary}} /CPU_tb1/memOut
add wave -noupdate -radix binary -childformat {{{/CPU_tb1/address[3]} -radix binary} {{/CPU_tb1/address[2]} -radix binary} {{/CPU_tb1/address[1]} -radix binary} {{/CPU_tb1/address[0]} -radix binary}} -subitemconfig {{/CPU_tb1/address[3]} {-height 15 -radix binary} {/CPU_tb1/address[2]} {-height 15 -radix binary} {/CPU_tb1/address[1]} {-height 15 -radix binary} {/CPU_tb1/address[0]} {-height 15 -radix binary}} /CPU_tb1/address
add wave -noupdate /CPU_tb1/CPU_dut1/AR/out
add wave -noupdate /CPU_tb1/CPU_dut1/AC/out
add wave -noupdate /CPU_tb1/CPU_dut1/SC/out
add wave -noupdate /CPU_tb1/CPU_dut1/PC/out
add wave -noupdate /CPU_tb1/CPU_dut1/DR/out
add wave -noupdate /CPU_tb1/CPU_dut1/IR/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {35 ns}
