.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableEvent
/* AFB54 800BF354 B0000A24 */  addiu      $t2, $zero, 0xB0
/* AFB58 800BF358 08004001 */  jr         $t2
/* AFB5C 800BF35C 0C000924 */   addiu     $t1, $zero, 0xC
/* AFB60 800BF360 00000000 */  nop
.size EnableEvent, . - EnableEvent
