.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razEnterWater
/* 974D8 800A6CD8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 974DC 800A6CDC 1800B0AF */  sw         $s0, 0x18($sp)
/* 974E0 800A6CE0 21808000 */  addu       $s0, $a0, $zero
/* 974E4 800A6CE4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 974E8 800A6CE8 2188A000 */  addu       $s1, $a1, $zero
/* 974EC 800A6CEC 2400B3AF */  sw         $s3, 0x24($sp)
/* 974F0 800A6CF0 2198C000 */  addu       $s3, $a2, $zero
/* 974F4 800A6CF4 2800BFAF */  sw         $ra, 0x28($sp)
/* 974F8 800A6CF8 2F97020C */  jal        razGetHeldWeapon
/* 974FC 800A6CFC 2000B2AF */   sw        $s2, 0x20($sp)
/* 97500 800A6D00 10006396 */  lhu        $v1, 0x10($s3)
/* 97504 800A6D04 00000000 */  nop
/* 97508 800A6D08 10006330 */  andi       $v1, $v1, 0x10
/* 9750C 800A6D0C 57006010 */  beqz       $v1, .L800A6E6C
/* 97510 800A6D10 21904000 */   addu      $s2, $v0, $zero
/* 97514 800A6D14 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 97518 800A6D18 01000224 */  addiu      $v0, $zero, 0x1
/* 9751C 800A6D1C 11006214 */  bne        $v1, $v0, .L800A6D64
/* 97520 800A6D20 00000000 */   nop
/* 97524 800A6D24 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 97528 800A6D28 00000000 */  nop
/* 9752C 800A6D2C 10004230 */  andi       $v0, $v0, 0x10
/* 97530 800A6D30 0C004014 */  bnez       $v0, .L800A6D64
/* 97534 800A6D34 0100023C */   lui       $v0, (0x186A0 >> 16)
/* 97538 800A6D38 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 9753C 800A6D3C F0FF0524 */  addiu      $a1, $zero, -0x10
/* 97540 800A6D40 21300000 */  addu       $a2, $zero, $zero
/* 97544 800A6D44 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 97548 800A6D48 1000A0AF */  sw         $zero, 0x10($sp)
/* 9754C 800A6D4C 0000048E */  lw         $a0, 0x0($s0)
/* 97550 800A6D50 4E68020C */  jal        SetPhysics
/* 97554 800A6D54 2138C000 */   addu      $a3, $a2, $zero
/* 97558 800A6D58 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 9755C 800A6D5C 9B9B0208 */  j          .L800A6E6C
/* 97560 800A6D60 00000000 */   nop
.L800A6D64:
/* 97564 800A6D64 0B004012 */  beqz       $s2, .L800A6D94
/* 97568 800A6D68 21204002 */   addu      $a0, $s2, $zero
/* 9756C 800A6D6C 92D1000C */  jal        INSTANCE_Query
/* 97570 800A6D70 04000524 */   addiu     $a1, $zero, 0x4
/* 97574 800A6D74 03000324 */  addiu      $v1, $zero, 0x3
/* 97578 800A6D78 06004314 */  bne        $v0, $v1, .L800A6D94
/* 9757C 800A6D7C 00080524 */   addiu     $a1, $zero, 0x800
/* 97580 800A6D80 0000048E */  lw         $a0, 0x0($s0)
/* 97584 800A6D84 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 97588 800A6D88 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 9758C 800A6D8C 9B9B0208 */  j          .L800A6E6C
/* 97590 800A6D90 00000000 */   nop
.L800A6D94:
/* 97594 800A6D94 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 97598 800A6D98 0400033C */  lui        $v1, (0x40000 >> 16)
/* 9759C 800A6D9C 24104300 */  and        $v0, $v0, $v1
/* 975A0 800A6DA0 32004014 */  bnez       $v0, .L800A6E6C
/* 975A4 800A6DA4 01000224 */   addiu     $v0, $zero, 0x1
/* 975A8 800A6DA8 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 975AC 800A6DAC 00000000 */  nop
/* 975B0 800A6DB0 2E006214 */  bne        $v1, $v0, .L800A6E6C
/* 975B4 800A6DB4 04000224 */   addiu     $v0, $zero, 0x4
/* 975B8 800A6DB8 30FD838F */  lw         $v1, %gp_rel(PhysicsMode)($gp)
/* 975BC 800A6DBC 00000000 */  nop
/* 975C0 800A6DC0 04006210 */  beq        $v1, $v0, .L800A6DD4
/* 975C4 800A6DC4 00000000 */   nop
/* 975C8 800A6DC8 0000048E */  lw         $a0, 0x0($s0)
/* 975CC 800A6DCC 289B020C */  jal        razSetDampingPhysics
/* 975D0 800A6DD0 00000000 */   nop
.L800A6DD4:
/* 975D4 800A6DD4 0000048E */  lw         $a0, 0x0($s0)
/* 975D8 800A6DD8 00000000 */  nop
/* 975DC 800A6DDC 7C01828C */  lw         $v0, 0x17C($a0)
/* 975E0 800A6DE0 00000000 */  nop
/* 975E4 800A6DE4 06004010 */  beqz       $v0, .L800A6E00
/* 975E8 800A6DE8 4000033C */   lui       $v1, (0x400004 >> 16)
/* 975EC 800A6DEC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 975F0 800A6DF0 04006334 */  ori        $v1, $v1, (0x400004 & 0xFFFF)
/* 975F4 800A6DF4 24104300 */  and        $v0, $v0, $v1
/* 975F8 800A6DF8 09004010 */  beqz       $v0, .L800A6E20
/* 975FC 800A6DFC 09000524 */   addiu     $a1, $zero, 0x9
.L800A6E00:
/* 97600 800A6E00 139B020C */  jal        razResetMotion
/* 97604 800A6E04 00000000 */   nop
/* 97608 800A6E08 21200002 */  addu       $a0, $s0, $zero
/* 9760C 800A6E0C 0A80053C */  lui        $a1, %hi(StateHandlerSwim)
/* 97610 800A6E10 0C02A524 */  addiu      $a1, $a1, %lo(StateHandlerSwim)
/* 97614 800A6E14 F4CA010C */  jal        StateSwitchStateCharacterData
/* 97618 800A6E18 21300000 */   addu      $a2, $zero, $zero
/* 9761C 800A6E1C 09000524 */  addiu      $a1, $zero, 0x9
.L800A6E20:
/* 97620 800A6E20 01000624 */  addiu      $a2, $zero, 0x1
/* 97624 800A6E24 0000048E */  lw         $a0, 0x0($s0)
/* 97628 800A6E28 2ED1020C */  jal        TrailWaterFX
/* 9762C 800A6E2C 2138C000 */   addu      $a3, $a2, $zero
/* 97630 800A6E30 0D000524 */  addiu      $a1, $zero, 0xD
/* 97634 800A6E34 01000624 */  addiu      $a2, $zero, 0x1
/* 97638 800A6E38 0000048E */  lw         $a0, 0x0($s0)
/* 9763C 800A6E3C 2ED1020C */  jal        TrailWaterFX
/* 97640 800A6E40 2138C000 */   addu      $a3, $a2, $zero
/* 97644 800A6E44 1F000524 */  addiu      $a1, $zero, 0x1F
/* 97648 800A6E48 01000624 */  addiu      $a2, $zero, 0x1
/* 9764C 800A6E4C 0000048E */  lw         $a0, 0x0($s0)
/* 97650 800A6E50 2ED1020C */  jal        TrailWaterFX
/* 97654 800A6E54 2138C000 */   addu      $a3, $a2, $zero
/* 97658 800A6E58 29000524 */  addiu      $a1, $zero, 0x29
/* 9765C 800A6E5C 01000624 */  addiu      $a2, $zero, 0x1
/* 97660 800A6E60 0000048E */  lw         $a0, 0x0($s0)
/* 97664 800A6E64 2ED1020C */  jal        TrailWaterFX
/* 97668 800A6E68 2138C000 */   addu      $a3, $a2, $zero
.L800A6E6C:
/* 9766C 800A6E6C 10006296 */  lhu        $v0, 0x10($s3)
/* 97670 800A6E70 00000000 */  nop
/* 97674 800A6E74 00084230 */  andi       $v0, $v0, 0x800
/* 97678 800A6E78 16004010 */  beqz       $v0, .L800A6ED4
/* 9767C 800A6E7C 01000224 */   addiu     $v0, $zero, 0x1
/* 97680 800A6E80 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 97684 800A6E84 00000000 */  nop
/* 97688 800A6E88 12006214 */  bne        $v1, $v0, .L800A6ED4
/* 9768C 800A6E8C 02000324 */   addiu     $v1, $zero, 0x2
/* 97690 800A6E90 08002316 */  bne        $s1, $v1, .L800A6EB4
/* 97694 800A6E94 21200002 */   addu      $a0, $s0, $zero
/* 97698 800A6E98 21286000 */  addu       $a1, $v1, $zero
/* 9769C 800A6E9C 3D000624 */  addiu      $a2, $zero, 0x3D
/* 976A0 800A6EA0 21380000 */  addu       $a3, $zero, $zero
/* 976A4 800A6EA4 03000224 */  addiu      $v0, $zero, 0x3
/* 976A8 800A6EA8 1000A2AF */  sw         $v0, 0x10($sp)
/* 976AC 800A6EAC B39B0208 */  j          .L800A6ECC
/* 976B0 800A6EB0 1400B1AF */   sw        $s1, 0x14($sp)
.L800A6EB4:
/* 976B4 800A6EB4 21282002 */  addu       $a1, $s1, $zero
/* 976B8 800A6EB8 3F000624 */  addiu      $a2, $zero, 0x3F
/* 976BC 800A6EBC 21380000 */  addu       $a3, $zero, $zero
/* 976C0 800A6EC0 10000224 */  addiu      $v0, $zero, 0x10
/* 976C4 800A6EC4 1000A2AF */  sw         $v0, 0x10($sp)
/* 976C8 800A6EC8 1400A3AF */  sw         $v1, 0x14($sp)
.L800A6ECC:
/* 976CC 800A6ECC 20C8010C */  jal        G2EmulationSwitchAnimation
/* 976D0 800A6ED0 00000000 */   nop
.L800A6ED4:
/* 976D4 800A6ED4 10006296 */  lhu        $v0, 0x10($s3)
/* 976D8 800A6ED8 00000000 */  nop
/* 976DC 800A6EDC 00014230 */  andi       $v0, $v0, 0x100
/* 976E0 800A6EE0 1F004010 */  beqz       $v0, .L800A6F60
/* 976E4 800A6EE4 00000000 */   nop
/* 976E8 800A6EE8 1D002016 */  bnez       $s1, .L800A6F60
/* 976EC 800A6EEC 00000000 */   nop
/* 976F0 800A6EF0 06004012 */  beqz       $s2, .L800A6F0C
/* 976F4 800A6EF4 00000000 */   nop
/* 976F8 800A6EF8 21204002 */  addu       $a0, $s2, $zero
/* 976FC 800A6EFC 92D1000C */  jal        INSTANCE_Query
/* 97700 800A6F00 04000524 */   addiu     $a1, $zero, 0x4
/* 97704 800A6F04 C79B0208 */  j          .L800A6F1C
/* 97708 800A6F08 C0201100 */   sll       $a0, $s1, 3
.L800A6F0C:
/* 9770C 800A6F0C 0000048E */  lw         $a0, 0x0($s0)
/* 97710 800A6F10 289B020C */  jal        razSetDampingPhysics
/* 97714 800A6F14 00000000 */   nop
/* 97718 800A6F18 C0201100 */  sll        $a0, $s1, 3
.L800A6F1C:
/* 9771C 800A6F1C 21209100 */  addu       $a0, $a0, $s1
/* 97720 800A6F20 C0200400 */  sll        $a0, $a0, 3
/* 97724 800A6F24 23209100 */  subu       $a0, $a0, $s1
/* 97728 800A6F28 80200400 */  sll        $a0, $a0, 2
/* 9772C 800A6F2C 21209000 */  addu       $a0, $a0, $s0
/* 97730 800A6F30 36C3010C */  jal        PurgeMessageQueue
/* 97734 800A6F34 0C008424 */   addiu     $a0, $a0, 0xC
/* 97738 800A6F38 09000524 */  addiu      $a1, $zero, 0x9
/* 9773C 800A6F3C 04000624 */  addiu      $a2, $zero, 0x4
/* 97740 800A6F40 0000048E */  lw         $a0, 0x0($s0)
/* 97744 800A6F44 2ED1020C */  jal        TrailWaterFX
/* 97748 800A6F48 01000724 */   addiu     $a3, $zero, 0x1
/* 9774C 800A6F4C 0D000524 */  addiu      $a1, $zero, 0xD
/* 97750 800A6F50 04000624 */  addiu      $a2, $zero, 0x4
/* 97754 800A6F54 0000048E */  lw         $a0, 0x0($s0)
/* 97758 800A6F58 2ED1020C */  jal        TrailWaterFX
/* 9775C 800A6F5C 01000724 */   addiu     $a3, $zero, 0x1
.L800A6F60:
/* 97760 800A6F60 2800BF8F */  lw         $ra, 0x28($sp)
/* 97764 800A6F64 2400B38F */  lw         $s3, 0x24($sp)
/* 97768 800A6F68 2000B28F */  lw         $s2, 0x20($sp)
/* 9776C 800A6F6C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 97770 800A6F70 1800B08F */  lw         $s0, 0x18($sp)
/* 97774 800A6F74 0800E003 */  jr         $ra
/* 97778 800A6F78 3000BD27 */   addiu     $sp, $sp, 0x30
.size razEnterWater, . - razEnterWater
