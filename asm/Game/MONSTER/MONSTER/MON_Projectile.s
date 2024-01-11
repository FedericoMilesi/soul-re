.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Projectile
/* 7A978 8008A178 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7A97C 8008A17C 1800B2AF */  sw         $s2, 0x18($sp)
/* 7A980 8008A180 21908000 */  addu       $s2, $a0, $zero
/* 7A984 8008A184 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7A988 8008A188 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A98C 8008A18C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A990 8008A190 6C01518E */  lw         $s1, 0x16C($s2)
/* 7A994 8008A194 00000000 */  nop
/* 7A998 8008A198 6801228E */  lw         $v0, 0x168($s1)
/* 7A99C 8008A19C 2400438E */  lw         $v1, 0x24($s2)
/* 7A9A0 8008A1A0 0800428C */  lw         $v0, 0x8($v0)
/* 7A9A4 8008A1A4 3C00638C */  lw         $v1, 0x3C($v1)
/* 7A9A8 8008A1A8 1E004280 */  lb         $v0, 0x1E($v0)
/* 7A9AC 8008A1AC C400248E */  lw         $a0, 0xC4($s1)
/* 7A9B0 8008A1B0 00110200 */  sll        $v0, $v0, 4
/* 7A9B4 8008A1B4 15008010 */  beqz       $a0, .L8008A20C
/* 7A9B8 8008A1B8 21806200 */   addu      $s0, $v1, $v0
/* 7A9BC 8008A1BC 1800428E */  lw         $v0, 0x18($s2)
/* 7A9C0 8008A1C0 00000000 */  nop
/* 7A9C4 8008A1C4 10004230 */  andi       $v0, $v0, 0x10
/* 7A9C8 8008A1C8 15004010 */  beqz       $v0, .L8008A220
/* 7A9CC 8008A1CC 00000000 */   nop
/* 7A9D0 8008A1D0 5F012292 */  lbu        $v0, 0x15F($s1)
/* 7A9D4 8008A1D4 00000000 */  nop
/* 7A9D8 8008A1D8 01004224 */  addiu      $v0, $v0, 0x1
/* 7A9DC 8008A1DC 5F0122A2 */  sb         $v0, 0x15F($s1)
/* 7A9E0 8008A1E0 00160200 */  sll        $v0, $v0, 24
/* 7A9E4 8008A1E4 0D000392 */  lbu        $v1, 0xD($s0)
/* 7A9E8 8008A1E8 03360200 */  sra        $a2, $v0, 24
/* 7A9EC 8008A1EC 2A18C300 */  slt        $v1, $a2, $v1
/* 7A9F0 8008A1F0 06006010 */  beqz       $v1, .L8008A20C
/* 7A9F4 8008A1F4 21204002 */   addu      $a0, $s2, $zero
/* 7A9F8 8008A1F8 0E000526 */  addiu      $a1, $s0, 0xE
/* 7A9FC 8008A1FC 6FFF010C */  jal        MON_PlayAnimFromList
/* 7AA00 8008A200 01000724 */   addiu     $a3, $zero, 0x1
/* 7AA04 8008A204 A7280208 */  j          .L8008A29C
/* 7AA08 8008A208 00000000 */   nop
.L8008A20C:
/* 7AA0C 8008A20C 21204002 */  addu       $a0, $s2, $zero
/* 7AA10 8008A210 91FE010C */  jal        MON_SwitchState
/* 7AA14 8008A214 0D000524 */   addiu     $a1, $zero, 0xD
/* 7AA18 8008A218 A7280208 */  j          .L8008A29C
/* 7AA1C 8008A21C 00000000 */   nop
.L8008A220:
/* 7AA20 8008A220 21204002 */  addu       $a0, $s2, $zero
/* 7AA24 8008A224 05000692 */  lbu        $a2, 0x5($s0)
/* 7AA28 8008A228 96FF010C */  jal        MON_AnimPlayingFromList
/* 7AA2C 8008A22C 0E000526 */   addiu     $a1, $s0, 0xE
/* 7AA30 8008A230 14004010 */  beqz       $v0, .L8008A284
/* 7AA34 8008A234 21204002 */   addu      $a0, $s2, $zero
/* 7AA38 8008A238 04000692 */  lbu        $a2, 0x4($s0)
/* 7AA3C 8008A23C CCC9010C */  jal        G2EmulationInstanceQueryPassedFrame
/* 7AA40 8008A240 21280000 */   addu      $a1, $zero, $zero
/* 7AA44 8008A244 0F004010 */  beqz       $v0, .L8008A284
/* 7AA48 8008A248 21204002 */   addu      $a0, $s2, $zero
/* 7AA4C 8008A24C C400228E */  lw         $v0, 0xC4($s1)
/* 7AA50 8008A250 00000000 */  nop
/* 7AA54 8008A254 0400468C */  lw         $a2, 0x4($v0)
/* 7AA58 8008A258 24F7010C */  jal        MISSILE_FireAtInstance
/* 7AA5C 8008A25C 21280002 */   addu      $a1, $s0, $zero
/* 7AA60 8008A260 0B000282 */  lb         $v0, 0xB($s0)
/* 7AA64 8008A264 00000000 */  nop
/* 7AA68 8008A268 05004010 */  beqz       $v0, .L8008A280
/* 7AA6C 8008A26C DFFF0324 */   addiu     $v1, $zero, -0x21
/* 7AA70 8008A270 0000228E */  lw         $v0, 0x0($s1)
/* 7AA74 8008A274 00000000 */  nop
/* 7AA78 8008A278 24104300 */  and        $v0, $v0, $v1
/* 7AA7C 8008A27C 000022AE */  sw         $v0, 0x0($s1)
.L8008A280:
/* 7AA80 8008A280 21204002 */  addu       $a0, $s2, $zero
.L8008A284:
/* 7AA84 8008A284 C400228E */  lw         $v0, 0xC4($s1)
/* 7AA88 8008A288 6801238E */  lw         $v1, 0x168($s1)
/* 7AA8C 8008A28C 0400458C */  lw         $a1, 0x4($v0)
/* 7AA90 8008A290 1C006684 */  lh         $a2, 0x1C($v1)
/* 7AA94 8008A294 6604020C */  jal        MON_TurnToPosition
/* 7AA98 8008A298 5C00A524 */   addiu     $a1, $a1, 0x5C
.L8008A29C:
/* 7AA9C 8008A29C 0917020C */  jal        MON_DefaultQueueHandler
/* 7AAA0 8008A2A0 21204002 */   addu      $a0, $s2, $zero
/* 7AAA4 8008A2A4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7AAA8 8008A2A8 1800B28F */  lw         $s2, 0x18($sp)
/* 7AAAC 8008A2AC 1400B18F */  lw         $s1, 0x14($sp)
/* 7AAB0 8008A2B0 1000B08F */  lw         $s0, 0x10($sp)
/* 7AAB4 8008A2B4 0800E003 */  jr         $ra
/* 7AAB8 8008A2B8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Projectile, . - MON_Projectile
