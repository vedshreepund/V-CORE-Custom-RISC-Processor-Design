iverilog -o decode_test` 
rtl/fetch/pc.v `
rtl/fetch/instruction_memory.v `
rtl/decode/*.v `
rtl/top/cpu_top.v `
testbench/cpu_decode_tb.v 

vvp decode_test
