.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_EndBurning
/* 5B70C 8006AF0C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B710 8006AF10 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B714 8006AF14 21808000 */  addu       $s0, $a0, $zero
/* 5B718 8006AF18 1800B2AF */  sw         $s2, 0x18($sp)
/* 5B71C 8006AF1C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5B720 8006AF20 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B724 8006AF24 6C01118E */  lw         $s1, 0x16C($s0)
/* 5B728 8006AF28 9635010C */  jal        FX_EndInstanceEffects
/* 5B72C 8006AF2C 2190A000 */   addu      $s2, $a1, $zero
/* 5B730 8006AF30 21200002 */  addu       $a0, $s0, $zero
/* 5B734 8006AF34 5CAB010C */  jal        PHYSOB_EndLighting
/* 5B738 8006AF38 21284002 */   addu      $a1, $s2, $zero
/* 5B73C 8006AF3C FEFF033C */  lui        $v1, (0xFFFEFFFF >> 16)
/* 5B740 8006AF40 0000228E */  lw         $v0, 0x0($s1)
/* 5B744 8006AF44 FFFF6334 */  ori        $v1, $v1, (0xFFFEFFFF & 0xFFFF)
/* 5B748 8006AF48 340020A6 */  sh         $zero, 0x34($s1)
/* 5B74C 8006AF4C 24104300 */  and        $v0, $v0, $v1
/* 5B750 8006AF50 000022AE */  sw         $v0, 0x0($s1)
/* 5B754 8006AF54 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5B758 8006AF58 1800B28F */  lw         $s2, 0x18($sp)
/* 5B75C 8006AF5C 1400B18F */  lw         $s1, 0x14($sp)
/* 5B760 8006AF60 1000B08F */  lw         $s0, 0x10($sp)
/* 5B764 8006AF64 0800E003 */  jr         $ra
/* 5B768 8006AF68 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOB_EndBurning, . - PHYSOB_EndBurning
