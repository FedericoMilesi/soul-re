.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndPlay
/* 31038 80040838 88BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 3103C 8004083C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31040 80040840 03004014 */  bnez       $v0, .L80040850
/* 31044 80040844 1000BFAF */   sw        $ra, 0x10($sp)
/* 31048 80040848 18020108 */  j          .L80040860
/* 3104C 8004084C 21100000 */   addu      $v0, $zero, $zero
.L80040850:
/* 31050 80040850 5A000524 */  addiu      $a1, $zero, 0x5A
/* 31054 80040854 40000624 */  addiu      $a2, $zero, 0x40
/* 31058 80040858 BE5B010C */  jal        aadPlaySfx
/* 3105C 8004085C 21380000 */   addu      $a3, $zero, $zero
.L80040860:
/* 31060 80040860 1000BF8F */  lw         $ra, 0x10($sp)
/* 31064 80040864 00000000 */  nop
/* 31068 80040868 0800E003 */  jr         $ra
/* 3106C 8004086C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndPlay, . - SndPlay
