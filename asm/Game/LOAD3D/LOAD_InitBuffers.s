.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_InitBuffers
/* 28A98 80038298 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28A9C 8003829C 00080424 */  addiu      $a0, $zero, 0x800
/* 28AA0 800382A0 1000BFAF */  sw         $ra, 0x10($sp)
/* 28AA4 800382A4 8140010C */  jal        MEMPACK_Malloc
/* 28AA8 800382A8 23000524 */   addiu     $a1, $zero, 0x23
/* 28AAC 800382AC 00080424 */  addiu      $a0, $zero, 0x800
/* 28AB0 800382B0 14BC82AF */  sw         $v0, %gp_rel(loadStatus + 0x80)($gp)
/* 28AB4 800382B4 8140010C */  jal        MEMPACK_Malloc
/* 28AB8 800382B8 23000524 */   addiu     $a1, $zero, 0x23
/* 28ABC 800382BC 18BC82AF */  sw         $v0, %gp_rel(loadStatus + 0x84)($gp)
/* 28AC0 800382C0 14BC828F */  lw         $v0, %gp_rel(loadStatus + 0x80)($gp)
/* 28AC4 800382C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 28AC8 800382C8 00000000 */  nop
/* 28ACC 800382CC 0800E003 */  jr         $ra
/* 28AD0 800382D0 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_InitBuffers, . - LOAD_InitBuffers
