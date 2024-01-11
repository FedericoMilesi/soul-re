.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSwitchAnimation
/* 62880 80072080 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62884 80072084 0200C104 */  bgez       $a2, .L80072090
/* 62888 80072088 1800BFAF */   sw        $ra, 0x18($sp)
/* 6288C 8007208C 21300000 */  addu       $a2, $zero, $zero
.L80072090:
/* 62890 80072090 3000A28F */  lw         $v0, 0x30($sp)
/* 62894 80072094 00000000 */  nop
/* 62898 80072098 1000A2AF */  sw         $v0, 0x10($sp)
/* 6289C 8007209C 3400A28F */  lw         $v0, 0x34($sp)
/* 628A0 800720A0 00000000 */  nop
/* 628A4 800720A4 1400A2AF */  sw         $v0, 0x14($sp)
/* 628A8 800720A8 0000848C */  lw         $a0, 0x0($a0)
/* 628AC 800720AC C8C7010C */  jal        G2EmulationInstanceSwitchAnimation
/* 628B0 800720B0 00000000 */   nop
/* 628B4 800720B4 1800BF8F */  lw         $ra, 0x18($sp)
/* 628B8 800720B8 00000000 */  nop
/* 628BC 800720BC 0800E003 */  jr         $ra
/* 628C0 800720C0 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationSwitchAnimation, . - G2EmulationSwitchAnimation
