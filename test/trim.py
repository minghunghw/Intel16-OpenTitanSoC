import sys

def read_file(file_name):
    with open(file_name, 'r') as file:
        return file.readlines()

def trim(hex):
    for i in range(len(hex)):
        if hex[i] == '00000000\n':
            return hex[0:i] + ['00000fff\n']

def write_file(file_name, hex):
    with open(file_name, 'w') as file:
        file.writelines(hex)

def main():
    print(sys.argv[1] + '.hex is processing...')
    file = 'hex/' + sys.argv[1] + '.hex'
    hex = read_file(file)
    hex = trim(hex)
    write_file(file, hex)

if __name__ == '__main__':
    main()