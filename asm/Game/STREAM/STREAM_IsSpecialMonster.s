.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsSpecialMonster
/* 49660 80058E60 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 49664 80058E64 0D80053C */  lui        $a1, %hi(aadGp + 0x4)
/* 49668 80058E68 1000BFAF */  sw         $ra, 0x10($sp)
/* 4966C 80058E6C 7E63010C */  jal        STREAM_InList
/* 49670 80058E70 F8C3A524 */   addiu     $a1, $a1, %lo(aadGp + 0x4)
/* 49674 80058E74 1000BF8F */  lw         $ra, 0x10($sp)
/* 49678 80058E78 00000000 */  nop
/* 4967C 80058E7C 0800E003 */  jr         $ra
/* 49680 80058E80 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_IsSpecialMonster, . - STREAM_IsSpecialMonster
