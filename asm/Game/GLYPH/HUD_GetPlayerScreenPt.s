.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_GetPlayerScreenPt
/* 6B770 8007AF70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6B774 8007AF74 1800B0AF */  sw         $s0, 0x18($sp)
/* 6B778 8007AF78 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6B77C 8007AF7C CDFD020C */  jal        func_800BF734
/* 6B780 8007AF80 21808000 */   addu      $s0, $a0, $zero
/* 6B784 8007AF84 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 6B788 8007AF88 52F2020C */  jal        func_800BC948
/* 6B78C 8007AF8C 00000000 */   nop
/* 6B790 8007AF90 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 6B794 8007AF94 4AF2020C */  jal        func_800BC928
/* 6B798 8007AF98 00000000 */   nop
/* 6B79C 8007AF9C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6B7A0 8007AFA0 00000000 */  nop
/* 6B7A4 8007AFA4 5F004388 */  lwl        $v1, 0x5F($v0)
/* 6B7A8 8007AFA8 5C004398 */  lwr        $v1, 0x5C($v0)
/* 6B7AC 8007AFAC 60004584 */  lh         $a1, 0x60($v0)
/* 6B7B0 8007AFB0 1300A3AB */  swl        $v1, 0x13($sp)
/* 6B7B4 8007AFB4 1000A3BB */  swr        $v1, 0x10($sp)
/* 6B7B8 8007AFB8 1400A5A7 */  sh         $a1, 0x14($sp)
/* 6B7BC 8007AFBC 1400A297 */  lhu        $v0, 0x14($sp)
/* 6B7C0 8007AFC0 00000000 */  nop
/* 6B7C4 8007AFC4 C0014224 */  addiu      $v0, $v0, 0x1C0
/* 6B7C8 8007AFC8 1400A2A7 */  sh         $v0, 0x14($sp)
/* 6B7CC 8007AFCC 1000A227 */  addiu      $v0, $sp, 0x10
/* 6B7D0 8007AFD0 000040C8 */  lwc2       $0, 0x0($v0)
/* 6B7D4 8007AFD4 040041C8 */  lwc2       $1, 0x4($v0)
/* 6B7D8 8007AFD8 00000000 */  nop
/* 6B7DC 8007AFDC 00000000 */  nop
/* 6B7E0 8007AFE0 0100184A */  RTPS
/* 6B7E4 8007AFE4 00000EEA */  swc2       $14, 0x0($s0)
/* 6B7E8 8007AFE8 F6FD020C */  jal        func_800BF7D8
/* 6B7EC 8007AFEC 00000000 */   nop
/* 6B7F0 8007AFF0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6B7F4 8007AFF4 1800B08F */  lw         $s0, 0x18($sp)
/* 6B7F8 8007AFF8 0800E003 */  jr         $ra
/* 6B7FC 8007AFFC 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUD_GetPlayerScreenPt, . - HUD_GetPlayerScreenPt
