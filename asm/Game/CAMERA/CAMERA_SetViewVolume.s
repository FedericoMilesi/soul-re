.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetViewVolume
/* 5700 80014F00 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5704 80014F04 1000B0AF */  sw         $s0, 0x10($sp)
/* 5708 80014F08 1400BFAF */  sw         $ra, 0x14($sp)
/* 570C 80014F0C A952000C */  jal        CAMERA_CalculateViewVolumeNormals
/* 5710 80014F10 21808000 */   addu      $s0, $a0, $zero
/* 5714 80014F14 7853000C */  jal        CAMERA_CalcVVClipInfo
/* 5718 80014F18 21200002 */   addu      $a0, $s0, $zero
/* 571C 80014F1C 1400BF8F */  lw         $ra, 0x14($sp)
/* 5720 80014F20 1000B08F */  lw         $s0, 0x10($sp)
/* 5724 80014F24 0800E003 */  jr         $ra
/* 5728 80014F28 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_SetViewVolume, . - CAMERA_SetViewVolume
