.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawFogRectangle
/* 4FADC 8005F2DC 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 4FAE0 8005F2E0 1000A98F */  lw         $t1, 0x10($sp)
/* 4FAE4 8005F2E4 0400688C */  lw         $t0, 0x4($v1)
/* 4FAE8 8005F2E8 0800628C */  lw         $v0, 0x8($v1)
/* 4FAEC 8005F2EC 24000525 */  addiu      $a1, $t0, 0x24
/* 4FAF0 8005F2F0 2B10A200 */  sltu       $v0, $a1, $v0
/* 4FAF4 8005F2F4 32004010 */  beqz       $v0, .L8005F3C0
/* 4FAF8 8005F2F8 00000000 */   nop
/* 4FAFC 8005F2FC 040065AC */  sw         $a1, 0x4($v1)
/* 4FB00 8005F300 00008294 */  lhu        $v0, 0x0($a0)
/* 4FB04 8005F304 00000000 */  nop
/* 4FB08 8005F308 080002A5 */  sh         $v0, 0x8($t0)
/* 4FB0C 8005F30C 02008294 */  lhu        $v0, 0x2($a0)
/* 4FB10 8005F310 00000000 */  nop
/* 4FB14 8005F314 0A0002A5 */  sh         $v0, 0xA($t0)
/* 4FB18 8005F318 00008294 */  lhu        $v0, 0x0($a0)
/* 4FB1C 8005F31C 04008394 */  lhu        $v1, 0x4($a0)
/* 4FB20 8005F320 00000000 */  nop
/* 4FB24 8005F324 21104300 */  addu       $v0, $v0, $v1
/* 4FB28 8005F328 100002A5 */  sh         $v0, 0x10($t0)
/* 4FB2C 8005F32C 02008294 */  lhu        $v0, 0x2($a0)
/* 4FB30 8005F330 00000000 */  nop
/* 4FB34 8005F334 120002A5 */  sh         $v0, 0x12($t0)
/* 4FB38 8005F338 00008294 */  lhu        $v0, 0x0($a0)
/* 4FB3C 8005F33C 00000000 */  nop
/* 4FB40 8005F340 180002A5 */  sh         $v0, 0x18($t0)
/* 4FB44 8005F344 02008294 */  lhu        $v0, 0x2($a0)
/* 4FB48 8005F348 06008394 */  lhu        $v1, 0x6($a0)
/* 4FB4C 8005F34C FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 4FB50 8005F350 21104300 */  addu       $v0, $v0, $v1
/* 4FB54 8005F354 1A0002A5 */  sh         $v0, 0x1A($t0)
/* 4FB58 8005F358 00008294 */  lhu        $v0, 0x0($a0)
/* 4FB5C 8005F35C 04008394 */  lhu        $v1, 0x4($a0)
/* 4FB60 8005F360 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 4FB64 8005F364 21104300 */  addu       $v0, $v0, $v1
/* 4FB68 8005F368 200002A5 */  sh         $v0, 0x20($t0)
/* 4FB6C 8005F36C 02008394 */  lhu        $v1, 0x2($a0)
/* 4FB70 8005F370 06008494 */  lhu        $a0, 0x6($a0)
/* 4FB74 8005F374 08000224 */  addiu      $v0, $zero, 0x8
/* 4FB78 8005F378 030002A1 */  sb         $v0, 0x3($t0)
/* 4FB7C 8005F37C 38000224 */  addiu      $v0, $zero, 0x38
/* 4FB80 8005F380 040009AD */  sw         $t1, 0x4($t0)
/* 4FB84 8005F384 0C0009AD */  sw         $t1, 0xC($t0)
/* 4FB88 8005F388 140009AD */  sw         $t1, 0x14($t0)
/* 4FB8C 8005F38C 1C0009AD */  sw         $t1, 0x1C($t0)
/* 4FB90 8005F390 070002A1 */  sb         $v0, 0x7($t0)
/* 4FB94 8005F394 21186400 */  addu       $v1, $v1, $a0
/* 4FB98 8005F398 80200600 */  sll        $a0, $a2, 2
/* 4FB9C 8005F39C 21208700 */  addu       $a0, $a0, $a3
/* 4FBA0 8005F3A0 220003A5 */  sh         $v1, 0x22($t0)
/* 4FBA4 8005F3A4 0000828C */  lw         $v0, 0x0($a0)
/* 4FBA8 8005F3A8 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 4FBAC 8005F3AC 24104500 */  and        $v0, $v0, $a1
/* 4FBB0 8005F3B0 25104300 */  or         $v0, $v0, $v1
/* 4FBB4 8005F3B4 24280501 */  and        $a1, $t0, $a1
/* 4FBB8 8005F3B8 000002AD */  sw         $v0, 0x0($t0)
/* 4FBBC 8005F3BC 000085AC */  sw         $a1, 0x0($a0)
.L8005F3C0:
/* 4FBC0 8005F3C0 0800E003 */  jr         $ra
/* 4FBC4 8005F3C4 00000000 */   nop
.size DrawFogRectangle, . - DrawFogRectangle
