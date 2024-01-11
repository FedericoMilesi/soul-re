.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeWarpArrow
/* 37210 80046A10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 37214 80046A14 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 37218 80046A18 21888000 */  addu       $s1, $a0, $zero
/* 3721C 80046A1C 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 37220 80046A20 90A2448C */  lw         $a0, %lo(objectAccess + 0x54)($v0)
/* 37224 80046A24 5000A28F */  lw         $v0, 0x50($sp)
/* 37228 80046A28 3400B3AF */  sw         $s3, 0x34($sp)
/* 3722C 80046A2C 2198A000 */  addu       $s3, $a1, $zero
/* 37230 80046A30 3000B2AF */  sw         $s2, 0x30($sp)
/* 37234 80046A34 2190C000 */  addu       $s2, $a2, $zero
/* 37238 80046A38 3800B4AF */  sw         $s4, 0x38($sp)
/* 3723C 80046A3C 21A0E000 */  addu       $s4, $a3, $zero
/* 37240 80046A40 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 37244 80046A44 22008010 */  beqz       $a0, .L80046AD0
/* 37248 80046A48 2800B0AF */   sw        $s0, 0x28($sp)
/* 3724C 80046A4C 06004104 */  bgez       $v0, .L80046A68
/* 37250 80046A50 43810200 */   sra       $s0, $v0, 5
/* 37254 80046A54 21100000 */  addu       $v0, $zero, $zero
/* 37258 80046A58 03004104 */  bgez       $v0, .L80046A68
/* 3725C 80046A5C 43810200 */   sra       $s0, $v0, 5
/* 37260 80046A60 1F004224 */  addiu      $v0, $v0, 0x1F
/* 37264 80046A64 43810200 */  sra        $s0, $v0, 5
.L80046A68:
/* 37268 80046A68 00121000 */  sll        $v0, $s0, 8
/* 3726C 80046A6C 25100202 */  or         $v0, $s0, $v0
/* 37270 80046A70 001C1000 */  sll        $v1, $s0, 16
/* 37274 80046A74 25804300 */  or         $s0, $v0, $v1
/* 37278 80046A78 21280000 */  addu       $a1, $zero, $zero
/* 3727C 80046A7C 9D19010C */  jal        FX_GetTextureObject
/* 37280 80046A80 09000624 */   addiu     $a2, $zero, 0x9
/* 37284 80046A84 21203202 */  addu       $a0, $s1, $s2
/* 37288 80046A88 21286002 */  addu       $a1, $s3, $zero
/* 3728C 80046A8C 21302002 */  addu       $a2, $s1, $zero
/* 37290 80046A90 03000324 */  addiu      $v1, $zero, 0x3
/* 37294 80046A94 2138B400 */  addu       $a3, $a1, $s4
/* 37298 80046A98 1000A3AF */  sw         $v1, 0x10($sp)
/* 3729C 80046A9C 1400A2AF */  sw         $v0, 0x14($sp)
/* 372A0 80046AA0 1800B0AF */  sw         $s0, 0x18($sp)
/* 372A4 80046AA4 1C00B0AF */  sw         $s0, 0x1C($sp)
/* 372A8 80046AA8 2000B0AF */  sw         $s0, 0x20($sp)
/* 372AC 80046AAC 431A010C */  jal        FX_SetupPolyGT4
/* 372B0 80046AB0 2400B0AF */   sw        $s0, 0x24($sp)
/* 372B4 80046AB4 21184000 */  addu       $v1, $v0, $zero
/* 372B8 80046AB8 05006010 */  beqz       $v1, .L80046AD0
/* 372BC 80046ABC 00000000 */   nop
/* 372C0 80046AC0 07006290 */  lbu        $v0, 0x7($v1)
/* 372C4 80046AC4 00000000 */  nop
/* 372C8 80046AC8 02004234 */  ori        $v0, $v0, 0x2
/* 372CC 80046ACC 070062A0 */  sb         $v0, 0x7($v1)
.L80046AD0:
/* 372D0 80046AD0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 372D4 80046AD4 3800B48F */  lw         $s4, 0x38($sp)
/* 372D8 80046AD8 3400B38F */  lw         $s3, 0x34($sp)
/* 372DC 80046ADC 3000B28F */  lw         $s2, 0x30($sp)
/* 372E0 80046AE0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 372E4 80046AE4 2800B08F */  lw         $s0, 0x28($sp)
/* 372E8 80046AE8 0800E003 */  jr         $ra
/* 372EC 80046AEC 4000BD27 */   addiu     $sp, $sp, 0x40
.size FX_MakeWarpArrow, . - FX_MakeWarpArrow
