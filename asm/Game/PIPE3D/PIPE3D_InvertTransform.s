.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_InvertTransform
/* 2B3D4 8003ABD4 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2B3D8 8003ABD8 4800B2AF */  sw         $s2, 0x48($sp)
/* 2B3DC 8003ABDC 4400B1AF */  sw         $s1, 0x44($sp)
/* 2B3E0 8003ABE0 2188A000 */  addu       $s1, $a1, $zero
/* 2B3E4 8003ABE4 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 2B3E8 8003ABE8 4000B0AF */  sw         $s0, 0x40($sp)
/* 2B3EC 8003ABEC 12002386 */  lh         $v1, 0x12($s1)
/* 2B3F0 8003ABF0 01000224 */  addiu      $v0, $zero, 0x1
/* 2B3F4 8003ABF4 06006214 */  bne        $v1, $v0, .L8003AC10
/* 2B3F8 8003ABF8 21908000 */   addu      $s2, $a0, $zero
/* 2B3FC 8003ABFC 2000B027 */  addiu      $s0, $sp, 0x20
/* 2B400 8003AC00 29EB000C */  jal        PIPE3D_NormalizeMatrix
/* 2B404 8003AC04 21200002 */   addu      $a0, $s0, $zero
/* 2B408 8003AC08 05EB0008 */  j          .L8003AC14
/* 2B40C 8003AC0C 21200002 */   addu      $a0, $s0, $zero
.L8003AC10:
/* 2B410 8003AC10 21202002 */  addu       $a0, $s1, $zero
.L8003AC14:
/* 2B414 8003AC14 88F4020C */  jal        func_800BD220
/* 2B418 8003AC18 21284002 */   addu      $a1, $s2, $zero
/* 2B41C 8003AC1C 1400228E */  lw         $v0, 0x14($s1)
/* 2B420 8003AC20 21204002 */  addu       $a0, $s2, $zero
/* 2B424 8003AC24 23100200 */  negu       $v0, $v0
/* 2B428 8003AC28 1000A2AF */  sw         $v0, 0x10($sp)
/* 2B42C 8003AC2C 1800228E */  lw         $v0, 0x18($s1)
/* 2B430 8003AC30 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B434 8003AC34 23100200 */  negu       $v0, $v0
/* 2B438 8003AC38 1400A2AF */  sw         $v0, 0x14($sp)
/* 2B43C 8003AC3C 1C00228E */  lw         $v0, 0x1C($s1)
/* 2B440 8003AC40 14008624 */  addiu      $a2, $a0, 0x14
/* 2B444 8003AC44 23100200 */  negu       $v0, $v0
/* 2B448 8003AC48 30F4020C */  jal        func_800BD0C0
/* 2B44C 8003AC4C 1800A2AF */   sw        $v0, 0x18($sp)
/* 2B450 8003AC50 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 2B454 8003AC54 4800B28F */  lw         $s2, 0x48($sp)
/* 2B458 8003AC58 4400B18F */  lw         $s1, 0x44($sp)
/* 2B45C 8003AC5C 4000B08F */  lw         $s0, 0x40($sp)
/* 2B460 8003AC60 0800E003 */  jr         $ra
/* 2B464 8003AC64 5000BD27 */   addiu     $sp, $sp, 0x50
.size PIPE3D_InvertTransform, . - PIPE3D_InvertTransform
