.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TIMER_TimeDiff
/* 2E64C 8003DE4C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2E650 8003DE50 1000B0AF */  sw         $s0, 0x10($sp)
/* 2E654 8003DE54 21808000 */  addu       $s0, $a0, $zero
/* 2E658 8003DE58 1400BFAF */  sw         $ra, 0x14($sp)
/* 2E65C 8003DE5C EBF4020C */  jal        func_800BD3AC
/* 2E660 8003DE60 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 2E664 8003DE64 FFFF4630 */  andi       $a2, $v0, 0xFFFF
/* 2E668 8003DE68 022C1000 */  srl        $a1, $s0, 16
/* 2E66C 8003DE6C 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 2E670 8003DE70 00000000 */  nop
/* 2E674 8003DE74 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 2E678 8003DE78 2B106500 */  sltu       $v0, $v1, $a1
/* 2E67C 8003DE7C 05004010 */  beqz       $v0, .L8003DE94
/* 2E680 8003DE80 FFFF0432 */   andi      $a0, $s0, 0xFFFF
/* 2E684 8003DE84 0100023C */  lui        $v0, (0x10000 >> 16)
/* 2E688 8003DE88 21106200 */  addu       $v0, $v1, $v0
/* 2E68C 8003DE8C A6F70008 */  j          .L8003DE98
/* 2E690 8003DE90 23184500 */   subu      $v1, $v0, $a1
.L8003DE94:
/* 2E694 8003DE94 23186500 */  subu       $v1, $v1, $a1
.L8003DE98:
/* 2E698 8003DE98 2B10C400 */  sltu       $v0, $a2, $a0
/* 2E69C 8003DE9C 05004010 */  beqz       $v0, .L8003DEB4
/* 2E6A0 8003DEA0 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 2E6A4 8003DEA4 2110C200 */  addu       $v0, $a2, $v0
/* 2E6A8 8003DEA8 23804400 */  subu       $s0, $v0, $a0
/* 2E6AC 8003DEAC AEF70008 */  j          .L8003DEB8
/* 2E6B0 8003DEB0 FFFF6324 */   addiu     $v1, $v1, -0x1
.L8003DEB4:
/* 2E6B4 8003DEB4 2380C400 */  subu       $s0, $a2, $a0
.L8003DEB8:
/* 2E6B8 8003DEB8 D308622C */  sltiu      $v0, $v1, 0x8D3
/* 2E6BC 8003DEBC 04004014 */  bnez       $v0, .L8003DED0
/* 2E6C0 8003DEC0 6210053C */   lui       $a1, (0x10624DD3 >> 16)
/* 2E6C4 8003DEC4 4100033C */  lui        $v1, (0x41828F >> 16)
/* 2E6C8 8003DEC8 C3F70008 */  j          .L8003DF0C
/* 2E6CC 8003DECC 8F826334 */   ori       $v1, $v1, (0x41828F & 0xFFFF)
.L8003DED0:
/* 2E6D0 8003DED0 D34DA534 */  ori        $a1, $a1, (0x10624DD3 & 0xFFFF)
/* 2E6D4 8003DED4 C0201000 */  sll        $a0, $s0, 3
/* 2E6D8 8003DED8 23209000 */  subu       $a0, $a0, $s0
/* 2E6DC 8003DEDC 80200400 */  sll        $a0, $a0, 2
/* 2E6E0 8003DEE0 21209000 */  addu       $a0, $a0, $s0
/* 2E6E4 8003DEE4 C0100300 */  sll        $v0, $v1, 3
/* 2E6E8 8003DEE8 23104300 */  subu       $v0, $v0, $v1
/* 2E6EC 8003DEEC 80100200 */  sll        $v0, $v0, 2
/* 2E6F0 8003DEF0 21104300 */  addu       $v0, $v0, $v1
/* 2E6F4 8003DEF4 001C0200 */  sll        $v1, $v0, 16
/* 2E6F8 8003DEF8 23186200 */  subu       $v1, $v1, $v0
/* 2E6FC 8003DEFC 21208300 */  addu       $a0, $a0, $v1
/* 2E700 8003DF00 19008500 */  multu      $a0, $a1
/* 2E704 8003DF04 10380000 */  mfhi       $a3
/* 2E708 8003DF08 82190700 */  srl        $v1, $a3, 6
.L8003DF0C:
/* 2E70C 8003DF0C C897828F */  lw         $v0, %gp_rel(gTimerEnabled)($gp)
/* 2E710 8003DF10 00000000 */  nop
/* 2E714 8003DF14 02004014 */  bnez       $v0, .L8003DF20
/* 2E718 8003DF18 00000000 */   nop
/* 2E71C 8003DF1C 21180000 */  addu       $v1, $zero, $zero
.L8003DF20:
/* 2E720 8003DF20 1400BF8F */  lw         $ra, 0x14($sp)
/* 2E724 8003DF24 1000B08F */  lw         $s0, 0x10($sp)
/* 2E728 8003DF28 21106000 */  addu       $v0, $v1, $zero
/* 2E72C 8003DF2C 0800E003 */  jr         $ra
/* 2E730 8003DF30 1800BD27 */   addiu     $sp, $sp, 0x18
.size TIMER_TimeDiff, . - TIMER_TimeDiff
