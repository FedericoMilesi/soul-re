.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadIsSfxLoaded
/* 44B3C 8005433C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 44B40 80054340 00000000 */  nop
/* 44B44 80054344 21104400 */  addu       $v0, $v0, $a0
/* 44B48 80054348 08084490 */  lbu        $a0, 0x808($v0)
/* 44B4C 8005434C 00000000 */  nop
/* 44B50 80054350 FE00822C */  sltiu      $v0, $a0, 0xFE
/* 44B54 80054354 06004014 */  bnez       $v0, .L80054370
/* 44B58 80054358 01000224 */   addiu     $v0, $zero, 0x1
/* 44B5C 8005435C FE000324 */  addiu      $v1, $zero, 0xFE
/* 44B60 80054360 03008310 */  beq        $a0, $v1, .L80054370
/* 44B64 80054364 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 44B68 80054368 0800E003 */  jr         $ra
/* 44B6C 8005436C 21100000 */   addu      $v0, $zero, $zero
.L80054370:
/* 44B70 80054370 0800E003 */  jr         $ra
/* 44B74 80054374 00000000 */   nop
.size aadIsSfxLoaded, . - aadIsSfxLoaded
