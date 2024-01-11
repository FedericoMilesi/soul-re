.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadIsSfxPlaying
/* 477C8 80056FC8 21280000 */  addu       $a1, $zero, $zero
/* 477CC 80056FCC D89B878F */  lw         $a3, %gp_rel(aadMem)($gp)
/* 477D0 80056FD0 D0000924 */  addiu      $t1, $zero, 0xD0
/* 477D4 80056FD4 02000824 */  addiu      $t0, $zero, 0x2
/* 477D8 80056FD8 DC010624 */  addiu      $a2, $zero, 0x1DC
.L80056FDC:
/* 477DC 80056FDC 2118E600 */  addu       $v1, $a3, $a2
/* 477E0 80056FE0 08006290 */  lbu        $v0, 0x8($v1)
/* 477E4 80056FE4 00000000 */  nop
/* 477E8 80056FE8 0D004914 */  bne        $v0, $t1, .L80057020
/* 477EC 80056FEC 2110E500 */   addu      $v0, $a3, $a1
/* 477F0 80056FF0 7C044290 */  lbu        $v0, 0x47C($v0)
/* 477F4 80056FF4 00000000 */  nop
/* 477F8 80056FF8 09004010 */  beqz       $v0, .L80057020
/* 477FC 80056FFC 00000000 */   nop
/* 47800 80057000 07004810 */  beq        $v0, $t0, .L80057020
/* 47804 80057004 00000000 */   nop
/* 47808 80057008 0400628C */  lw         $v0, 0x4($v1)
/* 4780C 8005700C 00000000 */  nop
/* 47810 80057010 04004414 */  bne        $v0, $a0, .L80057024
/* 47814 80057014 0100A524 */   addiu     $a1, $a1, 0x1
/* 47818 80057018 0800E003 */  jr         $ra
/* 4781C 8005701C 01000224 */   addiu     $v0, $zero, 0x1
.L80057020:
/* 47820 80057020 0100A524 */  addiu      $a1, $a1, 0x1
.L80057024:
/* 47824 80057024 1800A228 */  slti       $v0, $a1, 0x18
/* 47828 80057028 ECFF4014 */  bnez       $v0, .L80056FDC
/* 4782C 8005702C 1C00C624 */   addiu     $a2, $a2, 0x1C
/* 47830 80057030 0800E003 */  jr         $ra
/* 47834 80057034 21100000 */   addu      $v0, $zero, $zero
.size aadIsSfxPlaying, . - aadIsSfxPlaying
