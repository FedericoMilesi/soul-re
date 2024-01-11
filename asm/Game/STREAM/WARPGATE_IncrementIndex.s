.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IncrementIndex
/* 4BED0 8005B6D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4BED4 8005B6D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 4BED8 8005B6D8 01001124 */  addiu      $s1, $zero, 0x1
/* 4BEDC 8005B6DC 1CC78383 */  lb         $v1, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BEE0 8005B6E0 04000224 */  addiu      $v0, $zero, 0x4
/* 4BEE4 8005B6E4 1800BFAF */  sw         $ra, 0x18($sp)
/* 4BEE8 8005B6E8 39006214 */  bne        $v1, $v0, .L8005B7D0
/* 4BEEC 8005B6EC 1000B0AF */   sw        $s0, 0x10($sp)
/* 4BEF0 8005B6F0 83010424 */  addiu      $a0, $zero, 0x183
/* 4BEF4 8005B6F4 7F000524 */  addiu      $a1, $zero, 0x7F
/* 4BEF8 8005B6F8 40000624 */  addiu      $a2, $zero, 0x40
/* 4BEFC 8005B6FC 2402010C */  jal        SndPlayVolPan
/* 4BF00 8005B700 21380000 */   addu      $a3, $zero, $zero
/* 4BF04 8005B704 4992103C */  lui        $s0, (0x92492493 >> 16)
/* 4BF08 8005B708 93241036 */  ori        $s0, $s0, (0x92492493 & 0xFFFF)
/* 4BF0C 8005B70C 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4BF10 8005B710 00100224 */  addiu      $v0, $zero, 0x1000
/* 4BF14 8005B714 FCA0858F */  lw         $a1, %gp_rel(CurrentWarpNumber)($gp)
/* 4BF18 8005B718 28C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4BF1C 8005B71C 2130B100 */  addu       $a2, $a1, $s1
/* 4BF20 8005B720 1800D000 */  mult       $a2, $s0
/* 4BF24 8005B724 00A18727 */  addiu      $a3, $gp, %gp_rel(WarpRoomArray)
/* 4BF28 8005B728 1CC791A3 */  sb         $s1, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BF2C 8005B72C 20C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4BF30 8005B730 040162A4 */  sh         $v0, 0x104($v1)
/* 4BF34 8005B734 80100500 */  sll        $v0, $a1, 2
/* 4BF38 8005B738 21104500 */  addu       $v0, $v0, $a1
/* 4BF3C 8005B73C 80100200 */  sll        $v0, $v0, 2
/* 4BF40 8005B740 21104700 */  addu       $v0, $v0, $a3
/* 4BF44 8005B744 28C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4BF48 8005B748 100040AC */  sw         $zero, 0x10($v0)
/* 4BF4C 8005B74C C3170600 */  sra        $v0, $a2, 31
/* 4BF50 8005B750 10400000 */  mfhi       $t0
/* 4BF54 8005B754 21180601 */  addu       $v1, $t0, $a2
/* 4BF58 8005B758 C3180300 */  sra        $v1, $v1, 3
/* 4BF5C 8005B75C 23186200 */  subu       $v1, $v1, $v0
/* 4BF60 8005B760 C0100300 */  sll        $v0, $v1, 3
/* 4BF64 8005B764 23104300 */  subu       $v0, $v0, $v1
/* 4BF68 8005B768 04102202 */  sllv       $v0, $v0, $s1
/* 4BF6C 8005B76C 2330C200 */  subu       $a2, $a2, $v0
/* 4BF70 8005B770 80280600 */  sll        $a1, $a2, 2
/* 4BF74 8005B774 2128A600 */  addu       $a1, $a1, $a2
/* 4BF78 8005B778 80280500 */  sll        $a1, $a1, 2
/* 4BF7C 8005B77C FCA086AF */  sw         $a2, %gp_rel(CurrentWarpNumber)($gp)
/* 4BF80 8005B780 1CD2010C */  jal        strcmpi
/* 4BF84 8005B784 2128A700 */   addu      $a1, $a1, $a3
/* 4BF88 8005B788 10004014 */  bnez       $v0, .L8005B7CC
/* 4BF8C 8005B78C 00E00224 */   addiu     $v0, $zero, -0x2000
/* 4BF90 8005B790 FCA0848F */  lw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 4BF94 8005B794 00000000 */  nop
/* 4BF98 8005B798 21209100 */  addu       $a0, $a0, $s1
/* 4BF9C 8005B79C 18009000 */  mult       $a0, $s0
/* 4BFA0 8005B7A0 C3170400 */  sra        $v0, $a0, 31
/* 4BFA4 8005B7A4 10400000 */  mfhi       $t0
/* 4BFA8 8005B7A8 21180401 */  addu       $v1, $t0, $a0
/* 4BFAC 8005B7AC C3180300 */  sra        $v1, $v1, 3
/* 4BFB0 8005B7B0 23186200 */  subu       $v1, $v1, $v0
/* 4BFB4 8005B7B4 C0100300 */  sll        $v0, $v1, 3
/* 4BFB8 8005B7B8 23104300 */  subu       $v0, $v0, $v1
/* 4BFBC 8005B7BC 04102202 */  sllv       $v0, $v0, $s1
/* 4BFC0 8005B7C0 23208200 */  subu       $a0, $a0, $v0
/* 4BFC4 8005B7C4 FCA084AF */  sw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 4BFC8 8005B7C8 00E00224 */  addiu      $v0, $zero, -0x2000
.L8005B7CC:
/* 4BFCC 8005B7CC 18ED82AF */  sw         $v0, %gp_rel(hud_warp_arrow_flash)($gp)
.L8005B7D0:
/* 4BFD0 8005B7D0 21102002 */  addu       $v0, $s1, $zero
/* 4BFD4 8005B7D4 1800BF8F */  lw         $ra, 0x18($sp)
/* 4BFD8 8005B7D8 1400B18F */  lw         $s1, 0x14($sp)
/* 4BFDC 8005B7DC 1000B08F */  lw         $s0, 0x10($sp)
/* 4BFE0 8005B7E0 0800E003 */  jr         $ra
/* 4BFE4 8005B7E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size WARPGATE_IncrementIndex, . - WARPGATE_IncrementIndex
