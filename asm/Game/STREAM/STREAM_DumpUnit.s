.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpUnit
/* 4B69C 8005AE9C 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 4B6A0 8005AEA0 6800B2AF */  sw         $s2, 0x68($sp)
/* 4B6A4 8005AEA4 21908000 */  addu       $s2, $a0, $zero
/* 4B6A8 8005AEA8 6C00B3AF */  sw         $s3, 0x6C($sp)
/* 4B6AC 8005AEAC 2198A000 */  addu       $s3, $a1, $zero
/* 4B6B0 8005AEB0 6000B0AF */  sw         $s0, 0x60($sp)
/* 4B6B4 8005AEB4 21800000 */  addu       $s0, $zero, $zero
/* 4B6B8 8005AEB8 02000724 */  addiu      $a3, $zero, 0x2
/* 4B6BC 8005AEBC 3CC78627 */  addiu      $a2, $gp, %gp_rel(StreamTracker)
/* 4B6C0 8005AEC0 7000BFAF */  sw         $ra, 0x70($sp)
/* 4B6C4 8005AEC4 6400B1AF */  sw         $s1, 0x64($sp)
.L8005AEC8:
/* 4B6C8 8005AEC8 0400C284 */  lh         $v0, 0x4($a2)
/* 4B6CC 8005AECC 00000000 */  nop
/* 4B6D0 8005AED0 15004714 */  bne        $v0, $a3, .L8005AF28
/* 4B6D4 8005AED4 00000000 */   nop
/* 4B6D8 8005AED8 0800C28C */  lw         $v0, 0x8($a2)
/* 4B6DC 8005AEDC 00000000 */  nop
/* 4B6E0 8005AEE0 0000428C */  lw         $v0, 0x0($v0)
/* 4B6E4 8005AEE4 00000000 */  nop
/* 4B6E8 8005AEE8 3000428C */  lw         $v0, 0x30($v0)
/* 4B6EC 8005AEEC 00000000 */  nop
/* 4B6F0 8005AEF0 0000458C */  lw         $a1, 0x0($v0)
/* 4B6F4 8005AEF4 00000000 */  nop
/* 4B6F8 8005AEF8 0B00A018 */  blez       $a1, .L8005AF28
/* 4B6FC 8005AEFC 21200000 */   addu      $a0, $zero, $zero
/* 4B700 8005AF00 2C004324 */  addiu      $v1, $v0, 0x2C
.L8005AF04:
/* 4B704 8005AF04 0000628C */  lw         $v0, 0x0($v1)
/* 4B708 8005AF08 00000000 */  nop
/* 4B70C 8005AF0C 02005214 */  bne        $v0, $s2, .L8005AF18
/* 4B710 8005AF10 00000000 */   nop
/* 4B714 8005AF14 000060AC */  sw         $zero, 0x0($v1)
.L8005AF18:
/* 4B718 8005AF18 01008424 */  addiu      $a0, $a0, 0x1
/* 4B71C 8005AF1C 2A108500 */  slt        $v0, $a0, $a1
/* 4B720 8005AF20 F8FF4014 */  bnez       $v0, .L8005AF04
/* 4B724 8005AF24 5C006324 */   addiu     $v1, $v1, 0x5C
.L8005AF28:
/* 4B728 8005AF28 01001026 */  addiu      $s0, $s0, 0x1
/* 4B72C 8005AF2C 1000022A */  slti       $v0, $s0, 0x10
/* 4B730 8005AF30 E5FF4014 */  bnez       $v0, .L8005AEC8
/* 4B734 8005AF34 4000C624 */   addiu     $a2, $a2, 0x40
/* 4B738 8005AF38 04004386 */  lh         $v1, 0x4($s2)
/* 4B73C 8005AF3C 01000224 */  addiu      $v0, $zero, 0x1
/* 4B740 8005AF40 03006210 */  beq        $v1, $v0, .L8005AF50
/* 4B744 8005AF44 03000224 */   addiu     $v0, $zero, 0x3
/* 4B748 8005AF48 0C006214 */  bne        $v1, $v0, .L8005AF7C
/* 4B74C 8005AF4C 00000000 */   nop
.L8005AF50:
/* 4B750 8005AF50 0C004426 */  addiu      $a0, $s2, 0xC
/* 4B754 8005AF54 1000A527 */  addiu      $a1, $sp, 0x10
/* 4B758 8005AF58 21300000 */  addu       $a2, $zero, $zero
/* 4B75C 8005AF5C 8062010C */  jal        STREAM_FillOutFileNames
/* 4B760 8005AF60 2138C000 */   addu      $a3, $a2, $zero
/* 4B764 8005AF64 1000A427 */  addiu      $a0, $sp, 0x10
/* 4B768 8005AF68 0680053C */  lui        $a1, %hi(STREAM_StreamLoadLevelAbort)
/* 4B76C 8005AF6C 8B82010C */  jal        LOAD_AbortFileLoad
/* 4B770 8005AF70 CC9FA524 */   addiu     $a1, $a1, %lo(STREAM_StreamLoadLevelAbort)
/* 4B774 8005AF74 186C0108 */  j          .L8005B060
/* 4B778 8005AF78 040040A6 */   sh        $zero, 0x4($s2)
.L8005AF7C:
/* 4B77C 8005AF7C 816D010C */  jal        WARPGATE_IsUnitWarpRoom
/* 4B780 8005AF80 21204002 */   addu      $a0, $s2, $zero
/* 4B784 8005AF84 03004010 */  beqz       $v0, .L8005AF94
/* 4B788 8005AF88 00000000 */   nop
/* 4B78C 8005AF8C DD6C010C */  jal        WARPGATE_RemoveFromArray
/* 4B790 8005AF90 21204002 */   addu      $a0, $s2, $zero
.L8005AF94:
/* 4B794 8005AF94 FEA0010C */  jal        EVENT_RemoveStreamToInstanceList
/* 4B798 8005AF98 21204002 */   addu      $a0, $s2, $zero
/* 4B79C 8005AF9C 0800438E */  lw         $v1, 0x8($s2)
/* 4B7A0 8005AFA0 00000000 */  nop
/* 4B7A4 8005AFA4 E800628C */  lw         $v0, 0xE8($v1)
/* 4B7A8 8005AFA8 00000000 */  nop
/* 4B7AC 8005AFAC 0F004018 */  blez       $v0, .L8005AFEC
/* 4B7B0 8005AFB0 21800000 */   addu      $s0, $zero, $zero
/* 4B7B4 8005AFB4 21880002 */  addu       $s1, $s0, $zero
.L8005AFB8:
/* 4B7B8 8005AFB8 EC00658C */  lw         $a1, 0xEC($v1)
/* 4B7BC 8005AFBC 00000000 */  nop
/* 4B7C0 8005AFC0 2128B100 */  addu       $a1, $a1, $s1
/* 4B7C4 8005AFC4 0000A48C */  lw         $a0, 0x0($a1)
/* 4B7C8 8005AFC8 9EFB000C */  jal        SOUND_EndInstanceSounds
/* 4B7CC 8005AFCC 0800A524 */   addiu     $a1, $a1, 0x8
/* 4B7D0 8005AFD0 0800438E */  lw         $v1, 0x8($s2)
/* 4B7D4 8005AFD4 01001026 */  addiu      $s0, $s0, 0x1
/* 4B7D8 8005AFD8 E800628C */  lw         $v0, 0xE8($v1)
/* 4B7DC 8005AFDC 00000000 */  nop
/* 4B7E0 8005AFE0 2A100202 */  slt        $v0, $s0, $v0
/* 4B7E4 8005AFE4 F4FF4014 */  bnez       $v0, .L8005AFB8
/* 4B7E8 8005AFE8 24003126 */   addiu     $s1, $s1, 0x24
.L8005AFEC:
/* 4B7EC 8005AFEC 3C004486 */  lh         $a0, 0x3C($s2)
/* 4B7F0 8005AFF0 00000000 */  nop
/* 4B7F4 8005AFF4 03008010 */  beqz       $a0, .L8005B004
/* 4B7F8 8005AFF8 00000000 */   nop
/* 4B7FC 8005AFFC EC4A010C */  jal        aadFreeDynamicSfx
/* 4B800 8005B000 00000000 */   nop
.L8005B004:
/* 4B804 8005B004 0000448E */  lw         $a0, 0x0($s2)
/* 4B808 8005B008 2860020C */  jal        PLANAPI_DeleteNodeFromPoolByUnit
/* 4B80C 8005B00C 00000000 */   nop
/* 4B810 8005B010 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4B814 8005B014 0000458E */  lw         $a1, 0x0($s2)
/* 4B818 8005B018 0800468E */  lw         $a2, 0x8($s2)
/* 4B81C 8005B01C 696B010C */  jal        STREAM_RemoveInstancesWithIDInInstanceList
/* 4B820 8005B020 00000000 */   nop
/* 4B824 8005B024 09006012 */  beqz       $s3, .L8005B04C
/* 4B828 8005B028 00000000 */   nop
/* 4B82C 8005B02C 0000448E */  lw         $a0, 0x0($s2)
/* 4B830 8005B030 0800458E */  lw         $a1, 0x8($s2)
/* 4B834 8005B034 FC9D010C */  jal        EVENT_SaveEventsFromLevel
/* 4B838 8005B038 00000000 */   nop
/* 4B83C 8005B03C 0000448E */  lw         $a0, 0x0($s2)
/* 4B840 8005B040 0800458E */  lw         $a1, 0x8($s2)
/* 4B844 8005B044 99D7020C */  jal        SAVE_CreatedSavedLevel
/* 4B848 8005B048 00000000 */   nop
.L8005B04C:
/* 4B84C 8005B04C 0800448E */  lw         $a0, 0x8($s2)
/* 4B850 8005B050 2641010C */  jal        MEMPACK_Free
/* 4B854 8005B054 00000000 */   nop
/* 4B858 8005B058 080040AE */  sw         $zero, 0x8($s2)
/* 4B85C 8005B05C 040040A6 */  sh         $zero, 0x4($s2)
.L8005B060:
/* 4B860 8005B060 060040A6 */  sh         $zero, 0x6($s2)
/* 4B864 8005B064 7000BF8F */  lw         $ra, 0x70($sp)
/* 4B868 8005B068 6C00B38F */  lw         $s3, 0x6C($sp)
/* 4B86C 8005B06C 6800B28F */  lw         $s2, 0x68($sp)
/* 4B870 8005B070 6400B18F */  lw         $s1, 0x64($sp)
/* 4B874 8005B074 6000B08F */  lw         $s0, 0x60($sp)
/* 4B878 8005B078 0800E003 */  jr         $ra
/* 4B87C 8005B07C 7800BD27 */   addiu     $sp, $sp, 0x78
.size STREAM_DumpUnit, . - STREAM_DumpUnit
