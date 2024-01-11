.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetSlotVolume
/* 46A00 80056200 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46A04 80056204 1000BFAF */  sw         $ra, 0x10($sp)
/* 46A08 80056208 06008390 */  lbu        $v1, 0x6($a0)
/* 46A0C 8005620C 3805A28C */  lw         $v0, 0x538($a1)
/* 46A10 80056210 00000000 */  nop
/* 46A14 80056214 520543A0 */  sb         $v1, 0x552($v0)
/* 46A18 80056218 3805A48C */  lw         $a0, 0x538($a1)
/* 46A1C 8005621C E955010C */  jal        aadUpdateSlotVolPan
/* 46A20 80056220 00000000 */   nop
/* 46A24 80056224 1000BF8F */  lw         $ra, 0x10($sp)
/* 46A28 80056228 00000000 */  nop
/* 46A2C 8005622C 0800E003 */  jr         $ra
/* 46A30 80056230 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdSetSlotVolume, . - metaCmdSetSlotVolume
