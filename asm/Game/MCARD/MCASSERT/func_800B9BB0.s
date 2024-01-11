.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9BB0
/* AA3B0 800B9BB0 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x10F8)
/* AA3B4 800B9BB4 A4D9638C */  lw         $v1, %lo(the_attract_movies + 0x10F8)($v1)
/* AA3B8 800B9BB8 00000000 */  nop
/* AA3BC 800B9BBC 00006294 */  lhu        $v0, 0x0($v1)
/* AA3C0 800B9BC0 0800E003 */  jr         $ra
/* AA3C4 800B9BC4 000064A4 */   sh        $a0, 0x0($v1)
.size func_800B9BB0, . - func_800B9BB0
