.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SoulSucked
/* 74C5C 8008445C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 74C60 80084460 1400B1AF */  sw         $s1, 0x14($sp)
/* 74C64 80084464 21888000 */  addu       $s1, $a0, $zero
/* 74C68 80084468 1800BFAF */  sw         $ra, 0x18($sp)
/* 74C6C 8008446C 1000B0AF */  sw         $s0, 0x10($sp)
/* 74C70 80084470 6C01308E */  lw         $s0, 0x16C($s1)
/* 74C74 80084474 00000000 */  nop
/* 74C78 80084478 0000028E */  lw         $v0, 0x0($s0)
/* 74C7C 8008447C 00000000 */  nop
/* 74C80 80084480 00024230 */  andi       $v0, $v0, 0x200
/* 74C84 80084484 0E004010 */  beqz       $v0, .L800844C0
/* 74C88 80084488 00000000 */   nop
/* 74C8C 8008448C 2400228E */  lw         $v0, 0x24($s1)
/* 74C90 80084490 00000000 */  nop
/* 74C94 80084494 1000428C */  lw         $v0, 0x10($v0)
/* 74C98 80084498 00000000 */  nop
/* 74C9C 8008449C 08004230 */  andi       $v0, $v0, 0x8
/* 74CA0 800844A0 04004014 */  bnez       $v0, .L800844B4
/* 74CA4 800844A4 00000000 */   nop
/* 74CA8 800844A8 9006020C */  jal        MON_GetTime
/* 74CAC 800844AC 00000000 */   nop
/* 74CB0 800844B0 0C0102AE */  sw         $v0, 0x10C($s0)
.L800844B4:
/* 74CB4 800844B4 D80000AE */  sw         $zero, 0xD8($s0)
/* 74CB8 800844B8 E910020C */  jal        MON_BirthMana
/* 74CBC 800844BC 21202002 */   addu      $a0, $s1, $zero
.L800844C0:
/* 74CC0 800844C0 1800BF8F */  lw         $ra, 0x18($sp)
/* 74CC4 800844C4 1400B18F */  lw         $s1, 0x14($sp)
/* 74CC8 800844C8 1000B08F */  lw         $s0, 0x10($sp)
/* 74CCC 800844CC 0800E003 */  jr         $ra
/* 74CD0 800844D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_SoulSucked, . - MON_SoulSucked
