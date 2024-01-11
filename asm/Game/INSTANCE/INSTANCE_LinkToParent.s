.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_LinkToParent
/* 25D1C 8003551C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 25D20 80035520 1400B1AF */  sw         $s1, 0x14($sp)
/* 25D24 80035524 2188A000 */  addu       $s1, $a1, $zero
/* 25D28 80035528 1800BFAF */  sw         $ra, 0x18($sp)
/* 25D2C 8003552C 1000B0AF */  sw         $s0, 0x10($sp)
/* 25D30 80035530 4C01228E */  lw         $v0, 0x14C($s1)
/* 25D34 80035534 21808000 */  addu       $s0, $a0, $zero
/* 25D38 80035538 500102AE */  sw         $v0, 0x150($s0)
/* 25D3C 8003553C 4C0130AE */  sw         $s0, 0x14C($s1)
/* 25D40 80035540 84000286 */  lh         $v0, 0x84($s0)
/* 25D44 80035544 480111AE */  sw         $s1, 0x148($s0)
/* 25D48 80035548 540106AE */  sw         $a2, 0x154($s0)
/* 25D4C 8003554C 84002386 */  lh         $v1, 0x84($s1)
/* 25D50 80035550 00130200 */  sll        $v0, $v0, 12
/* 25D54 80035554 1A004300 */  div        $zero, $v0, $v1
/* 25D58 80035558 12100000 */  mflo       $v0
/* 25D5C 8003555C 00000000 */  nop
/* 25D60 80035560 840002A6 */  sh         $v0, 0x84($s0)
/* 25D64 80035564 86000286 */  lh         $v0, 0x86($s0)
/* 25D68 80035568 86002386 */  lh         $v1, 0x86($s1)
/* 25D6C 8003556C 00130200 */  sll        $v0, $v0, 12
/* 25D70 80035570 1A004300 */  div        $zero, $v0, $v1
/* 25D74 80035574 12100000 */  mflo       $v0
/* 25D78 80035578 00000000 */  nop
/* 25D7C 8003557C 860002A6 */  sh         $v0, 0x86($s0)
/* 25D80 80035580 88000286 */  lh         $v0, 0x88($s0)
/* 25D84 80035584 88002386 */  lh         $v1, 0x88($s1)
/* 25D88 80035588 00130200 */  sll        $v0, $v0, 12
/* 25D8C 8003558C 1A004300 */  div        $zero, $v0, $v1
/* 25D90 80035590 12100000 */  mflo       $v0
/* 25D94 80035594 21202002 */  addu       $a0, $s1, $zero
/* 25D98 80035598 EAD5000C */  jal        INSTANCE_UpdateFamilyStreamUnitID
/* 25D9C 8003559C 880002A6 */   sh        $v0, 0x88($s0)
/* 25DA0 800355A0 21202002 */  addu       $a0, $s1, $zero
/* 25DA4 800355A4 1000053C */  lui        $a1, (0x100012 >> 16)
/* 25DA8 800355A8 1200A534 */  ori        $a1, $a1, (0x100012 & 0xFFFF)
/* 25DAC 800355AC A1D1000C */  jal        INSTANCE_Post
/* 25DB0 800355B0 21300002 */   addu      $a2, $s0, $zero
/* 25DB4 800355B4 1800028E */  lw         $v0, 0x18($s0)
/* 25DB8 800355B8 00000000 */  nop
/* 25DBC 800355BC 08004234 */  ori        $v0, $v0, 0x8
/* 25DC0 800355C0 180002AE */  sw         $v0, 0x18($s0)
/* 25DC4 800355C4 1800BF8F */  lw         $ra, 0x18($sp)
/* 25DC8 800355C8 1400B18F */  lw         $s1, 0x14($sp)
/* 25DCC 800355CC 1000B08F */  lw         $s0, 0x10($sp)
/* 25DD0 800355D0 0800E003 */  jr         $ra
/* 25DD4 800355D4 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_LinkToParent, . - INSTANCE_LinkToParent
