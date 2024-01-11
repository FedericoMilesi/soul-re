.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpMonster
/* 49530 80058D30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 49534 80058D34 1800B2AF */  sw         $s2, 0x18($sp)
/* 49538 80058D38 21908000 */  addu       $s2, $a0, $zero
/* 4953C 80058D3C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 49540 80058D40 1400B1AF */  sw         $s1, 0x14($sp)
/* 49544 80058D44 1000B0AF */  sw         $s0, 0x10($sp)
/* 49548 80058D48 1800448E */  lw         $a0, 0x18($s2)
/* 4954C 80058D4C 1000518E */  lw         $s1, 0x10($s2)
/* 49550 80058D50 03008010 */  beqz       $a0, .L80058D60
/* 49554 80058D54 00000000 */   nop
/* 49558 80058D58 8FCE010C */  jal        VRAM_ClearVramBlock
/* 4955C 80058D5C 00000000 */   nop
.L80058D60:
/* 49560 80058D60 02F9000C */  jal        OBTABLE_RemoveObjectEntry
/* 49564 80058D64 21202002 */   addu      $a0, $s1, $zero
/* 49568 80058D68 2C00228E */  lw         $v0, 0x2C($s1)
/* 4956C 80058D6C 8000033C */  lui        $v1, (0x800000 >> 16)
/* 49570 80058D70 24104300 */  and        $v0, $v0, $v1
/* 49574 80058D74 07004010 */  beqz       $v0, .L80058D94
/* 49578 80058D78 00000000 */   nop
/* 4957C 80058D7C 06002486 */  lh         $a0, 0x6($s1)
/* 49580 80058D80 00000000 */  nop
/* 49584 80058D84 03008010 */  beqz       $a0, .L80058D94
/* 49588 80058D88 00000000 */   nop
/* 4958C 80058D8C EC4A010C */  jal        aadFreeDynamicSfx
/* 49590 80058D90 00000000 */   nop
.L80058D94:
/* 49594 80058D94 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 49598 80058D98 00000000 */  nop
/* 4959C 80058D9C 0400458C */  lw         $a1, 0x4($v0)
/* 495A0 80058DA0 00000000 */  nop
/* 495A4 80058DA4 0B00A010 */  beqz       $a1, .L80058DD4
/* 495A8 80058DA8 00000000 */   nop
.L80058DAC:
/* 495AC 80058DAC 1C00A28C */  lw         $v0, 0x1C($a1)
/* 495B0 80058DB0 0800B08C */  lw         $s0, 0x8($a1)
/* 495B4 80058DB4 04002216 */  bne        $s1, $v0, .L80058DC8
/* 495B8 80058DB8 00000000 */   nop
/* 495BC 80058DBC FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 495C0 80058DC0 14CA000C */  jal        INSTANCE_ReallyRemoveInstance
/* 495C4 80058DC4 21300000 */   addu      $a2, $zero, $zero
.L80058DC8:
/* 495C8 80058DC8 21280002 */  addu       $a1, $s0, $zero
/* 495CC 80058DCC F7FFA014 */  bnez       $a1, .L80058DAC
/* 495D0 80058DD0 00000000 */   nop
.L80058DD4:
/* 495D4 80058DD4 2641010C */  jal        MEMPACK_Free
/* 495D8 80058DD8 21202002 */   addu      $a0, $s1, $zero
/* 495DC 80058DDC 100040AE */  sw         $zero, 0x10($s2)
/* 495E0 80058DE0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 495E4 80058DE4 1800B28F */  lw         $s2, 0x18($sp)
/* 495E8 80058DE8 1400B18F */  lw         $s1, 0x14($sp)
/* 495EC 80058DEC 1000B08F */  lw         $s0, 0x10($sp)
/* 495F0 80058DF0 0800E003 */  jr         $ra
/* 495F4 80058DF4 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_DumpMonster, . - STREAM_DumpMonster
