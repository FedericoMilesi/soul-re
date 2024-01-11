.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CloseEvent
/* AFC44 800BF444 B0000A24 */  addiu      $t2, $zero, 0xB0
/* AFC48 800BF448 08004001 */  jr         $t2
/* AFC4C 800BF44C 09000924 */   addiu     $t1, $zero, 0x9
/* AFC50 800BF450 00000000 */  nop
.size CloseEvent, . - CloseEvent
