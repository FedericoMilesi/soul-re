.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetIntrMask
/* AA3B0 800B9BB0 0D80033C */  lui        $v1, %hi(D_800CD9A4)
/* AA3B4 800B9BB4 A4D9638C */  lw         $v1, %lo(D_800CD9A4)($v1)
/* AA3B8 800B9BB8 00000000 */  nop
/* AA3BC 800B9BBC 00006294 */  lhu        $v0, 0x0($v1)
/* AA3C0 800B9BC0 0800E003 */  jr         $ra
/* AA3C4 800B9BC4 000064A4 */   sh        $a0, 0x0($v1)
.size SetIntrMask, . - SetIntrMask
