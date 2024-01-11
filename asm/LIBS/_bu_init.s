.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _bu_init
/* B80C8 800C78C8 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B80CC 800C78CC 08004001 */  jr         $t2
/* B80D0 800C78D0 70000924 */   addiu     $t1, $zero, 0x70
/* B80D4 800C78D4 00000000 */  nop
.size _bu_init, . - _bu_init
