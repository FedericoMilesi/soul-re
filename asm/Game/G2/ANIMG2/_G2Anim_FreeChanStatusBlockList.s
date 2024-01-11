.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_FreeChanStatusBlockList
/* 8562C 80094E2C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 85630 80094E30 21288000 */  addu       $a1, $a0, $zero
/* 85634 80094E34 1400BFAF */  sw         $ra, 0x14($sp)
/* 85638 80094E38 0800A010 */  beqz       $a1, .L80094E5C
/* 8563C 80094E3C 1000B0AF */   sw        $s0, 0x10($sp)
.L80094E40:
/* 85640 80094E40 0000B08C */  lw         $s0, 0x0($a1)
/* 85644 80094E44 E8ED8427 */  addiu      $a0, $gp, %gp_rel(_chanStatusBlockPool)
/* 85648 80094E48 F857020C */  jal        G2PoolMem_Free
/* 8564C 80094E4C 00000000 */   nop
/* 85650 80094E50 21280002 */  addu       $a1, $s0, $zero
/* 85654 80094E54 FAFFA014 */  bnez       $a1, .L80094E40
/* 85658 80094E58 00000000 */   nop
.L80094E5C:
/* 8565C 80094E5C 1400BF8F */  lw         $ra, 0x14($sp)
/* 85660 80094E60 1000B08F */  lw         $s0, 0x10($sp)
/* 85664 80094E64 0800E003 */  jr         $ra
/* 85668 80094E68 1800BD27 */   addiu     $sp, $sp, 0x18
.size _G2Anim_FreeChanStatusBlockList, . - _G2Anim_FreeChanStatusBlockList
