.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSfxAbort
/* 43A28 80053228 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 43A2C 8005322C 1000B0AF */  sw         $s0, 0x10($sp)
/* 43A30 80053230 21808000 */  addu       $s0, $a0, $zero
/* 43A34 80053234 1400BFAF */  sw         $ra, 0x14($sp)
/* 43A38 80053238 7800038E */  lw         $v1, 0x78($s0)
/* 43A3C 8005323C 00000000 */  nop
/* 43A40 80053240 15006010 */  beqz       $v1, .L80053298
/* 43A44 80053244 00000000 */   nop
/* 43A48 80053248 5C00028E */  lw         $v0, 0x5C($s0)
/* 43A4C 8005324C 00000000 */  nop
/* 43A50 80053250 02004230 */  andi       $v0, $v0, 0x2
/* 43A54 80053254 0A004010 */  beqz       $v0, .L80053280
/* 43A58 80053258 00000000 */   nop
/* 43A5C 8005325C 0C00628C */  lw         $v0, 0xC($v1)
/* 43A60 80053260 00000000 */  nop
/* 43A64 80053264 03004010 */  beqz       $v0, .L80053274
/* 43A68 80053268 00000000 */   nop
/* 43A6C 8005326C A04C0108 */  j          .L80053280
/* 43A70 80053270 100040AC */   sw        $zero, 0x10($v0)
.L80053274:
/* 43A74 80053274 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 43A78 80053278 00000000 */  nop
/* 43A7C 8005327C E00740AC */  sw         $zero, 0x7E0($v0)
.L80053280:
/* 43A80 80053280 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 43A84 80053284 7800048E */  lw         $a0, 0x78($s0)
/* 43A88 80053288 3C07428C */  lw         $v0, 0x73C($v0)
/* 43A8C 8005328C 00000000 */  nop
/* 43A90 80053290 09F84000 */  jalr       $v0
/* 43A94 80053294 00000000 */   nop
.L80053298:
/* 43A98 80053298 5C0000AE */  sw         $zero, 0x5C($s0)
/* 43A9C 8005329C 1400BF8F */  lw         $ra, 0x14($sp)
/* 43AA0 800532A0 1000B08F */  lw         $s0, 0x10($sp)
/* 43AA4 800532A4 0800E003 */  jr         $ra
/* 43AA8 800532A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadLoadDynamicSfxAbort, . - aadLoadDynamicSfxAbort
