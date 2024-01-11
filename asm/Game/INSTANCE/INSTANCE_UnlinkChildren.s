.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_UnlinkChildren
/* 25F3C 8003573C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 25F40 80035740 1800B2AF */  sw         $s2, 0x18($sp)
/* 25F44 80035744 21908000 */  addu       $s2, $a0, $zero
/* 25F48 80035748 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 25F4C 8003574C 1400B1AF */  sw         $s1, 0x14($sp)
/* 25F50 80035750 1000B0AF */  sw         $s0, 0x10($sp)
/* 25F54 80035754 4C01518E */  lw         $s1, 0x14C($s2)
/* 25F58 80035758 00000000 */  nop
/* 25F5C 8003575C 0B002012 */  beqz       $s1, .L8003578C
/* 25F60 80035760 1000053C */   lui       $a1, (0x100013 >> 16)
.L80035764:
/* 25F64 80035764 1300A534 */  ori        $a1, $a1, (0x100013 & 0xFFFF)
/* 25F68 80035768 21204002 */  addu       $a0, $s2, $zero
/* 25F6C 8003576C 5001308E */  lw         $s0, 0x150($s1)
/* 25F70 80035770 A1D1000C */  jal        INSTANCE_Post
/* 25F74 80035774 21302002 */   addu      $a2, $s1, $zero
/* 25F78 80035778 480120AE */  sw         $zero, 0x148($s1)
/* 25F7C 8003577C 500120AE */  sw         $zero, 0x150($s1)
/* 25F80 80035780 21880002 */  addu       $s1, $s0, $zero
/* 25F84 80035784 F7FF2016 */  bnez       $s1, .L80035764
/* 25F88 80035788 1000053C */   lui       $a1, (0x100013 >> 16)
.L8003578C:
/* 25F8C 8003578C 4C0140AE */  sw         $zero, 0x14C($s2)
/* 25F90 80035790 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 25F94 80035794 1800B28F */  lw         $s2, 0x18($sp)
/* 25F98 80035798 1400B18F */  lw         $s1, 0x14($sp)
/* 25F9C 8003579C 1000B08F */  lw         $s0, 0x10($sp)
/* 25FA0 800357A0 0800E003 */  jr         $ra
/* 25FA4 800357A4 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_UnlinkChildren, . - INSTANCE_UnlinkChildren
