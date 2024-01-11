.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_CalcWarpFade
/* 4BFE8 8005B7E8 28C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4BFEC 8005B7EC 1EC78297 */  lhu        $v0, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
/* 4BFF0 8005B7F0 00000000 */  nop
/* 4BFF4 8005B7F4 040162A4 */  sh         $v0, 0x104($v1)
/* 4BFF8 8005B7F8 20C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4BFFC 8005B7FC 00000000 */  nop
/* 4C000 8005B800 21186400 */  addu       $v1, $v1, $a0
/* 4C004 8005B804 24C7848F */  lw         $a0, %gp_rel(WarpGateLoadInfo + 0xC)($gp)
/* 4C008 8005B808 00130300 */  sll        $v0, $v1, 12
/* 4C00C 8005B80C 1A004400 */  div        $zero, $v0, $a0
/* 4C010 8005B810 12100000 */  mflo       $v0
/* 4C014 8005B814 20C783AF */  sw         $v1, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4C018 8005B818 00100324 */  addiu      $v1, $zero, 0x1000
/* 4C01C 8005B81C 23106200 */  subu       $v0, $v1, $v0
/* 4C020 8005B820 1EC782A7 */  sh         $v0, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
/* 4C024 8005B824 00140200 */  sll        $v0, $v0, 16
/* 4C028 8005B828 03140200 */  sra        $v0, $v0, 16
/* 4C02C 8005B82C 01104228 */  slti       $v0, $v0, 0x1001
/* 4C030 8005B830 02004014 */  bnez       $v0, .L8005B83C
/* 4C034 8005B834 00000000 */   nop
/* 4C038 8005B838 1EC783A7 */  sh         $v1, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
.L8005B83C:
/* 4C03C 8005B83C 1EC78287 */  lh         $v0, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
/* 4C040 8005B840 00000000 */  nop
/* 4C044 8005B844 02004104 */  bgez       $v0, .L8005B850
/* 4C048 8005B848 00000000 */   nop
/* 4C04C 8005B84C 1EC780A7 */  sh         $zero, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
.L8005B850:
/* 4C050 8005B850 0800E003 */  jr         $ra
/* 4C054 8005B854 00000000 */   nop
.size WARPGATE_CalcWarpFade, . - WARPGATE_CalcWarpFade
