.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANSRCH_FindNodeToExpand
/* 8A578 80099D78 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A57C 80099D7C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8A580 80099D80 2400B5AF */  sw         $s5, 0x24($sp)
/* 8A584 80099D84 21A8A000 */  addu       $s5, $a1, $zero
/* 8A588 80099D88 2800B6AF */  sw         $s6, 0x28($sp)
/* 8A58C 80099D8C 21B0C000 */  addu       $s6, $a2, $zero
/* 8A590 80099D90 2000B4AF */  sw         $s4, 0x20($sp)
/* 8A594 80099D94 FFFF1424 */  addiu      $s4, $zero, -0x1
/* 8A598 80099D98 1400B1AF */  sw         $s1, 0x14($sp)
/* 8A59C 80099D9C 21888000 */  addu       $s1, $a0, $zero
/* 8A5A0 80099DA0 1800B2AF */  sw         $s2, 0x18($sp)
/* 8A5A4 80099DA4 21900000 */  addu       $s2, $zero, $zero
/* 8A5A8 80099DA8 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8A5AC 80099DAC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8A5B0 80099DB0 1000B0AF */  sw         $s0, 0x10($sp)
/* 8A5B4 80099DB4 01004290 */  lbu        $v0, 0x1($v0)
/* 8A5B8 80099DB8 00000000 */  nop
/* 8A5BC 80099DBC 29004010 */  beqz       $v0, .L80099E64
/* 8A5C0 80099DC0 21984002 */   addu      $s3, $s2, $zero
/* 8A5C4 80099DC4 21802002 */  addu       $s0, $s1, $zero
.L80099DC8:
/* 8A5C8 80099DC8 14000296 */  lhu        $v0, 0x14($s0)
/* 8A5CC 80099DCC 00000000 */  nop
/* 8A5D0 80099DD0 07105600 */  srav       $v0, $s6, $v0
/* 8A5D4 80099DD4 01004230 */  andi       $v0, $v0, 0x1
/* 8A5D8 80099DD8 1A004010 */  beqz       $v0, .L80099E44
/* 8A5DC 80099DDC 00000000 */   nop
/* 8A5E0 80099DE0 06000396 */  lhu        $v1, 0x6($s0)
/* 8A5E4 80099DE4 00000000 */  nop
/* 8A5E8 80099DE8 01006230 */  andi       $v0, $v1, 0x1
/* 8A5EC 80099DEC 15004010 */  beqz       $v0, .L80099E44
/* 8A5F0 80099DF0 02006230 */   andi      $v0, $v1, 0x2
/* 8A5F4 80099DF4 13004014 */  bnez       $v0, .L80099E44
/* 8A5F8 80099DF8 00000000 */   nop
/* 8A5FC 80099DFC 00002286 */  lh         $v0, 0x0($s1)
/* 8A600 80099E00 0000A486 */  lh         $a0, 0x0($s5)
/* 8A604 80099E04 02000386 */  lh         $v1, 0x2($s0)
/* 8A608 80099E08 0200A586 */  lh         $a1, 0x2($s5)
/* 8A60C 80099E0C 0400A686 */  lh         $a2, 0x4($s5)
/* 8A610 80099E10 23204400 */  subu       $a0, $v0, $a0
/* 8A614 80099E14 04000286 */  lh         $v0, 0x4($s0)
/* 8A618 80099E18 23286500 */  subu       $a1, $v1, $a1
/* 8A61C 80099E1C B7E6000C */  jal        MATH3D_LengthXYZ
/* 8A620 80099E20 23304600 */   subu      $a2, $v0, $a2
/* 8A624 80099E24 10000396 */  lhu        $v1, 0x10($s0)
/* 8A628 80099E28 00000000 */  nop
/* 8A62C 80099E2C 21186200 */  addu       $v1, $v1, $v0
/* 8A630 80099E30 2B108302 */  sltu       $v0, $s4, $v1
/* 8A634 80099E34 03004014 */  bnez       $v0, .L80099E44
/* 8A638 80099E38 00000000 */   nop
/* 8A63C 80099E3C 21980002 */  addu       $s3, $s0, $zero
/* 8A640 80099E40 21A06000 */  addu       $s4, $v1, $zero
.L80099E44:
/* 8A644 80099E44 1C001026 */  addiu      $s0, $s0, 0x1C
/* 8A648 80099E48 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A64C 80099E4C 00000000 */  nop
/* 8A650 80099E50 01004290 */  lbu        $v0, 0x1($v0)
/* 8A654 80099E54 01005226 */  addiu      $s2, $s2, 0x1
/* 8A658 80099E58 2A104202 */  slt        $v0, $s2, $v0
/* 8A65C 80099E5C DAFF4014 */  bnez       $v0, .L80099DC8
/* 8A660 80099E60 1C003126 */   addiu     $s1, $s1, 0x1C
.L80099E64:
/* 8A664 80099E64 21106002 */  addu       $v0, $s3, $zero
/* 8A668 80099E68 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8A66C 80099E6C 2800B68F */  lw         $s6, 0x28($sp)
/* 8A670 80099E70 2400B58F */  lw         $s5, 0x24($sp)
/* 8A674 80099E74 2000B48F */  lw         $s4, 0x20($sp)
/* 8A678 80099E78 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8A67C 80099E7C 1800B28F */  lw         $s2, 0x18($sp)
/* 8A680 80099E80 1400B18F */  lw         $s1, 0x14($sp)
/* 8A684 80099E84 1000B08F */  lw         $s0, 0x10($sp)
/* 8A688 80099E88 0800E003 */  jr         $ra
/* 8A68C 80099E8C 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLANSRCH_FindNodeToExpand, . - PLANSRCH_FindNodeToExpand
