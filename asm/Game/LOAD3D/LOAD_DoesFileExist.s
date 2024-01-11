.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_DoesFileExist
/* 2887C 8003807C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28880 80038080 1000BFAF */  sw         $ra, 0x10($sp)
/* 28884 80038084 15E0000C */  jal        LOAD_GetBigFileEntry
/* 28888 80038088 00000000 */   nop
/* 2888C 8003808C 04004010 */  beqz       $v0, .L800380A0
/* 28890 80038090 21180000 */   addu      $v1, $zero, $zero
/* 28894 80038094 0400428C */  lw         $v0, 0x4($v0)
/* 28898 80038098 00000000 */  nop
/* 2889C 8003809C 2B186200 */  sltu       $v1, $v1, $v0
.L800380A0:
/* 288A0 800380A0 1000BF8F */  lw         $ra, 0x10($sp)
/* 288A4 800380A4 21106000 */  addu       $v0, $v1, $zero
/* 288A8 800380A8 0800E003 */  jr         $ra
/* 288AC 800380AC 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_DoesFileExist, . - LOAD_DoesFileExist
