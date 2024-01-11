.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Birth
/* 78A74 80088274 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 78A78 80088278 1000BFAF */  sw         $ra, 0x10($sp)
/* 78A7C 8008827C 91FE010C */  jal        MON_SwitchState
/* 78A80 80088280 02000524 */   addiu     $a1, $zero, 0x2
/* 78A84 80088284 1000BF8F */  lw         $ra, 0x10($sp)
/* 78A88 80088288 00000000 */  nop
/* 78A8C 8008828C 0800E003 */  jr         $ra
/* 78A90 80088290 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_Birth, . - MON_Birth
