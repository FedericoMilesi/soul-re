.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HEALTHU_Pickup
/* 6CB78 8007C378 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6CB7C 8007C37C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6CB80 8007C380 21808000 */  addu       $s0, $a0, $zero
/* 6CB84 8007C384 00AD848F */  lw         $a0, %gp_rel(theCamera + 0x70)($gp)
/* 6CB88 8007C388 00ED8627 */  addiu      $a2, $gp, %gp_rel(HUD_Cap_Pos)
/* 6CB8C 8007C38C 1400BFAF */  sw         $ra, 0x14($sp)
/* 6CB90 8007C390 0EF3020C */  jal        ApplyMatrixSV
/* 6CB94 8007C394 5C000526 */   addiu     $a1, $s0, 0x5C
/* 6CB98 8007C398 00AD848F */  lw         $a0, %gp_rel(theCamera + 0x70)($gp)
/* 6CB9C 8007C39C 00ED8297 */  lhu        $v0, %gp_rel(HUD_Cap_Pos)($gp)
/* 6CBA0 8007C3A0 14008394 */  lhu        $v1, 0x14($a0)
/* 6CBA4 8007C3A4 00000000 */  nop
/* 6CBA8 8007C3A8 21104300 */  addu       $v0, $v0, $v1
/* 6CBAC 8007C3AC 00ED82A7 */  sh         $v0, %gp_rel(HUD_Cap_Pos)($gp)
/* 6CBB0 8007C3B0 02ED8297 */  lhu        $v0, %gp_rel(HUD_Cap_Pos + 0x2)($gp)
/* 6CBB4 8007C3B4 18008394 */  lhu        $v1, 0x18($a0)
/* 6CBB8 8007C3B8 00000000 */  nop
/* 6CBBC 8007C3BC 21104300 */  addu       $v0, $v0, $v1
/* 6CBC0 8007C3C0 02ED82A7 */  sh         $v0, %gp_rel(HUD_Cap_Pos + 0x2)($gp)
/* 6CBC4 8007C3C4 04ED8297 */  lhu        $v0, %gp_rel(HUD_Cap_Pos + 0x4)($gp)
/* 6CBC8 8007C3C8 1C008394 */  lhu        $v1, 0x1C($a0)
/* 6CBCC 8007C3CC 0CED80A7 */  sh         $zero, %gp_rel(HUD_Cap_Vel + 0x4)($gp)
/* 6CBD0 8007C3D0 0AED80A7 */  sh         $zero, %gp_rel(HUD_Cap_Vel + 0x2)($gp)
/* 6CBD4 8007C3D4 08ED80A7 */  sh         $zero, %gp_rel(HUD_Cap_Vel)($gp)
/* 6CBD8 8007C3D8 21104300 */  addu       $v0, $v0, $v1
/* 6CBDC 8007C3DC 04ED82A7 */  sh         $v0, %gp_rel(HUD_Cap_Pos + 0x4)($gp)
/* 6CBE0 8007C3E0 85D1000C */  jal        INSTANCE_KillInstance
/* 6CBE4 8007C3E4 21200002 */   addu      $a0, $s0, $zero
/* 6CBE8 8007C3E8 1400BF8F */  lw         $ra, 0x14($sp)
/* 6CBEC 8007C3EC 1000B08F */  lw         $s0, 0x10($sp)
/* 6CBF0 8007C3F0 01000224 */  addiu      $v0, $zero, 0x1
/* 6CBF4 8007C3F4 F8A482A7 */  sh         $v0, %gp_rel(HUD_Captured)($gp)
/* 6CBF8 8007C3F8 FCEC82A7 */  sh         $v0, %gp_rel(HUD_State)($gp)
/* 6CBFC 8007C3FC 0800E003 */  jr         $ra
/* 6CC00 8007C400 1800BD27 */   addiu     $sp, $sp, 0x18
.size HEALTHU_Pickup, . - HEALTHU_Pickup
