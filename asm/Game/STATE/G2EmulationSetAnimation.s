.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSetAnimation
/* 62D8C 8007258C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62D90 80072590 0200C104 */  bgez       $a2, .L8007259C
/* 62D94 80072594 1800BFAF */   sw        $ra, 0x18($sp)
/* 62D98 80072598 21300000 */  addu       $a2, $zero, $zero
.L8007259C:
/* 62D9C 8007259C 3000A28F */  lw         $v0, 0x30($sp)
/* 62DA0 800725A0 00000000 */  nop
/* 62DA4 800725A4 1000A2AF */  sw         $v0, 0x10($sp)
/* 62DA8 800725A8 0000848C */  lw         $a0, 0x0($a0)
/* 62DAC 800725AC 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 62DB0 800725B0 00000000 */   nop
/* 62DB4 800725B4 1800BF8F */  lw         $ra, 0x18($sp)
/* 62DB8 800725B8 00000000 */  nop
/* 62DBC 800725BC 0800E003 */  jr         $ra
/* 62DC0 800725C0 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationSetAnimation, . - G2EmulationSetAnimation
