.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_PursueEntry
/* 7F3C4 8008EBC4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F3C8 8008EBC8 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F3CC 8008EBCC 21888000 */  addu       $s1, $a0, $zero
/* 7F3D0 8008EBD0 1800BFAF */  sw         $ra, 0x18($sp)
/* 7F3D4 8008EBD4 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F3D8 8008EBD8 6C01308E */  lw         $s0, 0x16C($s1)
/* 7F3DC 8008EBDC D03A020C */  jal        VWRAITH_ShouldISwoop
/* 7F3E0 8008EBE0 00000000 */   nop
/* 7F3E4 8008EBE4 05004010 */  beqz       $v0, .L8008EBFC
/* 7F3E8 8008EBE8 00000000 */   nop
/* 7F3EC 8008EBEC 0400028E */  lw         $v0, 0x4($s0)
/* 7F3F0 8008EBF0 00000000 */  nop
/* 7F3F4 8008EBF4 02004234 */  ori        $v0, $v0, 0x2
/* 7F3F8 8008EBF8 040002AE */  sw         $v0, 0x4($s0)
.L8008EBFC:
/* 7F3FC 8008EBFC 0400028E */  lw         $v0, 0x4($s0)
/* 7F400 8008EC00 00000000 */  nop
/* 7F404 8008EC04 02004230 */  andi       $v0, $v0, 0x2
/* 7F408 8008EC08 05004014 */  bnez       $v0, .L8008EC20
/* 7F40C 8008EC0C 21202002 */   addu      $a0, $s1, $zero
/* 7F410 8008EC10 D229020C */  jal        MON_PursueEntry
/* 7F414 8008EC14 21202002 */   addu      $a0, $s1, $zero
/* 7F418 8008EC18 123B0208 */  j          .L8008EC48
/* 7F41C 8008EC1C 00000000 */   nop
.L8008EC20:
/* 7F420 8008EC20 2400228E */  lw         $v0, 0x24($s1)
/* 7F424 8008EC24 00000000 */  nop
/* 7F428 8008EC28 0400438C */  lw         $v1, 0x4($v0)
/* 7F42C 8008EC2C 0800458C */  lw         $a1, 0x8($v0)
/* 7F430 8008EC30 0E006680 */  lb         $a2, 0xE($v1)
/* 7F434 8008EC34 6FFF010C */  jal        MON_PlayAnimFromList
/* 7F438 8008EC38 01000724 */   addiu     $a3, $zero, 0x1
/* 7F43C 8008EC3C 04000224 */  addiu      $v0, $zero, 0x4
/* 7F440 8008EC40 080102AE */  sw         $v0, 0x108($s0)
/* 7F444 8008EC44 2A0100A6 */  sh         $zero, 0x12A($s0)
.L8008EC48:
/* 7F448 8008EC48 1800BF8F */  lw         $ra, 0x18($sp)
/* 7F44C 8008EC4C 1400B18F */  lw         $s1, 0x14($sp)
/* 7F450 8008EC50 1000B08F */  lw         $s0, 0x10($sp)
/* 7F454 8008EC54 0800E003 */  jr         $ra
/* 7F458 8008EC58 2000BD27 */   addiu     $sp, $sp, 0x20
.size VWRAITH_PursueEntry, . - VWRAITH_PursueEntry
