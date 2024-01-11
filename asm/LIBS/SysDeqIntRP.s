.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SysDeqIntRP
/* B8150 800C7950 C0000A24 */  addiu      $t2, $zero, 0xC0
/* B8154 800C7954 08004001 */  jr         $t2
/* B8158 800C7958 03000924 */   addiu     $t1, $zero, 0x3
/* B815C 800C795C 00000000 */  nop
.size SysDeqIntRP, . - SysDeqIntRP
