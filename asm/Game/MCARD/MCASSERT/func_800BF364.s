.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BF364
/* AFB64 800BF364 B0000A24 */  addiu      $t2, $zero, 0xB0
/* AFB68 800BF368 08004001 */  jr         $t2
/* AFB6C 800BF36C 08000924 */   addiu     $t1, $zero, 0x8
/* AFB70 800BF370 00000000 */  nop
.size func_800BF364, . - func_800BF364
