.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckDropOnSlope
/* 612BC 80070ABC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 612C0 80070AC0 2000B0AF */  sw         $s0, 0x20($sp)
/* 612C4 80070AC4 21808000 */  addu       $s0, $a0, $zero
/* 612C8 80070AC8 2400B1AF */  sw         $s1, 0x24($sp)
/* 612CC 80070ACC 2188E000 */  addu       $s1, $a3, $zero
/* 612D0 80070AD0 01000424 */  addiu      $a0, $zero, 0x1
/* 612D4 80070AD4 04108500 */  sllv       $v0, $a1, $a0
/* 612D8 80070AD8 21104500 */  addu       $v0, $v0, $a1
/* 612DC 80070ADC 80100200 */  sll        $v0, $v0, 2
/* 612E0 80070AE0 23104500 */  subu       $v0, $v0, $a1
/* 612E4 80070AE4 80150200 */  sll        $v0, $v0, 22
/* 612E8 80070AE8 032C0200 */  sra        $a1, $v0, 16
/* 612EC 80070AEC 04108600 */  sllv       $v0, $a2, $a0
/* 612F0 80070AF0 21104600 */  addu       $v0, $v0, $a2
/* 612F4 80070AF4 80100200 */  sll        $v0, $v0, 2
/* 612F8 80070AF8 23104600 */  subu       $v0, $v0, $a2
/* 612FC 80070AFC 80150200 */  sll        $v0, $v0, 22
/* 61300 80070B00 03340200 */  sra        $a2, $v0, 16
/* 61304 80070B04 000A0224 */  addiu      $v0, $zero, 0xA00
/* 61308 80070B08 1000A2AF */  sw         $v0, 0x10($sp)
/* 6130C 80070B0C 80020224 */  addiu      $v0, $zero, 0x280
/* 61310 80070B10 1400A2AF */  sw         $v0, 0x14($sp)
/* 61314 80070B14 60FF0224 */  addiu      $v0, $zero, -0xA0
/* 61318 80070B18 21380000 */  addu       $a3, $zero, $zero
/* 6131C 80070B1C 2800BFAF */  sw         $ra, 0x28($sp)
/* 61320 80070B20 CFC4010C */  jal        SetPhysicsSlideData
/* 61324 80070B24 1800A2AF */   sw        $v0, 0x18($sp)
/* 61328 80070B28 21200002 */  addu       $a0, $s0, $zero
/* 6132C 80070B2C 21284000 */  addu       $a1, $v0, $zero
/* 61330 80070B30 01000624 */  addiu      $a2, $zero, 0x1
/* 61334 80070B34 1BD8010C */  jal        PhysicsCheckSliding
/* 61338 80070B38 000025AE */   sw        $a1, 0x0($s1)
/* 6133C 80070B3C 2800BF8F */  lw         $ra, 0x28($sp)
/* 61340 80070B40 2400B18F */  lw         $s1, 0x24($sp)
/* 61344 80070B44 2000B08F */  lw         $s0, 0x20($sp)
/* 61348 80070B48 0800E003 */  jr         $ra
/* 6134C 80070B4C 3000BD27 */   addiu     $sp, $sp, 0x30
.size PHYSOB_CheckDropOnSlope, . - PHYSOB_CheckDropOnSlope
