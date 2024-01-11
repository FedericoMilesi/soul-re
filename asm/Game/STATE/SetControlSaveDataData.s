.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetControlSaveDataData
/* 62240 80071A40 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62244 80071A44 1000B0AF */  sw         $s0, 0x10($sp)
/* 62248 80071A48 21808000 */  addu       $s0, $a0, $zero
/* 6224C 80071A4C 1400B1AF */  sw         $s1, 0x14($sp)
/* 62250 80071A50 2188A000 */  addu       $s1, $a1, $zero
/* 62254 80071A54 1800BFAF */  sw         $ra, 0x18($sp)
/* 62258 80071A58 6DC3010C */  jal        CIRC_Alloc
/* 6225C 80071A5C 08000424 */   addiu     $a0, $zero, 0x8
/* 62260 80071A60 000050AC */  sw         $s0, 0x0($v0)
/* 62264 80071A64 040051AC */  sw         $s1, 0x4($v0)
/* 62268 80071A68 1800BF8F */  lw         $ra, 0x18($sp)
/* 6226C 80071A6C 1400B18F */  lw         $s1, 0x14($sp)
/* 62270 80071A70 1000B08F */  lw         $s0, 0x10($sp)
/* 62274 80071A74 0800E003 */  jr         $ra
/* 62278 80071A78 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetControlSaveDataData, . - SetControlSaveDataData
