.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C221C
/* B2A1C 800C221C 21308000 */  addu       $a2, $a0, $zero
/* B2A20 800C2220 0D80033C */  lui        $v1, %hi(Vcount + 0x14)
/* B2A24 800C2224 C0E86324 */  addiu      $v1, $v1, %lo(Vcount + 0x14)
/* B2A28 800C2228 80100600 */  sll        $v0, $a2, 2
/* B2A2C 800C222C 21184300 */  addu       $v1, $v0, $v1
/* B2A30 800C2230 0000678C */  lw         $a3, 0x0($v1)
/* B2A34 800C2234 2120A000 */  addu       $a0, $a1, $zero
/* B2A38 800C2238 21008710 */  beq        $a0, $a3, .L800C22C0
/* B2A3C 800C223C 2110E000 */   addu      $v0, $a3, $zero
/* B2A40 800C2240 10008010 */  beqz       $a0, .L800C2284
/* B2A44 800C2244 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* B2A48 800C2248 0D80053C */  lui        $a1, %hi(Vcount + 0x10)
/* B2A4C 800C224C BCE8A58C */  lw         $a1, %lo(Vcount + 0x10)($a1)
/* B2A50 800C2250 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* B2A54 800C2254 000064AC */  sw         $a0, 0x0($v1)
/* B2A58 800C2258 0000A48C */  lw         $a0, 0x0($a1)
/* B2A5C 800C225C 1000C324 */  addiu      $v1, $a2, 0x10
/* B2A60 800C2260 24208200 */  and        $a0, $a0, $v0
/* B2A64 800C2264 01000224 */  addiu      $v0, $zero, 0x1
/* B2A68 800C2268 04106200 */  sllv       $v0, $v0, $v1
/* B2A6C 800C226C 8000033C */  lui        $v1, (0x80FFFF >> 16)
/* B2A70 800C2270 25104300 */  or         $v0, $v0, $v1
/* B2A74 800C2274 25208200 */  or         $a0, $a0, $v0
/* B2A78 800C2278 0000A4AC */  sw         $a0, 0x0($a1)
/* B2A7C 800C227C B0080308 */  j          .L800C22C0
/* B2A80 800C2280 2110E000 */   addu      $v0, $a3, $zero
.L800C2284:
/* B2A84 800C2284 0D80053C */  lui        $a1, %hi(Vcount + 0x10)
/* B2A88 800C2288 BCE8A58C */  lw         $a1, %lo(Vcount + 0x10)($a1)
/* B2A8C 800C228C FFFF4234 */  ori        $v0, $v0, (0x80FFFF & 0xFFFF)
/* B2A90 800C2290 000060AC */  sw         $zero, 0x0($v1)
/* B2A94 800C2294 0000A38C */  lw         $v1, 0x0($a1)
/* B2A98 800C2298 1000C424 */  addiu      $a0, $a2, 0x10
/* B2A9C 800C229C 24186200 */  and        $v1, $v1, $v0
/* B2AA0 800C22A0 8000023C */  lui        $v0, (0x800000 >> 16)
/* B2AA4 800C22A4 25186200 */  or         $v1, $v1, $v0
/* B2AA8 800C22A8 01000224 */  addiu      $v0, $zero, 0x1
/* B2AAC 800C22AC 04108200 */  sllv       $v0, $v0, $a0
/* B2AB0 800C22B0 27100200 */  nor        $v0, $zero, $v0
/* B2AB4 800C22B4 24186200 */  and        $v1, $v1, $v0
/* B2AB8 800C22B8 0000A3AC */  sw         $v1, 0x0($a1)
/* B2ABC 800C22BC 2110E000 */  addu       $v0, $a3, $zero
.L800C22C0:
/* B2AC0 800C22C0 0800E003 */  jr         $ra
/* B2AC4 800C22C4 00000000 */   nop
.size func_800C221C, . - func_800C221C
