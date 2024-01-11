.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel nextfile
/* B80A8 800C78A8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B80AC 800C78AC 08004001 */  jr         $t2
/* B80B0 800C78B0 43000924 */   addiu     $t1, $zero, 0x43
/* B80B4 800C78B4 00000000 */  nop
.size nextfile, . - nextfile
