.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ChangeClearRCnt
/* B2B30 800C2330 C0000A24 */  addiu      $t2, $zero, 0xC0
/* B2B34 800C2334 08004001 */  jr         $t2
/* B2B38 800C2338 0A000924 */   addiu     $t1, $zero, 0xA
/* B2B3C 800C233C 00000000 */  nop
.size ChangeClearRCnt, . - ChangeClearRCnt
