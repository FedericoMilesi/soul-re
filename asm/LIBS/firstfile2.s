.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel firstfile2
/* B8870 800C8070 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B8874 800C8074 08004001 */  jr         $t2
/* B8878 800C8078 42000924 */   addiu     $t1, $zero, 0x42
/* B887C 800C807C 00000000 */  nop
.size firstfile2, . - firstfile2
