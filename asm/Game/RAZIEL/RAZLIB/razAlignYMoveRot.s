.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAlignYMoveRot
/* 9585C 800A505C A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 95860 800A5060 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 95864 800A5064 21988000 */  addu       $s3, $a0, $zero
/* 95868 800A5068 23100500 */  negu       $v0, $a1
/* 9586C 800A506C 4400B1AF */  sw         $s1, 0x44($sp)
/* 95870 800A5070 6800B18F */  lw         $s1, 0x68($sp)
/* 95874 800A5074 07000524 */  addiu      $a1, $zero, 0x7
/* 95878 800A5078 5000B4AF */  sw         $s4, 0x50($sp)
/* 9587C 800A507C 21A0C000 */  addu       $s4, $a2, $zero
/* 95880 800A5080 4800B2AF */  sw         $s2, 0x48($sp)
/* 95884 800A5084 2190E000 */  addu       $s2, $a3, $zero
/* 95888 800A5088 5400BFAF */  sw         $ra, 0x54($sp)
/* 9588C 800A508C 4000B0AF */  sw         $s0, 0x40($sp)
/* 95890 800A5090 1000A0A7 */  sh         $zero, 0x10($sp)
/* 95894 800A5094 1200A2A7 */  sh         $v0, 0x12($sp)
/* 95898 800A5098 92D1000C */  jal        INSTANCE_Query
/* 9589C 800A509C 1400A0A7 */   sh        $zero, 0x14($sp)
/* 958A0 800A50A0 2000B027 */  addiu      $s0, $sp, 0x20
/* 958A4 800A50A4 21200002 */  addu       $a0, $s0, $zero
/* 958A8 800A50A8 04004294 */  lhu        $v0, 0x4($v0)
/* 958AC 800A50AC 00083126 */  addiu      $s1, $s1, 0x800
/* 958B0 800A50B0 21105100 */  addu       $v0, $v0, $s1
/* 958B4 800A50B4 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 958B8 800A50B8 040042A6 */   sh        $v0, 0x4($s2)
/* 958BC 800A50BC 04004486 */  lh         $a0, 0x4($s2)
/* 958C0 800A50C0 32E4010C */  jal        func_800790C8
/* 958C4 800A50C4 21280002 */   addu      $a1, $s0, $zero
/* 958C8 800A50C8 21200002 */  addu       $a0, $s0, $zero
/* 958CC 800A50CC 1000A527 */  addiu      $a1, $sp, 0x10
/* 958D0 800A50D0 0EF3020C */  jal        func_800BCC38
/* 958D4 800A50D4 1800A627 */   addiu     $a2, $sp, 0x18
/* 958D8 800A50D8 5C006296 */  lhu        $v0, 0x5C($s3)
/* 958DC 800A50DC 1800A397 */  lhu        $v1, 0x18($sp)
/* 958E0 800A50E0 00000000 */  nop
/* 958E4 800A50E4 21104300 */  addu       $v0, $v0, $v1
/* 958E8 800A50E8 000082A6 */  sh         $v0, 0x0($s4)
/* 958EC 800A50EC 5E006296 */  lhu        $v0, 0x5E($s3)
/* 958F0 800A50F0 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 958F4 800A50F4 00000000 */  nop
/* 958F8 800A50F8 21104300 */  addu       $v0, $v0, $v1
/* 958FC 800A50FC 020082A6 */  sh         $v0, 0x2($s4)
/* 95900 800A5100 5400BF8F */  lw         $ra, 0x54($sp)
/* 95904 800A5104 5000B48F */  lw         $s4, 0x50($sp)
/* 95908 800A5108 4C00B38F */  lw         $s3, 0x4C($sp)
/* 9590C 800A510C 4800B28F */  lw         $s2, 0x48($sp)
/* 95910 800A5110 4400B18F */  lw         $s1, 0x44($sp)
/* 95914 800A5114 4000B08F */  lw         $s0, 0x40($sp)
/* 95918 800A5118 0800E003 */  jr         $ra
/* 9591C 800A511C 5800BD27 */   addiu     $sp, $sp, 0x58
.size razAlignYMoveRot, . - razAlignYMoveRot
