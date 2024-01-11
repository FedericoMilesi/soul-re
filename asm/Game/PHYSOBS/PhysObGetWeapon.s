.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysObGetWeapon
/* 5E5F8 8006DDF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5E5FC 8006DDFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 5E600 8006DE00 21888000 */  addu       $s1, $a0, $zero
/* 5E604 8006DE04 1000B0AF */  sw         $s0, 0x10($sp)
/* 5E608 8006DE08 21800000 */  addu       $s0, $zero, $zero
/* 5E60C 8006DE0C 1800BFAF */  sw         $ra, 0x18($sp)
/* 5E610 8006DE10 CFA3010C */  jal        CheckPhysObFamily
/* 5E614 8006DE14 21280002 */   addu      $a1, $s0, $zero
/* 5E618 8006DE18 04004010 */  beqz       $v0, .L8006DE2C
/* 5E61C 8006DE1C 21202002 */   addu      $a0, $s1, $zero
/* 5E620 8006DE20 2400228E */  lw         $v0, 0x24($s1)
/* 5E624 8006DE24 00000000 */  nop
/* 5E628 8006DE28 08005024 */  addiu      $s0, $v0, 0x8
.L8006DE2C:
/* 5E62C 8006DE2C CFA3010C */  jal        CheckPhysObFamily
/* 5E630 8006DE30 03000524 */   addiu     $a1, $zero, 0x3
/* 5E634 8006DE34 04004010 */  beqz       $v0, .L8006DE48
/* 5E638 8006DE38 21202002 */   addu      $a0, $s1, $zero
/* 5E63C 8006DE3C 2400228E */  lw         $v0, 0x24($s1)
/* 5E640 8006DE40 00000000 */  nop
/* 5E644 8006DE44 2800508C */  lw         $s0, 0x28($v0)
.L8006DE48:
/* 5E648 8006DE48 CFA3010C */  jal        CheckPhysObFamily
/* 5E64C 8006DE4C 07000524 */   addiu     $a1, $zero, 0x7
/* 5E650 8006DE50 0D004010 */  beqz       $v0, .L8006DE88
/* 5E654 8006DE54 21100002 */   addu      $v0, $s0, $zero
/* 5E658 8006DE58 6C01228E */  lw         $v0, 0x16C($s1)
/* 5E65C 8006DE5C 00000000 */  nop
/* 5E660 8006DE60 0400438C */  lw         $v1, 0x4($v0)
/* 5E664 8006DE64 2400248E */  lw         $a0, 0x24($s1)
/* 5E668 8006DE68 40100300 */  sll        $v0, $v1, 1
/* 5E66C 8006DE6C 21104300 */  addu       $v0, $v0, $v1
/* 5E670 8006DE70 0C00838C */  lw         $v1, 0xC($a0)
/* 5E674 8006DE74 80100200 */  sll        $v0, $v0, 2
/* 5E678 8006DE78 21104300 */  addu       $v0, $v0, $v1
/* 5E67C 8006DE7C 0800508C */  lw         $s0, 0x8($v0)
/* 5E680 8006DE80 00000000 */  nop
/* 5E684 8006DE84 21100002 */  addu       $v0, $s0, $zero
.L8006DE88:
/* 5E688 8006DE88 1800BF8F */  lw         $ra, 0x18($sp)
/* 5E68C 8006DE8C 1400B18F */  lw         $s1, 0x14($sp)
/* 5E690 8006DE90 1000B08F */  lw         $s0, 0x10($sp)
/* 5E694 8006DE94 0800E003 */  jr         $ra
/* 5E698 8006DE98 2000BD27 */   addiu     $sp, $sp, 0x20
.size PhysObGetWeapon, . - PhysObGetWeapon
