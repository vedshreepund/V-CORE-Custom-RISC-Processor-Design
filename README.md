# V-CORE-Custom-RISC-Processor-Design

cpu-design/
│
├── docs/
block_diagram.png
│   ├── 
│   ├── isa_spec.md
│   ├── datapath.md
│   └── control_signals.md
│
├── rtl/                    # Actual hardware (Verilog)
│   ├── top/
│   │   └── cpu_top.v       # Connects everything
│   │
│   ├── fetch/
│   │   ├── pc.v
│   │   ├── instruction_memory.v
│   │   └── fetch_unit.v
│   │
│   ├── decode/
│   │   ├── register_file.v
│   │   ├── control_unit.v
│   │   └── immediate_gen.v
│   │
│   ├── execute/
│   │   ├── alu.v
│   │   ├── alu_control.v
│   │   └── branch_unit.v
│   │
│   ├── memory/
│   │   ├── data_memory.v
│   │   └── load_store_unit.v
│   │
│   ├── writeback/
│   │   └── writeback_unit.v
│   │
│   └── common/
│       ├── mux.v
│       ├── adder.v
│       └── sign_extender.v
│
├── testbench/
│   ├── cpu_tb.v
│   ├── alu_tb.v
│   └── regfile_tb.v
│
├── programs/
│   ├── test1.hex
│   ├── loop_test.hex
│   └── os_boot.hex
│
├── scripts/
│   ├── compile.sh
│   └── simulate.sh
│
└── README.md
