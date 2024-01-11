.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_Pursue
/* 7F45C 8008EC5C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7F460 8008EC60 1800B2AF */  sw         $s2, 0x18($sp)
/* 7F464 8008EC64 21908000 */  addu       $s2, $a0, $zero
/* 7F468 8008EC68 2000BFAF */  sw         $ra, 0x20($sp)
/* 7F46C 8008EC6C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7F470 8008EC70 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F474 8008EC74 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F478 8008EC78 6C01508E */  lw         $s0, 0x16C($s2)
/* 7F47C 8008EC7C 00000000 */  nop
/* 7F480 8008EC80 0400038E */  lw         $v1, 0x4($s0)
/* 7F484 8008EC84 2400518E */  lw         $s1, 0x24($s2)
/* 7F488 8008EC88 02006230 */  andi       $v0, $v1, 0x2
/* 7F48C 8008EC8C 17004014 */  bnez       $v0, .L8008ECEC
/* 7F490 8008EC90 00000000 */   nop
/* 7F494 8008EC94 D03A020C */  jal        VWRAITH_ShouldISwoop
/* 7F498 8008EC98 00000000 */   nop
/* 7F49C 8008EC9C 05004010 */  beqz       $v0, .L8008ECB4
/* 7F4A0 8008ECA0 21204002 */   addu      $a0, $s2, $zero
/* 7F4A4 8008ECA4 91FE010C */  jal        MON_SwitchState
/* 7F4A8 8008ECA8 01000524 */   addiu     $a1, $zero, 0x1
/* 7F4AC 8008ECAC 843B0208 */  j          .L8008EE10
/* 7F4B0 8008ECB0 00000000 */   nop
.L8008ECB4:
/* 7F4B4 8008ECB4 C400028E */  lw         $v0, 0xC4($s0)
/* 7F4B8 8008ECB8 00000000 */  nop
/* 7F4BC 8008ECBC 07004010 */  beqz       $v0, .L8008ECDC
/* 7F4C0 8008ECC0 00000000 */   nop
/* 7F4C4 8008ECC4 0400428C */  lw         $v0, 0x4($v0)
/* 7F4C8 8008ECC8 0400238E */  lw         $v1, 0x4($s1)
/* 7F4CC 8008ECCC 60004584 */  lh         $a1, 0x60($v0)
/* 7F4D0 8008ECD0 06006684 */  lh         $a2, 0x6($v1)
/* 7F4D4 8008ECD4 8D3A020C */  jal        VWRAITH_MoveVertical
/* 7F4D8 8008ECD8 21204002 */   addu      $a0, $s2, $zero
.L8008ECDC:
/* 7F4DC 8008ECDC F629020C */  jal        MON_Pursue
/* 7F4E0 8008ECE0 21204002 */   addu      $a0, $s2, $zero
/* 7F4E4 8008ECE4 843B0208 */  j          .L8008EE10
/* 7F4E8 8008ECE8 00000000 */   nop
.L8008ECEC:
/* 7F4EC 8008ECEC C400028E */  lw         $v0, 0xC4($s0)
/* 7F4F0 8008ECF0 00000000 */  nop
/* 7F4F4 8008ECF4 41004010 */  beqz       $v0, .L8008EDFC
/* 7F4F8 8008ECF8 21204002 */   addu      $a0, $s2, $zero
/* 7F4FC 8008ECFC 0400458C */  lw         $a1, 0x4($v0)
/* 7F500 8008ED00 6801028E */  lw         $v0, 0x168($s0)
/* 7F504 8008ED04 0400238E */  lw         $v1, 0x4($s1)
/* 7F508 8008ED08 5C00A524 */  addiu      $a1, $a1, 0x5C
/* 7F50C 8008ED0C 20004684 */  lh         $a2, 0x20($v0)
/* 7F510 8008ED10 10006280 */  lb         $v0, 0x10($v1)
/* 7F514 8008ED14 3800238E */  lw         $v1, 0x38($s1)
/* 7F518 8008ED18 40110200 */  sll        $v0, $v0, 5
/* 7F51C 8008ED1C 6604020C */  jal        MON_TurnToPosition
/* 7F520 8008ED20 21986200 */   addu      $s3, $v1, $v0
/* 7F524 8008ED24 C400028E */  lw         $v0, 0xC4($s0)
/* 7F528 8008ED28 0400248E */  lw         $a0, 0x4($s1)
/* 7F52C 8008ED2C 14004284 */  lh         $v0, 0x14($v0)
/* 7F530 8008ED30 0A008384 */  lh         $v1, 0xA($a0)
/* 7F534 8008ED34 00000000 */  nop
/* 7F538 8008ED38 2A104300 */  slt        $v0, $v0, $v1
/* 7F53C 8008ED3C 0C004010 */  beqz       $v0, .L8008ED70
/* 7F540 8008ED40 06000524 */   addiu     $a1, $zero, 0x6
/* 7F544 8008ED44 21204002 */  addu       $a0, $s2, $zero
/* 7F548 8008ED48 0400028E */  lw         $v0, 0x4($s0)
/* 7F54C 8008ED4C FDFF0324 */  addiu      $v1, $zero, -0x3
/* 7F550 8008ED50 B80013AE */  sw         $s3, 0xB8($s0)
/* 7F554 8008ED54 5F0100A2 */  sb         $zero, 0x15F($s0)
/* 7F558 8008ED58 2A0100A6 */  sh         $zero, 0x12A($s0)
/* 7F55C 8008ED5C 24104300 */  and        $v0, $v0, $v1
/* 7F560 8008ED60 91FE010C */  jal        MON_SwitchState
/* 7F564 8008ED64 040002AE */   sw        $v0, 0x4($s0)
/* 7F568 8008ED68 6F3B0208 */  j          .L8008EDBC
/* 7F56C 8008ED6C 21204002 */   addu      $a0, $s2, $zero
.L8008ED70:
/* 7F570 8008ED70 1800428E */  lw         $v0, 0x18($s2)
/* 7F574 8008ED74 00000000 */  nop
/* 7F578 8008ED78 10004230 */  andi       $v0, $v0, 0x10
/* 7F57C 8008ED7C 0E004010 */  beqz       $v0, .L8008EDB8
/* 7F580 8008ED80 00000000 */   nop
/* 7F584 8008ED84 0800258E */  lw         $a1, 0x8($s1)
/* 7F588 8008ED88 0F008680 */  lb         $a2, 0xF($a0)
/* 7F58C 8008ED8C F4FE010C */  jal        MON_GetAnim
/* 7F590 8008ED90 21204002 */   addu      $a0, $s2, $zero
/* 7F594 8008ED94 00004294 */  lhu        $v0, 0x0($v0)
/* 7F598 8008ED98 00000000 */  nop
/* 7F59C 8008ED9C 2A0102A6 */  sh         $v0, 0x12A($s0)
/* 7F5A0 8008EDA0 0400228E */  lw         $v0, 0x4($s1)
/* 7F5A4 8008EDA4 02000724 */  addiu      $a3, $zero, 0x2
/* 7F5A8 8008EDA8 0800258E */  lw         $a1, 0x8($s1)
/* 7F5AC 8008EDAC 0F004680 */  lb         $a2, 0xF($v0)
/* 7F5B0 8008EDB0 6FFF010C */  jal        MON_PlayAnimFromList
/* 7F5B4 8008EDB4 21204002 */   addu      $a0, $s2, $zero
.L8008EDB8:
/* 7F5B8 8008EDB8 21204002 */  addu       $a0, $s2, $zero
.L8008EDBC:
/* 7F5BC 8008EDBC C400028E */  lw         $v0, 0xC4($s0)
/* 7F5C0 8008EDC0 0400238E */  lw         $v1, 0x4($s1)
/* 7F5C4 8008EDC4 0400428C */  lw         $v0, 0x4($v0)
/* 7F5C8 8008EDC8 02006584 */  lh         $a1, 0x2($v1)
/* 7F5CC 8008EDCC 60004284 */  lh         $v0, 0x60($v0)
/* 7F5D0 8008EDD0 04006684 */  lh         $a2, 0x4($v1)
/* 7F5D4 8008EDD4 8D3A020C */  jal        VWRAITH_MoveVertical
/* 7F5D8 8008EDD8 21284500 */   addu      $a1, $v0, $a1
/* 7F5DC 8008EDDC 2A010286 */  lh         $v0, 0x12A($s0)
/* 7F5E0 8008EDE0 00000000 */  nop
/* 7F5E4 8008EDE4 08004010 */  beqz       $v0, .L8008EE08
/* 7F5E8 8008EDE8 00000000 */   nop
/* 7F5EC 8008EDEC 5204020C */  jal        MON_MoveForward
/* 7F5F0 8008EDF0 21204002 */   addu      $a0, $s2, $zero
/* 7F5F4 8008EDF4 823B0208 */  j          .L8008EE08
/* 7F5F8 8008EDF8 00000000 */   nop
.L8008EDFC:
/* 7F5FC 8008EDFC FDFF0224 */  addiu      $v0, $zero, -0x3
/* 7F600 8008EE00 24106200 */  and        $v0, $v1, $v0
/* 7F604 8008EE04 040002AE */  sw         $v0, 0x4($s0)
.L8008EE08:
/* 7F608 8008EE08 0917020C */  jal        MON_DefaultQueueHandler
/* 7F60C 8008EE0C 21204002 */   addu      $a0, $s2, $zero
.L8008EE10:
/* 7F610 8008EE10 2000BF8F */  lw         $ra, 0x20($sp)
/* 7F614 8008EE14 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7F618 8008EE18 1800B28F */  lw         $s2, 0x18($sp)
/* 7F61C 8008EE1C 1400B18F */  lw         $s1, 0x14($sp)
/* 7F620 8008EE20 1000B08F */  lw         $s0, 0x10($sp)
/* 7F624 8008EE24 0800E003 */  jr         $ra
/* 7F628 8008EE28 2800BD27 */   addiu     $sp, $sp, 0x28
.size VWRAITH_Pursue, . - VWRAITH_Pursue
