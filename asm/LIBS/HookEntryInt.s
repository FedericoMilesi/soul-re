.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HookEntryInt
/* B2720 800C1F20 B0000A24 */  addiu      $t2, $zero, 0xB0
/* B2724 800C1F24 08004001 */  jr         $t2
/* B2728 800C1F28 19000924 */   addiu     $t1, $zero, 0x19
/* B272C 800C1F2C 00000000 */  nop
.size HookEntryInt, . - HookEntryInt
