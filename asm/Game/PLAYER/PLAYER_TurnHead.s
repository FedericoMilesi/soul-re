.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAYER_TurnHead
/* 3554 80012D54 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3558 80012D58 1000B0AF */  sw         $s0, 0x10($sp)
/* 355C 80012D5C 21808000 */  addu       $s0, $a0, $zero
/* 3560 80012D60 1400B1AF */  sw         $s1, 0x14($sp)
/* 3564 80012D64 2188A000 */  addu       $s1, $a1, $zero
/* 3568 80012D68 1800B2AF */  sw         $s2, 0x18($sp)
/* 356C 80012D6C 2190C000 */  addu       $s2, $a2, $zero
/* 3570 80012D70 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3574 80012D74 2198E000 */  addu       $s3, $a3, $zero
/* 3578 80012D78 2000BFAF */  sw         $ra, 0x20($sp)
/* 357C 80012D7C 92D1000C */  jal        INSTANCE_Query
/* 3580 80012D80 01000524 */   addiu     $a1, $zero, 0x1
/* 3584 80012D84 01004230 */  andi       $v0, $v0, 0x1
/* 3588 80012D88 07004010 */  beqz       $v0, .L80012DA8
/* 358C 80012D8C 21200002 */   addu      $a0, $s0, $zero
/* 3590 80012D90 21282002 */  addu       $a1, $s1, $zero
/* 3594 80012D94 21304002 */  addu       $a2, $s2, $zero
/* 3598 80012D98 50D0020C */  jal        RAZIEL_TurnHead
/* 359C 80012D9C 21386002 */   addu      $a3, $s3, $zero
/* 35A0 80012DA0 6E4B0008 */  j          .L80012DB8
/* 35A4 80012DA4 00000000 */   nop
.L80012DA8:
/* 35A8 80012DA8 21282002 */  addu       $a1, $s1, $zero
/* 35AC 80012DAC 21304002 */  addu       $a2, $s2, $zero
/* 35B0 80012DB0 94FC010C */  jal        MONAPI_TurnHead
/* 35B4 80012DB4 21386002 */   addu      $a3, $s3, $zero
.L80012DB8:
/* 35B8 80012DB8 2000BF8F */  lw         $ra, 0x20($sp)
/* 35BC 80012DBC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 35C0 80012DC0 1800B28F */  lw         $s2, 0x18($sp)
/* 35C4 80012DC4 1400B18F */  lw         $s1, 0x14($sp)
/* 35C8 80012DC8 1000B08F */  lw         $s0, 0x10($sp)
/* 35CC 80012DCC 0800E003 */  jr         $ra
/* 35D0 80012DD0 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLAYER_TurnHead, . - PLAYER_TurnHead
