.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_FreeInterpStateBlockList
/* 832A4 80092AA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 832A8 80092AA8 21288000 */  addu       $a1, $a0, $zero
/* 832AC 80092AAC 1400BFAF */  sw         $ra, 0x14($sp)
/* 832B0 80092AB0 0800A010 */  beqz       $a1, .L80092AD4
/* 832B4 80092AB4 1000B0AF */   sw        $s0, 0x10($sp)
.L80092AB8:
/* 832B8 80092AB8 0000B08C */  lw         $s0, 0x0($a1)
/* 832BC 80092ABC 88F58427 */  addiu      $a0, $gp, %gp_rel(_interpStateBlockPool)
/* 832C0 80092AC0 F857020C */  jal        G2PoolMem_Free
/* 832C4 80092AC4 00000000 */   nop
/* 832C8 80092AC8 21280002 */  addu       $a1, $s0, $zero
/* 832CC 80092ACC FAFFA014 */  bnez       $a1, .L80092AB8
/* 832D0 80092AD0 00000000 */   nop
.L80092AD4:
/* 832D4 80092AD4 1400BF8F */  lw         $ra, 0x14($sp)
/* 832D8 80092AD8 1000B08F */  lw         $s0, 0x10($sp)
/* 832DC 80092ADC 0800E003 */  jr         $ra
/* 832E0 80092AE0 1800BD27 */   addiu     $sp, $sp, 0x18
.size _G2Anim_FreeInterpStateBlockList, . - _G2Anim_FreeInterpStateBlockList
