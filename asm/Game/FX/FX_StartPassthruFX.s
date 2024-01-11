.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartPassthruFX
/* 40258 8004FA58 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4025C 8004FA5C 2800BFAF */  sw         $ra, 0x28($sp)
/* 40260 8004FA60 2400B1AF */  sw         $s1, 0x24($sp)
/* 40264 8004FA64 2000B0AF */  sw         $s0, 0x20($sp)
/* 40268 8004FA68 0000A294 */  lhu        $v0, 0x0($a1)
/* 4026C 8004FA6C 21808000 */  addu       $s0, $a0, $zero
/* 40270 8004FA70 340102A6 */  sh         $v0, 0x134($s0)
/* 40274 8004FA74 0200A294 */  lhu        $v0, 0x2($a1)
/* 40278 8004FA78 00000000 */  nop
/* 4027C 8004FA7C 360102A6 */  sh         $v0, 0x136($s0)
/* 40280 8004FA80 0400A294 */  lhu        $v0, 0x4($a1)
/* 40284 8004FA84 00000000 */  nop
/* 40288 8004FA88 380102A6 */  sh         $v0, 0x138($s0)
/* 4028C 8004FA8C 0000A384 */  lh         $v1, 0x0($a1)
/* 40290 8004FA90 0000C284 */  lh         $v0, 0x0($a2)
/* 40294 8004FA94 00000000 */  nop
/* 40298 8004FA98 18006200 */  mult       $v1, $v0
/* 4029C 8004FA9C 0200A384 */  lh         $v1, 0x2($a1)
/* 402A0 8004FAA0 12480000 */  mflo       $t1
/* 402A4 8004FAA4 0200C284 */  lh         $v0, 0x2($a2)
/* 402A8 8004FAA8 00000000 */  nop
/* 402AC 8004FAAC 18006200 */  mult       $v1, $v0
/* 402B0 8004FAB0 0400A384 */  lh         $v1, 0x4($a1)
/* 402B4 8004FAB4 12400000 */  mflo       $t0
/* 402B8 8004FAB8 0400C284 */  lh         $v0, 0x4($a2)
/* 402BC 8004FABC 00000000 */  nop
/* 402C0 8004FAC0 18006200 */  mult       $v1, $v0
/* 402C4 8004FAC4 1800B127 */  addiu      $s1, $sp, 0x18
/* 402C8 8004FAC8 21380000 */  addu       $a3, $zero, $zero
/* 402CC 8004FACC D0200524 */  addiu      $a1, $zero, 0x20D0
/* 402D0 8004FAD0 21302002 */  addu       $a2, $s1, $zero
/* 402D4 8004FAD4 2000023C */  lui        $v0, (0x20FF40 >> 16)
/* 402D8 8004FAD8 40FF4234 */  ori        $v0, $v0, (0x20FF40 & 0xFFFF)
/* 402DC 8004FADC 1800A2AF */  sw         $v0, 0x18($sp)
/* 402E0 8004FAE0 21102801 */  addu       $v0, $t1, $t0
/* 402E4 8004FAE4 12180000 */  mflo       $v1
/* 402E8 8004FAE8 21104300 */  addu       $v0, $v0, $v1
/* 402EC 8004FAEC 03130200 */  sra        $v0, $v0, 12
/* 402F0 8004FAF0 23100200 */  negu       $v0, $v0
/* 402F4 8004FAF4 3C0102AE */  sw         $v0, 0x13C($s0)
/* 402F8 8004FAF8 02000224 */  addiu      $v0, $zero, 0x2
/* 402FC 8004FAFC EA2B010C */  jal        FX_DoInstancePowerRing
/* 40300 8004FB00 1000A2AF */   sw        $v0, 0x10($sp)
/* 40304 8004FB04 21200002 */  addu       $a0, $s0, $zero
/* 40308 8004FB08 D0200524 */  addiu      $a1, $zero, 0x20D0
/* 4030C 8004FB0C 21302002 */  addu       $a2, $s1, $zero
/* 40310 8004FB10 21380000 */  addu       $a3, $zero, $zero
/* 40314 8004FB14 01000224 */  addiu      $v0, $zero, 0x1
/* 40318 8004FB18 EA2B010C */  jal        FX_DoInstancePowerRing
/* 4031C 8004FB1C 1000A2AF */   sw        $v0, 0x10($sp)
/* 40320 8004FB20 2800BF8F */  lw         $ra, 0x28($sp)
/* 40324 8004FB24 2400B18F */  lw         $s1, 0x24($sp)
/* 40328 8004FB28 2000B08F */  lw         $s0, 0x20($sp)
/* 4032C 8004FB2C 0800E003 */  jr         $ra
/* 40330 8004FB30 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_StartPassthruFX, . - FX_StartPassthruFX
