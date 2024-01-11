.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SurprisedEntry
/* 79B4C 8008934C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 79B50 80089350 1000B0AF */  sw         $s0, 0x10($sp)
/* 79B54 80089354 21808000 */  addu       $s0, $a0, $zero
/* 79B58 80089358 1800BFAF */  sw         $ra, 0x18($sp)
/* 79B5C 8008935C 1400B1AF */  sw         $s1, 0x14($sp)
/* 79B60 80089360 6C01118E */  lw         $s1, 0x16C($s0)
/* 79B64 80089364 1A000524 */  addiu      $a1, $zero, 0x1A
/* 79B68 80089368 B6FF010C */  jal        MON_PlayAnim
/* 79B6C 8008936C 01000624 */   addiu     $a2, $zero, 0x1
/* 79B70 80089370 9006020C */  jal        MON_GetTime
/* 79B74 80089374 21200002 */   addu      $a0, $s0, $zero
/* 79B78 80089378 6801238E */  lw         $v1, 0x168($s1)
/* 79B7C 8008937C 00000000 */  nop
/* 79B80 80089380 0800638C */  lw         $v1, 0x8($v1)
/* 79B84 80089384 00000000 */  nop
/* 79B88 80089388 06006384 */  lh         $v1, 0x6($v1)
/* 79B8C 8008938C 00000000 */  nop
/* 79B90 80089390 21104300 */  addu       $v0, $v0, $v1
/* 79B94 80089394 140122AE */  sw         $v0, 0x114($s1)
/* 79B98 80089398 1800BF8F */  lw         $ra, 0x18($sp)
/* 79B9C 8008939C 1400B18F */  lw         $s1, 0x14($sp)
/* 79BA0 800893A0 1000B08F */  lw         $s0, 0x10($sp)
/* 79BA4 800893A4 0800E003 */  jr         $ra
/* 79BA8 800893A8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_SurprisedEntry, . - MON_SurprisedEntry
