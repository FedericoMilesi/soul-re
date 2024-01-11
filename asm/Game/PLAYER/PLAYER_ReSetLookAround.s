.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAYER_ReSetLookAround
/* 366C 80012E6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3670 80012E70 1000B0AF */  sw         $s0, 0x10($sp)
/* 3674 80012E74 21808000 */  addu       $s0, $a0, $zero
/* 3678 80012E78 1400BFAF */  sw         $ra, 0x14($sp)
/* 367C 80012E7C 92D1000C */  jal        INSTANCE_Query
/* 3680 80012E80 01000524 */   addiu     $a1, $zero, 0x1
/* 3684 80012E84 01004230 */  andi       $v0, $v0, 0x1
/* 3688 80012E88 05004010 */  beqz       $v0, .L80012EA0
/* 368C 80012E8C 00000000 */   nop
/* 3690 80012E90 F7D0020C */  jal        RAZIEL_ResetLookAround
/* 3694 80012E94 21200002 */   addu      $a0, $s0, $zero
/* 3698 80012E98 AA4B0008 */  j          .L80012EA8
/* 369C 80012E9C 00000000 */   nop
.L80012EA0:
/* 36A0 80012EA0 BFFC010C */  jal        MONAPI_ResetLookAround
/* 36A4 80012EA4 21200002 */   addu      $a0, $s0, $zero
.L80012EA8:
/* 36A8 80012EA8 1400BF8F */  lw         $ra, 0x14($sp)
/* 36AC 80012EAC 1000B08F */  lw         $s0, 0x10($sp)
/* 36B0 80012EB0 0800E003 */  jr         $ra
/* 36B4 80012EB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLAYER_ReSetLookAround, . - PLAYER_ReSetLookAround
