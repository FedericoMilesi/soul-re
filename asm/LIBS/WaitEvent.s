.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WaitEvent
/* B7400 800C6C00 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7404 800C6C04 08004001 */  jr         $t2
/* B7408 800C6C08 0A000924 */   addiu     $t1, $zero, 0xA
/* B740C 800C6C0C 00000000 */  nop
.size WaitEvent, . - WaitEvent
