.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerWallcrawling
/* 93584 800A2D84 D0FC828F */  lw         $v0, %gp_rel(ExtraRot)($gp)
/* 93588 800A2D88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9358C 800A2D8C 1000BFAF */  sw         $ra, 0x10($sp)
/* 93590 800A2D90 02004494 */  lhu        $a0, 0x2($v0)
/* 93594 800A2D94 B0F98587 */  lh         $a1, %gp_rel(Raziel + 0x380)($gp)
/* 93598 800A2D98 00F88424 */  addiu      $a0, $a0, -0x800
/* 9359C 800A2D9C 00240400 */  sll        $a0, $a0, 16
/* 935A0 800A2DA0 7EE8000C */  jal        AngleDiff
/* 935A4 800A2DA4 03240400 */   sra       $a0, $a0, 16
/* 935A8 800A2DA8 1000BF8F */  lw         $ra, 0x10($sp)
/* 935AC 800A2DAC B4F982A7 */  sh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 935B0 800A2DB0 0800E003 */  jr         $ra
/* 935B4 800A2DB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SteerWallcrawling, . - SteerWallcrawling
