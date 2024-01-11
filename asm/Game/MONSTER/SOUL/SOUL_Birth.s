.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Birth
/* 7E55C 8008DD5C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7E560 8008DD60 1400B1AF */  sw         $s1, 0x14($sp)
/* 7E564 8008DD64 21888000 */  addu       $s1, $a0, $zero
/* 7E568 8008DD68 1800BFAF */  sw         $ra, 0x18($sp)
/* 7E56C 8008DD6C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7E570 8008DD70 880120AE */  sw         $zero, 0x188($s1)
/* 7E574 8008DD74 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7E578 8008DD78 6C01308E */  lw         $s0, 0x16C($s1)
/* 7E57C 8008DD7C 4B36020C */  jal        SOUL_Physics
/* 7E580 8008DD80 00000000 */   nop
/* 7E584 8008DD84 9006020C */  jal        MON_GetTime
/* 7E588 8008DD88 21202002 */   addu      $a0, $s1, $zero
/* 7E58C 8008DD8C 1401038E */  lw         $v1, 0x114($s0)
/* 7E590 8008DD90 00000000 */  nop
/* 7E594 8008DD94 2B186200 */  sltu       $v1, $v1, $v0
/* 7E598 8008DD98 03006010 */  beqz       $v1, .L8008DDA8
/* 7E59C 8008DD9C 21202002 */   addu      $a0, $s1, $zero
/* 7E5A0 8008DDA0 91FE010C */  jal        MON_SwitchState
/* 7E5A4 8008DDA4 02000524 */   addiu     $a1, $zero, 0x2
.L8008DDA8:
/* 7E5A8 8008DDA8 2436020C */  jal        SOUL_QueueHandler
/* 7E5AC 8008DDAC 21202002 */   addu      $a0, $s1, $zero
/* 7E5B0 8008DDB0 1800BF8F */  lw         $ra, 0x18($sp)
/* 7E5B4 8008DDB4 1400B18F */  lw         $s1, 0x14($sp)
/* 7E5B8 8008DDB8 1000B08F */  lw         $s0, 0x10($sp)
/* 7E5BC 8008DDBC 0800E003 */  jr         $ra
/* 7E5C0 8008DDC0 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Birth, . - SOUL_Birth
