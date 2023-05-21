import csv
import sys
import re

def parse_lef_file(file_path, direction=None):
    with open(file_path, 'r') as f:
        lef_contents = f.read()

    # Regular expression patterns for matching the pin and its location
    pin_pattern = r'PIN\s+(\w+)(\[\d+\])?'
    location_pattern = r'PIN\s+(\w+)(\[\d+\])?\n\s+DIRECTION\s+(\w+)\s+;\n\s+USE\s+(\w+)\s+;\n\s+PORT\n\s+LAYER\s+(\w+)\s+;\n\s+RECT\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)\s+([\d.]+)'

    # Find pins and their locations in the LEF file
    pins = re.findall(pin_pattern, lef_contents)
    locations = re.findall(location_pattern, lef_contents)

    # Create a list to store pin locations
    pin_locations = []

    # Iterate over the found locations and associate them with the corresponding pin
    for location in locations:
        pin_name = location[0]
        pin_index = location[1].strip('[]') if location[1] else None
        pin_direction = location[2]
        pin_use = location[3]
        pin_rect = (float(location[5]), float(location[6]), float(location[7]), float(location[8]))

        # Exclude pins like 'pad', 'vdd', 'vss', 'vddh'
        if pin_name.lower() not in ['pad', 'vdd', 'vss', 'vddh']:
            if direction == "vertical":
                pin_locations.append({
                    'pin': pin_name,
                    'index': pin_index,
                    'y_coordinate': pin_rect[1]
                })
            elif direction == "horizontal":
                pin_locations.append({
                    'pin': pin_name,
                    'index': pin_index,
                    'x_coordinate': pin_rect[0]
                })

    return pin_locations

lef_file_path = sys.argv[1]
direction = sys.argv[2]
csv_file_path = sys.argv[3]

pin_locations = parse_lef_file(lef_file_path, direction)

# Generate pin.csv file
with open(csv_file_path, 'w', newline='') as f:
    writer = csv.writer(f)
    if direction == "vertical":
        for location in pin_locations:
            writer.writerow([location['pin'], location['index'], location['y_coordinate']])
    elif direction == "horizontal":
        for location in pin_locations:
            writer.writerow([location['pin'], location['index'], location['x_coordinate']])
