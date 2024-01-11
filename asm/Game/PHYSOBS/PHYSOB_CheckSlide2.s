.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckSlide2
/* 6122C 80070A2C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 61230 80070A30 2000B0AF */  sw         $s0, 0x20($sp)
/* 61234 80070A34 21808000 */  addu       $s0, $a0, $zero
/* 61238 80070A38 2400B1AF */  sw         $s1, 0x24($sp)
/* 6123C 80070A3C 2188E000 */  addu       $s1, $a3, $zero
/* 61240 80070A40 01000424 */  addiu      $a0, $zero, 0x1
/* 61244 80070A44 04108500 */  sllv       $v0, $a1, $a0
/* 61248 80070A48 21104500 */  addu       $v0, $v0, $a1
/* 6124C 80070A4C 80100200 */  sll        $v0, $v0, 2
/* 61250 80070A50 23104500 */  subu       $v0, $v0, $a1
/* 61254 80070A54 80150200 */  sll        $v0, $v0, 22
/* 61258 80070A58 032C0200 */  sra        $a1, $v0, 16
/* 6125C 80070A5C 04108600 */  sllv       $v0, $a2, $a0
/* 61260 80070A60 21104600 */  addu       $v0, $v0, $a2
/* 61264 80070A64 80100200 */  sll        $v0, $v0, 2
/* 61268 80070A68 23104600 */  subu       $v0, $v0, $a2
/* 6126C 80070A6C 80150200 */  sll        $v0, $v0, 22
/* 61270 80070A70 03340200 */  sra        $a2, $v0, 16
/* 61274 80070A74 80020224 */  addiu      $v0, $zero, 0x280
/* 61278 80070A78 1000A2AF */  sw         $v0, 0x10($sp)
/* 6127C 80070A7C 1400A2AF */  sw         $v0, 0x14($sp)
/* 61280 80070A80 6AFF0224 */  addiu      $v0, $zero, -0x96
/* 61284 80070A84 21380000 */  addu       $a3, $zero, $zero
/* 61288 80070A88 2800BFAF */  sw         $ra, 0x28($sp)
/* 6128C 80070A8C CFC4010C */  jal        SetPhysicsSlideData
/* 61290 80070A90 1800A2AF */   sw        $v0, 0x18($sp)
/* 61294 80070A94 21200002 */  addu       $a0, $s0, $zero
/* 61298 80070A98 21284000 */  addu       $a1, $v0, $zero
/* 6129C 80070A9C 01000624 */  addiu      $a2, $zero, 0x1
/* 612A0 80070AA0 1BD8010C */  jal        PhysicsCheckSliding
/* 612A4 80070AA4 000025AE */   sw        $a1, 0x0($s1)
/* 612A8 80070AA8 2800BF8F */  lw         $ra, 0x28($sp)
/* 612AC 80070AAC 2400B18F */  lw         $s1, 0x24($sp)
/* 612B0 80070AB0 2000B08F */  lw         $s0, 0x20($sp)
/* 612B4 80070AB4 0800E003 */  jr         $ra
/* 612B8 80070AB8 3000BD27 */   addiu     $sp, $sp, 0x30
.size PHYSOB_CheckSlide2, . - PHYSOB_CheckSlide2
