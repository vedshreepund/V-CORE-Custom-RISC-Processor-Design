iverilog -o cpu_test `
rtl/fetch/*.v `
rtl/decode/*.v `
rtl/execute/*.v `
rtl/memory/*.v `
rtl/writeback/*.v `
rtl/top/cpu_top.v `
testbench/cpu_decode_tb.v

vvp cpu_test
