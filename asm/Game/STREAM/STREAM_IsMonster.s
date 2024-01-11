.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsMonster
/* 49760 80058F60 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 49764 80058F64 0D80053C */  lui        $a1, %hi(aadGp + 0x1C)
/* 49768 80058F68 1000BFAF */  sw         $ra, 0x10($sp)
/* 4976C 80058F6C 7E63010C */  jal        STREAM_InList
/* 49770 80058F70 10C4A524 */   addiu     $a1, $a1, %lo(aadGp + 0x1C)
/* 49774 80058F74 1000BF8F */  lw         $ra, 0x10($sp)
/* 49778 80058F78 00000000 */  nop
/* 4977C 80058F7C 0800E003 */  jr         $ra
/* 49780 80058F80 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_IsMonster, . - STREAM_IsMonster
