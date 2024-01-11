.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpSomeMonsters
/* 49684 80058E84 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 49688 80058E88 1400B1AF */  sw         $s1, 0x14($sp)
/* 4968C 80058E8C 0CBE918F */  lw         $s1, %gp_rel(gameTrackerX + 0x44)($gp)
/* 49690 80058E90 1800B2AF */  sw         $s2, 0x18($sp)
/* 49694 80058E94 21900000 */  addu       $s2, $zero, $zero
/* 49698 80058E98 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4969C 80058E9C 02001324 */  addiu      $s3, $zero, 0x2
/* 496A0 80058EA0 2000BFAF */  sw         $ra, 0x20($sp)
/* 496A4 80058EA4 1000B0AF */  sw         $s0, 0x10($sp)
/* 496A8 80058EA8 10003026 */  addiu      $s0, $s1, 0x10
.L80058EAC:
/* 496AC 80058EAC 04000286 */  lh         $v0, 0x4($s0)
/* 496B0 80058EB0 00000000 */  nop
/* 496B4 80058EB4 0B005314 */  bne        $v0, $s3, .L80058EE4
/* 496B8 80058EB8 00000000 */   nop
/* 496BC 80058EBC 0000028E */  lw         $v0, 0x0($s0)
/* 496C0 80058EC0 00000000 */  nop
/* 496C4 80058EC4 07004010 */  beqz       $v0, .L80058EE4
/* 496C8 80058EC8 00000000 */   nop
/* 496CC 80058ECC 9863010C */  jal        STREAM_IsSpecialMonster
/* 496D0 80058ED0 21202002 */   addu      $a0, $s1, $zero
/* 496D4 80058ED4 03004010 */  beqz       $v0, .L80058EE4
/* 496D8 80058ED8 00000000 */   nop
/* 496DC 80058EDC 4C63010C */  jal        STREAM_DumpMonster
/* 496E0 80058EE0 21202002 */   addu      $a0, $s1, $zero
.L80058EE4:
/* 496E4 80058EE4 01005226 */  addiu      $s2, $s2, 0x1
/* 496E8 80058EE8 24001026 */  addiu      $s0, $s0, 0x24
/* 496EC 80058EEC 3000422A */  slti       $v0, $s2, 0x30
/* 496F0 80058EF0 EEFF4014 */  bnez       $v0, .L80058EAC
/* 496F4 80058EF4 24003126 */   addiu     $s1, $s1, 0x24
/* 496F8 80058EF8 2000BF8F */  lw         $ra, 0x20($sp)
/* 496FC 80058EFC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 49700 80058F00 1800B28F */  lw         $s2, 0x18($sp)
/* 49704 80058F04 1400B18F */  lw         $s1, 0x14($sp)
/* 49708 80058F08 1000B08F */  lw         $s0, 0x10($sp)
/* 4970C 80058F0C 0800E003 */  jr         $ra
/* 49710 80058F10 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_DumpSomeMonsters, . - STREAM_DumpSomeMonsters
