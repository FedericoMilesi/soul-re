.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationQueryFrame
/* 62FD8 800727D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62FDC 800727DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 62FE0 800727E0 0000848C */  lw         $a0, 0x0($a0)
/* 62FE4 800727E4 B2C9010C */  jal        G2EmulationInstanceQueryFrame
/* 62FE8 800727E8 00000000 */   nop
/* 62FEC 800727EC 1000BF8F */  lw         $ra, 0x10($sp)
/* 62FF0 800727F0 00000000 */  nop
/* 62FF4 800727F4 0800E003 */  jr         $ra
/* 62FF8 800727F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationQueryFrame, . - G2EmulationQueryFrame
