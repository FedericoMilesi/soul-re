.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdAssignSequence
/* 46780 80055F80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46784 80055F84 1800B2AF */  sw         $s2, 0x18($sp)
/* 46788 80055F88 2190A000 */  addu       $s2, $a1, $zero
/* 4678C 80055F8C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 46790 80055F90 1400B1AF */  sw         $s1, 0x14($sp)
/* 46794 80055F94 1000B0AF */  sw         $s0, 0x10($sp)
/* 46798 80055F98 5805508E */  lw         $s0, 0x558($s2)
/* 4679C 80055F9C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 467A0 80055FA0 06009190 */  lbu        $s1, 0x6($a0)
/* 467A4 80055FA4 80181000 */  sll        $v1, $s0, 2
/* 467A8 80055FA8 21104300 */  addu       $v0, $v0, $v1
/* 467AC 80055FAC 0005428C */  lw         $v0, 0x500($v0)
/* 467B0 80055FB0 02000324 */  addiu      $v1, $zero, 0x2
/* 467B4 80055FB4 09004314 */  bne        $v0, $v1, .L80055FDC
/* 467B8 80055FB8 00000000 */   nop
/* 467BC 80055FBC 7051010C */  jal        aadGetNumDynamicSequences
/* 467C0 80055FC0 21200002 */   addu      $a0, $s0, $zero
/* 467C4 80055FC4 2A102202 */  slt        $v0, $s1, $v0
/* 467C8 80055FC8 04004010 */  beqz       $v0, .L80055FDC
/* 467CC 80055FCC 21200002 */   addu      $a0, $s0, $zero
/* 467D0 80055FD0 3C054692 */  lbu        $a2, 0x53C($s2)
/* 467D4 80055FD4 7C51010C */  jal        aadAssignDynamicSequence
/* 467D8 80055FD8 21282002 */   addu      $a1, $s1, $zero
.L80055FDC:
/* 467DC 80055FDC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 467E0 80055FE0 1800B28F */  lw         $s2, 0x18($sp)
/* 467E4 80055FE4 1400B18F */  lw         $s1, 0x14($sp)
/* 467E8 80055FE8 1000B08F */  lw         $s0, 0x10($sp)
/* 467EC 80055FEC 0800E003 */  jr         $ra
/* 467F0 80055FF0 2000BD27 */   addiu     $sp, $sp, 0x20
.size metaCmdAssignSequence, . - metaCmdAssignSequence
