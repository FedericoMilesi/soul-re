.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ShouldIAttackInstance
/* 70AB0 800802B0 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 70AB4 800802B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 70AB8 800802B8 1800B2AF */  sw         $s2, 0x18($sp)
/* 70ABC 800802BC 21908000 */  addu       $s2, $a0, $zero
/* 70AC0 800802C0 1000B0AF */  sw         $s0, 0x10($sp)
/* 70AC4 800802C4 2180A000 */  addu       $s0, $a1, $zero
/* 70AC8 800802C8 2000BFAF */  sw         $ra, 0x20($sp)
/* 70ACC 800802CC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 70AD0 800802D0 38000216 */  bne        $s0, $v0, .L800803B4
/* 70AD4 800802D4 1400B1AF */   sw        $s1, 0x14($sp)
/* 70AD8 800802D8 21200002 */  addu       $a0, $s0, $zero
/* 70ADC 800802DC 92D1000C */  jal        INSTANCE_Query
/* 70AE0 800802E0 22000524 */   addiu     $a1, $zero, 0x22
/* 70AE4 800802E4 21200002 */  addu       $a0, $s0, $zero
/* 70AE8 800802E8 0A000524 */  addiu      $a1, $zero, 0xA
/* 70AEC 800802EC 92D1000C */  jal        INSTANCE_Query
/* 70AF0 800802F0 21884000 */   addu      $s1, $v0, $zero
/* 70AF4 800802F4 21184000 */  addu       $v1, $v0, $zero
/* 70AF8 800802F8 6C01538E */  lw         $s3, 0x16C($s2)
/* 70AFC 800802FC 0120023C */  lui        $v0, (0x20010000 >> 16)
/* 70B00 80080300 24106200 */  and        $v0, $v1, $v0
/* 70B04 80080304 0D004014 */  bnez       $v0, .L8008033C
/* 70B08 80080308 00000000 */   nop
/* 70B0C 8008030C 07002012 */  beqz       $s1, .L8008032C
/* 70B10 80080310 21200002 */   addu      $a0, $s0, $zero
/* 70B14 80080314 05003212 */  beq        $s1, $s2, .L8008032C
/* 70B18 80080318 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 70B1C 8008031C 24106200 */  and        $v0, $v1, $v0
/* 70B20 80080320 25004014 */  bnez       $v0, .L800803B8
/* 70B24 80080324 21100000 */   addu      $v0, $zero, $zero
/* 70B28 80080328 21200002 */  addu       $a0, $s0, $zero
.L8008032C:
/* 70B2C 8008032C 92D1000C */  jal        INSTANCE_Query
/* 70B30 80080330 2E000524 */   addiu     $a1, $zero, 0x2E
/* 70B34 80080334 03004010 */  beqz       $v0, .L80080344
/* 70B38 80080338 07000224 */   addiu     $v0, $zero, 0x7
.L8008033C:
/* 70B3C 8008033C EE000208 */  j          .L800803B8
/* 70B40 80080340 21100000 */   addu      $v0, $zero, $zero
.L80080344:
/* 70B44 80080344 5A016392 */  lbu        $v1, 0x15A($s3)
/* 70B48 80080348 00000000 */  nop
/* 70B4C 8008034C 1A006214 */  bne        $v1, $v0, .L800803B8
/* 70B50 80080350 01000224 */   addiu     $v0, $zero, 0x1
/* 70B54 80080354 2000468E */  lw         $a2, 0x20($s2)
/* 70B58 80080358 00000000 */  nop
/* 70B5C 8008035C 1600C010 */  beqz       $a2, .L800803B8
/* 70B60 80080360 00000000 */   nop
/* 70B64 80080364 4000428E */  lw         $v0, 0x40($s2)
/* 70B68 80080368 00000000 */  nop
/* 70B6C 8008036C 11004010 */  beqz       $v0, .L800803B4
/* 70B70 80080370 00000000 */   nop
/* 70B74 80080374 5C000286 */  lh         $v0, 0x5C($s0)
/* 70B78 80080378 2000C484 */  lh         $a0, 0x20($a2)
/* 70B7C 8008037C 5E000386 */  lh         $v1, 0x5E($s0)
/* 70B80 80080380 2200C584 */  lh         $a1, 0x22($a2)
/* 70B84 80080384 2400C684 */  lh         $a2, 0x24($a2)
/* 70B88 80080388 23204400 */  subu       $a0, $v0, $a0
/* 70B8C 8008038C 60000286 */  lh         $v0, 0x60($s0)
/* 70B90 80080390 23286500 */  subu       $a1, $v1, $a1
/* 70B94 80080394 B7E6000C */  jal        MATH3D_LengthXYZ
/* 70B98 80080398 23304600 */   subu      $a2, $v0, $a2
/* 70B9C 8008039C 3C016386 */  lh         $v1, 0x13C($s3)
/* 70BA0 800803A0 00000000 */  nop
/* 70BA4 800803A4 80026324 */  addiu      $v1, $v1, 0x280
/* 70BA8 800803A8 2A186200 */  slt        $v1, $v1, $v0
/* 70BAC 800803AC 02006014 */  bnez       $v1, .L800803B8
/* 70BB0 800803B0 21100000 */   addu      $v0, $zero, $zero
.L800803B4:
/* 70BB4 800803B4 01000224 */  addiu      $v0, $zero, 0x1
.L800803B8:
/* 70BB8 800803B8 2000BF8F */  lw         $ra, 0x20($sp)
/* 70BBC 800803BC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 70BC0 800803C0 1800B28F */  lw         $s2, 0x18($sp)
/* 70BC4 800803C4 1400B18F */  lw         $s1, 0x14($sp)
/* 70BC8 800803C8 1000B08F */  lw         $s0, 0x10($sp)
/* 70BCC 800803CC 0800E003 */  jr         $ra
/* 70BD0 800803D0 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_ShouldIAttackInstance, . - MON_ShouldIAttackInstance
