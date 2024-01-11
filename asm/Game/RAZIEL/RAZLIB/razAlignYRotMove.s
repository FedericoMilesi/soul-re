.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAlignYRotMove
/* 95920 800A5120 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 95924 800A5124 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 95928 800A5128 21888000 */  addu       $s1, $a0, $zero
/* 9592C 800A512C 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 95930 800A5130 21A8A000 */  addu       $s5, $a1, $zero
/* 95934 800A5134 5000B2AF */  sw         $s2, 0x50($sp)
/* 95938 800A5138 2190C000 */  addu       $s2, $a2, $zero
/* 9593C 800A513C 5800B4AF */  sw         $s4, 0x58($sp)
/* 95940 800A5140 21A0E000 */  addu       $s4, $a3, $zero
/* 95944 800A5144 4800B0AF */  sw         $s0, 0x48($sp)
/* 95948 800A5148 2000B027 */  addiu      $s0, $sp, 0x20
/* 9594C 800A514C 21200002 */  addu       $a0, $s0, $zero
/* 95950 800A5150 21280000 */  addu       $a1, $zero, $zero
/* 95954 800A5154 5400B3AF */  sw         $s3, 0x54($sp)
/* 95958 800A5158 7800B38F */  lw         $s3, 0x78($sp)
/* 9595C 800A515C 6000BFAF */  sw         $ra, 0x60($sp)
/* 95960 800A5160 2EF2020C */  jal        func_800BC8B8
/* 95964 800A5164 08000624 */   addiu     $a2, $zero, 0x8
/* 95968 800A5168 21204002 */  addu       $a0, $s2, $zero
/* 9596C 800A516C 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 95970 800A5170 5C002526 */   addiu     $a1, $s1, 0x5C
/* 95974 800A5174 21200002 */  addu       $a0, $s0, $zero
/* 95978 800A5178 2800B027 */  addiu      $s0, $sp, 0x28
/* 9597C 800A517C 21280002 */  addu       $a1, $s0, $zero
/* 95980 800A5180 21105300 */  addu       $v0, $v0, $s3
/* 95984 800A5184 040082A6 */  sh         $v0, 0x4($s4)
/* 95988 800A5188 3DE3010C */  jal        func_80078CF4
/* 9598C 800A518C 2400A2A7 */   sh        $v0, 0x24($sp)
/* 95990 800A5190 21200002 */  addu       $a0, $s0, $zero
/* 95994 800A5194 1000A527 */  addiu      $a1, $sp, 0x10
/* 95998 800A5198 1800A627 */  addiu      $a2, $sp, 0x18
/* 9599C 800A519C 1000A0A7 */  sh         $zero, 0x10($sp)
/* 959A0 800A51A0 1400A0A7 */  sh         $zero, 0x14($sp)
/* 959A4 800A51A4 0EF3020C */  jal        func_800BCC38
/* 959A8 800A51A8 1200B5A7 */   sh        $s5, 0x12($sp)
/* 959AC 800A51AC 5C002296 */  lhu        $v0, 0x5C($s1)
/* 959B0 800A51B0 1800A397 */  lhu        $v1, 0x18($sp)
/* 959B4 800A51B4 00000000 */  nop
/* 959B8 800A51B8 21104300 */  addu       $v0, $v0, $v1
/* 959BC 800A51BC 000042A6 */  sh         $v0, 0x0($s2)
/* 959C0 800A51C0 5E002296 */  lhu        $v0, 0x5E($s1)
/* 959C4 800A51C4 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 959C8 800A51C8 00000000 */  nop
/* 959CC 800A51CC 21104300 */  addu       $v0, $v0, $v1
/* 959D0 800A51D0 020042A6 */  sh         $v0, 0x2($s2)
/* 959D4 800A51D4 6000BF8F */  lw         $ra, 0x60($sp)
/* 959D8 800A51D8 5C00B58F */  lw         $s5, 0x5C($sp)
/* 959DC 800A51DC 5800B48F */  lw         $s4, 0x58($sp)
/* 959E0 800A51E0 5400B38F */  lw         $s3, 0x54($sp)
/* 959E4 800A51E4 5000B28F */  lw         $s2, 0x50($sp)
/* 959E8 800A51E8 4C00B18F */  lw         $s1, 0x4C($sp)
/* 959EC 800A51EC 4800B08F */  lw         $s0, 0x48($sp)
/* 959F0 800A51F0 0800E003 */  jr         $ra
/* 959F4 800A51F4 6800BD27 */   addiu     $sp, $sp, 0x68
.size razAlignYRotMove, . - razAlignYRotMove
