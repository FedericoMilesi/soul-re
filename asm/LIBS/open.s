.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel open
/* B7DB8 800C75B8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7DBC 800C75BC 08004001 */  jr         $t2
/* B7DC0 800C75C0 32000924 */   addiu     $t1, $zero, 0x32
/* B7DC4 800C75C4 00000000 */  nop
.size open, . - open
