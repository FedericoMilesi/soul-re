.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVideoMode
/* B2B60 800C2360 0D80023C */  lui        $v0, %hi(GsOUT_PACKET_P)
/* B2B64 800C2364 ECE8428C */  lw         $v0, %lo(GsOUT_PACKET_P)($v0)
/* B2B68 800C2368 0800E003 */  jr         $ra
/* B2B6C 800C236C 00000000 */   nop
/* B2B70 800C2370 00000000 */  nop
/* B2B74 800C2374 00000000 */  nop
/* B2B78 800C2378 00000000 */  nop
.size GetVideoMode, . - GetVideoMode
