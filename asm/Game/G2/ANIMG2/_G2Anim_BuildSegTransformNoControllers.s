.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2Anim_BuildSegTransformNoControllers
/* 84940 80094140 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 84944 80094144 2000B0AF */  sw         $s0, 0x20($sp)
/* 84948 80094148 21808000 */  addu       $s0, $a0, $zero
/* 8494C 8009414C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 84950 80094150 2198A000 */  addu       $s3, $a1, $zero
/* 84954 80094154 3000B4AF */  sw         $s4, 0x30($sp)
/* 84958 80094158 21A0C000 */  addu       $s4, $a2, $zero
/* 8495C 8009415C 40100700 */  sll        $v0, $a3, 1
/* 84960 80094160 21104700 */  addu       $v0, $v0, $a3
/* 84964 80094164 C0100200 */  sll        $v0, $v0, 3
/* 84968 80094168 F8ED8327 */  addiu      $v1, $gp, %gp_rel(_segValues)
/* 8496C 8009416C 2400B1AF */  sw         $s1, 0x24($sp)
/* 84970 80094170 21884300 */  addu       $s1, $v0, $v1
/* 84974 80094174 3400BFAF */  sw         $ra, 0x34($sp)
/* 84978 80094178 2800B2AF */  sw         $s2, 0x28($sp)
/* 8497C 8009417C 08002286 */  lh         $v0, 0x8($s1)
/* 84980 80094180 21202002 */  addu       $a0, $s1, $zero
/* 84984 80094184 1000A2AF */  sw         $v0, 0x10($sp)
/* 84988 80094188 0A002686 */  lh         $a2, 0xA($s1)
/* 8498C 8009418C 21280002 */  addu       $a1, $s0, $zero
/* 84990 80094190 1400A6AF */  sw         $a2, 0x14($sp)
/* 84994 80094194 0C002386 */  lh         $v1, 0xC($s1)
/* 84998 80094198 25104600 */  or         $v0, $v0, $a2
/* 8499C 8009419C 25104300 */  or         $v0, $v0, $v1
/* 849A0 800941A0 00104238 */  xori       $v0, $v0, 0x1000
/* 849A4 800941A4 2B900200 */  sltu       $s2, $zero, $v0
/* 849A8 800941A8 DA50020C */  jal        _G2Anim_BuildSegLocalRotMatrix
/* 849AC 800941AC 1800A3AF */   sw        $v1, 0x18($sp)
/* 849B0 800941B0 04004012 */  beqz       $s2, .L800941C4
/* 849B4 800941B4 21200002 */   addu      $a0, $s0, $zero
/* 849B8 800941B8 96E4010C */  jal        func_80079258
/* 849BC 800941BC 1000A527 */   addiu     $a1, $sp, 0x10
/* 849C0 800941C0 120012A6 */  sh         $s2, 0x12($s0)
.L800941C4:
/* 849C4 800941C4 00006C8E */  lw         $t4, 0x0($s3)
/* 849C8 800941C8 04006D8E */  lw         $t5, 0x4($s3)
/* 849CC 800941CC 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 849D0 800941D0 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 849D4 800941D4 08006C8E */  lw         $t4, 0x8($s3)
/* 849D8 800941D8 0C006D8E */  lw         $t5, 0xC($s3)
/* 849DC 800941DC 10006E8E */  lw         $t6, 0x10($s3)
/* 849E0 800941E0 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 849E4 800941E4 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 849E8 800941E8 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 849EC 800941EC 00000C96 */  lhu        $t4, 0x0($s0)
/* 849F0 800941F0 06000D96 */  lhu        $t5, 0x6($s0)
/* 849F4 800941F4 0C000E96 */  lhu        $t6, 0xC($s0)
/* 849F8 800941F8 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 849FC 800941FC 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 84A00 80094200 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 84A04 80094204 02000896 */  lhu        $t0, 0x2($s0)
/* 84A08 80094208 08000996 */  lhu        $t1, 0x8($s0)
/* 84A0C 8009420C 00000000 */  nop
/* 84A10 80094210 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 84A14 80094214 0E000A96 */  lhu        $t2, 0xE($s0)
/* 84A18 80094218 04000B96 */  lhu        $t3, 0x4($s0)
/* 84A1C 8009421C 00480D48 */  mfc2       $t5, $9 # handwritten instruction
/* 84A20 80094220 00500E48 */  mfc2       $t6, $10 # handwritten instruction
/* 84A24 80094224 00580F48 */  mfc2       $t7, $11 # handwritten instruction
/* 84A28 80094228 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 84A2C 8009422C 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 84A30 80094230 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 84A34 80094234 00000DA6 */  sh         $t5, 0x0($s0)
/* 84A38 80094238 06000EA6 */  sh         $t6, 0x6($s0)
/* 84A3C 8009423C 00000000 */  nop
/* 84A40 80094240 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 84A44 80094244 0A000C96 */  lhu        $t4, 0xA($s0)
/* 84A48 80094248 10000D96 */  lhu        $t5, 0x10($s0)
/* 84A4C 8009424C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 84A50 80094250 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 84A54 80094254 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 84A58 80094258 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 84A5C 8009425C 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 84A60 80094260 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 84A64 80094264 0C000FA6 */  sh         $t7, 0xC($s0)
/* 84A68 80094268 020008A6 */  sh         $t0, 0x2($s0)
/* 84A6C 8009426C 00000000 */  nop
/* 84A70 80094270 12E0494A */  MVMVA      1, 0, 3, 3, 0
/* 84A74 80094274 080009A6 */  sh         $t1, 0x8($s0)
/* 84A78 80094278 0E000AA6 */  sh         $t2, 0xE($s0)
/* 84A7C 8009427C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 84A80 80094280 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 84A84 80094284 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 84A88 80094288 040008A6 */  sh         $t0, 0x4($s0)
/* 84A8C 8009428C 0A0009A6 */  sh         $t1, 0xA($s0)
/* 84A90 80094290 10000AA6 */  sh         $t2, 0x10($s0)
/* 84A94 80094294 10002226 */  addiu      $v0, $s1, 0x10
/* 84A98 80094298 14000326 */  addiu      $v1, $s0, 0x14
/* 84A9C 8009429C 000040C8 */  lwc2       $0, 0x0($v0)
/* 84AA0 800942A0 040041C8 */  lwc2       $1, 0x4($v0)
/* 84AA4 800942A4 00000000 */  nop
/* 84AA8 800942A8 00000000 */  nop
/* 84AAC 800942AC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 84AB0 800942B0 000079E8 */  swc2       $25, 0x0($v1)
/* 84AB4 800942B4 04007AE8 */  swc2       $26, 0x4($v1) # handwritten instruction
/* 84AB8 800942B8 08007BE8 */  swc2       $27, 0x8($v1) # handwritten instruction
/* 84ABC 800942BC 13008012 */  beqz       $s4, .L8009430C
/* 84AC0 800942C0 00000000 */   nop
/* 84AC4 800942C4 1400628E */  lw         $v0, 0x14($s3)
/* 84AC8 800942C8 1400038E */  lw         $v1, 0x14($s0)
/* 84ACC 800942CC 00000000 */  nop
/* 84AD0 800942D0 21104300 */  addu       $v0, $v0, $v1
/* 84AD4 800942D4 140062AE */  sw         $v0, 0x14($s3)
/* 84AD8 800942D8 1800628E */  lw         $v0, 0x18($s3)
/* 84ADC 800942DC 1800038E */  lw         $v1, 0x18($s0)
/* 84AE0 800942E0 00000000 */  nop
/* 84AE4 800942E4 21104300 */  addu       $v0, $v0, $v1
/* 84AE8 800942E8 180062AE */  sw         $v0, 0x18($s3)
/* 84AEC 800942EC 1C00628E */  lw         $v0, 0x1C($s3)
/* 84AF0 800942F0 1C00038E */  lw         $v1, 0x1C($s0)
/* 84AF4 800942F4 00000000 */  nop
/* 84AF8 800942F8 21104300 */  addu       $v0, $v0, $v1
/* 84AFC 800942FC 1C0062AE */  sw         $v0, 0x1C($s3)
/* 84B00 80094300 140000AE */  sw         $zero, 0x14($s0)
/* 84B04 80094304 180000AE */  sw         $zero, 0x18($s0)
/* 84B08 80094308 1C0000AE */  sw         $zero, 0x1C($s0)
.L8009430C:
/* 84B0C 8009430C 1400028E */  lw         $v0, 0x14($s0)
/* 84B10 80094310 1400638E */  lw         $v1, 0x14($s3)
/* 84B14 80094314 00000000 */  nop
/* 84B18 80094318 21104300 */  addu       $v0, $v0, $v1
/* 84B1C 8009431C 140002AE */  sw         $v0, 0x14($s0)
/* 84B20 80094320 1800028E */  lw         $v0, 0x18($s0)
/* 84B24 80094324 1800638E */  lw         $v1, 0x18($s3)
/* 84B28 80094328 00000000 */  nop
/* 84B2C 8009432C 21104300 */  addu       $v0, $v0, $v1
/* 84B30 80094330 180002AE */  sw         $v0, 0x18($s0)
/* 84B34 80094334 1C00028E */  lw         $v0, 0x1C($s0)
/* 84B38 80094338 1C00638E */  lw         $v1, 0x1C($s3)
/* 84B3C 8009433C 00000000 */  nop
/* 84B40 80094340 21104300 */  addu       $v0, $v0, $v1
/* 84B44 80094344 1C0002AE */  sw         $v0, 0x1C($s0)
/* 84B48 80094348 3400BF8F */  lw         $ra, 0x34($sp)
/* 84B4C 8009434C 3000B48F */  lw         $s4, 0x30($sp)
/* 84B50 80094350 2C00B38F */  lw         $s3, 0x2C($sp)
/* 84B54 80094354 2800B28F */  lw         $s2, 0x28($sp)
/* 84B58 80094358 2400B18F */  lw         $s1, 0x24($sp)
/* 84B5C 8009435C 2000B08F */  lw         $s0, 0x20($sp)
/* 84B60 80094360 0800E003 */  jr         $ra
/* 84B64 80094364 3800BD27 */   addiu     $sp, $sp, 0x38
.size _G2Anim_BuildSegTransformNoControllers, . - _G2Anim_BuildSegTransformNoControllers
