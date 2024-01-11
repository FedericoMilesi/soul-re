.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PursueEntry
/* 7AF48 8008A748 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7AF4C 8008A74C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7AF50 8008A750 21888000 */  addu       $s1, $a0, $zero
/* 7AF54 8008A754 1800BFAF */  sw         $ra, 0x18($sp)
/* 7AF58 8008A758 1000B0AF */  sw         $s0, 0x10($sp)
/* 7AF5C 8008A75C 6C01308E */  lw         $s0, 0x16C($s1)
/* 7AF60 8008A760 FEFF033C */  lui        $v1, (0xFFFEFFFF >> 16)
/* 7AF64 8008A764 0000028E */  lw         $v0, 0x0($s0)
/* 7AF68 8008A768 FFFF6334 */  ori        $v1, $v1, (0xFFFEFFFF & 0xFFFF)
/* 7AF6C 8008A76C 00104234 */  ori        $v0, $v0, 0x1000
/* 7AF70 8008A770 24184300 */  and        $v1, $v0, $v1
/* 7AF74 8008A774 04004230 */  andi       $v0, $v0, 0x4
/* 7AF78 8008A778 06004010 */  beqz       $v0, .L8008A794
/* 7AF7C 8008A77C 000003AE */   sw        $v1, 0x0($s0)
/* 7AF80 8008A780 03000524 */  addiu      $a1, $zero, 0x3
/* 7AF84 8008A784 B6FF010C */  jal        MON_PlayAnim
/* 7AF88 8008A788 02000624 */   addiu     $a2, $zero, 0x2
/* 7AF8C 8008A78C EB290208 */  j          .L8008A7AC
/* 7AF90 8008A790 FDFF023C */   lui       $v0, (0xFFFDFFFF >> 16)
.L8008A794:
/* 7AF94 8008A794 C908020C */  jal        MON_GetPlanSlot
/* 7AF98 8008A798 21200002 */   addu      $a0, $s0, $zero
/* 7AF9C 8008A79C 21202002 */  addu       $a0, $s1, $zero
/* 7AFA0 8008A7A0 9D03020C */  jal        MON_PlayCombatIdle
/* 7AFA4 8008A7A4 02000524 */   addiu     $a1, $zero, 0x2
/* 7AFA8 8008A7A8 FDFF023C */  lui        $v0, (0xFFFDFFFF >> 16)
.L8008A7AC:
/* 7AFAC 8008A7AC FFFF4234 */  ori        $v0, $v0, (0xFFFDFFFF & 0xFFFF)
/* 7AFB0 8008A7B0 0000038E */  lw         $v1, 0x0($s0)
/* 7AFB4 8008A7B4 04000424 */  addiu      $a0, $zero, 0x4
/* 7AFB8 8008A7B8 080104AE */  sw         $a0, 0x108($s0)
/* 7AFBC 8008A7BC 24186200 */  and        $v1, $v1, $v0
/* 7AFC0 8008A7C0 000003AE */  sw         $v1, 0x0($s0)
/* 7AFC4 8008A7C4 1800BF8F */  lw         $ra, 0x18($sp)
/* 7AFC8 8008A7C8 1400B18F */  lw         $s1, 0x14($sp)
/* 7AFCC 8008A7CC 1000B08F */  lw         $s0, 0x10($sp)
/* 7AFD0 8008A7D0 0800E003 */  jr         $ra
/* 7AFD4 8008A7D4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_PursueEntry, . - MON_PursueEntry
