.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BFA54
/* B0254 800BFA54 0D80023C */  lui        $v0, %hi(_spu_RXX)
/* B0258 800BFA58 5CED428C */  lw         $v0, %lo(_spu_RXX)($v0)
/* B025C 800BFA5C 00210400 */  sll        $a0, $a0, 4
/* B0260 800BFA60 21208200 */  addu       $a0, $a0, $v0
/* B0264 800BFA64 04008294 */  lhu        $v0, 0x4($a0)
/* B0268 800BFA68 0800E003 */  jr         $ra
/* B026C 800BFA6C 0000A2A4 */   sh        $v0, 0x0($a1)
/* B0270 800BFA70 00000000 */  nop
.size func_800BFA54, . - func_800BFA54
