.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BumpUpHealth
/* 94FE4 800A47E4 28FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x3F8)($gp)
/* 94FE8 800A47E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94FEC 800A47EC 1000BFAF */  sw         $ra, 0x10($sp)
/* 94FF0 800A47F0 01004224 */  addiu      $v0, $v0, 0x1
/* 94FF4 800A47F4 28FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F8)($gp)
/* 94FF8 800A47F8 0492020C */  jal        GetMaxHealth
/* 94FFC 800A47FC 00000000 */   nop
/* 95000 800A4800 1000BF8F */  lw         $ra, 0x10($sp)
/* 95004 800A4804 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95008 800A4808 0800E003 */  jr         $ra
/* 9500C 800A480C 1800BD27 */   addiu     $sp, $sp, 0x18
.size BumpUpHealth, . - BumpUpHealth
