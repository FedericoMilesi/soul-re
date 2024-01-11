.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeClearPAD
/* B2B20 800C2320 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B2B24 800C2324 08004001 */  jr         $t2
/* B2B28 800C2328 5B000924 */   addiu     $t1, $zero, 0x5B
/* B2B2C 800C232C 00000000 */  nop
.size ChangeClearPAD, . - ChangeClearPAD
