.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Wander
/* 7EC44 8008E444 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7EC48 8008E448 1000B0AF */  sw         $s0, 0x10($sp)
/* 7EC4C 8008E44C 21808000 */  addu       $s0, $a0, $zero
/* 7EC50 8008E450 1800BFAF */  sw         $ra, 0x18($sp)
/* 7EC54 8008E454 1400B1AF */  sw         $s1, 0x14($sp)
/* 7EC58 8008E458 6C01118E */  lw         $s1, 0x16C($s0)
/* 7EC5C 8008E45C 00000000 */  nop
/* 7EC60 8008E460 0000228E */  lw         $v0, 0x0($s1)
/* 7EC64 8008E464 0400033C */  lui        $v1, (0x40000 >> 16)
/* 7EC68 8008E468 24104300 */  and        $v0, $v0, $v1
/* 7EC6C 8008E46C 10004014 */  bnez       $v0, .L8008E4B0
/* 7EC70 8008E470 00000000 */   nop
/* 7EC74 8008E474 2000058E */  lw         $a1, 0x20($s0)
/* 7EC78 8008E478 00000000 */  nop
/* 7EC7C 8008E47C 0600A010 */  beqz       $a1, .L8008E498
/* 7EC80 8008E480 00000000 */   nop
/* 7EC84 8008E484 3A012686 */  lh         $a2, 0x13A($s1)
/* 7EC88 8008E488 D803020C */  jal        MON_GetRandomDestinationInWorld
/* 7EC8C 8008E48C 2000A524 */   addiu     $a1, $a1, 0x20
/* 7EC90 8008E490 59390208 */  j          .L8008E564
/* 7EC94 8008E494 880100AE */   sw        $zero, 0x188($s0)
.L8008E498:
/* 7EC98 8008E498 21200002 */  addu       $a0, $s0, $zero
/* 7EC9C 8008E49C 3A012686 */  lh         $a2, 0x13A($s1)
/* 7ECA0 8008E4A0 D803020C */  jal        MON_GetRandomDestinationInWorld
/* 7ECA4 8008E4A4 5C000526 */   addiu     $a1, $s0, 0x5C
/* 7ECA8 8008E4A8 59390208 */  j          .L8008E564
/* 7ECAC 8008E4AC 880100AE */   sw        $zero, 0x188($s0)
.L8008E4B0:
/* 7ECB0 8008E4B0 24012386 */  lh         $v1, 0x124($s1)
/* 7ECB4 8008E4B4 5C000486 */  lh         $a0, 0x5C($s0)
/* 7ECB8 8008E4B8 26012286 */  lh         $v0, 0x126($s1)
/* 7ECBC 8008E4BC 5E000586 */  lh         $a1, 0x5E($s0)
/* 7ECC0 8008E4C0 23206400 */  subu       $a0, $v1, $a0
/* 7ECC4 8008E4C4 EBE6000C */  jal        MATH3D_LengthXY
/* 7ECC8 8008E4C8 23284500 */   subu      $a1, $v0, $a1
/* 7ECCC 8008E4CC 64004228 */  slti       $v0, $v0, 0x64
/* 7ECD0 8008E4D0 05004010 */  beqz       $v0, .L8008E4E8
/* 7ECD4 8008E4D4 21200002 */   addu      $a0, $s0, $zero
/* 7ECD8 8008E4D8 91FE010C */  jal        MON_SwitchState
/* 7ECDC 8008E4DC 02000524 */   addiu     $a1, $zero, 0x2
/* 7ECE0 8008E4E0 59390208 */  j          .L8008E564
/* 7ECE4 8008E4E4 880100AE */   sw        $zero, 0x188($s0)
.L8008E4E8:
/* 7ECE8 8008E4E8 24012286 */  lh         $v0, 0x124($s1)
/* 7ECEC 8008E4EC 5C000386 */  lh         $v1, 0x5C($s0)
/* 7ECF0 8008E4F0 7401048E */  lw         $a0, 0x174($s0)
/* 7ECF4 8008E4F4 23104300 */  subu       $v0, $v0, $v1
/* 7ECF8 8008E4F8 23104400 */  subu       $v0, $v0, $a0
/* 7ECFC 8008E4FC 800102AE */  sw         $v0, 0x180($s0)
/* 7ED00 8008E500 26012286 */  lh         $v0, 0x126($s1)
/* 7ED04 8008E504 5E000386 */  lh         $v1, 0x5E($s0)
/* 7ED08 8008E508 00000000 */  nop
/* 7ED0C 8008E50C 23104300 */  subu       $v0, $v0, $v1
/* 7ED10 8008E510 7801038E */  lw         $v1, 0x178($s0)
/* 7ED14 8008E514 8001048E */  lw         $a0, 0x180($s0)
/* 7ED18 8008E518 23104300 */  subu       $v0, $v0, $v1
/* 7ED1C 8008E51C 840102AE */  sw         $v0, 0x184($s0)
/* 7ED20 8008E520 FEFF8228 */  slti       $v0, $a0, -0x2
/* 7ED24 8008E524 04004014 */  bnez       $v0, .L8008E538
/* 7ED28 8008E528 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 7ED2C 8008E52C 03008228 */  slti       $v0, $a0, 0x3
/* 7ED30 8008E530 02004014 */  bnez       $v0, .L8008E53C
/* 7ED34 8008E534 02000224 */   addiu     $v0, $zero, 0x2
.L8008E538:
/* 7ED38 8008E538 800102AE */  sw         $v0, 0x180($s0)
.L8008E53C:
/* 7ED3C 8008E53C 8401038E */  lw         $v1, 0x184($s0)
/* 7ED40 8008E540 00000000 */  nop
/* 7ED44 8008E544 FEFF6228 */  slti       $v0, $v1, -0x2
/* 7ED48 8008E548 04004014 */  bnez       $v0, .L8008E55C
/* 7ED4C 8008E54C FEFF0224 */   addiu     $v0, $zero, -0x2
/* 7ED50 8008E550 03006228 */  slti       $v0, $v1, 0x3
/* 7ED54 8008E554 02004014 */  bnez       $v0, .L8008E560
/* 7ED58 8008E558 02000224 */   addiu     $v0, $zero, 0x2
.L8008E55C:
/* 7ED5C 8008E55C 840102AE */  sw         $v0, 0x184($s0)
.L8008E560:
/* 7ED60 8008E560 880100AE */  sw         $zero, 0x188($s0)
.L8008E564:
/* 7ED64 8008E564 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7ED68 8008E568 4B36020C */  jal        SOUL_Physics
/* 7ED6C 8008E56C 21200002 */   addu      $a0, $s0, $zero
/* 7ED70 8008E570 0000228E */  lw         $v0, 0x0($s1)
/* 7ED74 8008E574 00000000 */  nop
/* 7ED78 8008E578 04004230 */  andi       $v0, $v0, 0x4
/* 7ED7C 8008E57C 0E004014 */  bnez       $v0, .L8008E5B8
/* 7ED80 8008E580 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 7ED84 8008E584 1800028E */  lw         $v0, 0x18($s0)
/* 7ED88 8008E588 00000000 */  nop
/* 7ED8C 8008E58C 24104300 */  and        $v0, $v0, $v1
/* 7ED90 8008E590 03004014 */  bnez       $v0, .L8008E5A0
/* 7ED94 8008E594 00000000 */   nop
/* 7ED98 8008E598 6336020C */  jal        SOUL_Fade
/* 7ED9C 8008E59C 21200002 */   addu      $a0, $s0, $zero
.L8008E5A0:
/* 7EDA0 8008E5A0 C400228E */  lw         $v0, 0xC4($s1)
/* 7EDA4 8008E5A4 00000000 */  nop
/* 7EDA8 8008E5A8 03004010 */  beqz       $v0, .L8008E5B8
/* 7EDAC 8008E5AC 21200002 */   addu      $a0, $s0, $zero
/* 7EDB0 8008E5B0 91FE010C */  jal        MON_SwitchState
/* 7EDB4 8008E5B4 13000524 */   addiu     $a1, $zero, 0x13
.L8008E5B8:
/* 7EDB8 8008E5B8 2436020C */  jal        SOUL_QueueHandler
/* 7EDBC 8008E5BC 21200002 */   addu      $a0, $s0, $zero
/* 7EDC0 8008E5C0 1800BF8F */  lw         $ra, 0x18($sp)
/* 7EDC4 8008E5C4 1400B18F */  lw         $s1, 0x14($sp)
/* 7EDC8 8008E5C8 1000B08F */  lw         $s0, 0x10($sp)
/* 7EDCC 8008E5CC 0800E003 */  jr         $ra
/* 7EDD0 8008E5D0 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Wander, . - SOUL_Wander
