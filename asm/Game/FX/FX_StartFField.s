.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartFField
/* 3F5FC 8004EDFC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3F600 8004EE00 1800B2AF */  sw         $s2, 0x18($sp)
/* 3F604 8004EE04 21908000 */  addu       $s2, $a0, $zero
/* 3F608 8004EE08 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3F60C 8004EE0C 2198A000 */  addu       $s3, $a1, $zero
/* 3F610 8004EE10 1400B1AF */  sw         $s1, 0x14($sp)
/* 3F614 8004EE14 2188C000 */  addu       $s1, $a2, $zero
/* 3F618 8004EE18 2000B4AF */  sw         $s4, 0x20($sp)
/* 3F61C 8004EE1C 21A0E000 */  addu       $s4, $a3, $zero
/* 3F620 8004EE20 2C000424 */  addiu      $a0, $zero, 0x2C
/* 3F624 8004EE24 0D000524 */  addiu      $a1, $zero, 0xD
/* 3F628 8004EE28 2400BFAF */  sw         $ra, 0x24($sp)
/* 3F62C 8004EE2C 8140010C */  jal        MEMPACK_Malloc
/* 3F630 8004EE30 1000B0AF */   sw        $s0, 0x10($sp)
/* 3F634 8004EE34 21804000 */  addu       $s0, $v0, $zero
/* 3F638 8004EE38 1C000012 */  beqz       $s0, .L8004EEAC
/* 3F63C 8004EE3C 86000224 */   addiu     $v0, $zero, 0x86
/* 3F640 8004EE40 0C0002A2 */  sb         $v0, 0xC($s0)
/* 3F644 8004EE44 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3F648 8004EE48 080012AE */  sw         $s2, 0x8($s0)
/* 3F64C 8004EE4C 0D0000A2 */  sb         $zero, 0xD($s0)
/* 3F650 8004EE50 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3F654 8004EE54 040000AE */  sw         $zero, 0x4($s0)
/* 3F658 8004EE58 180013A6 */  sh         $s3, 0x18($s0)
/* 3F65C 8004EE5C 00002296 */  lhu        $v0, 0x0($s1)
/* 3F660 8004EE60 02002396 */  lhu        $v1, 0x2($s1)
/* 3F664 8004EE64 04002596 */  lhu        $a1, 0x4($s1)
/* 3F668 8004EE68 100002A6 */  sh         $v0, 0x10($s0)
/* 3F66C 8004EE6C 10000226 */  addiu      $v0, $s0, 0x10
/* 3F670 8004EE70 020043A4 */  sh         $v1, 0x2($v0)
/* 3F674 8004EE74 040045A4 */  sh         $a1, 0x4($v0)
/* 3F678 8004EE78 1A0014A6 */  sh         $s4, 0x1A($s0)
/* 3F67C 8004EE7C 3800A28F */  lw         $v0, 0x38($sp)
/* 3F680 8004EE80 1E0000A6 */  sh         $zero, 0x1E($s0)
/* 3F684 8004EE84 1C0002A6 */  sh         $v0, 0x1C($s0)
/* 3F688 8004EE88 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3F68C 8004EE8C 240000A6 */  sh         $zero, 0x24($s0)
/* 3F690 8004EE90 200002A6 */  sh         $v0, 0x20($s0)
/* 3F694 8004EE94 00100224 */  addiu      $v0, $zero, 0x1000
/* 3F698 8004EE98 220002A6 */  sh         $v0, 0x22($s0)
/* 3F69C 8004EE9C 4000A28F */  lw         $v0, 0x40($sp)
/* 3F6A0 8004EEA0 21200002 */  addu       $a0, $s0, $zero
/* 3F6A4 8004EEA4 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3F6A8 8004EEA8 280002AE */   sw        $v0, 0x28($s0)
.L8004EEAC:
/* 3F6AC 8004EEAC 21100002 */  addu       $v0, $s0, $zero
/* 3F6B0 8004EEB0 2400BF8F */  lw         $ra, 0x24($sp)
/* 3F6B4 8004EEB4 2000B48F */  lw         $s4, 0x20($sp)
/* 3F6B8 8004EEB8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3F6BC 8004EEBC 1800B28F */  lw         $s2, 0x18($sp)
/* 3F6C0 8004EEC0 1400B18F */  lw         $s1, 0x14($sp)
/* 3F6C4 8004EEC4 1000B08F */  lw         $s0, 0x10($sp)
/* 3F6C8 8004EEC8 0800E003 */  jr         $ra
/* 3F6CC 8004EECC 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_StartFField, . - FX_StartFField
