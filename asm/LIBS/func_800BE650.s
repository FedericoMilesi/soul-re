.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE650
/* AEE50 800BE650 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AEE54 800BE654 1000BFAF */  sw         $ra, 0x10($sp)
/* AEE58 800BE658 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* AEE5C 800BE65C 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* AEE60 800BE660 AD15030C */  jal        DeliverEvent
/* AEE64 800BE664 20000524 */   addiu     $a1, $zero, 0x20
/* AEE68 800BE668 1000BF8F */  lw         $ra, 0x10($sp)
/* AEE6C 800BE66C 1800BD27 */  addiu      $sp, $sp, 0x18
/* AEE70 800BE670 0800E003 */  jr         $ra
/* AEE74 800BE674 00000000 */   nop
.size func_800BE650, . - func_800BE650
