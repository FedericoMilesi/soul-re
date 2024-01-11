.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Query
/* 24E48 80034648 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 24E4C 8003464C 1000BFAF */  sw         $ra, 0x10($sp)
/* 24E50 80034650 1801828C */  lw         $v0, 0x118($a0)
/* 24E54 80034654 00000000 */  nop
/* 24E58 80034658 05004010 */  beqz       $v0, .L80034670
/* 24E5C 8003465C 00000000 */   nop
/* 24E60 80034660 09F84000 */  jalr       $v0
/* 24E64 80034664 00000000 */   nop
/* 24E68 80034668 9DD10008 */  j          .L80034674
/* 24E6C 8003466C 00000000 */   nop
.L80034670:
/* 24E70 80034670 21100000 */  addu       $v0, $zero, $zero
.L80034674:
/* 24E74 80034674 1000BF8F */  lw         $ra, 0x10($sp)
/* 24E78 80034678 00000000 */  nop
/* 24E7C 8003467C 0800E003 */  jr         $ra
/* 24E80 80034680 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_Query, . - INSTANCE_Query
