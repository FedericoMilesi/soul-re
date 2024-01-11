.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA8E0
/* AB0E0 800BA8E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AB0E4 800BA8E4 1800B2AF */  sw         $s2, 0x18($sp)
/* AB0E8 800BA8E8 0D80123C */  lui        $s2, %hi(GEnv + 0x2)
/* AB0EC 800BA8EC 0EDA5226 */  addiu      $s2, $s2, %lo(GEnv + 0x2)
/* AB0F0 800BA8F0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* AB0F4 800BA8F4 1400B1AF */  sw         $s1, 0x14($sp)
/* AB0F8 800BA8F8 1000B0AF */  sw         $s0, 0x10($sp)
/* AB0FC 800BA8FC 00004292 */  lbu        $v0, 0x0($s2)
/* AB100 800BA900 00000000 */  nop
/* AB104 800BA904 0200422C */  sltiu      $v0, $v0, 0x2
/* AB108 800BA908 08004014 */  bnez       $v0, .L800BA92C
/* AB10C 800BA90C 21888000 */   addu      $s1, $a0, $zero
/* AB110 800BA910 0180043C */  lui        $a0, %hi(D_800126D8)
/* AB114 800BA914 D8268424 */  addiu      $a0, $a0, %lo(D_800126D8)
/* AB118 800BA918 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AB11C 800BA91C 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AB120 800BA920 00000000 */  nop
/* AB124 800BA924 09F84000 */  jalr       $v0
/* AB128 800BA928 21282002 */   addu      $a1, $s1, $zero
.L800BA92C:
/* AB12C 800BA92C 1C003026 */  addiu      $s0, $s1, 0x1C
/* AB130 800BA930 21200002 */  addu       $a0, $s0, $zero
/* AB134 800BA934 44EC020C */  jal        func_800BB110
/* AB138 800BA938 21282002 */   addu      $a1, $s1, $zero
/* AB13C 800BA93C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* AB140 800BA940 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* AB144 800BA944 21280002 */  addu       $a1, $s0, $zero
/* AB148 800BA948 40000624 */  addiu      $a2, $zero, 0x40
/* AB14C 800BA94C 1C00228E */  lw         $v0, 0x1C($s1)
/* AB150 800BA950 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x1158)
/* AB154 800BA954 04DA638C */  lw         $v1, %lo(the_attract_movies + 0x1158)($v1)
/* AB158 800BA958 25104400 */  or         $v0, $v0, $a0
/* AB15C 800BA95C 1C0022AE */  sw         $v0, 0x1C($s1)
/* AB160 800BA960 1800648C */  lw         $a0, 0x18($v1)
/* AB164 800BA964 0800628C */  lw         $v0, 0x8($v1)
/* AB168 800BA968 00000000 */  nop
/* AB16C 800BA96C 09F84000 */  jalr       $v0
/* AB170 800BA970 21380000 */   addu      $a3, $zero, $zero
/* AB174 800BA974 0E004426 */  addiu      $a0, $s2, 0xE
/* AB178 800BA978 21282002 */  addu       $a1, $s1, $zero
/* AB17C 800BA97C 02E5010C */  jal        func_80079408
/* AB180 800BA980 5C000624 */   addiu     $a2, $zero, 0x5C
/* AB184 800BA984 21102002 */  addu       $v0, $s1, $zero
/* AB188 800BA988 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AB18C 800BA98C 1800B28F */  lw         $s2, 0x18($sp)
/* AB190 800BA990 1400B18F */  lw         $s1, 0x14($sp)
/* AB194 800BA994 1000B08F */  lw         $s0, 0x10($sp)
/* AB198 800BA998 0800E003 */  jr         $ra
/* AB19C 800BA99C 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BA8E0, . - func_800BA8E0
