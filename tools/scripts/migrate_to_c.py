#!/usr/bin/env python3

import subprocess
import argparse
import m2ctx
import os

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("data_file")
    args = parser.parse_args()

    if args.data_file.endswith('.sdata.s'):
        c_file = args.data_file.replace('asm/data/', 'src/', 1).replace('.sdata.s', '.c')
        rodata = args.data_file.replace('.sdata.s', '.rodata.s')
        sdata = args.data_file
        data = args.data_file.replace('.sdata.s', '.data.s')
    else:
        c_file = args.data_file.replace('asm/data/', 'src/', 1).replace('.data.s', '.c')
        rodata = args.data_file.replace('.data.s', '.rodata.s')
        sdata = args.data_file.replace('.data.s', '.sdata.s')
        data = args.data_file

    filenames = []
    if os.path.isfile(rodata):
        filenames.append(rodata)
    if os.path.isfile(sdata):
        filenames.append(sdata)
    if os.path.isfile(data):
        filenames.append(data)

    f = open('data.s', 'w')
    for fname in filenames:
        with open(fname) as infile:
            for line in infile:
                f.write(line)
        f.write('\n\n')
    f.close()
    data = 'data.s'

    ctx = m2ctx.import_c_file(c_file, False, True)

    # Write m2c context
    f = open('data.c', 'w')
    f.write(ctx)
    f.close()

    # Decompile data
    decomp = subprocess.check_output(['tools/m2c/m2c.py', '--globals', 'all', '--context', 'data.c', data], encoding="utf-8")

    f = open('data.c', 'w')
    f.write(decomp)
    f.close()

    os.remove('data.c.m2c')