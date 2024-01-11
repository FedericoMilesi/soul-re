.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSpectralShift
/* 95E7C 800A567C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95E80 800A5680 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 95E84 800A5684 0400033C */  lui        $v1, (0x40000 >> 16)
/* 95E88 800A5688 24104300 */  and        $v0, $v0, $v1
/* 95E8C 800A568C 3B004014 */  bnez       $v0, .L800A577C
/* 95E90 800A5690 1000BFAF */   sw        $ra, 0x10($sp)
/* 95E94 800A5694 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 95E98 800A5698 01000224 */  addiu      $v0, $zero, 0x1
/* 95E9C 800A569C 37006214 */  bne        $v1, $v0, .L800A577C
/* 95EA0 800A56A0 00000000 */   nop
/* 95EA4 800A56A4 2197020C */  jal        razGetHeldItem
/* 95EA8 800A56A8 00000000 */   nop
/* 95EAC 800A56AC 09004010 */  beqz       $v0, .L800A56D4
/* 95EB0 800A56B0 21204000 */   addu      $a0, $v0, $zero
/* 95EB4 800A56B4 8000053C */  lui        $a1, (0x800008 >> 16)
/* 95EB8 800A56B8 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 95EBC 800A56BC A1D1000C */  jal        INSTANCE_Post
/* 95EC0 800A56C0 04000624 */   addiu     $a2, $zero, 0x4
/* 95EC4 800A56C4 00100424 */  addiu      $a0, $zero, 0x1000
/* 95EC8 800A56C8 21280000 */  addu       $a1, $zero, $zero
/* 95ECC 800A56CC 7F95020C */  jal        razSetFadeEffect
/* 95ED0 800A56D0 00010624 */   addiu     $a2, $zero, 0x100
.L800A56D4:
/* 95ED4 800A56D4 1000053C */  lui        $a1, (0x100014 >> 16)
/* 95ED8 800A56D8 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 95EDC 800A56DC 1400A534 */  ori        $a1, $a1, (0x100014 & 0xFFFF)
/* 95EE0 800A56E0 1800828C */  lw         $v0, 0x18($a0)
/* 95EE4 800A56E4 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 95EE8 800A56E8 25104300 */  or         $v0, $v0, $v1
/* 95EEC 800A56EC 180082AC */  sw         $v0, 0x18($a0)
/* 95EF0 800A56F0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 95EF4 800A56F4 A1D1000C */  jal        INSTANCE_Post
/* 95EF8 800A56F8 21300000 */   addu      $a2, $zero, $zero
/* 95EFC 800A56FC 0492020C */  jal        GetMaxHealth
/* 95F00 800A5700 00000000 */   nop
/* 95F04 800A5704 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 95F08 800A5708 00000000 */  nop
/* 95F0C 800A570C 03006214 */  bne        $v1, $v0, .L800A571C
/* 95F10 800A5710 0100023C */   lui       $v0, (0x14586 >> 16)
/* 95F14 800A5714 C8950208 */  j          .L800A5720
/* 95F18 800A5718 A0864234 */   ori       $v0, $v0, (0x186A0 & 0xFFFF)
.L800A571C:
/* 95F1C 800A571C 86454234 */  ori        $v0, $v0, (0x14586 & 0xFFFF)
.L800A5720:
/* 95F20 800A5720 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95F24 800A5724 02000224 */  addiu      $v0, $zero, 0x2
/* 95F28 800A5728 68FA82AF */  sw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 95F2C 800A572C 8597020C */  jal        razReaverOn
/* 95F30 800A5730 00000000 */   nop
/* 95F34 800A5734 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 95F38 800A5738 00000000 */  nop
/* 95F3C 800A573C 0F004014 */  bnez       $v0, .L800A577C
/* 95F40 800A5740 00000000 */   nop
/* 95F44 800A5744 F477010C */  jal        MORPH_ToggleMorph
/* 95F48 800A5748 00000000 */   nop
/* 95F4C 800A574C 3CF6838F */  lw         $v1, %gp_rel(Raziel + 0xC)($gp)
/* 95F50 800A5750 0B80023C */  lui        $v0, %hi(StateHandlerGlyphs)
/* 95F54 800A5754 50F64224 */  addiu      $v0, $v0, %lo(StateHandlerGlyphs)
/* 95F58 800A5758 08006210 */  beq        $v1, $v0, .L800A577C
/* 95F5C 800A575C 0A80023C */   lui       $v0, %hi(StateHandlerPuppetShow)
/* 95F60 800A5760 0CA94224 */  addiu      $v0, $v0, %lo(StateHandlerPuppetShow)
/* 95F64 800A5764 05006210 */  beq        $v1, $v0, .L800A577C
/* 95F68 800A5768 0400053C */   lui       $a1, (0x40005 >> 16)
/* 95F6C 800A576C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 95F70 800A5770 0500A534 */  ori        $a1, $a1, (0x40005 & 0xFFFF)
/* 95F74 800A5774 A1D1000C */  jal        INSTANCE_Post
/* 95F78 800A5778 21300000 */   addu      $a2, $zero, $zero
.L800A577C:
/* 95F7C 800A577C 1000BF8F */  lw         $ra, 0x10($sp)
/* 95F80 800A5780 00000000 */  nop
/* 95F84 800A5784 0800E003 */  jr         $ra
/* 95F88 800A5788 1800BD27 */   addiu     $sp, $sp, 0x18
.size razSpectralShift, . - razSpectralShift
