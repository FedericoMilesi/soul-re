.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB56C
/* ABD6C 800BB56C 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ABD70 800BB570 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ABD74 800BB574 00000000 */  nop
/* ABD78 800BB578 0000428C */  lw         $v0, 0x0($v0)
/* ABD7C 800BB57C 0800E003 */  jr         $ra
/* ABD80 800BB580 00000000 */   nop
.size func_800BB56C, . - func_800BB56C
