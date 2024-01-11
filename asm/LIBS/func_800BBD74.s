.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBD74
/* AC574 800BBD74 0E80023C */  lui        $v0, %hi(gMemcard + 0x58)
/* AC578 800BBD78 21104400 */  addu       $v0, $v0, $a0
/* AC57C 800BBD7C 60BD4290 */  lbu        $v0, %lo(gMemcard + 0x58)($v0)
/* AC580 800BBD80 0800E003 */  jr         $ra
/* AC584 800BBD84 00000000 */   nop
.size func_800BBD74, . - func_800BBD74
