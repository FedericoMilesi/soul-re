.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckSlide
/* 6119C 8007099C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 611A0 800709A0 2000B0AF */  sw         $s0, 0x20($sp)
/* 611A4 800709A4 21808000 */  addu       $s0, $a0, $zero
/* 611A8 800709A8 2400B1AF */  sw         $s1, 0x24($sp)
/* 611AC 800709AC 2188E000 */  addu       $s1, $a3, $zero
/* 611B0 800709B0 01000424 */  addiu      $a0, $zero, 0x1
/* 611B4 800709B4 04108500 */  sllv       $v0, $a1, $a0
/* 611B8 800709B8 21104500 */  addu       $v0, $v0, $a1
/* 611BC 800709BC 80100200 */  sll        $v0, $v0, 2
/* 611C0 800709C0 23104500 */  subu       $v0, $v0, $a1
/* 611C4 800709C4 80150200 */  sll        $v0, $v0, 22
/* 611C8 800709C8 032C0200 */  sra        $a1, $v0, 16
/* 611CC 800709CC 04108600 */  sllv       $v0, $a2, $a0
/* 611D0 800709D0 21104600 */  addu       $v0, $v0, $a2
/* 611D4 800709D4 80100200 */  sll        $v0, $v0, 2
/* 611D8 800709D8 23104600 */  subu       $v0, $v0, $a2
/* 611DC 800709DC 80150200 */  sll        $v0, $v0, 22
/* 611E0 800709E0 03340200 */  sra        $a2, $v0, 16
/* 611E4 800709E4 80020224 */  addiu      $v0, $zero, 0x280
/* 611E8 800709E8 1000A2AF */  sw         $v0, 0x10($sp)
/* 611EC 800709EC 1400A2AF */  sw         $v0, 0x14($sp)
/* 611F0 800709F0 60FF0224 */  addiu      $v0, $zero, -0xA0
/* 611F4 800709F4 21380000 */  addu       $a3, $zero, $zero
/* 611F8 800709F8 2800BFAF */  sw         $ra, 0x28($sp)
/* 611FC 800709FC CFC4010C */  jal        SetPhysicsSlideData
/* 61200 80070A00 1800A2AF */   sw        $v0, 0x18($sp)
/* 61204 80070A04 21200002 */  addu       $a0, $s0, $zero
/* 61208 80070A08 21284000 */  addu       $a1, $v0, $zero
/* 6120C 80070A0C 01000624 */  addiu      $a2, $zero, 0x1
/* 61210 80070A10 1BD8010C */  jal        PhysicsCheckSliding
/* 61214 80070A14 000025AE */   sw        $a1, 0x0($s1)
/* 61218 80070A18 2800BF8F */  lw         $ra, 0x28($sp)
/* 6121C 80070A1C 2400B18F */  lw         $s1, 0x24($sp)
/* 61220 80070A20 2000B08F */  lw         $s0, 0x20($sp)
/* 61224 80070A24 0800E003 */  jr         $ra
/* 61228 80070A28 3000BD27 */   addiu     $sp, $sp, 0x30
.size PHYSOB_CheckSlide, . - PHYSOB_CheckSlide
