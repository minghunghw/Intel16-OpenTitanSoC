import sys

def read_file(file_name):
    with open(file_name, 'r') as file:
        return file.readlines()

def label(lef):
    name = []
    loc = []
    for i in lef:
        pin = i.strip().split(",")
        for j in range(9):
            name.append(pin[0] + "[" + str(int(pin[1])+8*j) + "]")
            loc.append(round(float(pin[2]) + 155.952*j, 3))
    return name, loc

def loc2cmd(name, loc):
    lef = []
    for i in range(104*9):
        cmd = "place_pin -pin_name {{{:<18}}} -layer {{m5}} -location {{{:<10} 0}} -pin_size {{0.044 0.16}} -force_to_die_boundary\n".format(name[i], loc[i])
        lef.append(cmd)
    return lef

def write_file(file_name, lef):
    with open(file_name, 'w') as file:
        file.writelines(lef)

def main():
    print('pin_south.csv is processing...')
    file = "pin_south.csv"
    lef = read_file(file)
    name, loc = label(lef)
    lef = loc2cmd(name, loc)
    file = "pin_south.io"
    write_file(file, lef)

if __name__ == '__main__':
    main()