.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE678
/* AEE78 800BE678 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AEE7C 800BE67C 1000BFAF */  sw         $ra, 0x10($sp)
/* AEE80 800BE680 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* AEE84 800BE684 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* AEE88 800BE688 AD15030C */  jal        DeliverEvent
/* AEE8C 800BE68C 40000524 */   addiu     $a1, $zero, 0x40
/* AEE90 800BE690 1000BF8F */  lw         $ra, 0x10($sp)
/* AEE94 800BE694 1800BD27 */  addiu      $sp, $sp, 0x18
/* AEE98 800BE698 0800E003 */  jr         $ra
/* AEE9C 800BE69C 00000000 */   nop
.size func_800BE678, . - func_800BE678
