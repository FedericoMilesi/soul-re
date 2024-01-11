.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel close
/* B7DC8 800C75C8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7DCC 800C75CC 08004001 */  jr         $t2
/* B7DD0 800C75D0 36000924 */   addiu     $t1, $zero, 0x36
/* B7DD4 800C75D4 00000000 */  nop
.size close, . - close
