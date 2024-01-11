.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_LoadingMessage
/* 1D5B8 8002CDB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1D5BC 8002CDBC 1800BFAF */  sw         $ra, 0x18($sp)
/* 1D5C0 8002CDC0 1400B1AF */  sw         $s1, 0x14($sp)
/* 1D5C4 8002CDC4 1000B0AF */  sw         $s0, 0x10($sp)
.L8002CDC8:
/* 1D5C8 8002CDC8 E4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 1D5CC 8002CDCC 8494000C */  jal        func_80025210
/* 1D5D0 8002CDD0 00000000 */   nop
/* 1D5D4 8002CDD4 FCFF4014 */  bnez       $v0, .L8002CDC8
/* 1D5D8 8002CDD8 00000000 */   nop
.L8002CDDC:
/* 1D5DC 8002CDDC E0BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x118)($gp)
/* 1D5E0 8002CDE0 8494000C */  jal        func_80025210
/* 1D5E4 8002CDE4 00000000 */   nop
/* 1D5E8 8002CDE8 FCFF4014 */  bnez       $v0, .L8002CDDC
/* 1D5EC 8002CDEC 00000000 */   nop
/* 1D5F0 8002CDF0 D1E8020C */  jal        func_800BA344
/* 1D5F4 8002CDF4 21200000 */   addu      $a0, $zero, $zero
/* 1D5F8 8002CDF8 C3E6020C */  jal        func_800B9B0C
/* 1D5FC 8002CDFC 21200000 */   addu      $a0, $zero, $zero
/* 1D600 8002CE00 88BC9127 */  addiu      $s1, $gp, %gp_rel(draw)
/* 1D604 8002CE04 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 1D608 8002CE08 9CBF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1D60C 8002CE0C 01004238 */  xori       $v0, $v0, 0x1
/* 1D610 8002CE10 40200200 */  sll        $a0, $v0, 1
/* 1D614 8002CE14 21208200 */  addu       $a0, $a0, $v0
/* 1D618 8002CE18 C0200400 */  sll        $a0, $a0, 3
/* 1D61C 8002CE1C 23208200 */  subu       $a0, $a0, $v0
/* 1D620 8002CE20 80200400 */  sll        $a0, $a0, 2
/* 1D624 8002CE24 38EA020C */  jal        func_800BA8E0
/* 1D628 8002CE28 21209100 */   addu      $a0, $a0, $s1
/* 1D62C 8002CE2C B3DD020C */  jal        localstr_get
/* 1D630 8002CE30 6B000424 */   addiu     $a0, $zero, 0x6B
/* 1D634 8002CE34 21204000 */  addu       $a0, $v0, $zero
/* 1D638 8002CE38 A8B6000C */  jal        FONT_FontPrintCentered
/* 1D63C 8002CE3C 96000524 */   addiu     $a1, $zero, 0x96
/* 1D640 8002CE40 B3DD020C */  jal        localstr_get
/* 1D644 8002CE44 6B000424 */   addiu     $a0, $zero, 0x6B
/* 1D648 8002CE48 FBB5000C */  jal        FONT_GetStringWidth
/* 1D64C 8002CE4C 21204000 */   addu      $a0, $v0, $zero
/* 1D650 8002CE50 21204000 */  addu       $a0, $v0, $zero
/* 1D654 8002CE54 72DE020C */  jal        DisplayHintBox
/* 1D658 8002CE58 96000524 */   addiu     $a1, $zero, 0x96
/* 1D65C 8002CE5C 18B6000C */  jal        FONT_Flush
/* 1D660 8002CE60 00000000 */   nop
/* 1D664 8002CE64 FC2F048E */  lw         $a0, 0x2FFC($s0)
/* 1D668 8002CE68 1CEA020C */  jal        func_800BA870
/* 1D66C 8002CE6C 00000000 */   nop
/* 1D670 8002CE70 0FE9020C */  jal        func_800BA43C
/* 1D674 8002CE74 21200000 */   addu      $a0, $zero, $zero
/* 1D678 8002CE78 21200002 */  addu       $a0, $s0, $zero
/* 1D67C 8002CE7C DAE9020C */  jal        func_800BA768
/* 1D680 8002CE80 000C0524 */   addiu     $a1, $zero, 0xC00
/* 1D684 8002CE84 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 1D688 8002CE88 00000000 */  nop
/* 1D68C 8002CE8C 40200200 */  sll        $a0, $v0, 1
/* 1D690 8002CE90 21208200 */  addu       $a0, $a0, $v0
/* 1D694 8002CE94 C0200400 */  sll        $a0, $a0, 3
/* 1D698 8002CE98 23208200 */  subu       $a0, $a0, $v0
/* 1D69C 8002CE9C 80200400 */  sll        $a0, $a0, 2
/* 1D6A0 8002CEA0 38EA020C */  jal        func_800BA8E0
/* 1D6A4 8002CEA4 21209100 */   addu      $a0, $a0, $s1
/* 1D6A8 8002CEA8 0480043C */  lui        $a0, %hi(VblTick)
/* 1D6AC 8002CEAC C3E6020C */  jal        func_800B9B0C
/* 1D6B0 8002CEB0 C08B8424 */   addiu     $a0, $a0, %lo(VblTick)
/* 1D6B4 8002CEB4 0480043C */  lui        $a0, %hi(DrawCallback)
/* 1D6B8 8002CEB8 D1E8020C */  jal        func_800BA344
/* 1D6BC 8002CEBC 2C8C8424 */   addiu     $a0, $a0, %lo(DrawCallback)
/* 1D6C0 8002CEC0 1800BF8F */  lw         $ra, 0x18($sp)
/* 1D6C4 8002CEC4 1400B18F */  lw         $s1, 0x14($sp)
/* 1D6C8 8002CEC8 1000B08F */  lw         $s0, 0x10($sp)
/* 1D6CC 8002CECC 0800E003 */  jr         $ra
/* 1D6D0 8002CED0 2000BD27 */   addiu     $sp, $sp, 0x20
.size DRAW_LoadingMessage, . - DRAW_LoadingMessage
