.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_DecrementIndex
/* 4C058 8005B858 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4C05C 8005B85C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C060 8005B860 01001024 */  addiu      $s0, $zero, 0x1
/* 4C064 8005B864 1CC78383 */  lb         $v1, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4C068 8005B868 04000224 */  addiu      $v0, $zero, 0x4
/* 4C06C 8005B86C 2B006214 */  bne        $v1, $v0, .L8005B91C
/* 4C070 8005B870 1400BFAF */   sw        $ra, 0x14($sp)
/* 4C074 8005B874 83010424 */  addiu      $a0, $zero, 0x183
/* 4C078 8005B878 7F000524 */  addiu      $a1, $zero, 0x7F
/* 4C07C 8005B87C 40000624 */  addiu      $a2, $zero, 0x40
/* 4C080 8005B880 2402010C */  jal        SndPlayVolPan
/* 4C084 8005B884 21380000 */   addu      $a3, $zero, $zero
/* 4C088 8005B888 00100224 */  addiu      $v0, $zero, 0x1000
/* 4C08C 8005B88C 28C7848F */  lw         $a0, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4C090 8005B890 FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 4C094 8005B894 00A18627 */  addiu      $a2, $gp, %gp_rel(WarpRoomArray)
/* 4C098 8005B898 1CC790A3 */  sb         $s0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4C09C 8005B89C 20C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4C0A0 8005B8A0 040182A4 */  sh         $v0, 0x104($a0)
/* 4C0A4 8005B8A4 80100300 */  sll        $v0, $v1, 2
/* 4C0A8 8005B8A8 21104300 */  addu       $v0, $v0, $v1
/* 4C0AC 8005B8AC 80100200 */  sll        $v0, $v0, 2
/* 4C0B0 8005B8B0 21104600 */  addu       $v0, $v0, $a2
/* 4C0B4 8005B8B4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 4C0B8 8005B8B8 28C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4C0BC 8005B8BC 100040AC */  sw         $zero, 0x10($v0)
/* 4C0C0 8005B8C0 FCA083AF */  sw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 4C0C4 8005B8C4 02006104 */  bgez       $v1, .L8005B8D0
/* 4C0C8 8005B8C8 0D000224 */   addiu     $v0, $zero, 0xD
/* 4C0CC 8005B8CC FCA082AF */  sw         $v0, %gp_rel(CurrentWarpNumber)($gp)
.L8005B8D0:
/* 4C0D0 8005B8D0 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4C0D4 8005B8D4 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4C0D8 8005B8D8 80280200 */  sll        $a1, $v0, 2
/* 4C0DC 8005B8DC 2128A200 */  addu       $a1, $a1, $v0
/* 4C0E0 8005B8E0 80280500 */  sll        $a1, $a1, 2
/* 4C0E4 8005B8E4 1CD2010C */  jal        strcmpi
/* 4C0E8 8005B8E8 2128A600 */   addu      $a1, $a1, $a2
/* 4C0EC 8005B8EC 0A004014 */  bnez       $v0, .L8005B918
/* 4C0F0 8005B8F0 00200224 */   addiu     $v0, $zero, 0x2000
/* 4C0F4 8005B8F4 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4C0F8 8005B8F8 00000000 */  nop
/* 4C0FC 8005B8FC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4C100 8005B900 FCA082AF */  sw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4C104 8005B904 04004104 */  bgez       $v0, .L8005B918
/* 4C108 8005B908 00200224 */   addiu     $v0, $zero, 0x2000
/* 4C10C 8005B90C 0D000224 */  addiu      $v0, $zero, 0xD
/* 4C110 8005B910 FCA082AF */  sw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4C114 8005B914 00200224 */  addiu      $v0, $zero, 0x2000
.L8005B918:
/* 4C118 8005B918 18ED82AF */  sw         $v0, %gp_rel(hud_warp_arrow_flash)($gp)
.L8005B91C:
/* 4C11C 8005B91C 21100002 */  addu       $v0, $s0, $zero
/* 4C120 8005B920 1400BF8F */  lw         $ra, 0x14($sp)
/* 4C124 8005B924 1000B08F */  lw         $s0, 0x10($sp)
/* 4C128 8005B928 0800E003 */  jr         $ra
/* 4C12C 8005B92C 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_DecrementIndex, . - WARPGATE_DecrementIndex
