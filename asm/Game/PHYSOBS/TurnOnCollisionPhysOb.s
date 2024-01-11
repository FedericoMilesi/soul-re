.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TurnOnCollisionPhysOb
/* 5E708 8006DF08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5E70C 8006DF0C 1400B1AF */  sw         $s1, 0x14($sp)
/* 5E710 8006DF10 21888000 */  addu       $s1, $a0, $zero
/* 5E714 8006DF14 1800B2AF */  sw         $s2, 0x18($sp)
/* 5E718 8006DF18 2190A000 */  addu       $s2, $a1, $zero
/* 5E71C 8006DF1C FFFE053C */  lui        $a1, (0xFEFFFFFF >> 16)
/* 5E720 8006DF20 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5E724 8006DF24 1000B0AF */  sw         $s0, 0x10($sp)
/* 5E728 8006DF28 6C01238E */  lw         $v1, 0x16C($s1)
/* 5E72C 8006DF2C FFFFA534 */  ori        $a1, $a1, (0xFEFFFFFF & 0xFFFF)
/* 5E730 8006DF30 0000628C */  lw         $v0, 0x0($v1)
/* 5E734 8006DF34 00000000 */  nop
/* 5E738 8006DF38 24104500 */  and        $v0, $v0, $a1
/* 5E73C 8006DF3C 7EB7010C */  jal        PhysObGetWeapon
/* 5E740 8006DF40 000062AC */   sw        $v0, 0x0($v1)
/* 5E744 8006DF44 21804000 */  addu       $s0, $v0, $zero
/* 5E748 8006DF48 12000012 */  beqz       $s0, .L8006DF94
/* 5E74C 8006DF4C 02004232 */   andi      $v0, $s2, 0x2
/* 5E750 8006DF50 05004010 */  beqz       $v0, .L8006DF68
/* 5E754 8006DF54 01004232 */   andi      $v0, $s2, 0x1
/* 5E758 8006DF58 0E000582 */  lb         $a1, 0xE($s0)
/* 5E75C 8006DF5C EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 5E760 8006DF60 21202002 */   addu      $a0, $s1, $zero
/* 5E764 8006DF64 01004232 */  andi       $v0, $s2, 0x1
.L8006DF68:
/* 5E768 8006DF68 05004010 */  beqz       $v0, .L8006DF80
/* 5E76C 8006DF6C 04004232 */   andi      $v0, $s2, 0x4
/* 5E770 8006DF70 0F000582 */  lb         $a1, 0xF($s0)
/* 5E774 8006DF74 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 5E778 8006DF78 21202002 */   addu      $a0, $s1, $zero
/* 5E77C 8006DF7C 04004232 */  andi       $v0, $s2, 0x4
.L8006DF80:
/* 5E780 8006DF80 04004010 */  beqz       $v0, .L8006DF94
/* 5E784 8006DF84 00000000 */   nop
/* 5E788 8006DF88 0D000582 */  lb         $a1, 0xD($s0)
/* 5E78C 8006DF8C EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 5E790 8006DF90 21202002 */   addu      $a0, $s1, $zero
.L8006DF94:
/* 5E794 8006DF94 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5E798 8006DF98 1800B28F */  lw         $s2, 0x18($sp)
/* 5E79C 8006DF9C 1400B18F */  lw         $s1, 0x14($sp)
/* 5E7A0 8006DFA0 1000B08F */  lw         $s0, 0x10($sp)
/* 5E7A4 8006DFA4 0800E003 */  jr         $ra
/* 5E7A8 8006DFA8 2000BD27 */   addiu     $sp, $sp, 0x20
.size TurnOnCollisionPhysOb, . - TurnOnCollisionPhysOb
