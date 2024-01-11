.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielCollide
/* A46DC 800B3EDC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A46E0 800B3EE0 1000B0AF */  sw         $s0, 0x10($sp)
/* A46E4 800B3EE4 21808000 */  addu       $s0, $a0, $zero
/* A46E8 800B3EE8 2000BFAF */  sw         $ra, 0x20($sp)
/* A46EC 800B3EEC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A46F0 800B3EF0 1800B2AF */  sw         $s2, 0x18($sp)
/* A46F4 800B3EF4 1400B1AF */  sw         $s1, 0x14($sp)
/* A46F8 800B3EF8 C000128E */  lw         $s2, 0xC0($s0)
/* A46FC 800B3EFC CECE020C */  jal        GetCollisionType
/* A4700 800B3F00 00000000 */   nop
/* A4704 800B3F04 01000424 */  addiu      $a0, $zero, 0x1
/* A4708 800B3F08 86004410 */  beq        $v0, $a0, .L800B4124
/* A470C 800B3F0C 00000000 */   nop
/* A4710 800B3F10 07004592 */  lbu        $a1, 0x7($s2)
/* A4714 800B3F14 00000000 */  nop
/* A4718 800B3F18 6100A410 */  beq        $a1, $a0, .L800B40A0
/* A471C 800B3F1C 04000224 */   addiu     $v0, $zero, 0x4
/* A4720 800B3F20 06004392 */  lbu        $v1, 0x6($s2)
/* A4724 800B3F24 00000000 */  nop
/* A4728 800B3F28 03006210 */  beq        $v1, $v0, .L800B3F38
/* A472C 800B3F2C 03000224 */   addiu     $v0, $zero, 0x3
/* A4730 800B3F30 7C006414 */  bne        $v1, $a0, .L800B4124
/* A4734 800B3F34 00000000 */   nop
.L800B3F38:
/* A4738 800B3F38 0800A214 */  bne        $a1, $v0, .L800B3F5C
/* A473C 800B3F3C 05000224 */   addiu     $v0, $zero, 0x5
/* A4740 800B3F40 0C00428E */  lw         $v0, 0xC($s2)
/* A4744 800B3F44 00000000 */  nop
/* A4748 800B3F48 06004290 */  lbu        $v0, 0x6($v0)
/* A474C 800B3F4C 00000000 */  nop
/* A4750 800B3F50 08004230 */  andi       $v0, $v0, 0x8
/* A4754 800B3F54 0C004010 */  beqz       $v0, .L800B3F88
/* A4758 800B3F58 05000224 */   addiu     $v0, $zero, 0x5
.L800B3F5C:
/* A475C 800B3F5C 0800A214 */  bne        $a1, $v0, .L800B3F80
/* A4760 800B3F60 02000224 */   addiu     $v0, $zero, 0x2
/* A4764 800B3F64 0C00428E */  lw         $v0, 0xC($s2)
/* A4768 800B3F68 00000000 */  nop
/* A476C 800B3F6C 00004294 */  lhu        $v0, 0x0($v0)
/* A4770 800B3F70 00000000 */  nop
/* A4774 800B3F74 00204230 */  andi       $v0, $v0, 0x2000
/* A4778 800B3F78 03004014 */  bnez       $v0, .L800B3F88
/* A477C 800B3F7C 02000224 */   addiu     $v0, $zero, 0x2
.L800B3F80:
/* A4780 800B3F80 6800A214 */  bne        $a1, $v0, .L800B4124
/* A4784 800B3F84 00000000 */   nop
.L800B3F88:
/* A4788 800B3F88 C000138E */  lw         $s3, 0xC0($s0)
/* A478C 800B3F8C 0400428E */  lw         $v0, 0x4($s2)
/* A4790 800B3F90 00000000 */  nop
/* A4794 800B3F94 0A004230 */  andi       $v0, $v0, 0xA
/* A4798 800B3F98 20004010 */  beqz       $v0, .L800B401C
/* A479C 800B3F9C 28007126 */   addiu     $s1, $s3, 0x28
/* A47A0 800B3FA0 E0000296 */  lhu        $v0, 0xE0($s0)
/* A47A4 800B3FA4 28006396 */  lhu        $v1, 0x28($s3)
/* A47A8 800B3FA8 00000000 */  nop
/* A47AC 800B3FAC 21104300 */  addu       $v0, $v0, $v1
/* A47B0 800B3FB0 E00002A6 */  sh         $v0, 0xE0($s0)
/* A47B4 800B3FB4 E2000296 */  lhu        $v0, 0xE2($s0)
/* A47B8 800B3FB8 02002396 */  lhu        $v1, 0x2($s1)
/* A47BC 800B3FBC 00000000 */  nop
/* A47C0 800B3FC0 21104300 */  addu       $v0, $v0, $v1
/* A47C4 800B3FC4 E20002A6 */  sh         $v0, 0xE2($s0)
/* A47C8 800B3FC8 E4000296 */  lhu        $v0, 0xE4($s0)
/* A47CC 800B3FCC 04002396 */  lhu        $v1, 0x4($s1)
/* A47D0 800B3FD0 00000000 */  nop
/* A47D4 800B3FD4 21104300 */  addu       $v0, $v0, $v1
/* A47D8 800B3FD8 E40002A6 */  sh         $v0, 0xE4($s0)
/* A47DC 800B3FDC 5C000296 */  lhu        $v0, 0x5C($s0)
/* A47E0 800B3FE0 28006396 */  lhu        $v1, 0x28($s3)
/* A47E4 800B3FE4 00000000 */  nop
/* A47E8 800B3FE8 21104300 */  addu       $v0, $v0, $v1
/* A47EC 800B3FEC 5C0002A6 */  sh         $v0, 0x5C($s0)
/* A47F0 800B3FF0 5E000296 */  lhu        $v0, 0x5E($s0)
/* A47F4 800B3FF4 02002396 */  lhu        $v1, 0x2($s1)
/* A47F8 800B3FF8 21200002 */  addu       $a0, $s0, $zero
/* A47FC 800B3FFC 21104300 */  addu       $v0, $v0, $v1
/* A4800 800B4000 5E0082A4 */  sh         $v0, 0x5E($a0)
/* A4804 800B4004 60008294 */  lhu        $v0, 0x60($a0)
/* A4808 800B4008 04002396 */  lhu        $v1, 0x4($s1)
/* A480C 800B400C 28004526 */  addiu      $a1, $s2, 0x28
/* A4810 800B4010 21104300 */  addu       $v0, $v0, $v1
/* A4814 800B4014 47D00208 */  j          .L800B411C
/* A4818 800B4018 600082A4 */   sh        $v0, 0x60($a0)
.L800B401C:
/* A481C 800B401C 5C000296 */  lhu        $v0, 0x5C($s0)
/* A4820 800B4020 28006396 */  lhu        $v1, 0x28($s3)
/* A4824 800B4024 00000000 */  nop
/* A4828 800B4028 21104300 */  addu       $v0, $v0, $v1
/* A482C 800B402C 5C0002A6 */  sh         $v0, 0x5C($s0)
/* A4830 800B4030 5E000296 */  lhu        $v0, 0x5E($s0)
/* A4834 800B4034 02002396 */  lhu        $v1, 0x2($s1)
/* A4838 800B4038 21200002 */  addu       $a0, $s0, $zero
/* A483C 800B403C 21104300 */  addu       $v0, $v0, $v1
/* A4840 800B4040 5E0082A4 */  sh         $v0, 0x5E($a0)
/* A4844 800B4044 60008294 */  lhu        $v0, 0x60($a0)
/* A4848 800B4048 04002396 */  lhu        $v1, 0x4($s1)
/* A484C 800B404C 28004526 */  addiu      $a1, $s2, 0x28
/* A4850 800B4050 21104300 */  addu       $v0, $v0, $v1
/* A4854 800B4054 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* A4858 800B4058 600082A4 */   sh        $v0, 0x60($a0)
/* A485C 800B405C D0FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x5A0)($gp)
/* A4860 800B4060 28006396 */  lhu        $v1, 0x28($s3)
/* A4864 800B4064 00000000 */  nop
/* A4868 800B4068 21104300 */  addu       $v0, $v0, $v1
/* A486C 800B406C D0FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x5A0)($gp)
/* A4870 800B4070 D2FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x5A2)($gp)
/* A4874 800B4074 02002396 */  lhu        $v1, 0x2($s1)
/* A4878 800B4078 00000000 */  nop
/* A487C 800B407C 21104300 */  addu       $v0, $v0, $v1
/* A4880 800B4080 D2FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x5A2)($gp)
/* A4884 800B4084 D4FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x5A4)($gp)
/* A4888 800B4088 04002396 */  lhu        $v1, 0x4($s1)
/* A488C 800B408C 00000000 */  nop
/* A4890 800B4090 21104300 */  addu       $v0, $v0, $v1
/* A4894 800B4094 D4FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x5A4)($gp)
/* A4898 800B4098 49D00208 */  j          .L800B4124
/* A489C 800B409C 00000000 */   nop
.L800B40A0:
/* A48A0 800B40A0 0C00428E */  lw         $v0, 0xC($s2)
/* A48A4 800B40A4 00000000 */  nop
/* A48A8 800B40A8 0000428C */  lw         $v0, 0x0($v0)
/* A48AC 800B40AC 00000000 */  nop
/* A48B0 800B40B0 00204230 */  andi       $v0, $v0, 0x2000
/* A48B4 800B40B4 1B004010 */  beqz       $v0, .L800B4124
/* A48B8 800B40B8 00000000 */   nop
/* A48BC 800B40BC C000048E */  lw         $a0, 0xC0($s0)
/* A48C0 800B40C0 00000000 */  nop
/* A48C4 800B40C4 28008524 */  addiu      $a1, $a0, 0x28
/* A48C8 800B40C8 0400A0A4 */  sh         $zero, 0x4($a1)
/* A48CC 800B40CC E0000296 */  lhu        $v0, 0xE0($s0)
/* A48D0 800B40D0 28008394 */  lhu        $v1, 0x28($a0)
/* A48D4 800B40D4 00000000 */  nop
/* A48D8 800B40D8 21104300 */  addu       $v0, $v0, $v1
/* A48DC 800B40DC E00002A6 */  sh         $v0, 0xE0($s0)
/* A48E0 800B40E0 E2000296 */  lhu        $v0, 0xE2($s0)
/* A48E4 800B40E4 0200A394 */  lhu        $v1, 0x2($a1)
/* A48E8 800B40E8 00000000 */  nop
/* A48EC 800B40EC 21104300 */  addu       $v0, $v0, $v1
/* A48F0 800B40F0 E20002A6 */  sh         $v0, 0xE2($s0)
/* A48F4 800B40F4 5C000296 */  lhu        $v0, 0x5C($s0)
/* A48F8 800B40F8 28008394 */  lhu        $v1, 0x28($a0)
/* A48FC 800B40FC 21200002 */  addu       $a0, $s0, $zero
/* A4900 800B4100 21104300 */  addu       $v0, $v0, $v1
/* A4904 800B4104 5C0082A4 */  sh         $v0, 0x5C($a0)
/* A4908 800B4108 5E008294 */  lhu        $v0, 0x5E($a0)
/* A490C 800B410C 0200A394 */  lhu        $v1, 0x2($a1)
/* A4910 800B4110 28004526 */  addiu      $a1, $s2, 0x28
/* A4914 800B4114 21104300 */  addu       $v0, $v0, $v1
/* A4918 800B4118 5E0082A4 */  sh         $v0, 0x5E($a0)
.L800B411C:
/* A491C 800B411C 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* A4920 800B4120 00000000 */   nop
.L800B4124:
/* A4924 800B4124 2000BF8F */  lw         $ra, 0x20($sp)
/* A4928 800B4128 1C00B38F */  lw         $s3, 0x1C($sp)
/* A492C 800B412C 1800B28F */  lw         $s2, 0x18($sp)
/* A4930 800B4130 1400B18F */  lw         $s1, 0x14($sp)
/* A4934 800B4134 1000B08F */  lw         $s0, 0x10($sp)
/* A4938 800B4138 0800E003 */  jr         $ra
/* A493C 800B413C 2800BD27 */   addiu     $sp, $sp, 0x28
.size RazielCollide, . - RazielCollide
