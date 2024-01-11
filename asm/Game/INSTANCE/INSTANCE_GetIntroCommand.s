.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_GetIntroCommand
/* 23430 80032C30 0F008010 */  beqz       $a0, .L80032C70
/* 23434 80032C34 00000000 */   nop
/* 23438 80032C38 18CB0008 */  j          .L80032C60
/* 2343C 80032C3C 00000000 */   nop
.L80032C40:
/* 23440 80032C40 03140200 */  sra        $v0, $v0, 16
/* 23444 80032C44 0C004510 */  beq        $v0, $a1, .L80032C78
/* 23448 80032C48 21108000 */   addu      $v0, $a0, $zero
/* 2344C 80032C4C 02008284 */  lh         $v0, 0x2($a0)
/* 23450 80032C50 00000000 */  nop
/* 23454 80032C54 80100200 */  sll        $v0, $v0, 2
/* 23458 80032C58 04004224 */  addiu      $v0, $v0, 0x4
/* 2345C 80032C5C 21208200 */  addu       $a0, $a0, $v0
.L80032C60:
/* 23460 80032C60 00008284 */  lh         $v0, 0x0($a0)
/* 23464 80032C64 00008394 */  lhu        $v1, 0x0($a0)
/* 23468 80032C68 F5FF4014 */  bnez       $v0, .L80032C40
/* 2346C 80032C6C 00140300 */   sll       $v0, $v1, 16
.L80032C70:
/* 23470 80032C70 0800E003 */  jr         $ra
/* 23474 80032C74 21100000 */   addu      $v0, $zero, $zero
.L80032C78:
/* 23478 80032C78 0800E003 */  jr         $ra
/* 2347C 80032C7C 00000000 */   nop
.size INSTANCE_GetIntroCommand, . - INSTANCE_GetIntroCommand
