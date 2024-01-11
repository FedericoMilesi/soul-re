.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2AnimSection_UpdateStoredFrameFromQuat
/* 82D00 80092500 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 82D04 80092504 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 82D08 80092508 21B88000 */  addu       $s7, $a0, $zero
/* 82D0C 8009250C 4400BFAF */  sw         $ra, 0x44($sp)
/* 82D10 80092510 4000BEAF */  sw         $fp, 0x40($sp)
/* 82D14 80092514 3800B6AF */  sw         $s6, 0x38($sp)
/* 82D18 80092518 3400B5AF */  sw         $s5, 0x34($sp)
/* 82D1C 8009251C 3000B4AF */  sw         $s4, 0x30($sp)
/* 82D20 80092520 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 82D24 80092524 2800B2AF */  sw         $s2, 0x28($sp)
/* 82D28 80092528 2400B1AF */  sw         $s1, 0x24($sp)
/* 82D2C 8009252C 2000B0AF */  sw         $s0, 0x20($sp)
/* 82D30 80092530 2C00F08E */  lw         $s0, 0x2C($s7)
/* 82D34 80092534 0400E286 */  lh         $v0, 0x4($s7)
/* 82D38 80092538 00000386 */  lh         $v1, 0x0($s0)
/* 82D3C 8009253C 00130200 */  sll        $v0, $v0, 12
/* 82D40 80092540 1A004300 */  div        $zero, $v0, $v1
/* 82D44 80092544 12A80000 */  mflo       $s5
/* 82D48 80092548 04001424 */  addiu      $s4, $zero, 0x4
/* 82D4C 8009254C 0300F692 */  lbu        $s6, 0x3($s7)
/* 82D50 80092550 0400048E */  lw         $a0, 0x4($s0)
/* 82D54 80092554 9B53020C */  jal        _G2AnimAlphaTable_GetValue
/* 82D58 80092558 2128A002 */   addu      $a1, $s5, $zero
/* 82D5C 8009255C 21A84000 */  addu       $s5, $v0, $zero
/* 82D60 80092560 0200E392 */  lbu        $v1, 0x2($s7)
/* 82D64 80092564 0800138E */  lw         $s3, 0x8($s0)
/* 82D68 80092568 40100300 */  sll        $v0, $v1, 1
/* 82D6C 8009256C 21104300 */  addu       $v0, $v0, $v1
/* 82D70 80092570 C0100200 */  sll        $v0, $v0, 3
/* 82D74 80092574 F8ED8327 */  addiu      $v1, $gp, %gp_rel(_segValues)
/* 82D78 80092578 21884300 */  addu       $s1, $v0, $v1
/* 82D7C 8009257C 4B00C01A */  blez       $s6, .L800926AC
/* 82D80 80092580 21807402 */   addu      $s0, $s3, $s4
/* 82D84 80092584 1800BE27 */  addiu      $fp, $sp, 0x18
/* 82D88 80092588 16003226 */  addiu      $s2, $s1, 0x16
.L8009258C:
/* 82D8C 8009258C 2120A002 */  addu       $a0, $s5, $zero
/* 82D90 80092590 21280002 */  addu       $a1, $s0, $zero
/* 82D94 80092594 08000626 */  addiu      $a2, $s0, 0x8
/* 82D98 80092598 1800A727 */  addiu      $a3, $sp, 0x18
/* 82D9C 8009259C 0D59020C */  jal        G2Quat_Slerp_VM
/* 82DA0 800925A0 1000A0AF */   sw        $zero, 0x10($sp)
/* 82DA4 800925A4 1800A28F */  lw         $v0, 0x18($sp)
/* 82DA8 800925A8 0400C38F */  lw         $v1, 0x4($fp)
/* 82DAC 800925AC 08002426 */  addiu      $a0, $s1, 0x8
/* 82DB0 800925B0 000022AE */  sw         $v0, 0x0($s1)
/* 82DB4 800925B4 10000226 */  addiu      $v0, $s0, 0x10
/* 82DB8 800925B8 EEFF43AE */  sw         $v1, -0x12($s2)
/* 82DBC 800925BC 16000326 */  addiu      $v1, $s0, 0x16
/* 82DC0 800925C0 00004C94 */  lhu        $t4, 0x0($v0)
/* 82DC4 800925C4 02004D94 */  lhu        $t5, 0x2($v0)
/* 82DC8 800925C8 04004E94 */  lhu        $t6, 0x4($v0)
/* 82DCC 800925CC 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 82DD0 800925D0 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 82DD4 800925D4 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 82DD8 800925D8 00006C94 */  lhu        $t4, 0x0($v1)
/* 82DDC 800925DC 02006D94 */  lhu        $t5, 0x2($v1)
/* 82DE0 800925E0 04006E94 */  lhu        $t6, 0x4($v1)
/* 82DE4 800925E4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 82DE8 800925E8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 82DEC 800925EC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 82DF0 800925F0 00409548 */  mtc2       $s5, $8 # handwritten instruction
/* 82DF4 800925F4 00000000 */  nop
/* 82DF8 800925F8 00000000 */  nop
/* 82DFC 800925FC 3E00A84B */  GPL        1
/* 82E00 80092600 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 82E04 80092604 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 82E08 80092608 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 82E0C 8009260C 00008CA4 */  sh         $t4, 0x0($a0)
/* 82E10 80092610 02008DA4 */  sh         $t5, 0x2($a0)
/* 82E14 80092614 04008EA4 */  sh         $t6, 0x4($a0)
/* 82E18 80092618 10002426 */  addiu      $a0, $s1, 0x10
/* 82E1C 8009261C 1C000226 */  addiu      $v0, $s0, 0x1C
/* 82E20 80092620 22000326 */  addiu      $v1, $s0, 0x22
/* 82E24 80092624 00004C94 */  lhu        $t4, 0x0($v0)
/* 82E28 80092628 02004D94 */  lhu        $t5, 0x2($v0)
/* 82E2C 8009262C 04004E94 */  lhu        $t6, 0x4($v0)
/* 82E30 80092630 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 82E34 80092634 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 82E38 80092638 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 82E3C 8009263C 00006C94 */  lhu        $t4, 0x0($v1)
/* 82E40 80092640 02006D94 */  lhu        $t5, 0x2($v1)
/* 82E44 80092644 04006E94 */  lhu        $t6, 0x4($v1)
/* 82E48 80092648 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 82E4C 8009264C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 82E50 80092650 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 82E54 80092654 00409548 */  mtc2       $s5, $8 # handwritten instruction
/* 82E58 80092658 00000000 */  nop
/* 82E5C 8009265C 00000000 */  nop
/* 82E60 80092660 3E00A84B */  GPL        1
/* 82E64 80092664 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 82E68 80092668 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 82E6C 8009266C 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 82E70 80092670 00008CA4 */  sh         $t4, 0x0($a0)
/* 82E74 80092674 02008DA4 */  sh         $t5, 0x2($a0)
/* 82E78 80092678 04008EA4 */  sh         $t6, 0x4($a0)
/* 82E7C 8009267C FFFFD626 */  addiu      $s6, $s6, -0x1
/* 82E80 80092680 FFFF9426 */  addiu      $s4, $s4, -0x1
/* 82E84 80092684 04008016 */  bnez       $s4, .L80092698
/* 82E88 80092688 28001026 */   addiu     $s0, $s0, 0x28
/* 82E8C 8009268C 0000738E */  lw         $s3, 0x0($s3)
/* 82E90 80092690 04001424 */  addiu      $s4, $zero, 0x4
/* 82E94 80092694 21807402 */  addu       $s0, $s3, $s4
.L80092698:
/* 82E98 80092698 01000224 */  addiu      $v0, $zero, 0x1
/* 82E9C 8009269C 000042A6 */  sh         $v0, 0x0($s2)
/* 82EA0 800926A0 18005226 */  addiu      $s2, $s2, 0x18
/* 82EA4 800926A4 B9FFC01E */  bgtz       $s6, .L8009258C
/* 82EA8 800926A8 18003126 */   addiu     $s1, $s1, 0x18
.L800926AC:
/* 82EAC 800926AC 0000E292 */  lbu        $v0, 0x0($s7)
/* 82EB0 800926B0 0400E396 */  lhu        $v1, 0x4($s7)
/* 82EB4 800926B4 80004234 */  ori        $v0, $v0, 0x80
/* 82EB8 800926B8 0600E3A6 */  sh         $v1, 0x6($s7)
/* 82EBC 800926BC 0000E2A2 */  sb         $v0, 0x0($s7)
/* 82EC0 800926C0 4400BF8F */  lw         $ra, 0x44($sp)
/* 82EC4 800926C4 4000BE8F */  lw         $fp, 0x40($sp)
/* 82EC8 800926C8 3C00B78F */  lw         $s7, 0x3C($sp)
/* 82ECC 800926CC 3800B68F */  lw         $s6, 0x38($sp)
/* 82ED0 800926D0 3400B58F */  lw         $s5, 0x34($sp)
/* 82ED4 800926D4 3000B48F */  lw         $s4, 0x30($sp)
/* 82ED8 800926D8 2C00B38F */  lw         $s3, 0x2C($sp)
/* 82EDC 800926DC 2800B28F */  lw         $s2, 0x28($sp)
/* 82EE0 800926E0 2400B18F */  lw         $s1, 0x24($sp)
/* 82EE4 800926E4 2000B08F */  lw         $s0, 0x20($sp)
/* 82EE8 800926E8 0800E003 */  jr         $ra
/* 82EEC 800926EC 4800BD27 */   addiu     $sp, $sp, 0x48
.size _G2AnimSection_UpdateStoredFrameFromQuat, . - _G2AnimSection_UpdateStoredFrameFromQuat
