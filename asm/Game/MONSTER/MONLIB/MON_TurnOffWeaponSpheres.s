.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOffWeaponSpheres
/* 6FDD8 8007F5D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6FDDC 8007F5DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 6FDE0 8007F5E0 21888000 */  addu       $s1, $a0, $zero
/* 6FDE4 8007F5E4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6FDE8 8007F5E8 1800B2AF */  sw         $s2, 0x18($sp)
/* 6FDEC 8007F5EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FDF0 8007F5F0 4C01248E */  lw         $a0, 0x14C($s1)
/* 6FDF4 8007F5F4 6C01328E */  lw         $s2, 0x16C($s1)
/* 6FDF8 8007F5F8 09008010 */  beqz       $a0, .L8007F620
/* 6FDFC 8007F5FC 00000000 */   nop
/* 6FE00 8007F600 21808000 */  addu       $s0, $a0, $zero
/* 6FE04 8007F604 21200002 */  addu       $a0, $s0, $zero
.L8007F608:
/* 6FE08 8007F608 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 6FE0C 8007F60C 03000524 */   addiu     $a1, $zero, 0x3
/* 6FE10 8007F610 5001108E */  lw         $s0, 0x150($s0)
/* 6FE14 8007F614 00000000 */  nop
/* 6FE18 8007F618 FBFF0016 */  bnez       $s0, .L8007F608
/* 6FE1C 8007F61C 21200002 */   addu      $a0, $s0, $zero
.L8007F620:
/* 6FE20 8007F620 0000428E */  lw         $v0, 0x0($s2)
/* 6FE24 8007F624 00000000 */  nop
/* 6FE28 8007F628 00404230 */  andi       $v0, $v0, 0x4000
/* 6FE2C 8007F62C 22004010 */  beqz       $v0, .L8007F6B8
/* 6FE30 8007F630 00000000 */   nop
/* 6FE34 8007F634 26012286 */  lh         $v0, 0x126($s1)
/* 6FE38 8007F638 0001238E */  lw         $v1, 0x100($s1)
/* 6FE3C 8007F63C C0100200 */  sll        $v0, $v0, 3
/* 6FE40 8007F640 21186200 */  addu       $v1, $v1, $v0
/* 6FE44 8007F644 0400658C */  lw         $a1, 0x4($v1)
/* 6FE48 8007F648 0000638C */  lw         $v1, 0x0($v1)
/* 6FE4C 8007F64C 1600A010 */  beqz       $a1, .L8007F6A8
/* 6FE50 8007F650 00000000 */   nop
/* 6FE54 8007F654 01000724 */  addiu      $a3, $zero, 0x1
/* 6FE58 8007F658 09000624 */  addiu      $a2, $zero, 0x9
/* 6FE5C 8007F65C 04006424 */  addiu      $a0, $v1, 0x4
.L8007F660:
/* 6FE60 8007F660 FEFF8290 */  lbu        $v0, -0x2($a0)
/* 6FE64 8007F664 00000000 */  nop
/* 6FE68 8007F668 0B004714 */  bne        $v0, $a3, .L8007F698
/* 6FE6C 8007F66C 00000000 */   nop
/* 6FE70 8007F670 0000828C */  lw         $v0, 0x0($a0)
/* 6FE74 8007F674 00000000 */  nop
/* 6FE78 8007F678 04004290 */  lbu        $v0, 0x4($v0)
/* 6FE7C 8007F67C 00000000 */  nop
/* 6FE80 8007F680 05004614 */  bne        $v0, $a2, .L8007F698
/* 6FE84 8007F684 00000000 */   nop
/* 6FE88 8007F688 00006290 */  lbu        $v0, 0x0($v1)
/* 6FE8C 8007F68C 00000000 */  nop
/* 6FE90 8007F690 FE004230 */  andi       $v0, $v0, 0xFE
/* 6FE94 8007F694 000062A0 */  sb         $v0, 0x0($v1)
.L8007F698:
/* 6FE98 8007F698 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 6FE9C 8007F69C 08008424 */  addiu      $a0, $a0, 0x8
/* 6FEA0 8007F6A0 EFFFA014 */  bnez       $a1, .L8007F660
/* 6FEA4 8007F6A4 08006324 */   addiu     $v1, $v1, 0x8
.L8007F6A8:
/* 6FEA8 8007F6A8 0000428E */  lw         $v0, 0x0($s2)
/* 6FEAC 8007F6AC FFBF0324 */  addiu      $v1, $zero, -0x4001
/* 6FEB0 8007F6B0 24104300 */  and        $v0, $v0, $v1
/* 6FEB4 8007F6B4 000042AE */  sw         $v0, 0x0($s2)
.L8007F6B8:
/* 6FEB8 8007F6B8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6FEBC 8007F6BC 1800B28F */  lw         $s2, 0x18($sp)
/* 6FEC0 8007F6C0 1400B18F */  lw         $s1, 0x14($sp)
/* 6FEC4 8007F6C4 1000B08F */  lw         $s0, 0x10($sp)
/* 6FEC8 8007F6C8 0800E003 */  jr         $ra
/* 6FECC 8007F6CC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_TurnOffWeaponSpheres, . - MON_TurnOffWeaponSpheres
