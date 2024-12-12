#!/usr/bin/env python3

from __future__ import annotations
from pathlib import Path
from typing import Set
import re
from splat.segtypes.common.c import CommonSegC
from splat.util import options

class PSXSeg_c(CommonSegC):
    @staticmethod
    def get_global_asm_funcs(c_file: Path) -> Set[str]:
        with c_file.open() as f:
            text = CommonSegC.strip_c_comments(f.read())
            s = set(CommonSegC.find_include_asm(text))
            pattern = re.compile('#include.*["<](.*\.c)[">]')
            for match in pattern.finditer(text):
                path = options.opts.src_path / match.group(1)
                s.update(set(PSXSeg_c.get_global_asm_funcs(path)))

            return s