.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdStartSlot
/* 46960 80056160 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46964 80056164 1000BFAF */  sw         $ra, 0x10($sp)
/* 46968 80056168 3C05A490 */  lbu        $a0, 0x53C($a1)
/* 4696C 8005616C F451010C */  jal        aadStartSlot
/* 46970 80056170 00000000 */   nop
/* 46974 80056174 1000BF8F */  lw         $ra, 0x10($sp)
/* 46978 80056178 00000000 */  nop
/* 4697C 8005617C 0800E003 */  jr         $ra
/* 46980 80056180 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdStartSlot, . - metaCmdStartSlot
