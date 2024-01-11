.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel erase
/* B80B8 800C78B8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B80BC 800C78BC 08004001 */  jr         $t2
/* B80C0 800C78C0 45000924 */   addiu     $t1, $zero, 0x45
/* B80C4 800C78C4 00000000 */  nop
.size erase, . - erase
