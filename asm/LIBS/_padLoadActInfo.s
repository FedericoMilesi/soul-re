.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padLoadActInfo
/* B4060 800C3860 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B4064 800C3864 1000B0AF */  sw         $s0, 0x10($sp)
/* B4068 800C3868 21808000 */  addu       $s0, $a0, $zero
/* B406C 800C386C 1400B1AF */  sw         $s1, 0x14($sp)
/* B4070 800C3870 2188A000 */  addu       $s1, $a1, $zero
/* B4074 800C3874 0C002012 */  beqz       $s1, .L800C38A8
/* B4078 800C3878 1800BFAF */   sw        $ra, 0x18($sp)
/* B407C 800C387C 0400028E */  lw         $v0, 0x4($s0)
/* B4080 800C3880 00000000 */  nop
/* B4084 800C3884 26004014 */  bnez       $v0, .L800C3920
/* B4088 800C3888 21100000 */   addu      $v0, $zero, $zero
/* B408C 800C388C 0D80023C */  lui        $v0, %hi(_padFuncChkEng)
/* B4090 800C3890 20E9428C */  lw         $v0, %lo(_padFuncChkEng)($v0)
/* B4094 800C3894 00000000 */  nop
/* B4098 800C3898 09F84000 */  jalr       $v0
/* B409C 800C389C 00000000 */   nop
/* B40A0 800C38A0 03004010 */  beqz       $v0, .L800C38B0
/* B40A4 800C38A4 01000224 */   addiu     $v0, $zero, 0x1
.L800C38A8:
/* B40A8 800C38A8 480E0308 */  j          .L800C3920
/* B40AC 800C38AC 21100000 */   addu      $v0, $zero, $zero
.L800C38B0:
/* B40B0 800C38B0 04000324 */  addiu      $v1, $zero, 0x4
/* B40B4 800C38B4 03002526 */  addiu      $a1, $s1, 0x3
/* B40B8 800C38B8 83280500 */  sra        $a1, $a1, 2
/* B40BC 800C38BC 490003A2 */  sb         $v1, 0x49($s0)
/* B40C0 800C38C0 01000324 */  addiu      $v1, $zero, 0x1
/* B40C4 800C38C4 460003A2 */  sb         $v1, 0x46($s0)
/* B40C8 800C38C8 0C80033C */  lui        $v1, %hi(func_800C3934)
/* B40CC 800C38CC 34396324 */  addiu      $v1, $v1, %lo(func_800C3934)
/* B40D0 800C38D0 140003AE */  sw         $v1, 0x14($s0)
/* B40D4 800C38D4 E3000392 */  lbu        $v1, 0xE3($s0)
/* B40D8 800C38D8 0C80043C */  lui        $a0, %hi(func_800C39DC)
/* B40DC 800C38DC DC398424 */  addiu      $a0, $a0, %lo(func_800C39DC)
/* B40E0 800C38E0 180004AE */  sw         $a0, 0x18($s0)
/* B40E4 800C38E4 E9000492 */  lbu        $a0, 0xE9($s0)
/* B40E8 800C38E8 80280500 */  sll        $a1, $a1, 2
/* B40EC 800C38EC 000005AE */  sw         $a1, 0x0($s0)
/* B40F0 800C38F0 470000A2 */  sb         $zero, 0x47($s0)
/* B40F4 800C38F4 01006324 */  addiu      $v1, $v1, 0x1
/* B40F8 800C38F8 43180300 */  sra        $v1, $v1, 1
/* B40FC 800C38FC 80180300 */  sll        $v1, $v1, 2
/* B4100 800C3900 2128A300 */  addu       $a1, $a1, $v1
/* B4104 800C3904 80180400 */  sll        $v1, $a0, 2
/* B4108 800C3908 21186400 */  addu       $v1, $v1, $a0
/* B410C 800C390C 03006324 */  addiu      $v1, $v1, 0x3
/* B4110 800C3910 FC0F6330 */  andi       $v1, $v1, 0xFFC
/* B4114 800C3914 040005AE */  sw         $a1, 0x4($s0)
/* B4118 800C3918 2128A300 */  addu       $a1, $a1, $v1
/* B411C 800C391C 080005AE */  sw         $a1, 0x8($s0)
.L800C3920:
/* B4120 800C3920 1800BF8F */  lw         $ra, 0x18($sp)
/* B4124 800C3924 1400B18F */  lw         $s1, 0x14($sp)
/* B4128 800C3928 1000B08F */  lw         $s0, 0x10($sp)
/* B412C 800C392C 0800E003 */  jr         $ra
/* B4130 800C3930 2000BD27 */   addiu     $sp, $sp, 0x20
.size _padLoadActInfo, . - _padLoadActInfo
