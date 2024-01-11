.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterInit
/* 6E5E8 8007DDE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E5EC 8007DDEC 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E5F0 8007DDF0 21808000 */  addu       $s0, $a0, $zero
/* 6E5F4 8007DDF4 0200033C */  lui        $v1, (0x20000 >> 16)
/* 6E5F8 8007DDF8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6E5FC 8007DDFC 1800B2AF */  sw         $s2, 0x18($sp)
/* 6E600 8007DE00 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E604 8007DE04 1400028E */  lw         $v0, 0x14($s0)
/* 6E608 8007DE08 2400128E */  lw         $s2, 0x24($s0)
/* 6E60C 8007DE0C 24104300 */  and        $v0, $v0, $v1
/* 6E610 8007DE10 0A004010 */  beqz       $v0, .L8007DE3C
/* 6E614 8007DE14 00000000 */   nop
/* 6E618 8007DE18 6C01118E */  lw         $s1, 0x16C($s0)
/* 6E61C 8007DE1C 5B34020C */  jal        MONTABLE_GetCleanUpFunc
/* 6E620 8007DE20 00000000 */   nop
/* 6E624 8007DE24 09F84000 */  jalr       $v0
/* 6E628 8007DE28 21200002 */   addu      $a0, $s0, $zero
/* 6E62C 8007DE2C 321B020C */  jal        MONSENSE_RemoveSenses
/* 6E630 8007DE30 21200002 */   addu      $a0, $s0, $zero
/* 6E634 8007DE34 9DF70108 */  j          .L8007DE74
/* 6E638 8007DE38 00000000 */   nop
.L8007DE3C:
/* 6E63C 8007DE3C 13004012 */  beqz       $s2, .L8007DE8C
/* 6E640 8007DE40 E0AC033C */   lui       $v1, (0xACE00065 >> 16)
/* 6E644 8007DE44 0000428E */  lw         $v0, 0x0($s2)
/* 6E648 8007DE48 65006334 */  ori        $v1, $v1, (0xACE00065 & 0xFFFF)
/* 6E64C 8007DE4C 0F004314 */  bne        $v0, $v1, .L8007DE8C
/* 6E650 8007DE50 60020424 */   addiu     $a0, $zero, 0x260
/* 6E654 8007DE54 8140010C */  jal        MEMPACK_Malloc
/* 6E658 8007DE58 17000524 */   addiu     $a1, $zero, 0x17
/* 6E65C 8007DE5C 1000038E */  lw         $v1, 0x10($s0)
/* 6E660 8007DE60 21884000 */  addu       $s1, $v0, $zero
/* 6E664 8007DE64 07006014 */  bnez       $v1, .L8007DE84
/* 6E668 8007DE68 6C0111AE */   sw        $s1, 0x16C($s0)
/* 6E66C 8007DE6C 5A002012 */  beqz       $s1, .L8007DFD8
/* 6E670 8007DE70 00000000 */   nop
.L8007DE74:
/* 6E674 8007DE74 2641010C */  jal        MEMPACK_Free
/* 6E678 8007DE78 21202002 */   addu      $a0, $s1, $zero
/* 6E67C 8007DE7C F6F70108 */  j          .L8007DFD8
/* 6E680 8007DE80 00000000 */   nop
.L8007DE84:
/* 6E684 8007DE84 0B002016 */  bnez       $s1, .L8007DEB4
/* 6E688 8007DE88 21202002 */   addu      $a0, $s1, $zero
.L8007DE8C:
/* 6E68C 8007DE8C 240000AE */  sw         $zero, 0x24($s0)
/* 6E690 8007DE90 21200002 */  addu       $a0, $s0, $zero
/* 6E694 8007DE94 4154020C */  jal        G2Instance_GetKeylist
/* 6E698 8007DE98 21280000 */   addu      $a1, $zero, $zero
/* 6E69C 8007DE9C C8010426 */  addiu      $a0, $s0, 0x1C8
/* 6E6A0 8007DEA0 21284000 */  addu       $a1, $v0, $zero
/* 6E6A4 8007DEA4 B33F020C */  jal        G2Anim_SwitchToKeylist
/* 6E6A8 8007DEA8 21300000 */   addu      $a2, $zero, $zero
/* 6E6AC 8007DEAC F6F70108 */  j          .L8007DFD8
/* 6E6B0 8007DEB0 00000000 */   nop
.L8007DEB4:
/* 6E6B4 8007DEB4 21280000 */  addu       $a1, $zero, $zero
/* 6E6B8 8007DEB8 2EF2020C */  jal        memset
/* 6E6BC 8007DEBC 60020624 */   addiu     $a2, $zero, 0x260
/* 6E6C0 8007DEC0 24C3010C */  jal        InitMessageQueue
/* 6E6C4 8007DEC4 08002426 */   addiu     $a0, $s1, 0x8
/* 6E6C8 8007DEC8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6E6CC 8007DECC 980102AE */  sw         $v0, 0x198($s0)
/* 6E6D0 8007DED0 660122A2 */  sb         $v0, 0x166($s1)
/* 6E6D4 8007DED4 5F00078A */  lwl        $a3, 0x5F($s0)
/* 6E6D8 8007DED8 5C00079A */  lwr        $a3, 0x5C($s0)
/* 6E6DC 8007DEDC 60000886 */  lh         $t0, 0x60($s0)
/* 6E6E0 8007DEE0 2F0127AA */  swl        $a3, 0x12F($s1)
/* 6E6E4 8007DEE4 2C0127BA */  swr        $a3, 0x12C($s1)
/* 6E6E8 8007DEE8 300128A6 */  sh         $t0, 0x130($s1)
/* 6E6EC 8007DEEC A40122AE */  sw         $v0, 0x1A4($s1)
/* 6E6F0 8007DEF0 080120AE */  sw         $zero, 0x108($s1)
/* 6E6F4 8007DEF4 1400028E */  lw         $v0, 0x14($s0)
/* 6E6F8 8007DEF8 0100033C */  lui        $v1, (0x10040 >> 16)
/* 6E6FC 8007DEFC 25104300 */  or         $v0, $v0, $v1
/* 6E700 8007DF00 40004234 */  ori        $v0, $v0, (0x10040 & 0xFFFF)
/* 6E704 8007DF04 140002AE */  sw         $v0, 0x14($s0)
/* 6E708 8007DF08 1000428E */  lw         $v0, 0x10($s2)
/* 6E70C 8007DF0C 00000000 */  nop
/* 6E710 8007DF10 24104300 */  and        $v0, $v0, $v1
/* 6E714 8007DF14 05004014 */  bnez       $v0, .L8007DF2C
/* 6E718 8007DF18 00000000 */   nop
/* 6E71C 8007DF1C 1800028E */  lw         $v0, 0x18($s0)
/* 6E720 8007DF20 00000000 */  nop
/* 6E724 8007DF24 00014234 */  ori        $v0, $v0, 0x100
/* 6E728 8007DF28 180002AE */  sw         $v0, 0x18($s0)
.L8007DF2C:
/* 6E72C 8007DF2C 21200002 */  addu       $a0, $s0, $zero
/* 6E730 8007DF30 90010224 */  addiu      $v0, $zero, 0x190
/* 6E734 8007DF34 8C0102AE */  sw         $v0, 0x18C($s0)
/* 6E738 8007DF38 900102AE */  sw         $v0, 0x190($s0)
/* 6E73C 8007DF3C 940102AE */  sw         $v0, 0x194($s0)
/* 6E740 8007DF40 740100AE */  sw         $zero, 0x174($s0)
/* 6E744 8007DF44 780100AE */  sw         $zero, 0x178($s0)
/* 6E748 8007DF48 6834020C */  jal        MONTABLE_SetQueryFunc
/* 6E74C 8007DF4C 7C0100AE */   sw        $zero, 0x17C($s0)
/* 6E750 8007DF50 7534020C */  jal        MONTABLE_SetMessageFunc
/* 6E754 8007DF54 21200002 */   addu      $a0, $s0, $zero
/* 6E758 8007DF58 FE06020C */  jal        MON_ProcessIntro
/* 6E75C 8007DF5C 21200002 */   addu      $a0, $s0, $zero
/* 6E760 8007DF60 44012296 */  lhu        $v0, 0x144($s1)
/* 6E764 8007DF64 21200002 */  addu       $a0, $s0, $zero
/* 6E768 8007DF68 86FE010C */  jal        MON_TurnOnAllSpheres
/* 6E76C 8007DF6C 460122A6 */   sh        $v0, 0x146($s1)
/* 6E770 8007DF70 76FD010C */  jal        MON_TurnOffWeaponSpheres
/* 6E774 8007DF74 21200002 */   addu      $a0, $s0, $zero
/* 6E778 8007DF78 D71A020C */  jal        MONSENSE_SetupSenses
/* 6E77C 8007DF7C 21200002 */   addu      $a0, $s0, $zero
/* 6E780 8007DF80 0900020C */  jal        MON_AnimInit
/* 6E784 8007DF84 21200002 */   addu      $a0, $s0, $zero
/* 6E788 8007DF88 4E34020C */  jal        MONTABLE_GetInitFunc
/* 6E78C 8007DF8C 21200002 */   addu      $a0, $s0, $zero
/* 6E790 8007DF90 09F84000 */  jalr       $v0
/* 6E794 8007DF94 21200002 */   addu      $a0, $s0, $zero
/* 6E798 8007DF98 0000228E */  lw         $v0, 0x0($s1)
/* 6E79C 8007DF9C 00000000 */  nop
/* 6E7A0 8007DFA0 01004230 */  andi       $v0, $v0, 0x1
/* 6E7A4 8007DFA4 0C004010 */  beqz       $v0, .L8007DFD8
/* 6E7A8 8007DFA8 00000000 */   nop
/* 6E7AC 8007DFAC 9801058E */  lw         $a1, 0x198($s0)
/* 6E7B0 8007DFB0 2534020C */  jal        MONTABLE_GetStateFuncs
/* 6E7B4 8007DFB4 21200002 */   addu      $a0, $s0, $zero
/* 6E7B8 8007DFB8 0000238E */  lw         $v1, 0x0($s1)
/* 6E7BC 8007DFBC FEFF0424 */  addiu      $a0, $zero, -0x2
/* 6E7C0 8007DFC0 24186400 */  and        $v1, $v1, $a0
/* 6E7C4 8007DFC4 000023AE */  sw         $v1, 0x0($s1)
/* 6E7C8 8007DFC8 0000428C */  lw         $v0, 0x0($v0)
/* 6E7CC 8007DFCC 00000000 */  nop
/* 6E7D0 8007DFD0 09F84000 */  jalr       $v0
/* 6E7D4 8007DFD4 21200002 */   addu      $a0, $s0, $zero
.L8007DFD8:
/* 6E7D8 8007DFD8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6E7DC 8007DFDC 1800B28F */  lw         $s2, 0x18($sp)
/* 6E7E0 8007DFE0 1400B18F */  lw         $s1, 0x14($sp)
/* 6E7E4 8007DFE4 1000B08F */  lw         $s0, 0x10($sp)
/* 6E7E8 8007DFE8 0800E003 */  jr         $ra
/* 6E7EC 8007DFEC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MonsterInit, . - MonsterInit
