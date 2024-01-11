.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_MakeSpecialFogClut
/* 1D6D4 8002CED4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1D6D8 8002CED8 3800BFAF */  sw         $ra, 0x38($sp)
/* 1D6DC 8002CEDC 21388000 */  addu       $a3, $a0, $zero
/* 1D6E0 8002CEE0 10420624 */  addiu      $a2, $zero, 0x4210
/* 1D6E4 8002CEE4 0F000424 */  addiu      $a0, $zero, 0xF
/* 1D6E8 8002CEE8 2E00A227 */  addiu      $v0, $sp, 0x2E
.L8002CEEC:
/* 1D6EC 8002CEEC 000046A4 */  sh         $a2, 0x0($v0)
/* 1D6F0 8002CEF0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 1D6F4 8002CEF4 FDFF8104 */  bgez       $a0, .L8002CEEC
/* 1D6F8 8002CEF8 FEFF4224 */   addiu     $v0, $v0, -0x2
/* 1D6FC 8002CEFC 10000224 */  addiu      $v0, $zero, 0x10
/* 1D700 8002CF00 3400A2A7 */  sh         $v0, 0x34($sp)
/* 1D704 8002CF04 01000224 */  addiu      $v0, $zero, 0x1
/* 1D708 8002CF08 80190500 */  sll        $v1, $a1, 6
/* 1D70C 8002CF0C 3600A2A7 */  sh         $v0, 0x36($sp)
/* 1D710 8002CF10 03110700 */  sra        $v0, $a3, 4
/* 1D714 8002CF14 3F004230 */  andi       $v0, $v0, 0x3F
/* 1D718 8002CF18 25186200 */  or         $v1, $v1, $v0
/* 1D71C 8002CF1C 1000A0A7 */  sh         $zero, 0x10($sp)
/* 1D720 8002CF20 3000A7A7 */  sh         $a3, 0x30($sp)
/* 1D724 8002CF24 3200A5A7 */  sh         $a1, 0x32($sp)
/* 1D728 8002CF28 E8B383A7 */  sh         $v1, %gp_rel(SpecialFogClut)($gp)
/* 1D72C 8002CF2C 0FE9020C */  jal        DrawSync
/* 1D730 8002CF30 21200000 */   addu      $a0, $zero, $zero
/* 1D734 8002CF34 3000A427 */  addiu      $a0, $sp, 0x30
/* 1D738 8002CF38 94E9020C */  jal        LoadImage
/* 1D73C 8002CF3C 1000A527 */   addiu     $a1, $sp, 0x10
/* 1D740 8002CF40 0FE9020C */  jal        DrawSync
/* 1D744 8002CF44 21200000 */   addu      $a0, $zero, $zero
/* 1D748 8002CF48 3800BF8F */  lw         $ra, 0x38($sp)
/* 1D74C 8002CF4C 00000000 */  nop
/* 1D750 8002CF50 0800E003 */  jr         $ra
/* 1D754 8002CF54 4000BD27 */   addiu     $sp, $sp, 0x40
.size FONT_MakeSpecialFogClut, . - FONT_MakeSpecialFogClut
