.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetSpiralPoint
/* 3DF1C 8004D71C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3DF20 8004D720 1400B1AF */  sw         $s1, 0x14($sp)
/* 3DF24 8004D724 21888000 */  addu       $s1, $a0, $zero
/* 3DF28 8004D728 1000B0AF */  sw         $s0, 0x10($sp)
/* 3DF2C 8004D72C 2180A000 */  addu       $s0, $a1, $zero
/* 3DF30 8004D730 1800B2AF */  sw         $s2, 0x18($sp)
/* 3DF34 8004D734 2190C000 */  addu       $s2, $a2, $zero
/* 3DF38 8004D738 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3DF3C 8004D73C 2198E000 */  addu       $s3, $a3, $zero
/* 3DF40 8004D740 2000BFAF */  sw         $ra, 0x20($sp)
/* 3DF44 8004D744 DCE4010C */  jal        func_80079370
/* 3DF48 8004D748 21200002 */   addu      $a0, $s0, $zero
/* 3DF4C 8004D74C 23181100 */  negu       $v1, $s1
/* 3DF50 8004D750 18006200 */  mult       $v1, $v0
/* 3DF54 8004D754 8888023C */  lui        $v0, (0x88888889 >> 16)
/* 3DF58 8004D758 12180000 */  mflo       $v1
/* 3DF5C 8004D75C 89884234 */  ori        $v0, $v0, (0x88888889 & 0xFFFF)
/* 3DF60 8004D760 03230300 */  sra        $a0, $v1, 12
/* 3DF64 8004D764 18008200 */  mult       $a0, $v0
/* 3DF68 8004D768 C31F0300 */  sra        $v1, $v1, 31
/* 3DF6C 8004D76C 10480000 */  mfhi       $t1
/* 3DF70 8004D770 21102401 */  addu       $v0, $t1, $a0
/* 3DF74 8004D774 C3110200 */  sra        $v0, $v0, 7
/* 3DF78 8004D778 23104300 */  subu       $v0, $v0, $v1
/* 3DF7C 8004D77C 40220200 */  sll        $a0, $v0, 9
/* 3DF80 8004D780 03008104 */  bgez       $a0, .L8004D790
/* 3DF84 8004D784 00000000 */   nop
/* 3DF88 8004D788 E5350108 */  j          .L8004D794
/* 3DF8C 8004D78C 00F88424 */   addiu     $a0, $a0, -0x800
.L8004D790:
/* 3DF90 8004D790 00088424 */  addiu      $a0, $a0, 0x800
.L8004D794:
/* 3DF94 8004D794 03130400 */  sra        $v0, $a0, 12
/* 3DF98 8004D798 B6014224 */  addiu      $v0, $v0, 0x1B6
/* 3DF9C 8004D79C 000042AE */  sw         $v0, 0x0($s2)
/* 3DFA0 8004D7A0 D0E4010C */  jal        func_80079340
/* 3DFA4 8004D7A4 21200002 */   addu      $a0, $s0, $zero
/* 3DFA8 8004D7A8 18002202 */  mult       $s1, $v0
/* 3DFAC 8004D7AC 12400000 */  mflo       $t0
/* 3DFB0 8004D7B0 03130800 */  sra        $v0, $t0, 12
/* 3DFB4 8004D7B4 03004104 */  bgez       $v0, .L8004D7C4
/* 3DFB8 8004D7B8 00000000 */   nop
/* 3DFBC 8004D7BC F2350108 */  j          .L8004D7C8
/* 3DFC0 8004D7C0 00F84224 */   addiu     $v0, $v0, -0x800
.L8004D7C4:
/* 3DFC4 8004D7C4 00084224 */  addiu      $v0, $v0, 0x800
.L8004D7C8:
/* 3DFC8 8004D7C8 03130200 */  sra        $v0, $v0, 12
/* 3DFCC 8004D7CC C9004224 */  addiu      $v0, $v0, 0xC9
/* 3DFD0 8004D7D0 000062AE */  sw         $v0, 0x0($s3)
/* 3DFD4 8004D7D4 2000BF8F */  lw         $ra, 0x20($sp)
/* 3DFD8 8004D7D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3DFDC 8004D7DC 1800B28F */  lw         $s2, 0x18($sp)
/* 3DFE0 8004D7E0 1400B18F */  lw         $s1, 0x14($sp)
/* 3DFE4 8004D7E4 1000B08F */  lw         $s0, 0x10($sp)
/* 3DFE8 8004D7E8 0800E003 */  jr         $ra
/* 3DFEC 8004D7EC 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_GetSpiralPoint, . - FX_GetSpiralPoint
