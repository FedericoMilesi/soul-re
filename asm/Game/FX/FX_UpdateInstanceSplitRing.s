.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdateInstanceSplitRing
/* 3BBAC 8004B3AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3BBB0 8004B3B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 3BBB4 8004B3B4 21808000 */  addu       $s0, $a0, $zero
/* 3BBB8 8004B3B8 1400BFAF */  sw         $ra, 0x14($sp)
/* 3BBBC 8004B3BC 0E000286 */  lh         $v0, 0xE($s0)
/* 3BBC0 8004B3C0 00000000 */  nop
/* 3BBC4 8004B3C4 17004010 */  beqz       $v0, .L8004B424
/* 3BBC8 8004B3C8 00000000 */   nop
/* 3BBCC 8004B3CC 0D000292 */  lbu        $v0, 0xD($s0)
/* 3BBD0 8004B3D0 00000000 */  nop
/* 3BBD4 8004B3D4 05004014 */  bnez       $v0, .L8004B3EC
/* 3BBD8 8004B3D8 00000000 */   nop
/* 3BBDC 8004B3DC 4A2C010C */  jal        FX_UpdatePowerRing
/* 3BBE0 8004B3E0 00000000 */   nop
/* 3BBE4 8004B3E4 052D0108 */  j          .L8004B414
/* 3BBE8 8004B3E8 00000000 */   nop
.L8004B3EC:
/* 3BBEC 8004B3EC 1000028E */  lw         $v0, 0x10($s0)
/* 3BBF0 8004B3F0 04C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 3BBF4 8004B3F4 0E000486 */  lh         $a0, 0xE($s0)
/* 3BBF8 8004B3F8 21104300 */  addu       $v0, $v0, $v1
/* 3BBFC 8004B3FC 100002AE */  sw         $v0, 0x10($s0)
/* 3BC00 8004B400 2A104400 */  slt        $v0, $v0, $a0
/* 3BC04 8004B404 03004014 */  bnez       $v0, .L8004B414
/* 3BC08 8004B408 00000000 */   nop
/* 3BC0C 8004B40C 100004AE */  sw         $a0, 0x10($s0)
/* 3BC10 8004B410 0E0000A6 */  sh         $zero, 0xE($s0)
.L8004B414:
/* 3BC14 8004B414 0E000286 */  lh         $v0, 0xE($s0)
/* 3BC18 8004B418 00000000 */  nop
/* 3BC1C 8004B41C 03004014 */  bnez       $v0, .L8004B42C
/* 3BC20 8004B420 00000000 */   nop
.L8004B424:
/* 3BC24 8004B424 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3BC28 8004B428 21200002 */   addu      $a0, $s0, $zero
.L8004B42C:
/* 3BC2C 8004B42C 1400BF8F */  lw         $ra, 0x14($sp)
/* 3BC30 8004B430 1000B08F */  lw         $s0, 0x10($sp)
/* 3BC34 8004B434 0800E003 */  jr         $ra
/* 3BC38 8004B438 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_UpdateInstanceSplitRing, . - FX_UpdateInstanceSplitRing
