.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_SetupSource
/* A5534 800B4D34 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A5538 800B4D38 2800B0AF */  sw         $s0, 0x28($sp)
/* A553C 800B4D3C 1800B027 */  addiu      $s0, $sp, 0x18
/* A5540 800B4D40 21200002 */  addu       $a0, $s0, $zero
/* A5544 800B4D44 2C00BFAF */  sw         $ra, 0x2C($sp)
/* A5548 800B4D48 B101030C */  jal        func_800C06C4
/* A554C 800B4D4C 01000524 */   addiu     $a1, $zero, 0x1
/* A5550 800B4D50 05EA020C */  jal        func_800BA814
/* A5554 800B4D54 21200002 */   addu      $a0, $s0, $zero
/* A5558 800B4D58 1000A427 */  addiu      $a0, $sp, 0x10
/* A555C 800B4D5C 21280000 */  addu       $a1, $zero, $zero
/* A5560 800B4D60 CCBD868F */  lw         $a2, %gp_rel(gameTrackerX + 0x4)($gp)
/* A5564 800B4D64 00020224 */  addiu      $v0, $zero, 0x200
/* A5568 800B4D68 1400A2A7 */  sh         $v0, 0x14($sp)
/* A556C 800B4D6C F0000224 */  addiu      $v0, $zero, 0xF0
/* A5570 800B4D70 1000A0A7 */  sh         $zero, 0x10($sp)
/* A5574 800B4D74 1600A2A7 */  sh         $v0, 0x16($sp)
/* A5578 800B4D78 00120600 */  sll        $v0, $a2, 8
/* A557C 800B4D7C 0100C638 */  xori       $a2, $a2, 0x1
/* A5580 800B4D80 00320600 */  sll        $a2, $a2, 8
/* A5584 800B4D84 ACE9020C */  jal        func_800BA6B0
/* A5588 800B4D88 1200A2A7 */   sh        $v0, 0x12($sp)
/* A558C 800B4D8C 21200002 */  addu       $a0, $s0, $zero
/* A5590 800B4D90 B101030C */  jal        func_800C06C4
/* A5594 800B4D94 21280000 */   addu      $a1, $zero, $zero
/* A5598 800B4D98 05EA020C */  jal        func_800BA814
/* A559C 800B4D9C 21200002 */   addu      $a0, $s0, $zero
/* A55A0 800B4DA0 0FE9020C */  jal        func_800BA43C
/* A55A4 800B4DA4 21200000 */   addu      $a0, $zero, $zero
/* A55A8 800B4DA8 CCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* A55AC 800B4DAC 00000000 */  nop
/* A55B0 800B4DB0 40200200 */  sll        $a0, $v0, 1
/* A55B4 800B4DB4 21208200 */  addu       $a0, $a0, $v0
/* A55B8 800B4DB8 C0200400 */  sll        $a0, $a0, 3
/* A55BC 800B4DBC 23208200 */  subu       $a0, $a0, $v0
/* A55C0 800B4DC0 80200400 */  sll        $a0, $a0, 2
/* A55C4 800B4DC4 88BC8227 */  addiu      $v0, $gp, %gp_rel(draw)
/* A55C8 800B4DC8 38EA020C */  jal        func_800BA8E0
/* A55CC 800B4DCC 21208200 */   addu      $a0, $a0, $v0
/* A55D0 800B4DD0 2C00BF8F */  lw         $ra, 0x2C($sp)
/* A55D4 800B4DD4 2800B08F */  lw         $s0, 0x28($sp)
/* A55D8 800B4DD8 0800E003 */  jr         $ra
/* A55DC 800B4DDC 3000BD27 */   addiu     $sp, $sp, 0x30
.size UNDERWORLD_SetupSource, . - UNDERWORLD_SetupSource
