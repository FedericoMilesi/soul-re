#!/usr/bin/env python3

from __future__ import annotations
from pathlib import Path
from splat.util import options
from splat.segtypes.common.bss import CommonSegBss

class PSXSegComm(CommonSegBss):
    def get_linker_section(self) -> str:
        return ".sbss"
    
    def asm_out_path(self) -> Path:
        typ = self.type
        if typ.startswith("."):
            typ = typ[1:]

        return options.opts.data_path / self.dir / f"{self.name}.{typ}.s"
