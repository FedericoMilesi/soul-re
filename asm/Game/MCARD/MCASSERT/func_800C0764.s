.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0764
/* B0F64 800C0764 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B0F68 800C0768 08004001 */  jr         $t2
/* B0F6C 800C076C 39000924 */   addiu     $t1, $zero, 0x39
/* B0F70 800C0770 00000000 */  nop
.size func_800C0764, . - func_800C0764
