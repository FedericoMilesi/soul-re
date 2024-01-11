.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FlushCache
/* B8860 800C8060 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B8864 800C8064 08004001 */  jr         $t2
/* B8868 800C8068 44000924 */   addiu     $t1, $zero, 0x44
/* B886C 800C806C 00000000 */  nop
.size FlushCache, . - FlushCache
