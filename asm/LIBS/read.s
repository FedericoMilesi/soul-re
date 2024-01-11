.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel read
/* B7DE8 800C75E8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7DEC 800C75EC 08004001 */  jr         $t2
/* B7DF0 800C75F0 34000924 */   addiu     $t1, $zero, 0x34
/* B7DF4 800C75F4 00000000 */  nop
.size read, . - read
