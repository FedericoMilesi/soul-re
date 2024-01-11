.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetControllerInput
/* 928A8 800A20A8 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 928AC 800A20AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 928B0 800A20B0 1400BFAF */  sw         $ra, 0x14($sp)
/* 928B4 800A20B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 928B8 800A20B8 1400428C */  lw         $v0, 0x14($v0)
/* 928BC 800A20BC 00000000 */  nop
/* 928C0 800A20C0 00014230 */  andi       $v0, $v0, 0x100
/* 928C4 800A20C4 03004010 */  beqz       $v0, .L800A20D4
/* 928C8 800A20C8 21308000 */   addu      $a2, $a0, $zero
/* 928CC 800A20CC 9E880208 */  j          .L800A2278
/* 928D0 800A20D0 21100000 */   addu      $v0, $zero, $zero
.L800A20D4:
/* 928D4 800A20D4 0000A58C */  lw         $a1, 0x0($a1)
/* 928D8 800A20D8 05000224 */  addiu      $v0, $zero, 0x5
/* 928DC 800A20DC 0500A330 */  andi       $v1, $a1, 0x5
/* 928E0 800A20E0 0B006214 */  bne        $v1, $v0, .L800A2110
/* 928E4 800A20E4 0900A330 */   andi      $v1, $a1, 0x9
/* 928E8 800A20E8 0010103C */  lui        $s0, (0x10000010 >> 16)
/* 928EC 800A20EC 10001036 */  ori        $s0, $s0, (0x10000010 & 0xFFFF)
/* 928F0 800A20F0 0010043C */  lui        $a0, (0x10000010 >> 16)
/* 928F4 800A20F4 000A0224 */  addiu      $v0, $zero, 0xA00
/* 928F8 800A20F8 0000C2AC */  sw         $v0, 0x0($a2)
/* 928FC 800A20FC C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 92900 800A2100 1B88020C */  jal        UpdateZoneDelta
/* 92904 800A2104 10008434 */   ori       $a0, $a0, (0x10000010 & 0xFFFF)
/* 92908 800A2108 9C880208 */  j          .L800A2270
/* 9290C 800A210C 00000000 */   nop
.L800A2110:
/* 92910 800A2110 09000224 */  addiu      $v0, $zero, 0x9
/* 92914 800A2114 0B006214 */  bne        $v1, $v0, .L800A2144
/* 92918 800A2118 0600A330 */   andi      $v1, $a1, 0x6
/* 9291C 800A211C 0010103C */  lui        $s0, (0x10000020 >> 16)
/* 92920 800A2120 20001036 */  ori        $s0, $s0, (0x10000020 & 0xFFFF)
/* 92924 800A2124 0010043C */  lui        $a0, (0x10000020 >> 16)
/* 92928 800A2128 00060224 */  addiu      $v0, $zero, 0x600
/* 9292C 800A212C 0000C2AC */  sw         $v0, 0x0($a2)
/* 92930 800A2130 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 92934 800A2134 1B88020C */  jal        UpdateZoneDelta
/* 92938 800A2138 20008434 */   ori       $a0, $a0, (0x10000020 & 0xFFFF)
/* 9293C 800A213C 9C880208 */  j          .L800A2270
/* 92940 800A2140 00000000 */   nop
.L800A2144:
/* 92944 800A2144 06000224 */  addiu      $v0, $zero, 0x6
/* 92948 800A2148 0B006214 */  bne        $v1, $v0, .L800A2178
/* 9294C 800A214C 0A00A330 */   andi      $v1, $a1, 0xA
/* 92950 800A2150 0010103C */  lui        $s0, (0x10000040 >> 16)
/* 92954 800A2154 40001036 */  ori        $s0, $s0, (0x10000040 & 0xFFFF)
/* 92958 800A2158 0010043C */  lui        $a0, (0x10000040 >> 16)
/* 9295C 800A215C 000E0224 */  addiu      $v0, $zero, 0xE00
/* 92960 800A2160 0000C2AC */  sw         $v0, 0x0($a2)
/* 92964 800A2164 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 92968 800A2168 1B88020C */  jal        UpdateZoneDelta
/* 9296C 800A216C 40008434 */   ori       $a0, $a0, (0x10000040 & 0xFFFF)
/* 92970 800A2170 9C880208 */  j          .L800A2270
/* 92974 800A2174 00000000 */   nop
.L800A2178:
/* 92978 800A2178 0A000224 */  addiu      $v0, $zero, 0xA
/* 9297C 800A217C 0B006214 */  bne        $v1, $v0, .L800A21AC
/* 92980 800A2180 0100A230 */   andi      $v0, $a1, 0x1
/* 92984 800A2184 0010103C */  lui        $s0, (0x10000030 >> 16)
/* 92988 800A2188 30001036 */  ori        $s0, $s0, (0x10000030 & 0xFFFF)
/* 9298C 800A218C 0010043C */  lui        $a0, (0x10000030 >> 16)
/* 92990 800A2190 00020224 */  addiu      $v0, $zero, 0x200
/* 92994 800A2194 0000C2AC */  sw         $v0, 0x0($a2)
/* 92998 800A2198 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 9299C 800A219C 1B88020C */  jal        UpdateZoneDelta
/* 929A0 800A21A0 30008434 */   ori       $a0, $a0, (0x10000030 & 0xFFFF)
/* 929A4 800A21A4 9C880208 */  j          .L800A2270
/* 929A8 800A21A8 00000000 */   nop
.L800A21AC:
/* 929AC 800A21AC 0A004010 */  beqz       $v0, .L800A21D8
/* 929B0 800A21B0 0010103C */   lui       $s0, (0x10000001 >> 16)
/* 929B4 800A21B4 01001036 */  ori        $s0, $s0, (0x10000001 & 0xFFFF)
/* 929B8 800A21B8 0010043C */  lui        $a0, (0x10000001 >> 16)
/* 929BC 800A21BC 00080224 */  addiu      $v0, $zero, 0x800
/* 929C0 800A21C0 0000C2AC */  sw         $v0, 0x0($a2)
/* 929C4 800A21C4 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 929C8 800A21C8 1B88020C */  jal        UpdateZoneDelta
/* 929CC 800A21CC 01008434 */   ori       $a0, $a0, (0x10000001 & 0xFFFF)
/* 929D0 800A21D0 9C880208 */  j          .L800A2270
/* 929D4 800A21D4 00000000 */   nop
.L800A21D8:
/* 929D8 800A21D8 0200A230 */  andi       $v0, $a1, 0x2
/* 929DC 800A21DC 09004010 */  beqz       $v0, .L800A2204
/* 929E0 800A21E0 03001036 */   ori       $s0, $s0, (0x10000003 & 0xFFFF)
/* 929E4 800A21E4 0010043C */  lui        $a0, (0x10000003 >> 16)
/* 929E8 800A21E8 00100224 */  addiu      $v0, $zero, 0x1000
/* 929EC 800A21EC 0000C2AC */  sw         $v0, 0x0($a2)
/* 929F0 800A21F0 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 929F4 800A21F4 1B88020C */  jal        UpdateZoneDelta
/* 929F8 800A21F8 03008434 */   ori       $a0, $a0, (0x10000003 & 0xFFFF)
/* 929FC 800A21FC 9C880208 */  j          .L800A2270
/* 92A00 800A2200 00000000 */   nop
.L800A2204:
/* 92A04 800A2204 0800A230 */  andi       $v0, $a1, 0x8
/* 92A08 800A2208 0A004010 */  beqz       $v0, .L800A2234
/* 92A0C 800A220C 0010103C */   lui       $s0, (0x10000002 >> 16)
/* 92A10 800A2210 02001036 */  ori        $s0, $s0, (0x10000002 & 0xFFFF)
/* 92A14 800A2214 0010043C */  lui        $a0, (0x10000002 >> 16)
/* 92A18 800A2218 00040224 */  addiu      $v0, $zero, 0x400
/* 92A1C 800A221C 0000C2AC */  sw         $v0, 0x0($a2)
/* 92A20 800A2220 C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 92A24 800A2224 1B88020C */  jal        UpdateZoneDelta
/* 92A28 800A2228 02008434 */   ori       $a0, $a0, (0x10000002 & 0xFFFF)
/* 92A2C 800A222C 9C880208 */  j          .L800A2270
/* 92A30 800A2230 00000000 */   nop
.L800A2234:
/* 92A34 800A2234 0400A230 */  andi       $v0, $a1, 0x4
/* 92A38 800A2238 09004010 */  beqz       $v0, .L800A2260
/* 92A3C 800A223C 04001036 */   ori       $s0, $s0, (0x10000004 & 0xFFFF)
/* 92A40 800A2240 0010043C */  lui        $a0, (0x10000004 >> 16)
/* 92A44 800A2244 000C0224 */  addiu      $v0, $zero, 0xC00
/* 92A48 800A2248 0000C2AC */  sw         $v0, 0x0($a2)
/* 92A4C 800A224C C0FD858F */  lw         $a1, %gp_rel(LastRC)($gp)
/* 92A50 800A2250 1B88020C */  jal        UpdateZoneDelta
/* 92A54 800A2254 04008434 */   ori       $a0, $a0, (0x10000004 & 0xFFFF)
/* 92A58 800A2258 9C880208 */  j          .L800A2270
/* 92A5C 800A225C 00000000 */   nop
.L800A2260:
/* 92A60 800A2260 21800000 */  addu       $s0, $zero, $zero
/* 92A64 800A2264 10000224 */  addiu      $v0, $zero, 0x10
/* 92A68 800A2268 80A782AF */  sw         $v0, %gp_rel(ZoneDelta)($gp)
/* 92A6C 800A226C 0000C0AC */  sw         $zero, 0x0($a2)
.L800A2270:
/* 92A70 800A2270 C0FD90AF */  sw         $s0, %gp_rel(LastRC)($gp)
/* 92A74 800A2274 21100002 */  addu       $v0, $s0, $zero
.L800A2278:
/* 92A78 800A2278 1400BF8F */  lw         $ra, 0x14($sp)
/* 92A7C 800A227C 1000B08F */  lw         $s0, 0x10($sp)
/* 92A80 800A2280 0800E003 */  jr         $ra
/* 92A84 800A2284 1800BD27 */   addiu     $sp, $sp, 0x18
.size GetControllerInput, . - GetControllerInput
