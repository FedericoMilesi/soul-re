.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetControlInitIdleData
/* 6213C 8007193C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62140 80071940 1000B0AF */  sw         $s0, 0x10($sp)
/* 62144 80071944 21808000 */  addu       $s0, $a0, $zero
/* 62148 80071948 1400B1AF */  sw         $s1, 0x14($sp)
/* 6214C 8007194C 2188A000 */  addu       $s1, $a1, $zero
/* 62150 80071950 1800B2AF */  sw         $s2, 0x18($sp)
/* 62154 80071954 2190C000 */  addu       $s2, $a2, $zero
/* 62158 80071958 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6215C 8007195C 6DC3010C */  jal        CIRC_Alloc
/* 62160 80071960 0C000424 */   addiu     $a0, $zero, 0xC
/* 62164 80071964 000050AC */  sw         $s0, 0x0($v0)
/* 62168 80071968 040051AC */  sw         $s1, 0x4($v0)
/* 6216C 8007196C 080052AC */  sw         $s2, 0x8($v0)
/* 62170 80071970 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 62174 80071974 1800B28F */  lw         $s2, 0x18($sp)
/* 62178 80071978 1400B18F */  lw         $s1, 0x14($sp)
/* 6217C 8007197C 1000B08F */  lw         $s0, 0x10($sp)
/* 62180 80071980 0800E003 */  jr         $ra
/* 62184 80071984 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetControlInitIdleData, . - SetControlInitIdleData
