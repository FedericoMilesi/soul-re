.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetController_Vector
/* 811F4 800909F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 811F8 800909F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 811FC 800909FC 1400BFAF */  sw         $ra, 0x14($sp)
/* 81200 80090A00 0A47020C */  jal        _G2Anim_FindController
/* 81204 80090A04 2180E000 */   addu      $s0, $a3, $zero
/* 81208 80090A08 0300088A */  lwl        $t0, 0x3($s0)
/* 8120C 80090A0C 0000089A */  lwr        $t0, 0x0($s0)
/* 81210 80090A10 04000986 */  lh         $t1, 0x4($s0)
/* 81214 80090A14 170048A8 */  swl        $t0, 0x17($v0)
/* 81218 80090A18 140048B8 */  swr        $t0, 0x14($v0)
/* 8121C 80090A1C 180049A4 */  sh         $t1, 0x18($v0)
/* 81220 80090A20 08004390 */  lbu        $v1, 0x8($v0)
/* 81224 80090A24 00000000 */  nop
/* 81228 80090A28 080043A4 */  sh         $v1, 0x8($v0)
/* 8122C 80090A2C 1400BF8F */  lw         $ra, 0x14($sp)
/* 81230 80090A30 1000B08F */  lw         $s0, 0x10($sp)
/* 81234 80090A34 0800E003 */  jr         $ra
/* 81238 80090A38 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_SetController_Vector, . - G2Anim_SetController_Vector
