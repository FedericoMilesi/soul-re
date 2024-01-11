.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_GetBspTree
/* 4FC74 8005F474 0800828C */  lw         $v0, 0x8($a0)
/* 4FC78 8005F478 00000000 */  nop
/* 4FC7C 8005F47C 0000428C */  lw         $v0, 0x0($v0)
/* 4FC80 8005F480 00000000 */  nop
/* 4FC84 8005F484 4400438C */  lw         $v1, 0x44($v0)
/* 4FC88 8005F488 00000000 */  nop
/* 4FC8C 8005F48C 0F006010 */  beqz       $v1, .L8005F4CC
/* 4FC90 8005F490 00000000 */   nop
/* 4FC94 8005F494 0D006018 */  blez       $v1, .L8005F4CC
/* 4FC98 8005F498 21200000 */   addu      $a0, $zero, $zero
/* 4FC9C 8005F49C 21306000 */  addu       $a2, $v1, $zero
/* 4FCA0 8005F4A0 4800438C */  lw         $v1, 0x48($v0)
.L8005F4A4:
/* 4FCA4 8005F4A4 00000000 */  nop
/* 4FCA8 8005F4A8 1A006284 */  lh         $v0, 0x1A($v1)
/* 4FCAC 8005F4AC 00000000 */  nop
/* 4FCB0 8005F4B0 03004514 */  bne        $v0, $a1, .L8005F4C0
/* 4FCB4 8005F4B4 01008424 */   addiu     $a0, $a0, 0x1
/* 4FCB8 8005F4B8 0800E003 */  jr         $ra
/* 4FCBC 8005F4BC 21106000 */   addu      $v0, $v1, $zero
.L8005F4C0:
/* 4FCC0 8005F4C0 2A108600 */  slt        $v0, $a0, $a2
/* 4FCC4 8005F4C4 F7FF4014 */  bnez       $v0, .L8005F4A4
/* 4FCC8 8005F4C8 24006324 */   addiu     $v1, $v1, 0x24
.L8005F4CC:
/* 4FCCC 8005F4CC 0800E003 */  jr         $ra
/* 4FCD0 8005F4D0 21100000 */   addu      $v0, $zero, $zero
.size STREAM_GetBspTree, . - STREAM_GetBspTree
