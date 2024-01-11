.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_StartSpecialFade
/* 749E0 800841E0 6C01878C */  lw         $a3, 0x16C($a0)
/* 749E4 800841E4 00000000 */  nop
/* 749E8 800841E8 0400E28C */  lw         $v0, 0x4($a3)
/* 749EC 800841EC 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 749F0 800841F0 A801E5A4 */  sh         $a1, 0x1A8($a3)
/* 749F4 800841F4 25104300 */  or         $v0, $v0, $v1
/* 749F8 800841F8 0400E2AC */  sw         $v0, 0x4($a3)
/* 749FC 800841FC 04018284 */  lh         $v0, 0x104($a0)
/* 74A00 80084200 0200C01C */  bgtz       $a2, .L8008420C
/* 74A04 80084204 2328A200 */   subu      $a1, $a1, $v0
/* 74A08 80084208 01000624 */  addiu      $a2, $zero, 0x1
.L8008420C:
/* 74A0C 8008420C 1A00A600 */  div        $zero, $a1, $a2
/* 74A10 80084210 12100000 */  mflo       $v0
/* 74A14 80084214 00000000 */  nop
/* 74A18 80084218 AA01E2A4 */  sh         $v0, 0x1AA($a3)
/* 74A1C 8008421C 00140200 */  sll        $v0, $v0, 16
/* 74A20 80084220 07004014 */  bnez       $v0, .L80084240
/* 74A24 80084224 00000000 */   nop
/* 74A28 80084228 0400A104 */  bgez       $a1, .L8008423C
/* 74A2C 8008422C 01000224 */   addiu     $v0, $zero, 0x1
/* 74A30 80084230 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 74A34 80084234 0800E003 */  jr         $ra
/* 74A38 80084238 AA01E2A4 */   sh        $v0, 0x1AA($a3)
.L8008423C:
/* 74A3C 8008423C AA01E2A4 */  sh         $v0, 0x1AA($a3)
.L80084240:
/* 74A40 80084240 0800E003 */  jr         $ra
/* 74A44 80084244 00000000 */   nop
.size MON_StartSpecialFade, . - MON_StartSpecialFade
