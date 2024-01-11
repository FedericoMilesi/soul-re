.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_DropAllObjects
/* 72E08 80082608 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 72E0C 8008260C 1800BFAF */  sw         $ra, 0x18($sp)
/* 72E10 80082610 1400B1AF */  sw         $s1, 0x14($sp)
/* 72E14 80082614 1000B0AF */  sw         $s0, 0x10($sp)
/* 72E18 80082618 4C01848C */  lw         $a0, 0x14C($a0)
/* 72E1C 8008261C 00000000 */  nop
/* 72E20 80082620 10008010 */  beqz       $a0, .L80082664
/* 72E24 80082624 03001124 */   addiu     $s1, $zero, 0x3
.L80082628:
/* 72E28 80082628 5001908C */  lw         $s0, 0x150($a0)
/* 72E2C 8008262C 5401828C */  lw         $v0, 0x154($a0)
/* 72E30 80082630 00000000 */  nop
/* 72E34 80082634 04005114 */  bne        $v0, $s1, .L80082648
/* 72E38 80082638 8000053C */   lui       $a1, (0x800008 >> 16)
/* 72E3C 8008263C 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 72E40 80082640 94090208 */  j          .L80082650
/* 72E44 80082644 02000624 */   addiu     $a2, $zero, 0x2
.L80082648:
/* 72E48 80082648 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 72E4C 8008264C 01000624 */  addiu      $a2, $zero, 0x1
.L80082650:
/* 72E50 80082650 A1D1000C */  jal        INSTANCE_Post
/* 72E54 80082654 00000000 */   nop
/* 72E58 80082658 21200002 */  addu       $a0, $s0, $zero
/* 72E5C 8008265C F2FF8014 */  bnez       $a0, .L80082628
/* 72E60 80082660 00000000 */   nop
.L80082664:
/* 72E64 80082664 1800BF8F */  lw         $ra, 0x18($sp)
/* 72E68 80082668 1400B18F */  lw         $s1, 0x14($sp)
/* 72E6C 8008266C 1000B08F */  lw         $s0, 0x10($sp)
/* 72E70 80082670 0800E003 */  jr         $ra
/* 72E74 80082674 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_DropAllObjects, . - MON_DropAllObjects
