.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel write
/* B7DF8 800C75F8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7DFC 800C75FC 08004001 */  jr         $t2
/* B7E00 800C7600 35000924 */   addiu     $t1, $zero, 0x35
/* B7E04 800C7604 00000000 */  nop
.size write, . - write
