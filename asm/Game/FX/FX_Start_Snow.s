.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Start_Snow
/* 3D924 8004D124 EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 3D928 8004D128 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 3D92C 8004D12C 40100400 */  sll        $v0, $a0, 1
/* 3D930 8004D130 21104400 */  addu       $v0, $v0, $a0
/* 3D934 8004D134 00120200 */  sll        $v0, $v0, 8
/* 3D938 8004D138 18004300 */  mult       $v0, $v1
/* 3D93C 8004D13C C3170200 */  sra        $v0, $v0, 31
/* 3D940 8004D140 10280000 */  mfhi       $a1
/* 3D944 8004D144 43190500 */  sra        $v1, $a1, 5
/* 3D948 8004D148 23186200 */  subu       $v1, $v1, $v0
/* 3D94C 8004D14C 749A83A7 */  sh         $v1, %gp_rel(snow_amount)($gp)
/* 3D950 8004D150 0800E003 */  jr         $ra
/* 3D954 8004D154 00000000 */   nop
.size FX_Start_Snow, . - FX_Start_Snow
