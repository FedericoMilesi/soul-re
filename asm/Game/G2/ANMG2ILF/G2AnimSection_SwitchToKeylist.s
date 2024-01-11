.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SwitchToKeylist
/* 80A14 80090214 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80A18 80090218 1000BFAF */  sw         $ra, 0x10($sp)
/* 80A1C 8009021C 624D020C */  jal        G2AnimSection_SwitchToKeylistAtTime
/* 80A20 80090220 21380000 */   addu      $a3, $zero, $zero
/* 80A24 80090224 1000BF8F */  lw         $ra, 0x10($sp)
/* 80A28 80090228 00000000 */  nop
/* 80A2C 8009022C 0800E003 */  jr         $ra
/* 80A30 80090230 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_SwitchToKeylist, . - G2AnimSection_SwitchToKeylist
