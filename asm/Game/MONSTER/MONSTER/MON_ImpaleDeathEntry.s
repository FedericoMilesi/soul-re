.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ImpaleDeathEntry
/* 79588 80088D88 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7958C 80088D8C 1000B0AF */  sw         $s0, 0x10($sp)
/* 79590 80088D90 21808000 */  addu       $s0, $a0, $zero
/* 79594 80088D94 0D000524 */  addiu      $a1, $zero, 0xD
/* 79598 80088D98 1800BFAF */  sw         $ra, 0x18($sp)
/* 7959C 80088D9C 1400B1AF */  sw         $s1, 0x14($sp)
/* 795A0 80088DA0 6C01118E */  lw         $s1, 0x16C($s0)
/* 795A4 80088DA4 B6FF010C */  jal        MON_PlayAnim
/* 795A8 80088DA8 01000624 */   addiu     $a2, $zero, 0x1
/* 795AC 80088DAC 21200002 */  addu       $a0, $s0, $zero
/* 795B0 80088DB0 0000228E */  lw         $v0, 0x0($s1)
/* 795B4 80088DB4 2000033C */  lui        $v1, (0x200000 >> 16)
/* 795B8 80088DB8 25104300 */  or         $v0, $v0, $v1
/* 795BC 80088DBC EFFF0324 */  addiu      $v1, $zero, -0x11
/* 795C0 80088DC0 24104300 */  and        $v0, $v0, $v1
/* 795C4 80088DC4 7BFE010C */  jal        MON_TurnOffAllSpheres
/* 795C8 80088DC8 000022AE */   sw        $v0, 0x0($s1)
/* 795CC 80088DCC 9006020C */  jal        MON_GetTime
/* 795D0 80088DD0 21200002 */   addu      $a0, $s0, $zero
/* 795D4 80088DD4 21200002 */  addu       $a0, $s0, $zero
/* 795D8 80088DD8 30754224 */  addiu      $v0, $v0, 0x7530
/* 795DC 80088DDC 140122AE */  sw         $v0, 0x114($s1)
/* 795E0 80088DE0 800180AC */  sw         $zero, 0x180($a0)
/* 795E4 80088DE4 840180AC */  sw         $zero, 0x184($a0)
/* 795E8 80088DE8 740180AC */  sw         $zero, 0x174($a0)
/* 795EC 80088DEC 8209020C */  jal        MON_DropAllObjects
/* 795F0 80088DF0 780180AC */   sw        $zero, 0x178($a0)
/* 795F4 80088DF4 1800BF8F */  lw         $ra, 0x18($sp)
/* 795F8 80088DF8 1400B18F */  lw         $s1, 0x14($sp)
/* 795FC 80088DFC 1000B08F */  lw         $s0, 0x10($sp)
/* 79600 80088E00 0800E003 */  jr         $ra
/* 79604 80088E04 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_ImpaleDeathEntry, . - MON_ImpaleDeathEntry
