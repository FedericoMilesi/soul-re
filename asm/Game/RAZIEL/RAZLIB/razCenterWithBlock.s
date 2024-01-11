.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razCenterWithBlock
/* 969B0 800A61B0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 969B4 800A61B4 6400B3AF */  sw         $s3, 0x64($sp)
/* 969B8 800A61B8 21988000 */  addu       $s3, $a0, $zero
/* 969BC 800A61BC 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 969C0 800A61C0 2188A000 */  addu       $s1, $a1, $zero
/* 969C4 800A61C4 6000B2AF */  sw         $s2, 0x60($sp)
/* 969C8 800A61C8 2190C000 */  addu       $s2, $a2, $zero
/* 969CC 800A61CC 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 969D0 800A61D0 6800B4AF */  sw         $s4, 0x68($sp)
/* 969D4 800A61D4 2098020C */  jal        razGetForwardNormal
/* 969D8 800A61D8 5800B0AF */   sw        $s0, 0x58($sp)
/* 969DC 800A61DC D0F98427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x3A0)
/* 969E0 800A61E0 5998020C */  jal        razGetRotFromNormal
/* 969E4 800A61E4 2800A527 */   addiu     $a1, $sp, 0x28
/* 969E8 800A61E8 3000B027 */  addiu      $s0, $sp, 0x30
/* 969EC 800A61EC D4F98287 */  lh         $v0, %gp_rel(Raziel + 0x3A4)($gp)
/* 969F0 800A61F0 21200002 */  addu       $a0, $s0, $zero
/* 969F4 800A61F4 02004104 */  bgez       $v0, .L800A6200
/* 969F8 800A61F8 00000000 */   nop
/* 969FC 800A61FC 23100200 */  negu       $v0, $v0
.L800A6200:
/* 96A00 800A6200 E9034228 */  slti       $v0, $v0, 0x3E9
/* 96A04 800A6204 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 96A08 800A6208 01005438 */   xori      $s4, $v0, 0x1
/* 96A0C 800A620C 2C00A487 */  lh         $a0, 0x2C($sp)
/* 96A10 800A6210 32E4010C */  jal        func_800790C8
/* 96A14 800A6214 21280002 */   addu      $a1, $s0, $zero
/* 96A18 800A6218 21200002 */  addu       $a0, $s0, $zero
/* 96A1C 800A621C 1800A527 */  addiu      $a1, $sp, 0x18
/* 96A20 800A6220 2000A627 */  addiu      $a2, $sp, 0x20
/* 96A24 800A6224 40010224 */  addiu      $v0, $zero, 0x140
/* 96A28 800A6228 23105200 */  subu       $v0, $v0, $s2
/* 96A2C 800A622C 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 96A30 800A6230 1800A0A7 */  sh         $zero, 0x18($sp)
/* 96A34 800A6234 0EF3020C */  jal        func_800BCC38
/* 96A38 800A6238 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 96A3C 800A623C 5C006396 */  lhu        $v1, 0x5C($s3)
/* 96A40 800A6240 5C002296 */  lhu        $v0, 0x5C($s1)
/* 96A44 800A6244 00000000 */  nop
/* 96A48 800A6248 23186200 */  subu       $v1, $v1, $v0
/* 96A4C 800A624C 003C0300 */  sll        $a3, $v1, 16
/* 96A50 800A6250 03340700 */  sra        $a2, $a3, 16
/* 96A54 800A6254 1800A3A7 */  sh         $v1, 0x18($sp)
/* 96A58 800A6258 5E006496 */  lhu        $a0, 0x5E($s3)
/* 96A5C 800A625C 5E002296 */  lhu        $v0, 0x5E($s1)
/* 96A60 800A6260 0200C104 */  bgez       $a2, .L800A626C
/* 96A64 800A6264 2118C000 */   addu      $v1, $a2, $zero
/* 96A68 800A6268 23180300 */  negu       $v1, $v1
.L800A626C:
/* 96A6C 800A626C 23208200 */  subu       $a0, $a0, $v0
/* 96A70 800A6270 1A00A4A7 */  sh         $a0, 0x1A($sp)
/* 96A74 800A6274 00240400 */  sll        $a0, $a0, 16
/* 96A78 800A6278 032C0400 */  sra        $a1, $a0, 16
/* 96A7C 800A627C 0200A104 */  bgez       $a1, .L800A6288
/* 96A80 800A6280 2110A000 */   addu      $v0, $a1, $zero
/* 96A84 800A6284 23100200 */  negu       $v0, $v0
.L800A6288:
/* 96A88 800A6288 2A186200 */  slt        $v1, $v1, $v0
/* 96A8C 800A628C 08006010 */  beqz       $v1, .L800A62B0
/* 96A90 800A6290 C2170700 */   srl       $v0, $a3, 31
/* 96A94 800A6294 2110C200 */  addu       $v0, $a2, $v0
/* 96A98 800A6298 43100200 */  sra        $v0, $v0, 1
/* 96A9C 800A629C 0C008012 */  beqz       $s4, .L800A62D0
/* 96AA0 800A62A0 1800A2A7 */   sh        $v0, 0x18($sp)
/* 96AA4 800A62A4 2200A297 */  lhu        $v0, 0x22($sp)
/* 96AA8 800A62A8 B4980208 */  j          .L800A62D0
/* 96AAC 800A62AC 1A00A2A7 */   sh        $v0, 0x1A($sp)
.L800A62B0:
/* 96AB0 800A62B0 C2170400 */  srl        $v0, $a0, 31
/* 96AB4 800A62B4 2110A200 */  addu       $v0, $a1, $v0
/* 96AB8 800A62B8 43100200 */  sra        $v0, $v0, 1
/* 96ABC 800A62BC 04008012 */  beqz       $s4, .L800A62D0
/* 96AC0 800A62C0 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 96AC4 800A62C4 2000A297 */  lhu        $v0, 0x20($sp)
/* 96AC8 800A62C8 00000000 */  nop
/* 96ACC 800A62CC 1800A2A7 */  sh         $v0, 0x18($sp)
.L800A62D0:
/* 96AD0 800A62D0 C8017026 */  addiu      $s0, $s3, 0x1C8
/* 96AD4 800A62D4 21200002 */  addu       $a0, $s0, $zero
/* 96AD8 800A62D8 21280000 */  addu       $a1, $zero, $zero
/* 96ADC 800A62DC 5C006396 */  lhu        $v1, 0x5C($s3)
/* 96AE0 800A62E0 1800A697 */  lhu        $a2, 0x18($sp)
/* 96AE4 800A62E4 2000A297 */  lhu        $v0, 0x20($sp)
/* 96AE8 800A62E8 23186600 */  subu       $v1, $v1, $a2
/* 96AEC 800A62EC 21104300 */  addu       $v0, $v0, $v1
/* 96AF0 800A62F0 5000A2A7 */  sh         $v0, 0x50($sp)
/* 96AF4 800A62F4 5E006396 */  lhu        $v1, 0x5E($s3)
/* 96AF8 800A62F8 1A00A697 */  lhu        $a2, 0x1A($sp)
/* 96AFC 800A62FC 2200A297 */  lhu        $v0, 0x22($sp)
/* 96B00 800A6300 23186600 */  subu       $v1, $v1, $a2
/* 96B04 800A6304 21104300 */  addu       $v0, $v0, $v1
/* 96B08 800A6308 5200A2A7 */  sh         $v0, 0x52($sp)
/* 96B0C 800A630C 60006296 */  lhu        $v0, 0x60($s3)
/* 96B10 800A6310 20000624 */  addiu      $a2, $zero, 0x20
/* 96B14 800A6314 E541020C */  jal        G2Anim_IsControllerActive
/* 96B18 800A6318 5400A2A7 */   sh        $v0, 0x54($sp)
/* 96B1C 800A631C 06004014 */  bnez       $v0, .L800A6338
/* 96B20 800A6320 21206002 */   addu      $a0, $s3, $zero
/* 96B24 800A6324 21200002 */  addu       $a0, $s0, $zero
/* 96B28 800A6328 21280000 */  addu       $a1, $zero, $zero
/* 96B2C 800A632C 5641020C */  jal        G2Anim_EnableController
/* 96B30 800A6330 20000624 */   addiu     $a2, $zero, 0x20
/* 96B34 800A6334 21206002 */  addu       $a0, $s3, $zero
.L800A6338:
/* 96B38 800A6338 21280000 */  addu       $a1, $zero, $zero
/* 96B3C 800A633C 20000624 */  addiu      $a2, $zero, 0x20
/* 96B40 800A6340 06000224 */  addiu      $v0, $zero, 0x6
/* 96B44 800A6344 5000A727 */  addiu      $a3, $sp, 0x50
/* 96B48 800A6348 1000A2AF */  sw         $v0, 0x10($sp)
/* 96B4C 800A634C 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 96B50 800A6350 1400A0AF */   sw        $zero, 0x14($sp)
/* 96B54 800A6354 2C00A297 */  lhu        $v0, 0x2C($sp)
/* 96B58 800A6358 00000000 */  nop
/* 96B5C 800A635C 780062A6 */  sh         $v0, 0x78($s3)
/* 96B60 800A6360 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 96B64 800A6364 6800B48F */  lw         $s4, 0x68($sp)
/* 96B68 800A6368 6400B38F */  lw         $s3, 0x64($sp)
/* 96B6C 800A636C 6000B28F */  lw         $s2, 0x60($sp)
/* 96B70 800A6370 5C00B18F */  lw         $s1, 0x5C($sp)
/* 96B74 800A6374 5800B08F */  lw         $s0, 0x58($sp)
/* 96B78 800A6378 0800E003 */  jr         $ra
/* 96B7C 800A637C 7000BD27 */   addiu     $sp, $sp, 0x70
.size razCenterWithBlock, . - razCenterWithBlock
