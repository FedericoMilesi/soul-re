.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetEntryInt
/* B2B40 800C2340 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B2B44 800C2344 08004001 */  jr         $t2
/* B2B48 800C2348 18000924 */   addiu     $t1, $zero, 0x18
/* B2B4C 800C234C 00000000 */  nop
.size ResetEntryInt, . - ResetEntryInt
