.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GPU_cw
/* B2B50 800C2350 A0000A24 */  addiu      $t2, $zero, 0xA0
/* B2B54 800C2354 08004001 */  jr         $t2
/* B2B58 800C2358 49000924 */   addiu     $t1, $zero, 0x49
/* B2B5C 800C235C 00000000 */  nop
.size GPU_cw, . - GPU_cw
