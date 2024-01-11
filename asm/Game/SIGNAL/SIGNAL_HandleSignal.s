.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleSignal
/* EDC8 8001E5C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EDCC 8001E5CC 2138C000 */  addu       $a3, $a2, $zero
/* EDD0 8001E5D0 1000BFAF */  sw         $ra, 0x10($sp)
/* EDD4 8001E5D4 E378000C */  jal        COLLIDE_HandleSignal
/* EDD8 8001E5D8 01000624 */   addiu     $a2, $zero, 0x1
/* EDDC 8001E5DC 1000BF8F */  lw         $ra, 0x10($sp)
/* EDE0 8001E5E0 00000000 */  nop
/* EDE4 8001E5E4 0800E003 */  jr         $ra
/* EDE8 8001E5E8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleSignal, . - SIGNAL_HandleSignal
