.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LitShaftInit
/* 512FC 80060AFC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 51300 80060B00 1400B1AF */  sw         $s1, 0x14($sp)
/* 51304 80060B04 21888000 */  addu       $s1, $a0, $zero
/* 51308 80060B08 1800BFAF */  sw         $ra, 0x18($sp)
/* 5130C 80060B0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 51310 80060B10 2400308E */  lw         $s0, 0x24($s1)
/* 51314 80060B14 00000000 */  nop
/* 51318 80060B18 17000012 */  beqz       $s0, .L80060B78
/* 5131C 80060B1C 00000000 */   nop
/* 51320 80060B20 BEB7000C */  jal        GAMELOOP_GetTimeOfDay
/* 51324 80060B24 00000000 */   nop
/* 51328 80060B28 21184000 */  addu       $v1, $v0, $zero
/* 5132C 80060B2C BC020224 */  addiu      $v0, $zero, 0x2BC
/* 51330 80060B30 0E006210 */  beq        $v1, $v0, .L80060B6C
/* 51334 80060B34 BD026228 */   slti      $v0, $v1, 0x2BD
/* 51338 80060B38 05004010 */  beqz       $v0, .L80060B50
/* 5133C 80060B3C 58020224 */   addiu     $v0, $zero, 0x258
/* 51340 80060B40 0B006210 */  beq        $v1, $v0, .L80060B70
/* 51344 80060B44 00100224 */   addiu     $v0, $zero, 0x1000
/* 51348 80060B48 DE820108 */  j          .L80060B78
/* 5134C 80060B4C 00000000 */   nop
.L80060B50:
/* 51350 80060B50 08070224 */  addiu      $v0, $zero, 0x708
/* 51354 80060B54 05006210 */  beq        $v1, $v0, .L80060B6C
/* 51358 80060B58 6C070224 */   addiu     $v0, $zero, 0x76C
/* 5135C 80060B5C 06006214 */  bne        $v1, $v0, .L80060B78
/* 51360 80060B60 00100224 */   addiu     $v0, $zero, 0x1000
/* 51364 80060B64 DE820108 */  j          .L80060B78
/* 51368 80060B68 040122A6 */   sh        $v0, 0x104($s1)
.L80060B6C:
/* 5136C 80060B6C 00000296 */  lhu        $v0, 0x0($s0)
.L80060B70:
/* 51370 80060B70 00000000 */  nop
/* 51374 80060B74 040122A6 */  sh         $v0, 0x104($s1)
.L80060B78:
/* 51378 80060B78 1800BF8F */  lw         $ra, 0x18($sp)
/* 5137C 80060B7C 1400B18F */  lw         $s1, 0x14($sp)
/* 51380 80060B80 1000B08F */  lw         $s0, 0x10($sp)
/* 51384 80060B84 0800E003 */  jr         $ra
/* 51388 80060B88 2000BD27 */   addiu     $sp, $sp, 0x20
.size LitShaftInit, . - LitShaftInit
