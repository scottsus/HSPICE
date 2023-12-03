import re

def extract_values(data):
    rtl_pattern = r"rtl=\s*([\d\.-]+[pnmuf]?)"
    avg_cur_pattern = r"avg_cur=\s*([\d\.-]+[pnmuf]?)"
    avg_pow_pattern = r"avg_pow=\s*([\d\.-]+[pnmuf]?)"

    rtl_values = re.findall(rtl_pattern, data)
    avg_cur_values = re.findall(avg_cur_pattern, data)
    avg_pow_values = re.findall(avg_pow_pattern, data)

    extracted_data = []
    for rtl, avg_cur, avg_pow in zip(rtl_values, avg_cur_values, avg_pow_values):
        data_dict = {
            "rtl": clean_value(rtl),
            "avg_cur": clean_value(avg_cur),
            "avg_pow": clean_value(avg_pow)
        }
        extracted_data.append(data_dict)

    return extracted_data

def clean_value(value):
    if value[-1] == 'f':
        value = str(float(value[:-1]) * 1e-3) + 'p'

    unit = value[-1]
    number_value = float(value[:-1])
    number_value = round(abs(number_value), 2)
    value = str(number_value) + unit

    return value

def append_results():
    data_dir = '../data'

    lis_file_name = f'{data_dir}/dram.lis'
    in_file_name = f'{data_dir}/dram_sweep_input.txt'
    out_file_name = f'{data_dir}/dram_sweep_results.txt'

    lis_data = []
    with open(lis_file_name, 'r') as lis_f:
        data = lis_f.read()
        lis_data = extract_values(data)
        lis_f.close()

    input_data = []
    with open(in_file_name, 'r') as in_f:
        in_f.readline() # .DATA mydata
        in_f.readline() # + TEMP W_VAL CAP_VAL
        
        NUM_RESULTS = 88
        for i in range(NUM_RESULTS):
            input_data.append(in_f.readline())
        in_f.close()

    with open(out_file_name, 'w') as out_f:
        out_f.write('.DATA mydata\n')
        out_f.write('+ TEMP W_VAL CAP_VAL RTL Iavg Pavg\n')
        
        for i in range(len(input_data)):
            in_line = input_data[i]
            out_line = f'{in_line[:-1]} {lis_data[i]["rtl"]} {lis_data[i]["avg_cur"]} {lis_data[i]["avg_pow"]}\n'
            out_f.write(out_line)
        out_f.close()

if __name__ == '__main__':
    append_results()