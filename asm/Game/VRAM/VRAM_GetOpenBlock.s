.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_GetOpenBlock
/* 63AFC 800732FC 21200000 */  addu       $a0, $zero, $zero
/* 63B00 80073300 48E28327 */  addiu      $v1, $gp, %gp_rel(vramBlockList)
.L80073304:
/* 63B04 80073304 05006290 */  lbu        $v0, 0x5($v1)
/* 63B08 80073308 00000000 */  nop
/* 63B0C 8007330C 03004014 */  bnez       $v0, .L8007331C
/* 63B10 80073310 01008424 */   addiu     $a0, $a0, 0x1
/* 63B14 80073314 0800E003 */  jr         $ra
/* 63B18 80073318 21106000 */   addu      $v0, $v1, $zero
.L8007331C:
/* 63B1C 8007331C 5A008228 */  slti       $v0, $a0, 0x5A
/* 63B20 80073320 F8FF4014 */  bnez       $v0, .L80073304
/* 63B24 80073324 1C006324 */   addiu     $v1, $v1, 0x1C
/* 63B28 80073328 0800E003 */  jr         $ra
/* 63B2C 8007332C 21100000 */   addu      $v0, $zero, $zero
.size VRAM_GetOpenBlock, . - VRAM_GetOpenBlock
