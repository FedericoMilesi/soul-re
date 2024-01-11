.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel lseek
/* B7DD8 800C75D8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B7DDC 800C75DC 08004001 */  jr         $t2
/* B7DE0 800C75E0 33000924 */   addiu     $t1, $zero, 0x33
/* B7DE4 800C75E4 00000000 */  nop
.size lseek, . - lseek
