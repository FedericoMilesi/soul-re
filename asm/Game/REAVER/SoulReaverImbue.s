.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverImbue
/* 6AC2C 8007A42C A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 6AC30 8007A430 80280500 */  sll        $a1, $a1, 2
/* 6AC34 8007A434 40010324 */  addiu      $v1, $zero, 0x140
/* 6AC38 8007A438 5000BFAF */  sw         $ra, 0x50($sp)
/* 6AC3C 8007A43C 2400828C */  lw         $v0, 0x24($a0)
/* 6AC40 8007A440 21380000 */  addu       $a3, $zero, $zero
/* 6AC44 8007A444 2128A200 */  addu       $a1, $a1, $v0
/* 6AC48 8007A448 FCFFA58C */  lw         $a1, -0x4($a1)
/* 6AC4C 8007A44C F0000224 */  addiu      $v0, $zero, 0xF0
/* 6AC50 8007A450 1800A2AF */  sw         $v0, 0x18($sp)
/* 6AC54 8007A454 FFFF023C */  lui        $v0, (0xFFFF0000 >> 16)
/* 6AC58 8007A458 2400A2AF */  sw         $v0, 0x24($sp)
/* 6AC5C 8007A45C A0000224 */  addiu      $v0, $zero, 0xA0
/* 6AC60 8007A460 3000A2AF */  sw         $v0, 0x30($sp)
/* 6AC64 8007A464 14000224 */  addiu      $v0, $zero, 0x14
/* 6AC68 8007A468 4400A2AF */  sw         $v0, 0x44($sp)
/* 6AC6C 8007A46C 01000224 */  addiu      $v0, $zero, 0x1
/* 6AC70 8007A470 1000A3AF */  sw         $v1, 0x10($sp)
/* 6AC74 8007A474 1400A0AF */  sw         $zero, 0x14($sp)
/* 6AC78 8007A478 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 6AC7C 8007A47C 2000A0AF */  sw         $zero, 0x20($sp)
/* 6AC80 8007A480 2800A0AF */  sw         $zero, 0x28($sp)
/* 6AC84 8007A484 2C00A0AF */  sw         $zero, 0x2C($sp)
/* 6AC88 8007A488 3400A3AF */  sw         $v1, 0x34($sp)
/* 6AC8C 8007A48C 3C00A0AF */  sw         $zero, 0x3C($sp)
/* 6AC90 8007A490 4000A0AF */  sw         $zero, 0x40($sp)
/* 6AC94 8007A494 4800A2AF */  sw         $v0, 0x48($sp)
/* 6AC98 8007A498 3800A5AF */  sw         $a1, 0x38($sp)
/* 6AC9C 8007A49C 4000868C */  lw         $a2, 0x40($a0)
/* 6ACA0 8007A4A0 CE2F010C */  jal        FX_DoBlastRing
/* 6ACA4 8007A4A4 5C008524 */   addiu     $a1, $a0, 0x5C
/* 6ACA8 8007A4A8 5000BF8F */  lw         $ra, 0x50($sp)
/* 6ACAC 8007A4AC 00000000 */  nop
/* 6ACB0 8007A4B0 0800E003 */  jr         $ra
/* 6ACB4 8007A4B4 5800BD27 */   addiu     $sp, $sp, 0x58
.size SoulReaverImbue, . - SoulReaverImbue
