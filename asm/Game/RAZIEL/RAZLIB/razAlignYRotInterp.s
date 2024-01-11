.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAlignYRotInterp
/* 95AEC 800A52EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95AF0 800A52F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 95AF4 800A52F4 21808000 */  addu       $s0, $a0, $zero
/* 95AF8 800A52F8 1400BFAF */  sw         $ra, 0x14($sp)
/* 95AFC 800A52FC 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 95B00 800A5300 5C000426 */   addiu     $a0, $s0, 0x5C
/* 95B04 800A5304 780002A6 */  sh         $v0, 0x78($s0)
/* 95B08 800A5308 1400BF8F */  lw         $ra, 0x14($sp)
/* 95B0C 800A530C 1000B08F */  lw         $s0, 0x10($sp)
/* 95B10 800A5310 0800E003 */  jr         $ra
/* 95B14 800A5314 1800BD27 */   addiu     $sp, $sp, 0x18
.size razAlignYRotInterp, . - razAlignYRotInterp
