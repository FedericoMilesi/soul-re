.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_FacingOffset
/* 7099C 8008019C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 709A0 800801A0 1000B0AF */  sw         $s0, 0x10($sp)
/* 709A4 800801A4 2180A000 */  addu       $s0, $a1, $zero
/* 709A8 800801A8 5C008524 */  addiu      $a1, $a0, 0x5C
/* 709AC 800801AC 1400BFAF */  sw         $ra, 0x14($sp)
/* 709B0 800801B0 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 709B4 800801B4 5C000426 */   addiu     $a0, $s0, 0x5C
/* 709B8 800801B8 78000396 */  lhu        $v1, 0x78($s0)
/* 709BC 800801BC 1400BF8F */  lw         $ra, 0x14($sp)
/* 709C0 800801C0 1000B08F */  lw         $s0, 0x10($sp)
/* 709C4 800801C4 23104300 */  subu       $v0, $v0, $v1
/* 709C8 800801C8 00140200 */  sll        $v0, $v0, 16
/* 709CC 800801CC 03140200 */  sra        $v0, $v0, 16
/* 709D0 800801D0 0800E003 */  jr         $ra
/* 709D4 800801D4 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_FacingOffset, . - MON_FacingOffset
