#!/usr/bin/env python3

from dataclasses import dataclass
import operator
import glob
import os

@dataclass
class Function():
    name: str
    size: int

def get_size(path):
    f = open(path, 'r')
    lines = f.readlines()
    f.close()
    name = os.path.basename(file).split('.')[0]
    inst = 0
    for line in lines:
        if ('glabel ' + name) in line:
            inst = 0
        if '/*' in line:
            inst += 1
    return inst

def write_output_file(path, funcs):
    f = open(path, 'w')
    for fu in funcs:
        f.write(fu.name+';'+str(fu.size)+'\n')
    f.close()

if __name__ == "__main__":
    funcs = []
    asm_files = [y for x in os.walk('asm/nonmatchings/Game/') for y in glob.glob(os.path.join(x[0], '*.s'))]
    for file in asm_files:
        name = os.path.basename(file).split('.')[0]
        if name.startswith('D_'):
            continue

        funcs.append(Function(name, get_size(file)))

    sorted_size = sorted(funcs, key=operator.attrgetter('size'))
    write_output_file('size.csv', sorted_size)