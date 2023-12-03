# 🌶️ Lab 4: HSPICE

## Usage

1. Generate Inputs

```
python3 scripts/input_generator.py
```

2. Run HSPICE

```
hspice src/dram.sp
```

3. Append Results

```
python3 scripts/result_appender.py
```

## Explanation

### HSPICE Netlist

- include dependencies, including the generated `dram_sweep_input.txt`
- define parameters
- define voltages
- define transistors
- define capacitances
- define initial conditions
- setup transient analysis, including `SWEEP` based on the input data above
- measure outputs

### Python Scripts

- `input_generator.py`: takes in a range of widths, capacitances, and temperatures, and compiles them into a single .txt file for HSPICE.
- `result_appender.py`:
  1. extract `rtl`, `avg_current`, `avg_power` values from the `dram.lis` file
  2. maps them to each input parameter defined in the `dram_sweep_input.txt` file
  3. writes them to a new `dram_sweep_results.txt` file

## Schematic
Lab 4 Part 1 can be found [here](https://ssusanto.notion.site/HSPICE-bf830be213f4447982690270ab95580f?pvs=4), where I have waveform diagrams for DRAM and NAND, and a handdrawn schematic for NAND.

## Notes

Everything should be working as intended 👍
