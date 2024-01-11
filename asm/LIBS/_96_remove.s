.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _96_remove
/* B2AF8 800C22F8 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B2AFC 800C22FC 08004001 */  jr         $t2
/* B2B00 800C2300 72000924 */   addiu     $t1, $zero, 0x72
/* B2B04 800C2304 00000000 */  nop
/* B2B08 800C2308 00000000 */  nop
/* B2B0C 800C230C 00000000 */  nop
.size _96_remove, . - _96_remove
