"""
Python script for generating HSPICE testcases.
"""

data_dir = '../data'
file_path = f'{data_dir}/dram_sweep_input.txt'
widths = [
    120,
    180,
    240,
    300
]
capacitances = [
    0.01,
    8**0.1,
    8**0.2,
    8**0.3,
    8**0.4,
    8**0.5,
    8**0.6,
    8**0.7,
    8**0.8,
    8**0.9,
    8,
]
temperatures = [
    25,
    85,
]

with open(file_path, 'w') as f:
    f.write('.DATA  mydata\n')
    f.write('+ TEMP W_VAL CAP_VAL\n')
    for temperature in temperatures:
        for width in widths:
            for capacitance in capacitances:
                sentence = f" {temperature} {width}n {capacitance:.2f}f\n"
                f.write(sentence)
    f.write('.ENDDATA')
    f.close()