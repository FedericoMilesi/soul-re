.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_LoadCurrentWarpRoom
/* 4B964 8005B164 FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 4B968 8005B168 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4B96C 8005B16C 1400B1AF */  sw         $s1, 0x14($sp)
/* 4B970 8005B170 21888000 */  addu       $s1, $a0, $zero
/* 4B974 8005B174 1000B0AF */  sw         $s0, 0x10($sp)
/* 4B978 8005B178 00A19027 */  addiu      $s0, $gp, %gp_rel(WarpRoomArray)
/* 4B97C 8005B17C 1800BFAF */  sw         $ra, 0x18($sp)
/* 4B980 8005B180 0800A28C */  lw         $v0, 0x8($a1)
/* 4B984 8005B184 80280300 */  sll        $a1, $v1, 2
/* 4B988 8005B188 2128A300 */  addu       $a1, $a1, $v1
/* 4B98C 8005B18C 80280500 */  sll        $a1, $a1, 2
/* 4B990 8005B190 9800448C */  lw         $a0, 0x98($v0)
/* 4B994 8005B194 1CD2010C */  jal        strcmpi
/* 4B998 8005B198 2128B000 */   addu      $a1, $a1, $s0
/* 4B99C 8005B19C 05004014 */  bnez       $v0, .L8005B1B4
/* 4B9A0 8005B1A0 21282002 */   addu      $a1, $s1, $zero
/* 4B9A4 8005B1A4 24C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0xC)($gp)
/* 4B9A8 8005B1A8 03000224 */  addiu      $v0, $zero, 0x3
/* 4B9AC 8005B1AC 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4B9B0 8005B1B0 20C783AF */  sw         $v1, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
.L8005B1B4:
/* 4B9B4 8005B1B4 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4B9B8 8005B1B8 21300000 */  addu       $a2, $zero, $zero
/* 4B9BC 8005B1BC 80200200 */  sll        $a0, $v0, 2
/* 4B9C0 8005B1C0 21208200 */  addu       $a0, $a0, $v0
/* 4B9C4 8005B1C4 80200400 */  sll        $a0, $a0, 2
/* 4B9C8 8005B1C8 A76A010C */  jal        STREAM_LoadLevel
/* 4B9CC 8005B1CC 21209000 */   addu      $a0, $a0, $s0
/* 4B9D0 8005B1D0 FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 4B9D4 8005B1D4 21204000 */  addu       $a0, $v0, $zero
/* 4B9D8 8005B1D8 80100300 */  sll        $v0, $v1, 2
/* 4B9DC 8005B1DC 21104300 */  addu       $v0, $v0, $v1
/* 4B9E0 8005B1E0 80100200 */  sll        $v0, $v0, 2
/* 4B9E4 8005B1E4 21105000 */  addu       $v0, $v0, $s0
/* 4B9E8 8005B1E8 08008010 */  beqz       $a0, .L8005B20C
/* 4B9EC 8005B1EC 100044AC */   sw        $a0, 0x10($v0)
/* 4B9F0 8005B1F0 280024AE */  sw         $a0, 0x28($s1)
/* 4B9F4 8005B1F4 1000438C */  lw         $v1, 0x10($v0)
/* 4B9F8 8005B1F8 00000000 */  nop
/* 4B9FC 8005B1FC 06006294 */  lhu        $v0, 0x6($v1)
/* 4BA00 8005B200 00000000 */  nop
/* 4BA04 8005B204 01004234 */  ori        $v0, $v0, 0x1
/* 4BA08 8005B208 060062A4 */  sh         $v0, 0x6($v1)
.L8005B20C:
/* 4BA0C 8005B20C 1800BF8F */  lw         $ra, 0x18($sp)
/* 4BA10 8005B210 1400B18F */  lw         $s1, 0x14($sp)
/* 4BA14 8005B214 1000B08F */  lw         $s0, 0x10($sp)
/* 4BA18 8005B218 0800E003 */  jr         $ra
/* 4BA1C 8005B21C 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_LoadCurrentWarpRoom, . - STREAM_LoadCurrentWarpRoom
