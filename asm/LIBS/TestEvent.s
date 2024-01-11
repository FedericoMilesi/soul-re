.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TestEvent
/* B7280 800C6A80 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7284 800C6A84 08004001 */  jr         $t2
/* B7288 800C6A88 0B000924 */   addiu     $t1, $zero, 0xB
/* B728C 800C6A8C 00000000 */  nop
.size TestEvent, . - TestEvent
