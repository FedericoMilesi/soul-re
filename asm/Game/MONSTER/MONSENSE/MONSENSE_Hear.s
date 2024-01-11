.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_Hear
/* 76644 80085E44 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 76648 80085E48 1400B1AF */  sw         $s1, 0x14($sp)
/* 7664C 80085E4C 2188A000 */  addu       $s1, $a1, $zero
/* 76650 80085E50 1800BFAF */  sw         $ra, 0x18($sp)
/* 76654 80085E54 1000B0AF */  sw         $s0, 0x10($sp)
/* 76658 80085E58 6C01828C */  lw         $v0, 0x16C($a0)
/* 7665C 80085E5C 00000000 */  nop
/* 76660 80085E60 6801428C */  lw         $v0, 0x168($v0)
/* 76664 80085E64 0000248E */  lw         $a0, 0x0($s1)
/* 76668 80085E68 0400508C */  lw         $s0, 0x4($v0)
/* 7666C 80085E6C 92D1000C */  jal        INSTANCE_Query
/* 76670 80085E70 0A000524 */   addiu     $a1, $zero, 0xA
/* 76674 80085E74 0B01033C */  lui        $v1, (0x10B0143 >> 16)
/* 76678 80085E78 43016334 */  ori        $v1, $v1, (0x10B0143 & 0xFFFF)
/* 7667C 80085E7C 21204000 */  addu       $a0, $v0, $zero
/* 76680 80085E80 24188300 */  and        $v1, $a0, $v1
/* 76684 80085E84 04006010 */  beqz       $v1, .L80085E98
/* 76688 80085E88 2000023C */   lui       $v0, (0x200000 >> 16)
/* 7668C 80085E8C 24108200 */  and        $v0, $a0, $v0
/* 76690 80085E90 0B004010 */  beqz       $v0, .L80085EC0
/* 76694 80085E94 21100000 */   addu      $v0, $zero, $zero
.L80085E98:
/* 76698 80085E98 08000386 */  lh         $v1, 0x8($s0)
/* 7669C 80085E9C 0400228E */  lw         $v0, 0x4($s1)
/* 766A0 80085EA0 00000000 */  nop
/* 766A4 80085EA4 2B104300 */  sltu       $v0, $v0, $v1
/* 766A8 80085EA8 05004010 */  beqz       $v0, .L80085EC0
/* 766AC 80085EAC 21100000 */   addu      $v0, $zero, $zero
/* 766B0 80085EB0 06000586 */  lh         $a1, 0x6($s0)
/* 766B4 80085EB4 0A000686 */  lh         $a2, 0xA($s0)
/* 766B8 80085EB8 90E9000C */  jal        MATH3D_ConeDetect
/* 766BC 80085EBC 08002426 */   addiu     $a0, $s1, 0x8
.L80085EC0:
/* 766C0 80085EC0 1800BF8F */  lw         $ra, 0x18($sp)
/* 766C4 80085EC4 1400B18F */  lw         $s1, 0x14($sp)
/* 766C8 80085EC8 1000B08F */  lw         $s0, 0x10($sp)
/* 766CC 80085ECC 0800E003 */  jr         $ra
/* 766D0 80085ED0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONSENSE_Hear, . - MONSENSE_Hear
