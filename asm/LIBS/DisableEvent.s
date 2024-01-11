.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DisableEvent
/* AFB74 800BF374 B0000A24 */  addiu      $t2, $zero, 0xB0
/* AFB78 800BF378 08004001 */  jr         $t2
/* AFB7C 800BF37C 0D000924 */   addiu     $t1, $zero, 0xD
/* AFB80 800BF380 00000000 */  nop
.size DisableEvent, . - DisableEvent
