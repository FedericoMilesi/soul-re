.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ShrinkGlyphMenu
/* 6BB80 8007B380 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6BB84 8007B384 2400B1AF */  sw         $s1, 0x24($sp)
/* 6BB88 8007B388 21888000 */  addu       $s1, $a0, $zero
/* 6BB8C 8007B38C EFFF023C */  lui        $v0, (0xFFEFFFFF >> 16)
/* 6BB90 8007B390 0CBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 6BB94 8007B394 FFFF4234 */  ori        $v0, $v0, (0xFFEFFFFF & 0xFFFF)
/* 6BB98 8007B398 2800BFAF */  sw         $ra, 0x28($sp)
/* 6BB9C 8007B39C 2000B0AF */  sw         $s0, 0x20($sp)
/* 6BBA0 8007B3A0 6C01308E */  lw         $s0, 0x16C($s1)
/* 6BBA4 8007B3A4 24186200 */  and        $v1, $v1, $v0
/* 6BBA8 8007B3A8 0CBF83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 6BBAC 8007B3AC 90000286 */  lh         $v0, 0x90($s0)
/* 6BBB0 8007B3B0 90000396 */  lhu        $v1, 0x90($s0)
/* 6BBB4 8007B3B4 22004018 */  blez       $v0, .L8007B440
/* 6BBB8 8007B3B8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 6BBBC 8007B3BC 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6BBC0 8007B3C0 00000000 */  nop
/* 6BBC4 8007B3C4 40120200 */  sll        $v0, $v0, 9
/* 6BBC8 8007B3C8 02130200 */  srl        $v0, $v0, 12
/* 6BBCC 8007B3CC 23106200 */  subu       $v0, $v1, $v0
/* 6BBD0 8007B3D0 900002A6 */  sh         $v0, 0x90($s0)
/* 6BBD4 8007B3D4 00140200 */  sll        $v0, $v0, 16
/* 6BBD8 8007B3D8 02004104 */  bgez       $v0, .L8007B3E4
/* 6BBDC 8007B3DC 00000000 */   nop
/* 6BBE0 8007B3E0 900000A6 */  sh         $zero, 0x90($s0)
.L8007B3E4:
/* 6BBE4 8007B3E4 90000296 */  lhu        $v0, 0x90($s0)
/* 6BBE8 8007B3E8 90000486 */  lh         $a0, 0x90($s0)
/* 6BBEC 8007B3EC DCEC82A7 */  sh         $v0, %gp_rel(glyph_time)($gp)
/* 6BBF0 8007B3F0 D9EC010C */  jal        GlyphTime
/* 6BBF4 8007B3F4 00000000 */   nop
/* 6BBF8 8007B3F8 21204000 */  addu       $a0, $v0, $zero
/* 6BBFC 8007B3FC 80180400 */  sll        $v1, $a0, 2
/* 6BC00 8007B400 21186400 */  addu       $v1, $v1, $a0
/* 6BC04 8007B404 00110300 */  sll        $v0, $v1, 4
/* 6BC08 8007B408 23104300 */  subu       $v0, $v0, $v1
/* 6BC0C 8007B40C 40100200 */  sll        $v0, $v0, 1
/* 6BC10 8007B410 02004104 */  bgez       $v0, .L8007B41C
/* 6BC14 8007B414 00000000 */   nop
/* 6BC18 8007B418 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007B41C:
/* 6BC1C 8007B41C 90000386 */  lh         $v1, 0x90($s0)
/* 6BC20 8007B420 03130200 */  sra        $v0, $v0, 12
/* 6BC24 8007B424 920002A6 */  sh         $v0, 0x92($s0)
/* 6BC28 8007B428 06006018 */  blez       $v1, .L8007B444
/* 6BC2C 8007B42C 940004A6 */   sh        $a0, 0x94($s0)
/* 6BC30 8007B430 00EC010C */  jal        GlyphDrawMenu
/* 6BC34 8007B434 21202002 */   addu      $a0, $s1, $zero
/* 6BC38 8007B438 11ED0108 */  j          .L8007B444
/* 6BC3C 8007B43C 00000000 */   nop
.L8007B440:
/* 6BC40 8007B440 E0EC82A7 */  sh         $v0, %gp_rel(glyph_cost)($gp)
.L8007B444:
/* 6BC44 8007B444 F0EC838F */  lw         $v1, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6BC48 8007B448 00000000 */  nop
/* 6BC4C 8007B44C 0B00601C */  bgtz       $v1, .L8007B47C
/* 6BC50 8007B450 05000424 */   addiu     $a0, $zero, 0x5
/* 6BC54 8007B454 1800A227 */  addiu      $v0, $sp, 0x18
/* 6BC58 8007B458 1000A2AF */  sw         $v0, 0x10($sp)
/* 6BC5C 8007B45C 0C000224 */  addiu      $v0, $zero, 0xC
/* 6BC60 8007B460 D8EC8527 */  addiu      $a1, $gp, %gp_rel(MANNA_Position)
/* 6BC64 8007B464 C0FF0624 */  addiu      $a2, $zero, -0x40
/* 6BC68 8007B468 DAEC8727 */  addiu      $a3, $gp, %gp_rel(MANNA_Pos_vel)
/* 6BC6C 8007B46C 605C000C */  jal        CriticalDampValue
/* 6BC70 8007B470 1400A2AF */   sw        $v0, 0x14($sp)
/* 6BC74 8007B474 24ED0108 */  j          .L8007B490
/* 6BC78 8007B478 8E0000A6 */   sh        $zero, 0x8E($s0)
.L8007B47C:
/* 6BC7C 8007B47C 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6BC80 8007B480 00000000 */  nop
/* 6BC84 8007B484 23106200 */  subu       $v0, $v1, $v0
/* 6BC88 8007B488 F0EC82AF */  sw         $v0, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6BC8C 8007B48C 8E0000A6 */  sh         $zero, 0x8E($s0)
.L8007B490:
/* 6BC90 8007B490 2800BF8F */  lw         $ra, 0x28($sp)
/* 6BC94 8007B494 2400B18F */  lw         $s1, 0x24($sp)
/* 6BC98 8007B498 2000B08F */  lw         $s0, 0x20($sp)
/* 6BC9C 8007B49C 0800E003 */  jr         $ra
/* 6BCA0 8007B4A0 3000BD27 */   addiu     $sp, $sp, 0x30
.size ShrinkGlyphMenu, . - ShrinkGlyphMenu
