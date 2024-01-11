.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_FigureDragForSlope
/* 5EFB8 8006E7B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5EFBC 8006E7BC 1400B1AF */  sw         $s1, 0x14($sp)
/* 5EFC0 8006E7C0 2188A000 */  addu       $s1, $a1, $zero
/* 5EFC4 8006E7C4 1800B2AF */  sw         $s2, 0x18($sp)
/* 5EFC8 8006E7C8 2190C000 */  addu       $s2, $a2, $zero
/* 5EFCC 8006E7CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 5EFD0 8006E7D0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5EFD4 8006E7D4 71A3010C */  jal        PHYSOBS_IsAPushBlockAttached
/* 5EFD8 8006E7D8 21800000 */   addu      $s0, $zero, $zero
/* 5EFDC 8006E7DC 0D004014 */  bnez       $v0, .L8006E814
/* 5EFE0 8006E7E0 05000224 */   addiu     $v0, $zero, 0x5
/* 5EFE4 8006E7E4 0B002212 */  beq        $s1, $v0, .L8006E814
/* 5EFE8 8006E7E8 01000224 */   addiu     $v0, $zero, 0x1
/* 5EFEC 8006E7EC 09002212 */  beq        $s1, $v0, .L8006E814
/* 5EFF0 8006E7F0 07000224 */   addiu     $v0, $zero, 0x7
/* 5EFF4 8006E7F4 07002212 */  beq        $s1, $v0, .L8006E814
/* 5EFF8 8006E7F8 04000224 */   addiu     $v0, $zero, 0x4
/* 5EFFC 8006E7FC 05002212 */  beq        $s1, $v0, .L8006E814
/* 5F000 8006E800 02000224 */   addiu     $v0, $zero, 0x2
/* 5F004 8006E804 03002212 */  beq        $s1, $v0, .L8006E814
/* 5F008 8006E808 03000224 */   addiu     $v0, $zero, 0x3
/* 5F00C 8006E80C 04002216 */  bne        $s1, $v0, .L8006E820
/* 5F010 8006E810 21100002 */   addu      $v0, $s0, $zero
.L8006E814:
/* 5F014 8006E814 000040AE */  sw         $zero, 0x0($s2)
/* 5F018 8006E818 01001024 */  addiu      $s0, $zero, 0x1
/* 5F01C 8006E81C 21100002 */  addu       $v0, $s0, $zero
.L8006E820:
/* 5F020 8006E820 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5F024 8006E824 1800B28F */  lw         $s2, 0x18($sp)
/* 5F028 8006E828 1400B18F */  lw         $s1, 0x14($sp)
/* 5F02C 8006E82C 1000B08F */  lw         $s0, 0x10($sp)
/* 5F030 8006E830 0800E003 */  jr         $ra
/* 5F034 8006E834 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOBS_FigureDragForSlope, . - PHYSOBS_FigureDragForSlope
