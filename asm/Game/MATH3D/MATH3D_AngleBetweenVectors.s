.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_AngleBetweenVectors
/* 2A774 80039F74 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2A778 80039F78 1400BFAF */  sw         $ra, 0x14($sp)
/* 2A77C 80039F7C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2A780 80039F80 00008384 */  lh         $v1, 0x0($a0)
/* 2A784 80039F84 0000A284 */  lh         $v0, 0x0($a1)
/* 2A788 80039F88 00000000 */  nop
/* 2A78C 80039F8C 0F006214 */  bne        $v1, $v0, .L80039FCC
/* 2A790 80039F90 18006200 */   mult      $v1, $v0
/* 2A794 80039F94 02008384 */  lh         $v1, 0x2($a0)
/* 2A798 80039F98 0200A284 */  lh         $v0, 0x2($a1)
/* 2A79C 80039F9C 00000000 */  nop
/* 2A7A0 80039FA0 06006214 */  bne        $v1, $v0, .L80039FBC
/* 2A7A4 80039FA4 00000000 */   nop
/* 2A7A8 80039FA8 04008384 */  lh         $v1, 0x4($a0)
/* 2A7AC 80039FAC 0400A284 */  lh         $v0, 0x4($a1)
/* 2A7B0 80039FB0 00000000 */  nop
/* 2A7B4 80039FB4 26006210 */  beq        $v1, $v0, .L8003A050
/* 2A7B8 80039FB8 21100000 */   addu      $v0, $zero, $zero
.L80039FBC:
/* 2A7BC 80039FBC 00008384 */  lh         $v1, 0x0($a0)
/* 2A7C0 80039FC0 0000A284 */  lh         $v0, 0x0($a1)
/* 2A7C4 80039FC4 00000000 */  nop
/* 2A7C8 80039FC8 18006200 */  mult       $v1, $v0
.L80039FCC:
/* 2A7CC 80039FCC 02008384 */  lh         $v1, 0x2($a0)
/* 2A7D0 80039FD0 12380000 */  mflo       $a3
/* 2A7D4 80039FD4 0200A284 */  lh         $v0, 0x2($a1)
/* 2A7D8 80039FD8 00000000 */  nop
/* 2A7DC 80039FDC 18006200 */  mult       $v1, $v0
/* 2A7E0 80039FE0 04008384 */  lh         $v1, 0x4($a0)
/* 2A7E4 80039FE4 12300000 */  mflo       $a2
/* 2A7E8 80039FE8 0400A284 */  lh         $v0, 0x4($a1)
/* 2A7EC 80039FEC 00000000 */  nop
/* 2A7F0 80039FF0 18006200 */  mult       $v1, $v0
/* 2A7F4 80039FF4 2110E600 */  addu       $v0, $a3, $a2
/* 2A7F8 80039FF8 12180000 */  mflo       $v1
/* 2A7FC 80039FFC 21104300 */  addu       $v0, $v0, $v1
/* 2A800 8003A000 00084224 */  addiu      $v0, $v0, 0x800
/* 2A804 8003A004 03830200 */  sra        $s0, $v0, 12
/* 2A808 8003A008 0110022A */  slti       $v0, $s0, 0x1001
/* 2A80C 8003A00C 03004014 */  bnez       $v0, .L8003A01C
/* 2A810 8003A010 00F0022A */   slti      $v0, $s0, -0x1000
/* 2A814 8003A014 0AE80008 */  j          .L8003A028
/* 2A818 8003A018 00101024 */   addiu     $s0, $zero, 0x1000
.L8003A01C:
/* 2A81C 8003A01C 03004010 */  beqz       $v0, .L8003A02C
/* 2A820 8003A020 18001002 */   mult      $s0, $s0
/* 2A824 8003A024 00F01024 */  addiu      $s0, $zero, -0x1000
.L8003A028:
/* 2A828 8003A028 18001002 */  mult       $s0, $s0
.L8003A02C:
/* 2A82C 8003A02C 0001043C */  lui        $a0, (0x1000000 >> 16)
/* 2A830 8003A030 12400000 */  mflo       $t0
/* 2A834 8003A034 A6E7000C */  jal        MATH3D_FastSqrt0
/* 2A838 8003A038 23208800 */   subu      $a0, $a0, $t0
/* 2A83C 8003A03C 21204000 */  addu       $a0, $v0, $zero
/* 2A840 8003A040 26F3020C */  jal        ratan2
/* 2A844 8003A044 21280002 */   addu      $a1, $s0, $zero
/* 2A848 8003A048 00140200 */  sll        $v0, $v0, 16
/* 2A84C 8003A04C 03140200 */  sra        $v0, $v0, 16
.L8003A050:
/* 2A850 8003A050 1400BF8F */  lw         $ra, 0x14($sp)
/* 2A854 8003A054 1000B08F */  lw         $s0, 0x10($sp)
/* 2A858 8003A058 0800E003 */  jr         $ra
/* 2A85C 8003A05C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH3D_AngleBetweenVectors, . - MATH3D_AngleBetweenVectors
