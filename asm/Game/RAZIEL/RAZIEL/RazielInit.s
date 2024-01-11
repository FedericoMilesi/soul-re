.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielInit
/* A4614 800B3E14 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A4618 800B3E18 1000B0AF */  sw         $s0, 0x10($sp)
/* A461C 800B3E1C 21808000 */  addu       $s0, $a0, $zero
/* A4620 800B3E20 1400BFAF */  sw         $ra, 0x14($sp)
/* A4624 800B3E24 1C00028E */  lw         $v0, 0x1C($s0)
/* A4628 800B3E28 00000000 */  nop
/* A462C 800B3E2C 1C00428C */  lw         $v0, 0x1C($v0)
/* A4630 800B3E30 00000000 */  nop
/* A4634 800B3E34 240002AE */  sw         $v0, 0x24($s0)
/* A4638 800B3E38 2C00B0AC */  sw         $s0, 0x2C($a1)
/* A463C 800B3E3C 1400038E */  lw         $v1, 0x14($s0)
/* A4640 800B3E40 FFFE0224 */  addiu      $v0, $zero, -0x101
/* A4644 800B3E44 200000AE */  sw         $zero, 0x20($s0)
/* A4648 800B3E48 7C0100AE */  sw         $zero, 0x17C($s0)
/* A464C 800B3E4C 880100AE */  sw         $zero, 0x188($s0)
/* A4650 800B3E50 780100AE */  sw         $zero, 0x178($s0)
/* A4654 800B3E54 840100AE */  sw         $zero, 0x184($s0)
/* A4658 800B3E58 A00100AE */  sw         $zero, 0x1A0($s0)
/* A465C 800B3E5C A40100AE */  sw         $zero, 0x1A4($s0)
/* A4660 800B3E60 E00000A6 */  sh         $zero, 0xE0($s0)
/* A4664 800B3E64 E20000A6 */  sh         $zero, 0xE2($s0)
/* A4668 800B3E68 E40000A6 */  sh         $zero, 0xE4($s0)
/* A466C 800B3E6C 980100AE */  sw         $zero, 0x198($s0)
/* A4670 800B3E70 9C0100AE */  sw         $zero, 0x19C($s0)
/* A4674 800B3E74 400000AE */  sw         $zero, 0x40($s0)
/* A4678 800B3E78 940100AE */  sw         $zero, 0x194($s0)
/* A467C 800B3E7C AC0100AE */  sw         $zero, 0x1AC($s0)
/* A4680 800B3E80 620000A2 */  sb         $zero, 0x62($s0)
/* A4684 800B3E84 00046334 */  ori        $v1, $v1, 0x400
/* A4688 800B3E88 24186200 */  and        $v1, $v1, $v0
/* A468C 800B3E8C 1800028E */  lw         $v0, 0x18($s0)
/* A4690 800B3E90 80006334 */  ori        $v1, $v1, 0x80
/* A4694 800B3E94 140003AE */  sw         $v1, 0x14($s0)
/* A4698 800B3E98 84004234 */  ori        $v0, $v0, 0x84
/* A469C 800B3E9C 27F8000C */  jal        OBTABLE_GetInstanceCollideFunc
/* A46A0 800B3EA0 180002AE */   sw        $v0, 0x18($s0)
/* A46A4 800B3EA4 49F8000C */  jal        OBTABLE_GetInstanceProcessFunc
/* A46A8 800B3EA8 21200002 */   addu      $a0, $s0, $zero
/* A46AC 800B3EAC 21200002 */  addu       $a0, $s0, $zero
/* A46B0 800B3EB0 A6CE020C */  jal        DisableWristCollision
/* A46B4 800B3EB4 02000524 */   addiu     $a1, $zero, 0x2
/* A46B8 800B3EB8 21200002 */  addu       $a0, $s0, $zero
/* A46BC 800B3EBC A6CE020C */  jal        DisableWristCollision
/* A46C0 800B3EC0 01000524 */   addiu     $a1, $zero, 0x1
/* A46C4 800B3EC4 D59F020C */  jal        InitStates
/* A46C8 800B3EC8 21200002 */   addu      $a0, $s0, $zero
/* A46CC 800B3ECC 1400BF8F */  lw         $ra, 0x14($sp)
/* A46D0 800B3ED0 1000B08F */  lw         $s0, 0x10($sp)
/* A46D4 800B3ED4 0800E003 */  jr         $ra
/* A46D8 800B3ED8 1800BD27 */   addiu     $sp, $sp, 0x18
.size RazielInit, . - RazielInit
