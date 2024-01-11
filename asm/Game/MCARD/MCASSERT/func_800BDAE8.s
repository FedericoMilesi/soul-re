.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BDAE8
/* AE2E8 800BDAE8 0D80023C */  lui        $v0, %hi(_padFuncPort2Info)
/* AE2EC 800BDAEC 18E9428C */  lw         $v0, %lo(_padFuncPort2Info)($v0)
/* AE2F0 800BDAF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE2F4 800BDAF4 1000BFAF */  sw         $ra, 0x10($sp)
/* AE2F8 800BDAF8 09F84000 */  jalr       $v0
/* AE2FC 800BDAFC 00000000 */   nop
/* AE300 800BDB00 21184000 */  addu       $v1, $v0, $zero
/* AE304 800BDB04 37006290 */  lbu        $v0, 0x37($v1)
/* AE308 800BDB08 00000000 */  nop
/* AE30C 800BDB0C 13004014 */  bnez       $v0, .L800BDB5C
/* AE310 800BDB10 00000000 */   nop
/* AE314 800BDB14 38006290 */  lbu        $v0, 0x38($v1)
/* AE318 800BDB18 00000000 */  nop
/* AE31C 800BDB1C 0F004014 */  bnez       $v0, .L800BDB5C
/* AE320 800BDB20 00000000 */   nop
/* AE324 800BDB24 1000628C */  lw         $v0, 0x10($v1)
/* AE328 800BDB28 00000000 */  nop
/* AE32C 800BDB2C 05006210 */  beq        $v1, $v0, .L800BDB44
/* AE330 800BDB30 00000000 */   nop
/* AE334 800BDB34 39006290 */  lbu        $v0, 0x39($v1)
/* AE338 800BDB38 00000000 */  nop
/* AE33C 800BDB3C 07004014 */  bnez       $v0, .L800BDB5C
/* AE340 800BDB40 00000000 */   nop
.L800BDB44:
/* AE344 800BDB44 3000628C */  lw         $v0, 0x30($v1)
/* AE348 800BDB48 00000000 */  nop
/* AE34C 800BDB4C 00004290 */  lbu        $v0, 0x0($v0)
/* AE350 800BDB50 00000000 */  nop
/* AE354 800BDB54 12004010 */  beqz       $v0, .L800BDBA0
/* AE358 800BDB58 00000000 */   nop
.L800BDB5C:
/* AE35C 800BDB5C 49006490 */  lbu        $a0, 0x49($v1)
/* AE360 800BDB60 03000224 */  addiu      $v0, $zero, 0x3
/* AE364 800BDB64 0C008210 */  beq        $a0, $v0, .L800BDB98
/* AE368 800BDB68 04008228 */   slti      $v0, $a0, 0x4
/* AE36C 800BDB6C 05004010 */  beqz       $v0, .L800BDB84
/* AE370 800BDB70 02000224 */   addiu     $v0, $zero, 0x2
/* AE374 800BDB74 0B008210 */  beq        $a0, $v0, .L800BDBA4
/* AE378 800BDB78 01000224 */   addiu     $v0, $zero, 0x1
/* AE37C 800BDB7C E8F60208 */  j          .L800BDBA0
/* AE380 800BDB80 00000000 */   nop
.L800BDB84:
/* AE384 800BDB84 06000224 */  addiu      $v0, $zero, 0x6
/* AE388 800BDB88 06008210 */  beq        $a0, $v0, .L800BDBA4
/* AE38C 800BDB8C 04000224 */   addiu     $v0, $zero, 0x4
/* AE390 800BDB90 E8F60208 */  j          .L800BDBA0
/* AE394 800BDB94 00000000 */   nop
.L800BDB98:
/* AE398 800BDB98 E9F60208 */  j          .L800BDBA4
/* AE39C 800BDB9C 01000224 */   addiu     $v0, $zero, 0x1
.L800BDBA0:
/* AE3A0 800BDBA0 49006290 */  lbu        $v0, 0x49($v1)
.L800BDBA4:
/* AE3A4 800BDBA4 1000BF8F */  lw         $ra, 0x10($sp)
/* AE3A8 800BDBA8 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE3AC 800BDBAC 0800E003 */  jr         $ra
/* AE3B0 800BDBB0 00000000 */   nop
.size func_800BDAE8, . - func_800BDAE8
