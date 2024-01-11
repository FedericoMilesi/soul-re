.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_ZYXtoXYZ
/* 2AA54 8003A254 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2AA58 8003A258 3800B0AF */  sw         $s0, 0x38($sp)
/* 2AA5C 8003A25C 21808000 */  addu       $s0, $a0, $zero
/* 2AA60 8003A260 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2AA64 8003A264 D8E2010C */  jal        func_80078B60
/* 2AA68 8003A268 1000A527 */   addiu     $a1, $sp, 0x10
/* 2AA6C 8003A26C 3000A427 */  addiu      $a0, $sp, 0x30
/* 2AA70 8003A270 1000A527 */  addiu      $a1, $sp, 0x10
/* 2AA74 8003A274 1758020C */  jal        G2EulerAngles_FromMatrix
/* 2AA78 8003A278 15000624 */   addiu     $a2, $zero, 0x15
/* 2AA7C 8003A27C 3000A297 */  lhu        $v0, 0x30($sp)
/* 2AA80 8003A280 00000000 */  nop
/* 2AA84 8003A284 000002A6 */  sh         $v0, 0x0($s0)
/* 2AA88 8003A288 3200A297 */  lhu        $v0, 0x32($sp)
/* 2AA8C 8003A28C 00000000 */  nop
/* 2AA90 8003A290 020002A6 */  sh         $v0, 0x2($s0)
/* 2AA94 8003A294 3400A297 */  lhu        $v0, 0x34($sp)
/* 2AA98 8003A298 00000000 */  nop
/* 2AA9C 8003A29C 040002A6 */  sh         $v0, 0x4($s0)
/* 2AAA0 8003A2A0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2AAA4 8003A2A4 3800B08F */  lw         $s0, 0x38($sp)
/* 2AAA8 8003A2A8 0800E003 */  jr         $ra
/* 2AAAC 8003A2AC 4000BD27 */   addiu     $sp, $sp, 0x40
.size MATH3D_ZYXtoXYZ, . - MATH3D_ZYXtoXYZ
