#!/usr/bin/env python3

import urllib.request
import urllib.parse
from io import BytesIO

import subprocess
import tempfile
import zipfile
import json
import sys
import os
import re

def download_decompme(url_str, dir):
    try:
        parsed_url = urllib.parse.urlparse(url_str)
        slug = parsed_url.path[1:].split("/")[1]
    except Exception:
        print(
            f"Failed to parse decomp.me url, it should look like:{api_base}/scratch/<id>"
        )
        sys.exit(1)

    print(f"Downloading scratch with ID {slug}...")
    try:
        response_str = urllib.request.urlopen(f"{api_base}/api/scratch/{slug}")

        content = urllib.request.urlopen(
            f"{api_base}/api/scratch/{slug}/export"
        )
        zip = zipfile.ZipFile(BytesIO(content.read()))
        zip.extractall(dir)
    except Exception:
        print("Failed to download scratch from decomp.me")
        sys.exit(1)

def get_diff_label_and_cflags(path):
    f = open(path, 'r')
    meta = json.load(f)
    f.close()
    cflags = meta['compiler_flags'].split()
    for cflag in cflags[:]:
        if cflag.startswith('-Wa') or cflag.startswith('--') or ',' in cflag:
            cflags.remove(cflag)

    return meta['diff_label'], cflags, 

def fixup_asm(path, diff_label):
    f = open(path, 'r')
    txt = f.read()
    f.close()

    x = re.search('.*glabel.*'+diff_label, txt)
    
    f = open(path, 'w')
    f.write('.set noat\n')
    f.write('.set noreorder\n\n')
    if not x:
        f.write('glabel '+diff_label+'\n')
    f.write(txt)
    f.close()

def create_permuter_settings(cflags):
    f = open('permuter_settings.toml.in', 'r')
    txt = f.read()
    f.close()

    txt = txt.replace('$CFLAGS', ' '.join(cflags))
    f = open('permuter_settings.toml', 'w')
    f.write(txt)
    f.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print('permute.py [url]')
        sys.exit(1)

    api_base = os.environ.get("DECOMPME_API_BASE", "https://decomp.me")
    
    tempdir = tempfile.TemporaryDirectory(dir='./')
    download_decompme(sys.argv[1], tempdir.name)
    
    # Merge context + code
    filenames = [os.path.join(tempdir.name, 'ctx.c'), os.path.join(tempdir.name, 'code.c')]
    f = open(os.path.join(tempdir.name, 'func.c'), 'w')
    for fname in filenames:
        with open(fname) as infile:
            for line in infile:
                f.write(line)
        f.write('\n\n')
    f.close()
    
    code = os.path.join(tempdir.name, 'func.c')
    target = os.path.join(tempdir.name, 'target.s')
    meta = os.path.join(tempdir.name, 'metadata.json')
    diff_label, cflags = get_diff_label_and_cflags(meta)
    nonmatching = os.path.join('nonmatchings', diff_label)
    fixup_asm(target, diff_label)
    create_permuter_settings(cflags)
    
    subprocess.run(['tools/decomp-permuter/import.py', code, target])
    tempdir.cleanup()
    subprocess.run(['tools/decomp-permuter/permuter.py', '--best-only', '--stop-on-zero', '-j12', nonmatching])
