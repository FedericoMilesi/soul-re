.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOnWeaponSphere
/* 6FF88 8007F788 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FF8C 8007F78C 1400BFAF */  sw         $ra, 0x14($sp)
/* 6FF90 8007F790 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FF94 8007F794 4C01828C */  lw         $v0, 0x14C($a0)
/* 6FF98 8007F798 6C01908C */  lw         $s0, 0x16C($a0)
/* 6FF9C 8007F79C 0A004010 */  beqz       $v0, .L8007F7C8
/* 6FFA0 8007F7A0 00000000 */   nop
/* 6FFA4 8007F7A4 17D6000C */  jal        INSTANCE_GetChildLinkedToSegment
/* 6FFA8 8007F7A8 00000000 */   nop
/* 6FFAC 8007F7AC 34004010 */  beqz       $v0, .L8007F880
/* 6FFB0 8007F7B0 00000000 */   nop
/* 6FFB4 8007F7B4 21204000 */  addu       $a0, $v0, $zero
/* 6FFB8 8007F7B8 C2B7010C */  jal        TurnOnCollisionPhysOb
/* 6FFBC 8007F7BC 03000524 */   addiu     $a1, $zero, 0x3
/* 6FFC0 8007F7C0 1CFE0108 */  j          .L8007F870
/* 6FFC4 8007F7C4 00000000 */   nop
.L8007F7C8:
/* 6FFC8 8007F7C8 0000028E */  lw         $v0, 0x0($s0)
/* 6FFCC 8007F7CC 00000000 */  nop
/* 6FFD0 8007F7D0 00404230 */  andi       $v0, $v0, 0x4000
/* 6FFD4 8007F7D4 2A004014 */  bnez       $v0, .L8007F880
/* 6FFD8 8007F7D8 00000000 */   nop
/* 6FFDC 8007F7DC 0001838C */  lw         $v1, 0x100($a0)
/* 6FFE0 8007F7E0 00000000 */  nop
/* 6FFE4 8007F7E4 26006010 */  beqz       $v1, .L8007F880
/* 6FFE8 8007F7E8 00000000 */   nop
/* 6FFEC 8007F7EC 26018284 */  lh         $v0, 0x126($a0)
/* 6FFF0 8007F7F0 00000000 */  nop
/* 6FFF4 8007F7F4 C0100200 */  sll        $v0, $v0, 3
/* 6FFF8 8007F7F8 21106200 */  addu       $v0, $v1, $v0
/* 6FFFC 8007F7FC 0400468C */  lw         $a2, 0x4($v0)
/* 70000 8007F800 0000448C */  lw         $a0, 0x0($v0)
/* 70004 8007F804 1A00C010 */  beqz       $a2, .L8007F870
/* 70008 8007F808 00000000 */   nop
/* 7000C 8007F80C 01000824 */  addiu      $t0, $zero, 0x1
/* 70010 8007F810 09000724 */  addiu      $a3, $zero, 0x9
/* 70014 8007F814 04008324 */  addiu      $v1, $a0, 0x4
.L8007F818:
/* 70018 8007F818 FFFF6290 */  lbu        $v0, -0x1($v1)
/* 7001C 8007F81C 00000000 */  nop
/* 70020 8007F820 0F004514 */  bne        $v0, $a1, .L8007F860
/* 70024 8007F824 00000000 */   nop
/* 70028 8007F828 FEFF6290 */  lbu        $v0, -0x2($v1)
/* 7002C 8007F82C 00000000 */  nop
/* 70030 8007F830 0B004814 */  bne        $v0, $t0, .L8007F860
/* 70034 8007F834 00000000 */   nop
/* 70038 8007F838 0000628C */  lw         $v0, 0x0($v1)
/* 7003C 8007F83C 00000000 */  nop
/* 70040 8007F840 04004290 */  lbu        $v0, 0x4($v0)
/* 70044 8007F844 00000000 */  nop
/* 70048 8007F848 05004714 */  bne        $v0, $a3, .L8007F860
/* 7004C 8007F84C 00000000 */   nop
/* 70050 8007F850 00008290 */  lbu        $v0, 0x0($a0)
/* 70054 8007F854 00000000 */  nop
/* 70058 8007F858 01004234 */  ori        $v0, $v0, 0x1
/* 7005C 8007F85C 000082A0 */  sb         $v0, 0x0($a0)
.L8007F860:
/* 70060 8007F860 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 70064 8007F864 08006324 */  addiu      $v1, $v1, 0x8
/* 70068 8007F868 EBFFC014 */  bnez       $a2, .L8007F818
/* 7006C 8007F86C 08008424 */   addiu     $a0, $a0, 0x8
.L8007F870:
/* 70070 8007F870 0000028E */  lw         $v0, 0x0($s0)
/* 70074 8007F874 00000000 */  nop
/* 70078 8007F878 00404234 */  ori        $v0, $v0, 0x4000
/* 7007C 8007F87C 000002AE */  sw         $v0, 0x0($s0)
.L8007F880:
/* 70080 8007F880 1400BF8F */  lw         $ra, 0x14($sp)
/* 70084 8007F884 1000B08F */  lw         $s0, 0x10($sp)
/* 70088 8007F888 0800E003 */  jr         $ra
/* 7008C 8007F88C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_TurnOnWeaponSphere, . - MON_TurnOnWeaponSphere
