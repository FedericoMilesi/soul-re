.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_StartBurning
/* 5B68C 8006AE8C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B690 8006AE90 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B694 8006AE94 21808000 */  addu       $s0, $a0, $zero
/* 5B698 8006AE98 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B69C 8006AE9C 1800BFAF */  sw         $ra, 0x18($sp)
/* 5B6A0 8006AEA0 80AB010C */  jal        PHYSOB_StartBurnFX
/* 5B6A4 8006AEA4 2188A000 */   addu      $s1, $a1, $zero
/* 5B6A8 8006AEA8 21200002 */  addu       $a0, $s0, $zero
/* 5B6AC 8006AEAC 65AB010C */  jal        PHYSOB_StartLighting
/* 5B6B0 8006AEB0 21282002 */   addu      $a1, $s1, $zero
/* 5B6B4 8006AEB4 1800BF8F */  lw         $ra, 0x18($sp)
/* 5B6B8 8006AEB8 1400B18F */  lw         $s1, 0x14($sp)
/* 5B6BC 8006AEBC 1000B08F */  lw         $s0, 0x10($sp)
/* 5B6C0 8006AEC0 0800E003 */  jr         $ra
/* 5B6C4 8006AEC4 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOB_StartBurning, . - PHYSOB_StartBurning
