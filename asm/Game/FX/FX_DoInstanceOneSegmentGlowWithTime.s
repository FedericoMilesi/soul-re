.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoInstanceOneSegmentGlowWithTime
/* 3BF34 8004B734 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BF38 8004B738 3800A28F */  lw         $v0, 0x38($sp)
/* 3BF3C 8004B73C 3C00A38F */  lw         $v1, 0x3C($sp)
/* 3BF40 8004B740 4000A88F */  lw         $t0, 0x40($sp)
/* 3BF44 8004B744 2000B0AF */  sw         $s0, 0x20($sp)
/* 3BF48 8004B748 4400B08F */  lw         $s0, 0x44($sp)
/* 3BF4C 8004B74C 2400BFAF */  sw         $ra, 0x24($sp)
/* 3BF50 8004B750 1000A2AF */  sw         $v0, 0x10($sp)
/* 3BF54 8004B754 1400A3AF */  sw         $v1, 0x14($sp)
/* 3BF58 8004B758 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 3BF5C 8004B75C 1800A8AF */   sw        $t0, 0x18($sp)
/* 3BF60 8004B760 40191000 */  sll        $v1, $s0, 5
/* 3BF64 8004B764 21187000 */  addu       $v1, $v1, $s0
/* 3BF68 8004B768 0E0043A4 */  sh         $v1, 0xE($v0)
/* 3BF6C 8004B76C 2400BF8F */  lw         $ra, 0x24($sp)
/* 3BF70 8004B770 2000B08F */  lw         $s0, 0x20($sp)
/* 3BF74 8004B774 0800E003 */  jr         $ra
/* 3BF78 8004B778 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_DoInstanceOneSegmentGlowWithTime, . - FX_DoInstanceOneSegmentGlowWithTime
