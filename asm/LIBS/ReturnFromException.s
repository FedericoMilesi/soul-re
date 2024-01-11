.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ReturnFromException
/* B2B10 800C2310 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B2B14 800C2314 08004001 */  jr         $t2
/* B2B18 800C2318 17000924 */   addiu     $t1, $zero, 0x17
/* B2B1C 800C231C 00000000 */  nop
.size ReturnFromException, . - ReturnFromException
