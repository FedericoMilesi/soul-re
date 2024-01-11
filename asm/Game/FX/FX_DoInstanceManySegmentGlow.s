.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoInstanceManySegmentGlow
/* 3BEEC 8004B6EC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BEF0 8004B6F0 2000B0AF */  sw         $s0, 0x20($sp)
/* 3BEF4 8004B6F4 2180C000 */  addu       $s0, $a2, $zero
/* 3BEF8 8004B6F8 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3BEFC 8004B6FC 4000A38F */  lw         $v1, 0x40($sp)
/* 3BF00 8004B700 2130E000 */  addu       $a2, $a3, $zero
/* 3BF04 8004B704 1000A2AF */  sw         $v0, 0x10($sp)
/* 3BF08 8004B708 1400A3AF */  sw         $v1, 0x14($sp)
/* 3BF0C 8004B70C 1800A3AF */  sw         $v1, 0x18($sp)
/* 3BF10 8004B710 3800A78F */  lw         $a3, 0x38($sp)
/* 3BF14 8004B714 2400BFAF */  sw         $ra, 0x24($sp)
/* 3BF18 8004B718 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 3BF1C 8004B71C 00000000 */   nop
/* 3BF20 8004B720 240050A0 */  sb         $s0, 0x24($v0)
/* 3BF24 8004B724 2400BF8F */  lw         $ra, 0x24($sp)
/* 3BF28 8004B728 2000B08F */  lw         $s0, 0x20($sp)
/* 3BF2C 8004B72C 0800E003 */  jr         $ra
/* 3BF30 8004B730 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_DoInstanceManySegmentGlow, . - FX_DoInstanceManySegmentGlow
