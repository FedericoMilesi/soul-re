.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationSetInterpController_Vector
/* 6319C 8007299C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 631A0 800729A0 2400B3AF */  sw         $s3, 0x24($sp)
/* 631A4 800729A4 C8019324 */  addiu      $s3, $a0, 0x1C8
/* 631A8 800729A8 21206002 */  addu       $a0, $s3, $zero
/* 631AC 800729AC 2000B2AF */  sw         $s2, 0x20($sp)
/* 631B0 800729B0 FF00B230 */  andi       $s2, $a1, 0xFF
/* 631B4 800729B4 4000A38F */  lw         $v1, 0x40($sp)
/* 631B8 800729B8 21284002 */  addu       $a1, $s2, $zero
/* 631BC 800729BC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 631C0 800729C0 FF00D130 */  andi       $s1, $a2, 0xFF
/* 631C4 800729C4 1800B0AF */  sw         $s0, 0x18($sp)
/* 631C8 800729C8 4400B08F */  lw         $s0, 0x44($sp)
/* 631CC 800729CC 21302002 */  addu       $a2, $s1, $zero
/* 631D0 800729D0 2800BFAF */  sw         $ra, 0x28($sp)
/* 631D4 800729D4 40100300 */  sll        $v0, $v1, 1
/* 631D8 800729D8 21104300 */  addu       $v0, $v0, $v1
/* 631DC 800729DC C0100200 */  sll        $v0, $v0, 3
/* 631E0 800729E0 21104300 */  addu       $v0, $v0, $v1
/* 631E4 800729E4 80140200 */  sll        $v0, $v0, 18
/* 631E8 800729E8 03140200 */  sra        $v0, $v0, 16
/* 631EC 800729EC 8F42020C */  jal        G2Anim_SetInterpController_Vector
/* 631F0 800729F0 1000A2AF */   sw        $v0, 0x10($sp)
/* 631F4 800729F4 21206002 */  addu       $a0, $s3, $zero
/* 631F8 800729F8 21284002 */  addu       $a1, $s2, $zero
/* 631FC 800729FC 21302002 */  addu       $a2, $s1, $zero
/* 63200 80072A00 6542020C */  jal        G2Anim_SetControllerCallbackData
/* 63204 80072A04 21380002 */   addu      $a3, $s0, $zero
/* 63208 80072A08 2800BF8F */  lw         $ra, 0x28($sp)
/* 6320C 80072A0C 2400B38F */  lw         $s3, 0x24($sp)
/* 63210 80072A10 2000B28F */  lw         $s2, 0x20($sp)
/* 63214 80072A14 1C00B18F */  lw         $s1, 0x1C($sp)
/* 63218 80072A18 1800B08F */  lw         $s0, 0x18($sp)
/* 6321C 80072A1C 0800E003 */  jr         $ra
/* 63220 80072A20 3000BD27 */   addiu     $sp, $sp, 0x30
.size G2EmulationSetInterpController_Vector, . - G2EmulationSetInterpController_Vector
