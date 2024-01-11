.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_DrawShadow
/* 1B254 8002AA54 21588000 */  addu       $t3, $a0, $zero
/* 1B258 8002AA58 0400658D */  lw         $a1, 0x4($t3)
/* 1B25C 8002AA5C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1B260 8002AA60 0400A0A7 */  sh         $zero, 0x4($sp)
/* 1B264 8002AA64 0200A0A7 */  sh         $zero, 0x2($sp)
/* 1B268 8002AA68 0000A0A7 */  sh         $zero, 0x0($sp)
/* 1B26C 8002AA6C 0000A0CB */  lwc2       $0, 0x0($sp)
/* 1B270 8002AA70 0400A1CB */  lwc2       $1, 0x4($sp)
/* 1B274 8002AA74 00000000 */  nop
/* 1B278 8002AA78 00000000 */  nop
/* 1B27C 8002AA7C 0100184A */  RTPS
/* 1B280 8002AA80 6000023C */  lui        $v0, (0x606060 >> 16)
/* 1B284 8002AA84 60604234 */  ori        $v0, $v0, (0x606060 & 0xFFFF)
/* 1B288 8002AA88 0C00A2AF */  sw         $v0, 0xC($sp)
/* 1B28C 8002AA8C 0800A227 */  addiu      $v0, $sp, 0x8
/* 1B290 8002AA90 000048E8 */  swc2       $8, 0x0($v0)
/* 1B294 8002AA94 0800A28F */  lw         $v0, 0x8($sp)
/* 1B298 8002AA98 00000000 */  nop
/* 1B29C 8002AA9C 2A104700 */  slt        $v0, $v0, $a3
/* 1B2A0 8002AAA0 04004010 */  beqz       $v0, .L8002AAB4
/* 1B2A4 8002AAA4 0110E228 */   slti      $v0, $a3, 0x1001
/* 1B2A8 8002AAA8 03004010 */  beqz       $v0, .L8002AAB8
/* 1B2AC 8002AAAC 0C00A227 */   addiu     $v0, $sp, 0xC
/* 1B2B0 8002AAB0 0800A7AF */  sw         $a3, 0x8($sp)
.L8002AAB4:
/* 1B2B4 8002AAB4 0C00A227 */  addiu      $v0, $sp, 0xC
.L8002AAB8:
/* 1B2B8 8002AAB8 000046C8 */  lwc2       $6, 0x0($v0)
/* 1B2BC 8002AABC 0800AC8F */  lw         $t4, 0x8($sp)
/* 1B2C0 8002AAC0 00000000 */  nop
/* 1B2C4 8002AAC4 00408C48 */  mtc2       $t4, $8 # handwritten instruction
/* 1B2C8 8002AAC8 00000000 */  nop
/* 1B2CC 8002AACC 00000000 */  nop
/* 1B2D0 8002AAD0 1000784A */  DPCS
/* 1B2D4 8002AAD4 000056E8 */  swc2       $22, 0x0($v0)
/* 1B2D8 8002AAD8 21400000 */  addu       $t0, $zero, $zero
/* 1B2DC 8002AADC FF000A3C */  lui        $t2, (0xFFFFFF >> 16)
/* 1B2E0 8002AAE0 FFFF4A35 */  ori        $t2, $t2, (0xFFFFFF & 0xFFFF)
/* 1B2E4 8002AAE4 8CB18927 */  addiu      $t1, $gp, %gp_rel(shadow_vertices)
/* 1B2E8 8002AAE8 0400A724 */  addiu      $a3, $a1, 0x4
/* 1B2EC 8002AAEC 0C00A28F */  lw         $v0, 0xC($sp)
/* 1B2F0 8002AAF0 0032033C */  lui        $v1, (0x32000000 >> 16)
/* 1B2F4 8002AAF4 25104300 */  or         $v0, $v0, $v1
/* 1B2F8 8002AAF8 0C00A2AF */  sw         $v0, 0xC($sp)
.L8002AAFC:
/* 1B2FC 8002AAFC C0180800 */  sll        $v1, $t0, 3
/* 1B300 8002AB00 000022C9 */  lwc2       $2, 0x0($t1)
/* 1B304 8002AB04 040023C9 */  lwc2       $3, 0x4($t1)
/* 1B308 8002AB08 94B18227 */  addiu      $v0, $gp, %gp_rel(shadow_vertices + 0x8)
/* 1B30C 8002AB0C 21186200 */  addu       $v1, $v1, $v0
/* 1B310 8002AB10 000064C8 */  lwc2       $4, 0x0($v1)
/* 1B314 8002AB14 040065C8 */  lwc2       $5, 0x4($v1)
/* 1B318 8002AB18 00000000 */  nop
/* 1B31C 8002AB1C 00000000 */  nop
/* 1B320 8002AB20 3000284A */  RTPT
/* 1B324 8002AB24 0800628D */  lw         $v0, 0x8($t3)
/* 1B328 8002AB28 00000000 */  nop
/* 1B32C 8002AB2C D0FF4224 */  addiu      $v0, $v0, -0x30
/* 1B330 8002AB30 2B104500 */  sltu       $v0, $v0, $a1
/* 1B334 8002AB34 35004014 */  bnez       $v0, .L8002AC0C
/* 1B338 8002AB38 2110A000 */   addu      $v0, $a1, $zero
/* 1B33C 8002AB3C 00000000 */  nop
/* 1B340 8002AB40 00000000 */  nop
/* 1B344 8002AB44 0600404B */  NCLIP
/* 1B348 8002AB48 1000A227 */  addiu      $v0, $sp, 0x10
/* 1B34C 8002AB4C 000058E8 */  swc2       $24, 0x0($v0)
/* 1B350 8002AB50 1000A28F */  lw         $v0, 0x10($sp)
/* 1B354 8002AB54 00000000 */  nop
/* 1B358 8002AB58 27004104 */  bgez       $v0, .L8002ABF8
/* 1B35C 8002AB5C 00000000 */   nop
/* 1B360 8002AB60 00000000 */  nop
/* 1B364 8002AB64 00000000 */  nop
/* 1B368 8002AB68 2D00584B */  AVSZ3
/* 1B36C 8002AB6C 1400A227 */  addiu      $v0, $sp, 0x14
/* 1B370 8002AB70 000047E8 */  swc2       $7, 0x0($v0)
/* 1B374 8002AB74 1400A28F */  lw         $v0, 0x14($sp)
/* 1B378 8002AB78 00000000 */  nop
/* 1B37C 8002AB7C C0FF4224 */  addiu      $v0, $v0, -0x40
/* 1B380 8002AB80 C00B422C */  sltiu      $v0, $v0, 0xBC0
/* 1B384 8002AB84 1C004010 */  beqz       $v0, .L8002ABF8
/* 1B388 8002AB88 0C00A424 */   addiu     $a0, $a1, 0xC
/* 1B38C 8002AB8C 1400A324 */  addiu      $v1, $a1, 0x14
/* 1B390 8002AB90 1C00A224 */  addiu      $v0, $a1, 0x1C
/* 1B394 8002AB94 00008CE8 */  swc2       $12, 0x0($a0)
/* 1B398 8002AB98 00006DE8 */  swc2       $13, 0x0($v1)
/* 1B39C 8002AB9C 00004EE8 */  swc2       $14, 0x0($v0)
/* 1B3A0 8002ABA0 0C00A28F */  lw         $v0, 0xC($sp)
/* 1B3A4 8002ABA4 00E1033C */  lui        $v1, (0xE1000640 >> 16)
/* 1B3A8 8002ABA8 0C00E0AC */  sw         $zero, 0xC($a3)
/* 1B3AC 8002ABAC 1400E0AC */  sw         $zero, 0x14($a3)
/* 1B3B0 8002ABB0 0400E2AC */  sw         $v0, 0x4($a3)
/* 1B3B4 8002ABB4 1400A48F */  lw         $a0, 0x14($sp)
/* 1B3B8 8002ABB8 40066334 */  ori        $v1, $v1, (0xE1000640 & 0xFFFF)
/* 1B3BC 8002ABBC 0000E3AC */  sw         $v1, 0x0($a3)
/* 1B3C0 8002ABC0 2000E724 */  addiu      $a3, $a3, 0x20
/* 1B3C4 8002ABC4 80200400 */  sll        $a0, $a0, 2
/* 1B3C8 8002ABC8 21208600 */  addu       $a0, $a0, $a2
/* 1B3CC 8002ABCC 0000838C */  lw         $v1, 0x0($a0)
/* 1B3D0 8002ABD0 0007023C */  lui        $v0, (0x7000000 >> 16)
/* 1B3D4 8002ABD4 24186A00 */  and        $v1, $v1, $t2
/* 1B3D8 8002ABD8 25186200 */  or         $v1, $v1, $v0
/* 1B3DC 8002ABDC 2410AA00 */  and        $v0, $a1, $t2
/* 1B3E0 8002ABE0 0000A3AC */  sw         $v1, 0x0($a1)
/* 1B3E4 8002ABE4 000082AC */  sw         $v0, 0x0($a0)
/* 1B3E8 8002ABE8 0000628D */  lw         $v0, 0x0($t3)
/* 1B3EC 8002ABEC 2000A524 */  addiu      $a1, $a1, 0x20
/* 1B3F0 8002ABF0 01004224 */  addiu      $v0, $v0, 0x1
/* 1B3F4 8002ABF4 000062AD */  sw         $v0, 0x0($t3)
.L8002ABF8:
/* 1B3F8 8002ABF8 01000825 */  addiu      $t0, $t0, 0x1
/* 1B3FC 8002ABFC 0A000229 */  slti       $v0, $t0, 0xA
/* 1B400 8002AC00 BEFF4014 */  bnez       $v0, .L8002AAFC
/* 1B404 8002AC04 08002925 */   addiu     $t1, $t1, 0x8
/* 1B408 8002AC08 2110A000 */  addu       $v0, $a1, $zero
.L8002AC0C:
/* 1B40C 8002AC0C 0800E003 */  jr         $ra
/* 1B410 8002AC10 1800BD27 */   addiu     $sp, $sp, 0x18
.size DRAW_DrawShadow, . - DRAW_DrawShadow
