.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_GetKeyframeNumber
/* 807C0 8008FFC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 807C4 8008FFC4 1000B0AF */  sw         $s0, 0x10($sp)
/* 807C8 8008FFC8 1400BFAF */  sw         $ra, 0x14($sp)
/* 807CC 8008FFCC 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 807D0 8008FFD0 21808000 */   addu      $s0, $a0, $zero
/* 807D4 8008FFD4 06004014 */  bnez       $v0, .L8008FFF0
/* 807D8 8008FFD8 00000000 */   nop
/* 807DC 8008FFDC 2400028E */  lw         $v0, 0x24($s0)
/* 807E0 8008FFE0 04000386 */  lh         $v1, 0x4($s0)
/* 807E4 8008FFE4 01004290 */  lbu        $v0, 0x1($v0)
/* 807E8 8008FFE8 00400208 */  j          .L80090000
/* 807EC 8008FFEC 00000000 */   nop
.L8008FFF0:
/* 807F0 8008FFF0 2C00028E */  lw         $v0, 0x2C($s0)
/* 807F4 8008FFF4 2400048E */  lw         $a0, 0x24($s0)
/* 807F8 8008FFF8 02004384 */  lh         $v1, 0x2($v0)
/* 807FC 8008FFFC 01008290 */  lbu        $v0, 0x1($a0)
.L80090000:
/* 80800 80090000 00000000 */  nop
/* 80804 80090004 1A006200 */  div        $zero, $v1, $v0
/* 80808 80090008 12100000 */  mflo       $v0
/* 8080C 8009000C 1400BF8F */  lw         $ra, 0x14($sp)
/* 80810 80090010 1000B08F */  lw         $s0, 0x10($sp)
/* 80814 80090014 0800E003 */  jr         $ra
/* 80818 80090018 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_GetKeyframeNumber, . - G2AnimSection_GetKeyframeNumber
