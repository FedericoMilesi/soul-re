.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WALBOSC_Collide
/* 80244 8008FA44 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 80248 8008FA48 2000B2AF */  sw         $s2, 0x20($sp)
/* 8024C 8008FA4C 21908000 */  addu       $s2, $a0, $zero
/* 80250 8008FA50 2800BFAF */  sw         $ra, 0x28($sp)
/* 80254 8008FA54 2400B3AF */  sw         $s3, 0x24($sp)
/* 80258 8008FA58 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8025C 8008FA5C 1800B0AF */  sw         $s0, 0x18($sp)
/* 80260 8008FA60 C000508E */  lw         $s0, 0xC0($s2)
/* 80264 8008FA64 00000000 */  nop
/* 80268 8008FA68 0C00028E */  lw         $v0, 0xC($s0)
/* 8026C 8008FA6C 08000324 */  addiu      $v1, $zero, 0x8
/* 80270 8008FA70 04004290 */  lbu        $v0, 0x4($v0)
/* 80274 8008FA74 1400138E */  lw         $s3, 0x14($s0)
/* 80278 8008FA78 1B004314 */  bne        $v0, $v1, .L8008FAE8
/* 8027C 8008FA7C 00000000 */   nop
/* 80280 8008FA80 2400518E */  lw         $s1, 0x24($s2)
/* 80284 8008FA84 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 80288 8008FA88 01000524 */   addiu     $a1, $zero, 0x1
/* 8028C 8008FA8C 0800268E */  lw         $a2, 0x8($s1)
/* 80290 8008FA90 05000592 */  lbu        $a1, 0x5($s0)
/* 80294 8008FA94 0200C104 */  bgez       $a2, .L8008FAA0
/* 80298 8008FA98 21204002 */   addu      $a0, $s2, $zero
/* 8029C 8008FA9C 7F00C624 */  addiu      $a2, $a2, 0x7F
.L8008FAA0:
/* 802A0 8008FAA0 C3310600 */  sra        $a2, $a2, 7
/* 802A4 8008FAA4 7FC5010C */  jal        SetFXHitData
/* 802A8 8008FAA8 00010724 */   addiu     $a3, $zero, 0x100
/* 802AC 8008FAAC 21206002 */  addu       $a0, $s3, $zero
/* 802B0 8008FAB0 4000053C */  lui        $a1, (0x400000 >> 16)
/* 802B4 8008FAB4 A1D1000C */  jal        INSTANCE_Post
/* 802B8 8008FAB8 21304000 */   addu      $a2, $v0, $zero
/* 802BC 8008FABC 10002786 */  lh         $a3, 0x10($s1)
/* 802C0 8008FAC0 12002282 */  lb         $v0, 0x12($s1)
/* 802C4 8008FAC4 21204002 */  addu       $a0, $s2, $zero
/* 802C8 8008FAC8 1000A2AF */  sw         $v0, 0x10($sp)
/* 802CC 8008FACC 0800268E */  lw         $a2, 0x8($s1)
/* 802D0 8008FAD0 95C3010C */  jal        SetMonsterHitData
/* 802D4 8008FAD4 21280000 */   addu      $a1, $zero, $zero
/* 802D8 8008FAD8 21206002 */  addu       $a0, $s3, $zero
/* 802DC 8008FADC 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 802E0 8008FAE0 A1D1000C */  jal        INSTANCE_Post
/* 802E4 8008FAE4 21304000 */   addu      $a2, $v0, $zero
.L8008FAE8:
/* 802E8 8008FAE8 2800BF8F */  lw         $ra, 0x28($sp)
/* 802EC 8008FAEC 2400B38F */  lw         $s3, 0x24($sp)
/* 802F0 8008FAF0 2000B28F */  lw         $s2, 0x20($sp)
/* 802F4 8008FAF4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 802F8 8008FAF8 1800B08F */  lw         $s0, 0x18($sp)
/* 802FC 8008FAFC 0800E003 */  jr         $ra
/* 80300 8008FB00 3000BD27 */   addiu     $sp, $sp, 0x30
.size WALBOSC_Collide, . - WALBOSC_Collide
