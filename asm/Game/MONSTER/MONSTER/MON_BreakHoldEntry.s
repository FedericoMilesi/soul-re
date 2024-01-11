.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_BreakHoldEntry
/* 78DAC 800885AC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 78DB0 800885B0 1400B1AF */  sw         $s1, 0x14($sp)
/* 78DB4 800885B4 21888000 */  addu       $s1, $a0, $zero
/* 78DB8 800885B8 0F000524 */  addiu      $a1, $zero, 0xF
/* 78DBC 800885BC 1800BFAF */  sw         $ra, 0x18($sp)
/* 78DC0 800885C0 1000B0AF */  sw         $s0, 0x10($sp)
/* 78DC4 800885C4 6C01308E */  lw         $s0, 0x16C($s1)
/* 78DC8 800885C8 B6FF010C */  jal        MON_PlayAnim
/* 78DCC 800885CC 01000624 */   addiu     $a2, $zero, 0x1
/* 78DD0 800885D0 1000023C */  lui        $v0, (0x100000 >> 16)
/* 78DD4 800885D4 080102AE */  sw         $v0, 0x108($s0)
/* 78DD8 800885D8 1C00228E */  lw         $v0, 0x1C($s1)
/* 78DDC 800885DC 00000000 */  nop
/* 78DE0 800885E0 0000428C */  lw         $v0, 0x0($v0)
/* 78DE4 800885E4 00000000 */  nop
/* 78DE8 800885E8 00024230 */  andi       $v0, $v0, 0x200
/* 78DEC 800885EC 05004010 */  beqz       $v0, .L80088604
/* 78DF0 800885F0 00000000 */   nop
/* 78DF4 800885F4 1800228E */  lw         $v0, 0x18($s1)
/* 78DF8 800885F8 00000000 */  nop
/* 78DFC 800885FC 40004234 */  ori        $v0, $v0, 0x40
/* 78E00 80088600 180022AE */  sw         $v0, 0x18($s1)
.L80088604:
/* 78E04 80088604 1800BF8F */  lw         $ra, 0x18($sp)
/* 78E08 80088608 1400B18F */  lw         $s1, 0x14($sp)
/* 78E0C 8008860C 1000B08F */  lw         $s0, 0x10($sp)
/* 78E10 80088610 0800E003 */  jr         $ra
/* 78E14 80088614 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_BreakHoldEntry, . - MON_BreakHoldEntry
