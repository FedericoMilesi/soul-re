.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSfxReturn
/* 43AB4 800532B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43AB8 800532B8 1000B0AF */  sw         $s0, 0x10($sp)
/* 43ABC 800532BC 2180A000 */  addu       $s0, $a1, $zero
/* 43AC0 800532C0 1800BFAF */  sw         $ra, 0x18($sp)
/* 43AC4 800532C4 1400B1AF */  sw         $s1, 0x14($sp)
/* 43AC8 800532C8 7800118E */  lw         $s1, 0x78($s0)
/* 43ACC 800532CC 00000000 */  nop
/* 43AD0 800532D0 03002012 */  beqz       $s1, .L800532E0
/* 43AD4 800532D4 00000000 */   nop
/* 43AD8 800532D8 06002412 */  beq        $s1, $a0, .L800532F4
/* 43ADC 800532DC 61000424 */   addiu     $a0, $zero, 0x61
.L800532E0:
/* 43AE0 800532E0 21200002 */  addu       $a0, $s0, $zero
/* 43AE4 800532E4 8A4C010C */  jal        aadLoadDynamicSfxAbort
/* 43AE8 800532E8 0E100524 */   addiu     $a1, $zero, 0x100E
/* 43AEC 800532EC 064D0108 */  j          .L80053418
/* 43AF0 800532F0 00000000 */   nop
.L800532F4:
/* 43AF4 800532F4 53000524 */  addiu      $a1, $zero, 0x53
/* 43AF8 800532F8 4E000624 */  addiu      $a2, $zero, 0x4E
/* 43AFC 800532FC 3949010C */  jal        aadCreateFourCharID
/* 43B00 80053300 46000724 */   addiu     $a3, $zero, 0x46
/* 43B04 80053304 0000238E */  lw         $v1, 0x0($s1)
/* 43B08 80053308 00000000 */  nop
/* 43B0C 8005330C 07006214 */  bne        $v1, $v0, .L8005332C
/* 43B10 80053310 21200002 */   addu      $a0, $s0, $zero
/* 43B14 80053314 7800058E */  lw         $a1, 0x78($s0)
/* 43B18 80053318 00000000 */  nop
/* 43B1C 8005331C 0400A394 */  lhu        $v1, 0x4($a1)
/* 43B20 80053320 00010224 */  addiu      $v0, $zero, 0x100
/* 43B24 80053324 05006210 */  beq        $v1, $v0, .L8005333C
/* 43B28 80053328 00000000 */   nop
.L8005332C:
/* 43B2C 8005332C 8A4C010C */  jal        aadLoadDynamicSfxAbort
/* 43B30 80053330 0B100524 */   addiu     $a1, $zero, 0x100B
/* 43B34 80053334 064D0108 */  j          .L80053418
/* 43B38 80053338 00000000 */   nop
.L8005333C:
/* 43B3C 8005333C 50000296 */  lhu        $v0, 0x50($s0)
/* 43B40 80053340 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 43B44 80053344 0800A2A4 */  sh         $v0, 0x8($a1)
/* 43B48 80053348 E007838C */  lw         $v1, 0x7E0($a0)
/* 43B4C 8005334C 00000000 */  nop
/* 43B50 80053350 11006010 */  beqz       $v1, .L80053398
/* 43B54 80053354 00000000 */   nop
/* 43B58 80053358 1000628C */  lw         $v0, 0x10($v1)
/* 43B5C 8005335C 00000000 */  nop
/* 43B60 80053360 07004010 */  beqz       $v0, .L80053380
/* 43B64 80053364 00000000 */   nop
.L80053368:
/* 43B68 80053368 1000638C */  lw         $v1, 0x10($v1)
/* 43B6C 8005336C 00000000 */  nop
/* 43B70 80053370 1000628C */  lw         $v0, 0x10($v1)
/* 43B74 80053374 00000000 */  nop
/* 43B78 80053378 FBFF4014 */  bnez       $v0, .L80053368
/* 43B7C 8005337C 00000000 */   nop
.L80053380:
/* 43B80 80053380 7800028E */  lw         $v0, 0x78($s0)
/* 43B84 80053384 00000000 */  nop
/* 43B88 80053388 100062AC */  sw         $v0, 0x10($v1)
/* 43B8C 8005338C 7800028E */  lw         $v0, 0x78($s0)
/* 43B90 80053390 EC4C0108 */  j          .L800533B0
/* 43B94 80053394 0C0043AC */   sw        $v1, 0xC($v0)
.L80053398:
/* 43B98 80053398 7800028E */  lw         $v0, 0x78($s0)
/* 43B9C 8005339C 00000000 */  nop
/* 43BA0 800533A0 E00782AC */  sw         $v0, 0x7E0($a0)
/* 43BA4 800533A4 7800028E */  lw         $v0, 0x78($s0)
/* 43BA8 800533A8 00000000 */  nop
/* 43BAC 800533AC 0C0040AC */  sw         $zero, 0xC($v0)
.L800533B0:
/* 43BB0 800533B0 7800028E */  lw         $v0, 0x78($s0)
/* 43BB4 800533B4 00000000 */  nop
/* 43BB8 800533B8 100040AC */  sw         $zero, 0x10($v0)
/* 43BBC 800533BC 5C00028E */  lw         $v0, 0x5C($s0)
/* 43BC0 800533C0 5400048E */  lw         $a0, 0x54($s0)
/* 43BC4 800533C4 600000AE */  sw         $zero, 0x60($s0)
/* 43BC8 800533C8 02004234 */  ori        $v0, $v0, 0x2
/* 43BCC 800533CC 03008010 */  beqz       $a0, .L800533DC
/* 43BD0 800533D0 5C0002AE */   sw        $v0, 0x5C($s0)
/* 43BD4 800533D4 1DE1000C */  jal        LOAD_SetSearchDirectory
/* 43BD8 800533D8 00000000 */   nop
.L800533DC:
/* 43BDC 800533DC 28000426 */  addiu      $a0, $s0, 0x28
/* 43BE0 800533E0 0580053C */  lui        $a1, %hi(aadLoadDynamicSfxReturn2)
/* 43BE4 800533E4 5C3CA524 */  addiu      $a1, $a1, %lo(aadLoadDynamicSfxReturn2)
/* 43BE8 800533E8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 43BEC 800533EC 21300002 */  addu       $a2, $s0, $zero
/* 43BF0 800533F0 3407428C */  lw         $v0, 0x734($v0)
/* 43BF4 800533F4 00000000 */  nop
/* 43BF8 800533F8 09F84000 */  jalr       $v0
/* 43BFC 800533FC 21380000 */   addu      $a3, $zero, $zero
/* 43C00 80053400 5400028E */  lw         $v0, 0x54($s0)
/* 43C04 80053404 00000000 */  nop
/* 43C08 80053408 03004010 */  beqz       $v0, .L80053418
/* 43C0C 8005340C 00000000 */   nop
/* 43C10 80053410 1DE1000C */  jal        LOAD_SetSearchDirectory
/* 43C14 80053414 21200000 */   addu      $a0, $zero, $zero
.L80053418:
/* 43C18 80053418 1800BF8F */  lw         $ra, 0x18($sp)
/* 43C1C 8005341C 1400B18F */  lw         $s1, 0x14($sp)
/* 43C20 80053420 1000B08F */  lw         $s0, 0x10($sp)
/* 43C24 80053424 0800E003 */  jr         $ra
/* 43C28 80053428 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadLoadDynamicSfxReturn, . - aadLoadDynamicSfxReturn
