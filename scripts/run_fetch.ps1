iverilog -o fetch_test `
rtl/fetch/pc.v `
rtl/fetch/instruction_memory.v `
rtl/top/cpu_top.v `
testbench/cpu_fetch_tb.v

vvp fetch_test
