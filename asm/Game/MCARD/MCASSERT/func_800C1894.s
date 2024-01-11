.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1894
/* B2094 800C1894 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B2098 800C1898 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B209C 800C189C 21280000 */  addu       $a1, $zero, $zero
/* B20A0 800C18A0 80014794 */  lhu        $a3, 0x180($v0)
/* B20A4 800C18A4 82014894 */  lhu        $t0, 0x182($v0)
/* B20A8 800C18A8 0080E230 */  andi       $v0, $a3, 0x8000
/* B20AC 800C18AC 03004014 */  bnez       $v0, .L800C18BC
/* B20B0 800C18B0 21300000 */   addu      $a2, $zero, $zero
/* B20B4 800C18B4 60060308 */  j          .L800C1980
/* B20B8 800C18B8 2130A000 */   addu      $a2, $a1, $zero
.L800C18BC:
/* B20BC 800C18BC 00F0E330 */  andi       $v1, $a3, 0xF000
/* B20C0 800C18C0 00B00234 */  ori        $v0, $zero, 0xB000
/* B20C4 800C18C4 26006210 */  beq        $v1, $v0, .L800C1960
/* B20C8 800C18C8 2A104300 */   slt       $v0, $v0, $v1
/* B20CC 800C18CC 0F004014 */  bnez       $v0, .L800C190C
/* B20D0 800C18D0 00D00234 */   ori       $v0, $zero, 0xD000
/* B20D4 800C18D4 00900234 */  ori        $v0, $zero, 0x9000
/* B20D8 800C18D8 1D006210 */  beq        $v1, $v0, .L800C1950
/* B20DC 800C18DC 2A104300 */   slt       $v0, $v0, $v1
/* B20E0 800C18E0 06004014 */  bnez       $v0, .L800C18FC
/* B20E4 800C18E4 00A00234 */   ori       $v0, $zero, 0xA000
/* B20E8 800C18E8 00800234 */  ori        $v0, $zero, 0x8000
/* B20EC 800C18EC 16006210 */  beq        $v1, $v0, .L800C1948
/* B20F0 800C18F0 00000000 */   nop
/* B20F4 800C18F4 60060308 */  j          .L800C1980
/* B20F8 800C18F8 FF0FE730 */   andi      $a3, $a3, 0xFFF
.L800C18FC:
/* B20FC 800C18FC 16006210 */  beq        $v1, $v0, .L800C1958
/* B2100 800C1900 00000000 */   nop
/* B2104 800C1904 60060308 */  j          .L800C1980
/* B2108 800C1908 FF0FE730 */   andi      $a3, $a3, 0xFFF
.L800C190C:
/* B210C 800C190C 18006210 */  beq        $v1, $v0, .L800C1970
/* B2110 800C1910 2A104300 */   slt       $v0, $v0, $v1
/* B2114 800C1914 06004014 */  bnez       $v0, .L800C1930
/* B2118 800C1918 00E00234 */   ori       $v0, $zero, 0xE000
/* B211C 800C191C 00C00234 */  ori        $v0, $zero, 0xC000
/* B2120 800C1920 11006210 */  beq        $v1, $v0, .L800C1968
/* B2124 800C1924 00000000 */   nop
/* B2128 800C1928 60060308 */  j          .L800C1980
/* B212C 800C192C FF0FE730 */   andi      $a3, $a3, 0xFFF
.L800C1930:
/* B2130 800C1930 11006210 */  beq        $v1, $v0, .L800C1978
/* B2134 800C1934 00F00234 */   ori       $v0, $zero, 0xF000
/* B2138 800C1938 0F006210 */  beq        $v1, $v0, .L800C1978
/* B213C 800C193C 00000000 */   nop
/* B2140 800C1940 60060308 */  j          .L800C1980
/* B2144 800C1944 FF0FE730 */   andi      $a3, $a3, 0xFFF
.L800C1948:
/* B2148 800C1948 5F060308 */  j          .L800C197C
/* B214C 800C194C 01000624 */   addiu     $a2, $zero, 0x1
.L800C1950:
/* B2150 800C1950 5F060308 */  j          .L800C197C
/* B2154 800C1954 02000624 */   addiu     $a2, $zero, 0x2
.L800C1958:
/* B2158 800C1958 5F060308 */  j          .L800C197C
/* B215C 800C195C 03000624 */   addiu     $a2, $zero, 0x3
.L800C1960:
/* B2160 800C1960 5F060308 */  j          .L800C197C
/* B2164 800C1964 04000624 */   addiu     $a2, $zero, 0x4
.L800C1968:
/* B2168 800C1968 5F060308 */  j          .L800C197C
/* B216C 800C196C 05000624 */   addiu     $a2, $zero, 0x5
.L800C1970:
/* B2170 800C1970 5F060308 */  j          .L800C197C
/* B2174 800C1974 06000624 */   addiu     $a2, $zero, 0x6
.L800C1978:
/* B2178 800C1978 07000624 */  addiu      $a2, $zero, 0x7
.L800C197C:
/* B217C 800C197C FF0FE730 */  andi       $a3, $a3, 0xFFF
.L800C1980:
/* B2180 800C1980 00800231 */  andi       $v0, $t0, 0x8000
/* B2184 800C1984 03004014 */  bnez       $v0, .L800C1994
/* B2188 800C1988 00F00331 */   andi      $v1, $t0, 0xF000
/* B218C 800C198C 95060308 */  j          .L800C1A54
/* B2190 800C1990 21280000 */   addu      $a1, $zero, $zero
.L800C1994:
/* B2194 800C1994 00B00234 */  ori        $v0, $zero, 0xB000
/* B2198 800C1998 26006210 */  beq        $v1, $v0, .L800C1A34
/* B219C 800C199C 2A104300 */   slt       $v0, $v0, $v1
/* B21A0 800C19A0 0F004014 */  bnez       $v0, .L800C19E0
/* B21A4 800C19A4 00D00234 */   ori       $v0, $zero, 0xD000
/* B21A8 800C19A8 00900234 */  ori        $v0, $zero, 0x9000
/* B21AC 800C19AC 1D006210 */  beq        $v1, $v0, .L800C1A24
/* B21B0 800C19B0 2A104300 */   slt       $v0, $v0, $v1
/* B21B4 800C19B4 06004014 */  bnez       $v0, .L800C19D0
/* B21B8 800C19B8 00A00234 */   ori       $v0, $zero, 0xA000
/* B21BC 800C19BC 00800234 */  ori        $v0, $zero, 0x8000
/* B21C0 800C19C0 16006210 */  beq        $v1, $v0, .L800C1A1C
/* B21C4 800C19C4 00000000 */   nop
/* B21C8 800C19C8 95060308 */  j          .L800C1A54
/* B21CC 800C19CC FF0F0831 */   andi      $t0, $t0, 0xFFF
.L800C19D0:
/* B21D0 800C19D0 16006210 */  beq        $v1, $v0, .L800C1A2C
/* B21D4 800C19D4 00000000 */   nop
/* B21D8 800C19D8 95060308 */  j          .L800C1A54
/* B21DC 800C19DC FF0F0831 */   andi      $t0, $t0, 0xFFF
.L800C19E0:
/* B21E0 800C19E0 18006210 */  beq        $v1, $v0, .L800C1A44
/* B21E4 800C19E4 2A104300 */   slt       $v0, $v0, $v1
/* B21E8 800C19E8 06004014 */  bnez       $v0, .L800C1A04
/* B21EC 800C19EC 00E00234 */   ori       $v0, $zero, 0xE000
/* B21F0 800C19F0 00C00234 */  ori        $v0, $zero, 0xC000
/* B21F4 800C19F4 11006210 */  beq        $v1, $v0, .L800C1A3C
/* B21F8 800C19F8 00000000 */   nop
/* B21FC 800C19FC 95060308 */  j          .L800C1A54
/* B2200 800C1A00 FF0F0831 */   andi      $t0, $t0, 0xFFF
.L800C1A04:
/* B2204 800C1A04 11006210 */  beq        $v1, $v0, .L800C1A4C
/* B2208 800C1A08 00F00234 */   ori       $v0, $zero, 0xF000
/* B220C 800C1A0C 0F006210 */  beq        $v1, $v0, .L800C1A4C
/* B2210 800C1A10 00000000 */   nop
/* B2214 800C1A14 95060308 */  j          .L800C1A54
/* B2218 800C1A18 FF0F0831 */   andi      $t0, $t0, 0xFFF
.L800C1A1C:
/* B221C 800C1A1C 94060308 */  j          .L800C1A50
/* B2220 800C1A20 01000524 */   addiu     $a1, $zero, 0x1
.L800C1A24:
/* B2224 800C1A24 94060308 */  j          .L800C1A50
/* B2228 800C1A28 02000524 */   addiu     $a1, $zero, 0x2
.L800C1A2C:
/* B222C 800C1A2C 94060308 */  j          .L800C1A50
/* B2230 800C1A30 03000524 */   addiu     $a1, $zero, 0x3
.L800C1A34:
/* B2234 800C1A34 94060308 */  j          .L800C1A50
/* B2238 800C1A38 04000524 */   addiu     $a1, $zero, 0x4
.L800C1A3C:
/* B223C 800C1A3C 94060308 */  j          .L800C1A50
/* B2240 800C1A40 05000524 */   addiu     $a1, $zero, 0x5
.L800C1A44:
/* B2244 800C1A44 94060308 */  j          .L800C1A50
/* B2248 800C1A48 06000524 */   addiu     $a1, $zero, 0x6
.L800C1A4C:
/* B224C 800C1A4C 07000524 */  addiu      $a1, $zero, 0x7
.L800C1A50:
/* B2250 800C1A50 FF0F0831 */  andi       $t0, $t0, 0xFFF
.L800C1A54:
/* B2254 800C1A54 FFFFE330 */  andi       $v1, $a3, 0xFFFF
/* B2258 800C1A58 0040622C */  sltiu      $v0, $v1, 0x4000
/* B225C 800C1A5C 04004014 */  bnez       $v0, .L800C1A70
/* B2260 800C1A60 00800234 */   ori       $v0, $zero, 0x8000
/* B2264 800C1A64 23106200 */  subu       $v0, $v1, $v0
/* B2268 800C1A68 9D060308 */  j          .L800C1A74
/* B226C 800C1A6C 040082A4 */   sh        $v0, 0x4($a0)
.L800C1A70:
/* B2270 800C1A70 040087A4 */  sh         $a3, 0x4($a0)
.L800C1A74:
/* B2274 800C1A74 FFFF0331 */  andi       $v1, $t0, 0xFFFF
/* B2278 800C1A78 0040622C */  sltiu      $v0, $v1, 0x4000
/* B227C 800C1A7C 04004014 */  bnez       $v0, .L800C1A90
/* B2280 800C1A80 00800234 */   ori       $v0, $zero, 0x8000
/* B2284 800C1A84 23106200 */  subu       $v0, $v1, $v0
/* B2288 800C1A88 A5060308 */  j          .L800C1A94
/* B228C 800C1A8C 060082A4 */   sh        $v0, 0x6($a0)
.L800C1A90:
/* B2290 800C1A90 060088A4 */  sh         $t0, 0x6($a0)
.L800C1A94:
/* B2294 800C1A94 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B2298 800C1A98 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B229C 800C1A9C 080086A4 */  sh         $a2, 0x8($a0)
/* B22A0 800C1AA0 0A0085A4 */  sh         $a1, 0xA($a0)
/* B22A4 800C1AA4 B8016294 */  lhu        $v0, 0x1B8($v1)
/* B22A8 800C1AA8 00000000 */  nop
/* B22AC 800C1AAC 0C0082A4 */  sh         $v0, 0xC($a0)
/* B22B0 800C1AB0 BA016294 */  lhu        $v0, 0x1BA($v1)
/* B22B4 800C1AB4 00000000 */  nop
/* B22B8 800C1AB8 0E0082A4 */  sh         $v0, 0xE($a0)
/* B22BC 800C1ABC B0016294 */  lhu        $v0, 0x1B0($v1)
/* B22C0 800C1AC0 00000000 */  nop
/* B22C4 800C1AC4 100082A4 */  sh         $v0, 0x10($a0)
/* B22C8 800C1AC8 B2016294 */  lhu        $v0, 0x1B2($v1)
/* B22CC 800C1ACC 00000000 */  nop
/* B22D0 800C1AD0 120082A4 */  sh         $v0, 0x12($a0)
/* B22D4 800C1AD4 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B22D8 800C1AD8 00000000 */  nop
/* B22DC 800C1ADC 04004230 */  andi       $v0, $v0, 0x4
/* B22E0 800C1AE0 03004010 */  beqz       $v0, .L800C1AF0
/* B22E4 800C1AE4 01000224 */   addiu     $v0, $zero, 0x1
/* B22E8 800C1AE8 BD060308 */  j          .L800C1AF4
/* B22EC 800C1AEC 140082AC */   sw        $v0, 0x14($a0)
.L800C1AF0:
/* B22F0 800C1AF0 140080AC */  sw         $zero, 0x14($a0)
.L800C1AF4:
/* B22F4 800C1AF4 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B22F8 800C1AF8 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B22FC 800C1AFC 00000000 */  nop
/* B2300 800C1B00 AA014294 */  lhu        $v0, 0x1AA($v0)
/* B2304 800C1B04 00000000 */  nop
/* B2308 800C1B08 01004230 */  andi       $v0, $v0, 0x1
/* B230C 800C1B0C 03004010 */  beqz       $v0, .L800C1B1C
/* B2310 800C1B10 01000224 */   addiu     $v0, $zero, 0x1
/* B2314 800C1B14 C8060308 */  j          .L800C1B20
/* B2318 800C1B18 180082AC */   sw        $v0, 0x18($a0)
.L800C1B1C:
/* B231C 800C1B1C 180080AC */  sw         $zero, 0x18($a0)
.L800C1B20:
/* B2320 800C1B20 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B2324 800C1B24 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B2328 800C1B28 00000000 */  nop
/* B232C 800C1B2C B4016294 */  lhu        $v0, 0x1B4($v1)
/* B2330 800C1B30 00000000 */  nop
/* B2334 800C1B34 1C0082A4 */  sh         $v0, 0x1C($a0)
/* B2338 800C1B38 B6016294 */  lhu        $v0, 0x1B6($v1)
/* B233C 800C1B3C 00000000 */  nop
/* B2340 800C1B40 1E0082A4 */  sh         $v0, 0x1E($a0)
/* B2344 800C1B44 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B2348 800C1B48 00000000 */  nop
/* B234C 800C1B4C 08004230 */  andi       $v0, $v0, 0x8
/* B2350 800C1B50 03004010 */  beqz       $v0, .L800C1B60
/* B2354 800C1B54 01000224 */   addiu     $v0, $zero, 0x1
/* B2358 800C1B58 D9060308 */  j          .L800C1B64
/* B235C 800C1B5C 200082AC */   sw        $v0, 0x20($a0)
.L800C1B60:
/* B2360 800C1B60 200080AC */  sw         $zero, 0x20($a0)
.L800C1B64:
/* B2364 800C1B64 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B2368 800C1B68 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B236C 800C1B6C 00000000 */  nop
/* B2370 800C1B70 AA014294 */  lhu        $v0, 0x1AA($v0)
/* B2374 800C1B74 00000000 */  nop
/* B2378 800C1B78 02004230 */  andi       $v0, $v0, 0x2
/* B237C 800C1B7C 03004010 */  beqz       $v0, .L800C1B8C
/* B2380 800C1B80 01000224 */   addiu     $v0, $zero, 0x1
/* B2384 800C1B84 E4060308 */  j          .L800C1B90
/* B2388 800C1B88 240082AC */   sw        $v0, 0x24($a0)
.L800C1B8C:
/* B238C 800C1B8C 240080AC */  sw         $zero, 0x24($a0)
.L800C1B90:
/* B2390 800C1B90 0800E003 */  jr         $ra
/* B2394 800C1B94 00000000 */   nop
/* B2398 800C1B98 00000000 */  nop
/* B239C 800C1B9C 00000000 */  nop
/* B23A0 800C1BA0 00000000 */  nop
.size func_800C1894, . - func_800C1894
