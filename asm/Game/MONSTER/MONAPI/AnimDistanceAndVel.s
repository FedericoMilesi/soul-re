.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AnimDistanceAndVel
/* 6F2F4 8007EAF4 18FFBD27 */  addiu      $sp, $sp, -0xE8
/* 6F2F8 8007EAF8 D400B1AF */  sw         $s1, 0xD4($sp)
/* 6F2FC 8007EAFC 21888000 */  addu       $s1, $a0, $zero
/* 6F300 8007EB00 DC00B3AF */  sw         $s3, 0xDC($sp)
/* 6F304 8007EB04 2198A000 */  addu       $s3, $a1, $zero
/* 6F308 8007EB08 E000BFAF */  sw         $ra, 0xE0($sp)
/* 6F30C 8007EB0C D800B2AF */  sw         $s2, 0xD8($sp)
/* 6F310 8007EB10 D000B0AF */  sw         $s0, 0xD0($sp)
/* 6F314 8007EB14 0C00228E */  lw         $v0, 0xC($s1)
/* 6F318 8007EB18 00000000 */  nop
/* 6F31C 8007EB1C 0000458C */  lw         $a1, 0x0($v0)
/* 6F320 8007EB20 0C006282 */  lb         $v0, 0xC($s3)
/* 6F324 8007EB24 1000238E */  lw         $v1, 0x10($s1)
/* 6F328 8007EB28 80100200 */  sll        $v0, $v0, 2
/* 6F32C 8007EB2C 21104300 */  addu       $v0, $v0, $v1
/* 6F330 8007EB30 0000528C */  lw         $s2, 0x0($v0)
/* 6F334 8007EB34 E94A020C */  jal        G2Anim_Init
/* 6F338 8007EB38 1000A427 */   addiu     $a0, $sp, 0x10
/* 6F33C 8007EB3C 3400B027 */  addiu      $s0, $sp, 0x34
/* 6F340 8007EB40 020000A2 */  sb         $zero, 0x2($s0)
/* 6F344 8007EB44 0C00228E */  lw         $v0, 0xC($s1)
/* 6F348 8007EB48 00000000 */  nop
/* 6F34C 8007EB4C 0000428C */  lw         $v0, 0x0($v0)
/* 6F350 8007EB50 21200002 */  addu       $a0, $s0, $zero
/* 6F354 8007EB54 18004290 */  lbu        $v0, 0x18($v0)
/* 6F358 8007EB58 21280000 */  addu       $a1, $zero, $zero
/* 6F35C 8007EB5C 1C0000AE */  sw         $zero, 0x1C($s0)
/* 6F360 8007EB60 200000AE */  sw         $zero, 0x20($s0)
/* 6F364 8007EB64 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 6F368 8007EB68 030002A2 */   sb        $v0, 0x3($s0)
/* 6F36C 8007EB6C 21200002 */  addu       $a0, $s0, $zero
/* 6F370 8007EB70 21284002 */  addu       $a1, $s2, $zero
/* 6F374 8007EB74 0C006682 */  lb         $a2, 0xC($s3)
/* 6F378 8007EB78 624D020C */  jal        G2AnimSection_SwitchToKeylistAtTime
/* 6F37C 8007EB7C 21380000 */   addu      $a3, $zero, $zero
/* 6F380 8007EB80 1000A427 */  addiu      $a0, $sp, 0x10
/* 6F384 8007EB84 21280000 */  addu       $a1, $zero, $zero
/* 6F388 8007EB88 314C020C */  jal        G2Anim_SegmentHasActiveChannels
/* 6F38C 8007EB8C 00070624 */   addiu     $a2, $zero, 0x700
/* 6F390 8007EB90 29004010 */  beqz       $v0, .L8007EC38
/* 6F394 8007EB94 00000000 */   nop
/* 6F398 8007EB98 D33F020C */  jal        G2AnimKeylist_GetDuration
/* 6F39C 8007EB9C 21204002 */   addu      $a0, $s2, $zero
/* 6F3A0 8007EBA0 1000A427 */  addiu      $a0, $sp, 0x10
/* 6F3A4 8007EBA4 21280000 */  addu       $a1, $zero, $zero
/* 6F3A8 8007EBA8 00140200 */  sll        $v0, $v0, 16
/* 6F3AC 8007EBAC 03340200 */  sra        $a2, $v0, 16
/* 6F3B0 8007EBB0 E63E020C */  jal        G2Anim_GetRootMotionOverInterval
/* 6F3B4 8007EBB4 C800A727 */   addiu     $a3, $sp, 0xC8
/* 6F3B8 8007EBB8 C800A287 */  lh         $v0, 0xC8($sp)
/* 6F3BC 8007EBBC 00000000 */  nop
/* 6F3C0 8007EBC0 18004200 */  mult       $v0, $v0
/* 6F3C4 8007EBC4 12200000 */  mflo       $a0
/* 6F3C8 8007EBC8 CA00A287 */  lh         $v0, 0xCA($sp)
/* 6F3CC 8007EBCC 00000000 */  nop
/* 6F3D0 8007EBD0 18004200 */  mult       $v0, $v0
/* 6F3D4 8007EBD4 12180000 */  mflo       $v1
/* 6F3D8 8007EBD8 CC00A287 */  lh         $v0, 0xCC($sp)
/* 6F3DC 8007EBDC 00000000 */  nop
/* 6F3E0 8007EBE0 18004200 */  mult       $v0, $v0
/* 6F3E4 8007EBE4 21208300 */  addu       $a0, $a0, $v1
/* 6F3E8 8007EBE8 12480000 */  mflo       $t1
/* 6F3EC 8007EBEC A6E7000C */  jal        MATH3D_FastSqrt0
/* 6F3F0 8007EBF0 21208900 */   addu      $a0, $a0, $t1
/* 6F3F4 8007EBF4 21204002 */  addu       $a0, $s2, $zero
/* 6F3F8 8007EBF8 D33F020C */  jal        G2AnimKeylist_GetDuration
/* 6F3FC 8007EBFC 21804000 */   addu      $s0, $v0, $zero
/* 6F400 8007EC00 40181000 */  sll        $v1, $s0, 1
/* 6F404 8007EC04 21187000 */  addu       $v1, $v1, $s0
/* 6F408 8007EC08 C0180300 */  sll        $v1, $v1, 3
/* 6F40C 8007EC0C 21187000 */  addu       $v1, $v1, $s0
/* 6F410 8007EC10 04006496 */  lhu        $a0, 0x4($s3)
/* 6F414 8007EC14 80180300 */  sll        $v1, $v1, 2
/* 6F418 8007EC18 18008300 */  mult       $a0, $v1
/* 6F41C 8007EC1C 12180000 */  mflo       $v1
/* 6F420 8007EC20 00140200 */  sll        $v0, $v0, 16
/* 6F424 8007EC24 03110200 */  sra        $v0, $v0, 4
/* 6F428 8007EC28 1A006200 */  div        $zero, $v1, $v0
/* 6F42C 8007EC2C 12100000 */  mflo       $v0
/* 6F430 8007EC30 020070A6 */  sh         $s0, 0x2($s3)
/* 6F434 8007EC34 000062A6 */  sh         $v0, 0x0($s3)
.L8007EC38:
/* 6F438 8007EC38 354B020C */  jal        G2Anim_Free
/* 6F43C 8007EC3C 1000A427 */   addiu     $a0, $sp, 0x10
/* 6F440 8007EC40 E000BF8F */  lw         $ra, 0xE0($sp)
/* 6F444 8007EC44 DC00B38F */  lw         $s3, 0xDC($sp)
/* 6F448 8007EC48 D800B28F */  lw         $s2, 0xD8($sp)
/* 6F44C 8007EC4C D400B18F */  lw         $s1, 0xD4($sp)
/* 6F450 8007EC50 D000B08F */  lw         $s0, 0xD0($sp)
/* 6F454 8007EC54 0800E003 */  jr         $ra
/* 6F458 8007EC58 E800BD27 */   addiu     $sp, $sp, 0xE8
.size AnimDistanceAndVel, . - AnimDistanceAndVel
