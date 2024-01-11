.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_Segment2ScreenPt
/* 2D400 8003CC00 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 2D404 8003CC04 4000B0AF */  sw         $s0, 0x40($sp)
/* 2D408 8003CC08 2180E000 */  addu       $s0, $a3, $zero
/* 2D40C 8003CC0C 4400BFAF */  sw         $ra, 0x44($sp)
/* 2D410 8003CC10 4000828C */  lw         $v0, 0x40($a0)
/* 2D414 8003CC14 2120A000 */  addu       $a0, $a1, $zero
/* 2D418 8003CC18 40290600 */  sll        $a1, $a2, 5
/* 2D41C 8003CC1C 1000A627 */  addiu      $a2, $sp, 0x10
/* 2D420 8003CC20 59FD020C */  jal        func_800BF564
/* 2D424 8003CC24 21284500 */   addu      $a1, $v0, $a1
/* 2D428 8003CC28 52F2020C */  jal        func_800BC948
/* 2D42C 8003CC2C 1000A427 */   addiu     $a0, $sp, 0x10
/* 2D430 8003CC30 4AF2020C */  jal        func_800BC928
/* 2D434 8003CC34 1000A427 */   addiu     $a0, $sp, 0x10
/* 2D438 8003CC38 3000A227 */  addiu      $v0, $sp, 0x30
/* 2D43C 8003CC3C 3400A0A7 */  sh         $zero, 0x34($sp)
/* 2D440 8003CC40 3200A0A7 */  sh         $zero, 0x32($sp)
/* 2D444 8003CC44 3000A0A7 */  sh         $zero, 0x30($sp)
/* 2D448 8003CC48 000040C8 */  lwc2       $0, 0x0($v0)
/* 2D44C 8003CC4C 040041C8 */  lwc2       $1, 0x4($v0)
/* 2D450 8003CC50 00000000 */  nop
/* 2D454 8003CC54 00000000 */  nop
/* 2D458 8003CC58 0100184A */  RTPS
/* 2D45C 8003CC5C 00000EEA */  swc2       $14, 0x0($s0)
/* 2D460 8003CC60 3800A227 */  addiu      $v0, $sp, 0x38
/* 2D464 8003CC64 000053E8 */  swc2       $19, 0x0($v0)
/* 2D468 8003CC68 3800A28F */  lw         $v0, 0x38($sp)
/* 2D46C 8003CC6C 4400BF8F */  lw         $ra, 0x44($sp)
/* 2D470 8003CC70 4000B08F */  lw         $s0, 0x40($sp)
/* 2D474 8003CC74 83100200 */  sra        $v0, $v0, 2
/* 2D478 8003CC78 ECFF4224 */  addiu      $v0, $v0, -0x14
/* 2D47C 8003CC7C 0800E003 */  jr         $ra
/* 2D480 8003CC80 4800BD27 */   addiu     $sp, $sp, 0x48
.size PIPE3D_Segment2ScreenPt, . - PIPE3D_Segment2ScreenPt
