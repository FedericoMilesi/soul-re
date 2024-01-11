.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawScreenPoly
/* 37060 80046860 21588000 */  addu       $t3, $a0, $zero
/* 37064 80046864 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 37068 80046868 9CBF888F */  lw         $t0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 3706C 8004686C 0400478C */  lw         $a3, 0x4($v0)
/* 37070 80046870 0800428C */  lw         $v0, 0x8($v0)
/* 37074 80046874 1C00E924 */  addiu      $t1, $a3, 0x1C
/* 37078 80046878 2B102201 */  sltu       $v0, $t1, $v0
/* 3707C 8004687C 21004010 */  beqz       $v0, .L80046904
/* 37080 80046880 2150A000 */   addu      $t2, $a1, $zero
/* 37084 80046884 00E1043C */  lui        $a0, (0xE1000600 >> 16)
/* 37088 80046888 00068434 */  ori        $a0, $a0, (0xE1000600 & 0xFFFF)
/* 3708C 8004688C FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 37090 80046890 00020324 */  addiu      $v1, $zero, 0x200
/* 37094 80046894 F0000224 */  addiu      $v0, $zero, 0xF0
/* 37098 80046898 1600E2A4 */  sh         $v0, 0x16($a3)
/* 3709C 8004689C 1A00E2A4 */  sh         $v0, 0x1A($a3)
/* 370A0 800468A0 40110B00 */  sll        $v0, $t3, 5
/* 370A4 800468A4 25104400 */  or         $v0, $v0, $a0
/* 370A8 800468A8 0400E2AC */  sw         $v0, 0x4($a3)
/* 370AC 800468AC 2A000224 */  addiu      $v0, $zero, 0x2A
/* 370B0 800468B0 80200600 */  sll        $a0, $a2, 2
/* 370B4 800468B4 21208800 */  addu       $a0, $a0, $t0
/* 370B8 800468B8 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 370BC 800468BC 0C00E0A4 */  sh         $zero, 0xC($a3)
/* 370C0 800468C0 0E00E0A4 */  sh         $zero, 0xE($a3)
/* 370C4 800468C4 1000E3A4 */  sh         $v1, 0x10($a3)
/* 370C8 800468C8 1200E0A4 */  sh         $zero, 0x12($a3)
/* 370CC 800468CC 1400E0A4 */  sh         $zero, 0x14($a3)
/* 370D0 800468D0 1800E3A4 */  sh         $v1, 0x18($a3)
/* 370D4 800468D4 0800EAAC */  sw         $t2, 0x8($a3)
/* 370D8 800468D8 0B00E2A0 */  sb         $v0, 0xB($a3)
/* 370DC 800468DC 0000828C */  lw         $v0, 0x0($a0)
/* 370E0 800468E0 0006033C */  lui        $v1, (0x6000000 >> 16)
/* 370E4 800468E4 24104500 */  and        $v0, $v0, $a1
/* 370E8 800468E8 25104300 */  or         $v0, $v0, $v1
/* 370EC 800468EC 2428E500 */  and        $a1, $a3, $a1
/* 370F0 800468F0 0000E2AC */  sw         $v0, 0x0($a3)
/* 370F4 800468F4 000085AC */  sw         $a1, 0x0($a0)
/* 370F8 800468F8 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 370FC 800468FC 00000000 */  nop
/* 37100 80046900 040049AC */  sw         $t1, 0x4($v0)
.L80046904:
/* 37104 80046904 0800E003 */  jr         $ra
/* 37108 80046908 00000000 */   nop
.size FX_DrawScreenPoly, . - FX_DrawScreenPoly
