.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_DisplayControllerStatus
/* 227A4 80031FA4 70BB828F */  lw         $v0, %gp_rel(gamePadControllerOut)($gp)
/* 227A8 80031FA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 227AC 80031FAC 1400B1AF */  sw         $s1, 0x14($sp)
/* 227B0 80031FB0 21888000 */  addu       $s1, $a0, $zero
/* 227B4 80031FB4 1800BFAF */  sw         $ra, 0x18($sp)
/* 227B8 80031FB8 06004228 */  slti       $v0, $v0, 0x6
/* 227BC 80031FBC 0C004014 */  bnez       $v0, .L80031FF0
/* 227C0 80031FC0 1000B0AF */   sw        $s0, 0x10($sp)
/* 227C4 80031FC4 B3DD020C */  jal        localstr_get
/* 227C8 80031FC8 6D000424 */   addiu     $a0, $zero, 0x6D
/* 227CC 80031FCC 21804000 */  addu       $s0, $v0, $zero
/* 227D0 80031FD0 21200002 */  addu       $a0, $s0, $zero
/* 227D4 80031FD4 A8B6000C */  jal        FONT_FontPrintCentered
/* 227D8 80031FD8 21282002 */   addu      $a1, $s1, $zero
/* 227DC 80031FDC FBB5000C */  jal        FONT_GetStringWidth
/* 227E0 80031FE0 21200002 */   addu      $a0, $s0, $zero
/* 227E4 80031FE4 21204000 */  addu       $a0, $v0, $zero
/* 227E8 80031FE8 72DE020C */  jal        DisplayHintBox
/* 227EC 80031FEC 21282002 */   addu      $a1, $s1, $zero
.L80031FF0:
/* 227F0 80031FF0 1800BF8F */  lw         $ra, 0x18($sp)
/* 227F4 80031FF4 1400B18F */  lw         $s1, 0x14($sp)
/* 227F8 80031FF8 1000B08F */  lw         $s0, 0x10($sp)
/* 227FC 80031FFC 0800E003 */  jr         $ra
/* 22800 80032000 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMEPAD_DisplayControllerStatus, . - GAMEPAD_DisplayControllerStatus
