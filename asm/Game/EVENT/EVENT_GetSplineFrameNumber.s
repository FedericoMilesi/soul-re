.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetSplineFrameNumber
/* 57B58 80067358 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 57B5C 8006735C 1000B0AF */  sw         $s0, 0x10($sp)
/* 57B60 80067360 21808000 */  addu       $s0, $a0, $zero
/* 57B64 80067364 1400BFAF */  sw         $ra, 0x14($sp)
/* 57B68 80067368 0000048E */  lw         $a0, 0x0($s0)
/* 57B6C 8006736C 0400058E */  lw         $a1, 0x4($s0)
/* 57B70 80067370 0C00068E */  lw         $a2, 0xC($s0)
/* 57B74 80067374 1000078E */  lw         $a3, 0x10($s0)
/* 57B78 80067378 96F4000C */  jal        SCRIPT_GetPosSplineDef
/* 57B7C 8006737C 00000000 */   nop
/* 57B80 80067380 0000048E */  lw         $a0, 0x0($s0)
/* 57B84 80067384 53F4000C */  jal        SCRIPT_GetSplineFrameNumber
/* 57B88 80067388 21284000 */   addu      $a1, $v0, $zero
/* 57B8C 8006738C 1400BF8F */  lw         $ra, 0x14($sp)
/* 57B90 80067390 1000B08F */  lw         $s0, 0x10($sp)
/* 57B94 80067394 0800E003 */  jr         $ra
/* 57B98 80067398 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_GetSplineFrameNumber, . - EVENT_GetSplineFrameNumber
