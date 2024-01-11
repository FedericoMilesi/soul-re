.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessPhysics
/* 8AD60 8009A560 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8AD64 8009A564 2000B2AF */  sw         $s2, 0x20($sp)
/* 8AD68 8009A568 2190A000 */  addu       $s2, $a1, $zero
/* 8AD6C 8009A56C 2800BFAF */  sw         $ra, 0x28($sp)
/* 8AD70 8009A570 2400B3AF */  sw         $s3, 0x24($sp)
/* 8AD74 8009A574 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8AD78 8009A578 1800B0AF */  sw         $s0, 0x18($sp)
/* 8AD7C 8009A57C 0000508E */  lw         $s0, 0x0($s2)
/* 8AD80 8009A580 00000000 */  nop
/* 8AD84 8009A584 4000028E */  lw         $v0, 0x40($s0)
/* 8AD88 8009A588 00000000 */  nop
/* 8AD8C 8009A58C 6B004010 */  beqz       $v0, .L8009A73C
/* 8AD90 8009A590 21988000 */   addu      $s3, $a0, $zero
/* 8AD94 8009A594 FC01038E */  lw         $v1, 0x1FC($s0)
/* 8AD98 8009A598 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 8AD9C 8009A59C 00000000 */  nop
/* 8ADA0 8009A5A0 18006200 */  mult       $v1, $v0
/* 8ADA4 8009A5A4 04000224 */  addiu      $v0, $zero, 0x4
/* 8ADA8 8009A5A8 12400000 */  mflo       $t0
/* 8ADAC 8009A5AC 1C00E210 */  beq        $a3, $v0, .L8009A620
/* 8ADB0 8009A5B0 028B0800 */   srl       $s1, $t0, 12
/* 8ADB4 8009A5B4 0500E228 */  slti       $v0, $a3, 0x5
/* 8ADB8 8009A5B8 05004010 */  beqz       $v0, .L8009A5D0
/* 8ADBC 8009A5BC 00000000 */   nop
/* 8ADC0 8009A5C0 0A00E010 */  beqz       $a3, .L8009A5EC
/* 8ADC4 8009A5C4 21206002 */   addu      $a0, $s3, $zero
/* 8ADC8 8009A5C8 CF690208 */  j          .L8009A73C
/* 8ADCC 8009A5CC 00000000 */   nop
.L8009A5D0:
/* 8ADD0 8009A5D0 05000224 */  addiu      $v0, $zero, 0x5
/* 8ADD4 8009A5D4 3A00E210 */  beq        $a3, $v0, .L8009A6C0
/* 8ADD8 8009A5D8 06000224 */   addiu     $v0, $zero, 0x6
/* 8ADDC 8009A5DC 3D00E210 */  beq        $a3, $v0, .L8009A6D4
/* 8ADE0 8009A5E0 21200002 */   addu      $a0, $s0, $zero
/* 8ADE4 8009A5E4 CF690208 */  j          .L8009A73C
/* 8ADE8 8009A5E8 00000000 */   nop
.L8009A5EC:
/* 8ADEC 8009A5EC F0F5868F */  lw         $a2, %gp_rel(ExternalForces)($gp)
/* 8ADF0 8009A5F0 80010226 */  addiu      $v0, $s0, 0x180
/* 8ADF4 8009A5F4 1000A2AF */  sw         $v0, 0x10($sp)
/* 8ADF8 8009A5F8 0000458E */  lw         $a1, 0x0($s2)
/* 8ADFC 8009A5FC D669020C */  jal        ApplyExternalLocalForces
/* 8AE00 8009A600 04000724 */   addiu     $a3, $zero, 0x4
/* 8AE04 8009A604 21302002 */  addu       $a2, $s1, $zero
/* 8AE08 8009A608 0000448E */  lw         $a0, 0x0($s2)
/* 8AE0C 8009A60C 6803658E */  lw         $a1, 0x368($s3)
/* 8AE10 8009A610 19DE010C */  jal        PhysicsMoveLocalZClamp
/* 8AE14 8009A614 21380000 */   addu      $a3, $zero, $zero
/* 8AE18 8009A618 CF690208 */  j          .L8009A73C
/* 8AE1C 8009A61C 00000000 */   nop
.L8009A620:
/* 8AE20 8009A620 21206002 */  addu       $a0, $s3, $zero
/* 8AE24 8009A624 F0F5868F */  lw         $a2, %gp_rel(ExternalForces)($gp)
/* 8AE28 8009A628 80010226 */  addiu      $v0, $s0, 0x180
/* 8AE2C 8009A62C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8AE30 8009A630 0000458E */  lw         $a1, 0x0($s2)
/* 8AE34 8009A634 D669020C */  jal        ApplyExternalLocalForces
/* 8AE38 8009A638 04000724 */   addiu     $a3, $zero, 0x4
/* 8AE3C 8009A63C 21302002 */  addu       $a2, $s1, $zero
/* 8AE40 8009A640 0000448E */  lw         $a0, 0x0($s2)
/* 8AE44 8009A644 6803658E */  lw         $a1, 0x368($s3)
/* 8AE48 8009A648 19DE010C */  jal        PhysicsMoveLocalZClamp
/* 8AE4C 8009A64C 21380000 */   addu      $a3, $zero, $zero
/* 8AE50 8009A650 21280000 */  addu       $a1, $zero, $zero
/* 8AE54 8009A654 2130A000 */  addu       $a2, $a1, $zero
/* 8AE58 8009A658 0000448E */  lw         $a0, 0x0($s2)
/* 8AE5C 8009A65C 47DF010C */  jal        PHYSICS_StopIfCloseToTarget
/* 8AE60 8009A660 2138A000 */   addu      $a3, $a1, $zero
/* 8AE64 8009A664 0000448E */  lw         $a0, 0x0($s2)
/* 8AE68 8009A668 00000000 */  nop
/* 8AE6C 8009A66C 8001828C */  lw         $v0, 0x180($a0)
/* 8AE70 8009A670 00000000 */  nop
/* 8AE74 8009A674 31004014 */  bnez       $v0, .L8009A73C
/* 8AE78 8009A678 00000000 */   nop
/* 8AE7C 8009A67C 8401828C */  lw         $v0, 0x184($a0)
/* 8AE80 8009A680 00000000 */  nop
/* 8AE84 8009A684 2D004014 */  bnez       $v0, .L8009A73C
/* 8AE88 8009A688 00000000 */   nop
/* 8AE8C 8009A68C 8801828C */  lw         $v0, 0x188($a0)
/* 8AE90 8009A690 00000000 */  nop
/* 8AE94 8009A694 29004014 */  bnez       $v0, .L8009A73C
/* 8AE98 8009A698 00000000 */   nop
/* 8AE9C 8009A69C 21280000 */  addu       $a1, $zero, $zero
/* 8AEA0 8009A6A0 2130A000 */  addu       $a2, $a1, $zero
/* 8AEA4 8009A6A4 F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8AEA8 8009A6A8 2138A000 */  addu       $a3, $a1, $zero
/* 8AEAC 8009A6AC 1000A0AF */  sw         $zero, 0x10($sp)
/* 8AEB0 8009A6B0 2E69020C */  jal        SetExternalForce
/* 8AEB4 8009A6B4 1400A0AF */   sw        $zero, 0x14($sp)
/* 8AEB8 8009A6B8 CF690208 */  j          .L8009A73C
/* 8AEBC 8009A6BC 00000000 */   nop
.L8009A6C0:
/* 8AEC0 8009A6C0 21200002 */  addu       $a0, $s0, $zero
/* 8AEC4 8009A6C4 21302002 */  addu       $a2, $s1, $zero
/* 8AEC8 8009A6C8 6803658E */  lw         $a1, 0x368($s3)
/* 8AECC 8009A6CC B8690208 */  j          .L8009A6E0
/* 8AED0 8009A6D0 21380000 */   addu      $a3, $zero, $zero
.L8009A6D4:
/* 8AED4 8009A6D4 21302002 */  addu       $a2, $s1, $zero
/* 8AED8 8009A6D8 6803658E */  lw         $a1, 0x368($s3)
/* 8AEDC 8009A6DC 01000724 */  addiu      $a3, $zero, 0x1
.L8009A6E0:
/* 8AEE0 8009A6E0 19DE010C */  jal        PhysicsMoveLocalZClamp
/* 8AEE4 8009A6E4 00000000 */   nop
/* 8AEE8 8009A6E8 21200002 */  addu       $a0, $s0, $zero
/* 8AEEC 8009A6EC 21280000 */  addu       $a1, $zero, $zero
/* 8AEF0 8009A6F0 62056786 */  lh         $a3, 0x562($s3)
/* 8AEF4 8009A6F4 47DF010C */  jal        PHYSICS_StopIfCloseToTarget
/* 8AEF8 8009A6F8 2130A000 */   addu      $a2, $a1, $zero
/* 8AEFC 8009A6FC 8001028E */  lw         $v0, 0x180($s0)
/* 8AF00 8009A700 00000000 */  nop
/* 8AF04 8009A704 0D004014 */  bnez       $v0, .L8009A73C
/* 8AF08 8009A708 00000000 */   nop
/* 8AF0C 8009A70C 8401028E */  lw         $v0, 0x184($s0)
/* 8AF10 8009A710 00000000 */  nop
/* 8AF14 8009A714 09004014 */  bnez       $v0, .L8009A73C
/* 8AF18 8009A718 00000000 */   nop
/* 8AF1C 8009A71C 8801028E */  lw         $v0, 0x188($s0)
/* 8AF20 8009A720 00000000 */  nop
/* 8AF24 8009A724 05004014 */  bnez       $v0, .L8009A73C
/* 8AF28 8009A728 21200002 */   addu      $a0, $s0, $zero
/* 8AF2C 8009A72C 1000053C */  lui        $a1, (0x100011 >> 16)
/* 8AF30 8009A730 62056686 */  lh         $a2, 0x562($s3)
/* 8AF34 8009A734 A1D1000C */  jal        INSTANCE_Post
/* 8AF38 8009A738 1100A534 */   ori       $a1, $a1, (0x100011 & 0xFFFF)
.L8009A73C:
/* 8AF3C 8009A73C 2800BF8F */  lw         $ra, 0x28($sp)
/* 8AF40 8009A740 2400B38F */  lw         $s3, 0x24($sp)
/* 8AF44 8009A744 2000B28F */  lw         $s2, 0x20($sp)
/* 8AF48 8009A748 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8AF4C 8009A74C 1800B08F */  lw         $s0, 0x18($sp)
/* 8AF50 8009A750 0800E003 */  jr         $ra
/* 8AF54 8009A754 3000BD27 */   addiu     $sp, $sp, 0x30
.size ProcessPhysics, . - ProcessPhysics
