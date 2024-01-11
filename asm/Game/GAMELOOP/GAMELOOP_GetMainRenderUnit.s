.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_GetMainRenderUnit
/* 1FE9C 8002F69C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1FEA0 8002F6A0 80AD8387 */  lh         $v1, %gp_rel(theCamera + 0xF0)($gp)
/* 1FEA4 8002F6A4 05000224 */  addiu      $v0, $zero, 0x5
/* 1FEA8 8002F6A8 1800BFAF */  sw         $ra, 0x18($sp)
/* 1FEAC 8002F6AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 1FEB0 8002F6B0 06006214 */  bne        $v1, $v0, .L8002F6CC
/* 1FEB4 8002F6B4 1000B0AF */   sw        $s0, 0x10($sp)
/* 1FEB8 8002F6B8 B4B0848F */  lw         $a0, %gp_rel(theCamera + 0x424)($gp)
/* 1FEBC 8002F6BC 7469010C */  jal        STREAM_WhichUnitPointerIsIn
/* 1FEC0 8002F6C0 00000000 */   nop
/* 1FEC4 8002F6C4 D1BD0008 */  j          .L8002F744
/* 1FEC8 8002F6C8 21804000 */   addu      $s0, $v0, $zero
.L8002F6CC:
/* 1FECC 8002F6CC 98AD918F */  lw         $s1, %gp_rel(theCamera + 0x108)($gp)
/* 1FED0 8002F6D0 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 1FED4 8002F6D4 00000000 */  nop
/* 1FED8 8002F6D8 10002216 */  bne        $s1, $v0, .L8002F71C
/* 1FEDC 8002F6DC 00000000 */   nop
/* 1FEE0 8002F6E0 44BF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x17C)($gp)
/* 1FEE4 8002F6E4 00000000 */  nop
/* 1FEE8 8002F6E8 0C004010 */  beqz       $v0, .L8002F71C
/* 1FEEC 8002F6EC 00000000 */   nop
/* 1FEF0 8002F6F0 68BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1A0)($gp)
/* 1FEF4 8002F6F4 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 1FEF8 8002F6F8 00000000 */   nop
/* 1FEFC 8002F6FC 21804000 */  addu       $s0, $v0, $zero
/* 1FF00 8002F700 0A000016 */  bnez       $s0, .L8002F72C
/* 1FF04 8002F704 00000000 */   nop
/* 1FF08 8002F708 3800248E */  lw         $a0, 0x38($s1)
/* 1FF0C 8002F70C 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 1FF10 8002F710 00000000 */   nop
/* 1FF14 8002F714 D2BD0008 */  j          .L8002F748
/* 1FF18 8002F718 00000000 */   nop
.L8002F71C:
/* 1FF1C 8002F71C 3800248E */  lw         $a0, 0x38($s1)
/* 1FF20 8002F720 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 1FF24 8002F724 00000000 */   nop
/* 1FF28 8002F728 21804000 */  addu       $s0, $v0, $zero
.L8002F72C:
/* 1FF2C 8002F72C 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 1FF30 8002F730 FF91000C */  jal        COLLIDE_CameraWithStreamSignals
/* 1FF34 8002F734 00000000 */   nop
/* 1FF38 8002F738 02004010 */  beqz       $v0, .L8002F744
/* 1FF3C 8002F73C 00000000 */   nop
/* 1FF40 8002F740 21804000 */  addu       $s0, $v0, $zero
.L8002F744:
/* 1FF44 8002F744 21100002 */  addu       $v0, $s0, $zero
.L8002F748:
/* 1FF48 8002F748 1800BF8F */  lw         $ra, 0x18($sp)
/* 1FF4C 8002F74C 1400B18F */  lw         $s1, 0x14($sp)
/* 1FF50 8002F750 1000B08F */  lw         $s0, 0x10($sp)
/* 1FF54 8002F754 0800E003 */  jr         $ra
/* 1FF58 8002F758 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMELOOP_GetMainRenderUnit, . - GAMELOOP_GetMainRenderUnit
