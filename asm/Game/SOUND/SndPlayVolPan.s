.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndPlayVolPan
/* 31090 80040890 88BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 31094 80040894 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31098 80040898 03004014 */  bnez       $v0, .L800408A8
/* 3109C 8004089C 1000BFAF */   sw        $ra, 0x10($sp)
/* 310A0 800408A0 2F020108 */  j          .L800408BC
/* 310A4 800408A4 21100000 */   addu      $v0, $zero, $zero
.L800408A8:
/* 310A8 800408A8 003C0700 */  sll        $a3, $a3, 16
/* 310AC 800408AC FFFFA530 */  andi       $a1, $a1, 0xFFFF
/* 310B0 800408B0 FFFFC630 */  andi       $a2, $a2, 0xFFFF
/* 310B4 800408B4 BE5B010C */  jal        aadPlaySfx
/* 310B8 800408B8 033C0700 */   sra       $a3, $a3, 16
.L800408BC:
/* 310BC 800408BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 310C0 800408C0 00000000 */  nop
/* 310C4 800408C4 0800E003 */  jr         $ra
/* 310C8 800408C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndPlayVolPan, . - SndPlayVolPan
