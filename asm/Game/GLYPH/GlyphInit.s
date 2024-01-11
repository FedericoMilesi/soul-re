.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphInit
/* 6B364 8007AB64 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6B368 8007AB68 1800B2AF */  sw         $s2, 0x18($sp)
/* 6B36C 8007AB6C 21908000 */  addu       $s2, $a0, $zero
/* 6B370 8007AB70 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6B374 8007AB74 1400B1AF */  sw         $s1, 0x14($sp)
/* 6B378 8007AB78 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B37C 8007AB7C 1400428E */  lw         $v0, 0x14($s2)
/* 6B380 8007AB80 0200033C */  lui        $v1, (0x20000 >> 16)
/* 6B384 8007AB84 24104300 */  and        $v0, $v0, $v1
/* 6B388 8007AB88 06004010 */  beqz       $v0, .L8007ABA4
/* 6B38C 8007AB8C 9C000424 */   addiu     $a0, $zero, 0x9C
/* 6B390 8007AB90 6C01448E */  lw         $a0, 0x16C($s2)
/* 6B394 8007AB94 2641010C */  jal        MEMPACK_Free
/* 6B398 8007AB98 00000000 */   nop
/* 6B39C 8007AB9C 14EB0108 */  j          .L8007AC50
/* 6B3A0 8007ABA0 00000000 */   nop
.L8007ABA4:
/* 6B3A4 8007ABA4 8140010C */  jal        MEMPACK_Malloc
/* 6B3A8 8007ABA8 1D000524 */   addiu     $a1, $zero, 0x1D
/* 6B3AC 8007ABAC 21884000 */  addu       $s1, $v0, $zero
/* 6B3B0 8007ABB0 04003026 */  addiu      $s0, $s1, 0x4
/* 6B3B4 8007ABB4 21200002 */  addu       $a0, $s0, $zero
/* 6B3B8 8007ABB8 24C3010C */  jal        InitMessageQueue
/* 6B3BC 8007ABBC 6C0151AE */   sw        $s1, 0x16C($s2)
/* 6B3C0 8007ABC0 21200002 */  addu       $a0, $s0, $zero
/* 6B3C4 8007ABC4 1000053C */  lui        $a1, (0x100001 >> 16)
/* 6B3C8 8007ABC8 0100A534 */  ori        $a1, $a1, (0x100001 & 0xFFFF)
/* 6B3CC 8007ABCC 4EC3010C */  jal        EnMessageQueueData
/* 6B3D0 8007ABD0 21300000 */   addu      $a2, $zero, $zero
/* 6B3D4 8007ABD4 0100043C */  lui        $a0, (0x10800 >> 16)
/* 6B3D8 8007ABD8 00088434 */  ori        $a0, $a0, (0x10800 & 0xFFFF)
/* 6B3DC 8007ABDC 0880023C */  lui        $v0, %hi(_GlyphOffProcess)
/* 6B3E0 8007ABE0 A0B54224 */  addiu      $v0, $v0, %lo(_GlyphOffProcess)
/* 6B3E4 8007ABE4 000022AE */  sw         $v0, 0x0($s1)
/* 6B3E8 8007ABE8 07000224 */  addiu      $v0, $zero, 0x7
/* 6B3EC 8007ABEC 8C0022A6 */  sh         $v0, 0x8C($s1)
/* 6B3F0 8007ABF0 8C002386 */  lh         $v1, 0x8C($s1)
/* 6B3F4 8007ABF4 B60D0224 */  addiu      $v0, $zero, 0xDB6
/* 6B3F8 8007ABF8 980022A6 */  sh         $v0, 0x98($s1)
/* 6B3FC 8007ABFC 01000224 */  addiu      $v0, $zero, 0x1
/* 6B400 8007AC00 900020A6 */  sh         $zero, 0x90($s1)
/* 6B404 8007AC04 DCEC80A7 */  sh         $zero, %gp_rel(glyph_time)($gp)
/* 6B408 8007AC08 920020A6 */  sh         $zero, 0x92($s1)
/* 6B40C 8007AC0C 940020A6 */  sh         $zero, 0x94($s1)
/* 6B410 8007AC10 9A0022A6 */  sh         $v0, 0x9A($s1)
/* 6B414 8007AC14 8E0020A6 */  sh         $zero, 0x8E($s1)
/* 6B418 8007AC18 DEEC80A7 */  sh         $zero, %gp_rel(glyph_trigger)($gp)
/* 6B41C 8007AC1C F4A480AF */  sw         $zero, %gp_rel(fx_blastring)($gp)
/* 6B420 8007AC20 F0A480A7 */  sh         $zero, %gp_rel(fx_going)($gp)
/* 6B424 8007AC24 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 6B428 8007AC28 C0100300 */  sll        $v0, $v1, 3
/* 6B42C 8007AC2C 21104300 */  addu       $v0, $v0, $v1
/* 6B430 8007AC30 80190200 */  sll        $v1, $v0, 6
/* 6B434 8007AC34 21104300 */  addu       $v0, $v0, $v1
/* 6B438 8007AC38 960022A6 */  sh         $v0, 0x96($s1)
/* 6B43C 8007AC3C 1400438E */  lw         $v1, 0x14($s2)
/* 6B440 8007AC40 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6B444 8007AC44 E0EC82A7 */  sh         $v0, %gp_rel(glyph_cost)($gp)
/* 6B448 8007AC48 25186400 */  or         $v1, $v1, $a0
/* 6B44C 8007AC4C 140043AE */  sw         $v1, 0x14($s2)
.L8007AC50:
/* 6B450 8007AC50 13F1010C */  jal        HUD_Init
/* 6B454 8007AC54 00000000 */   nop
/* 6B458 8007AC58 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6B45C 8007AC5C 1800B28F */  lw         $s2, 0x18($sp)
/* 6B460 8007AC60 1400B18F */  lw         $s1, 0x14($sp)
/* 6B464 8007AC64 1000B08F */  lw         $s0, 0x10($sp)
/* 6B468 8007AC68 C0FF0224 */  addiu      $v0, $zero, -0x40
/* 6B46C 8007AC6C F0EC80AF */  sw         $zero, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6B470 8007AC70 D8EC82A7 */  sh         $v0, %gp_rel(MANNA_Position)($gp)
/* 6B474 8007AC74 DAEC80A7 */  sh         $zero, %gp_rel(MANNA_Pos_vel)($gp)
/* 6B478 8007AC78 0800E003 */  jr         $ra
/* 6B47C 8007AC7C 2000BD27 */   addiu     $sp, $sp, 0x20
.size GlyphInit, . - GlyphInit
