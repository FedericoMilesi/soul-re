.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineMultiIsWhere
/* 31E84 80041684 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31E88 80041688 1000B0AF */  sw         $s0, 0x10($sp)
/* 31E8C 8004168C 21808000 */  addu       $s0, $a0, $zero
/* 31E90 80041690 1400BFAF */  sw         $ra, 0x14($sp)
/* 31E94 80041694 0000048E */  lw         $a0, 0x0($s0)
/* 31E98 80041698 00000000 */  nop
/* 31E9C 8004169C 04008010 */  beqz       $a0, .L800416B0
/* 31EA0 800416A0 21180000 */   addu      $v1, $zero, $zero
/* 31EA4 800416A4 8705010C */  jal        SplineIsWhere
/* 31EA8 800416A8 10000526 */   addiu     $a1, $s0, 0x10
/* 31EAC 800416AC 21184000 */  addu       $v1, $v0, $zero
.L800416B0:
/* 31EB0 800416B0 0400048E */  lw         $a0, 0x4($s0)
/* 31EB4 800416B4 00000000 */  nop
/* 31EB8 800416B8 06008010 */  beqz       $a0, .L800416D4
/* 31EBC 800416BC 00140300 */   sll       $v0, $v1, 16
/* 31EC0 800416C0 04004014 */  bnez       $v0, .L800416D4
/* 31EC4 800416C4 00000000 */   nop
/* 31EC8 800416C8 8705010C */  jal        SplineIsWhere
/* 31ECC 800416CC 18000526 */   addiu     $a1, $s0, 0x18
/* 31ED0 800416D0 21184000 */  addu       $v1, $v0, $zero
.L800416D4:
/* 31ED4 800416D4 0800048E */  lw         $a0, 0x8($s0)
/* 31ED8 800416D8 00000000 */  nop
/* 31EDC 800416DC 06008010 */  beqz       $a0, .L800416F8
/* 31EE0 800416E0 00140300 */   sll       $v0, $v1, 16
/* 31EE4 800416E4 05004014 */  bnez       $v0, .L800416FC
/* 31EE8 800416E8 00000000 */   nop
/* 31EEC 800416EC 8705010C */  jal        SplineIsWhere
/* 31EF0 800416F0 20000526 */   addiu     $a1, $s0, 0x20
/* 31EF4 800416F4 21184000 */  addu       $v1, $v0, $zero
.L800416F8:
/* 31EF8 800416F8 00140300 */  sll        $v0, $v1, 16
.L800416FC:
/* 31EFC 800416FC 1400BF8F */  lw         $ra, 0x14($sp)
/* 31F00 80041700 1000B08F */  lw         $s0, 0x10($sp)
/* 31F04 80041704 03140200 */  sra        $v0, $v0, 16
/* 31F08 80041708 0800E003 */  jr         $ra
/* 31F0C 8004170C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SplineMultiIsWhere, . - SplineMultiIsWhere
