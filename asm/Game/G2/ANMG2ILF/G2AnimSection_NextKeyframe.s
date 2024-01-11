.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_NextKeyframe
/* 808AC 800900AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 808B0 800900B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 808B4 800900B4 21808000 */  addu       $s0, $a0, $zero
/* 808B8 800900B8 1400BFAF */  sw         $ra, 0x14($sp)
/* 808BC 800900BC 00000292 */  lbu        $v0, 0x0($s0)
/* 808C0 800900C0 00000000 */  nop
/* 808C4 800900C4 01004230 */  andi       $v0, $v0, 0x1
/* 808C8 800900C8 0B004014 */  bnez       $v0, .L800900F8
/* 808CC 800900CC 21100000 */   addu      $v0, $zero, $zero
/* 808D0 800900D0 7640020C */  jal        G2AnimSection_SetNotRewinding
/* 808D4 800900D4 21200002 */   addu      $a0, $s0, $zero
/* 808D8 800900D8 F058020C */  jal        G2Timer_GetFrameTime
/* 808DC 800900DC 00000000 */   nop
/* 808E0 800900E0 21200002 */  addu       $a0, $s0, $zero
/* 808E4 800900E4 00140200 */  sll        $v0, $v0, 16
/* 808E8 800900E8 F84D020C */  jal        G2AnimSection_UpdateOverInterval
/* 808EC 800900EC 032C0200 */   sra       $a1, $v0, 16
/* 808F0 800900F0 00140200 */  sll        $v0, $v0, 16
/* 808F4 800900F4 03140200 */  sra        $v0, $v0, 16
.L800900F8:
/* 808F8 800900F8 1400BF8F */  lw         $ra, 0x14($sp)
/* 808FC 800900FC 1000B08F */  lw         $s0, 0x10($sp)
/* 80900 80090100 0800E003 */  jr         $ra
/* 80904 80090104 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_NextKeyframe, . - G2AnimSection_NextKeyframe
