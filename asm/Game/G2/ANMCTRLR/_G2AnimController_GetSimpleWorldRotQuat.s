.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_GetSimpleWorldRotQuat
/* 827BC 80091FBC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 827C0 80091FC0 2138A000 */  addu       $a3, $a1, $zero
/* 827C4 80091FC4 3400B1AF */  sw         $s1, 0x34($sp)
/* 827C8 80091FC8 2188C000 */  addu       $s1, $a2, $zero
/* 827CC 80091FCC 1000A527 */  addiu      $a1, $sp, 0x10
/* 827D0 80091FD0 3800BFAF */  sw         $ra, 0x38($sp)
/* 827D4 80091FD4 3000B0AF */  sw         $s0, 0x30($sp)
/* 827D8 80091FD8 03008290 */  lbu        $v0, 0x3($a0)
/* 827DC 80091FDC F8ED8427 */  addiu      $a0, $gp, %gp_rel(_segValues)
/* 827E0 80091FE0 40180200 */  sll        $v1, $v0, 1
/* 827E4 80091FE4 21186200 */  addu       $v1, $v1, $v0
/* 827E8 80091FE8 1000E28C */  lw         $v0, 0x10($a3)
/* 827EC 80091FEC 1400F08C */  lw         $s0, 0x14($a3)
/* 827F0 80091FF0 1C00428C */  lw         $v0, 0x1C($v0)
/* 827F4 80091FF4 C0180300 */  sll        $v1, $v1, 3
/* 827F8 80091FF8 21104300 */  addu       $v0, $v0, $v1
/* 827FC 80091FFC 12004284 */  lh         $v0, 0x12($v0)
/* 82800 80092000 21206400 */  addu       $a0, $v1, $a0
/* 82804 80092004 40110200 */  sll        $v0, $v0, 5
/* 82808 80092008 DA50020C */  jal        _G2Anim_BuildSegLocalRotMatrix
/* 8280C 8009200C 21800202 */   addu      $s0, $s0, $v0
/* 82810 80092010 21200002 */  addu       $a0, $s0, $zero
/* 82814 80092014 15FD020C */  jal        func_800BF454
/* 82818 80092018 1000A527 */   addiu     $a1, $sp, 0x10
/* 8281C 8009201C 21202002 */  addu       $a0, $s1, $zero
/* 82820 80092020 A4E6010C */  jal        func_80079A90
/* 82824 80092024 1000A527 */   addiu     $a1, $sp, 0x10
/* 82828 80092028 3800BF8F */  lw         $ra, 0x38($sp)
/* 8282C 8009202C 3400B18F */  lw         $s1, 0x34($sp)
/* 82830 80092030 3000B08F */  lw         $s0, 0x30($sp)
/* 82834 80092034 0800E003 */  jr         $ra
/* 82838 80092038 4000BD27 */   addiu     $sp, $sp, 0x40
.size _G2AnimController_GetSimpleWorldRotQuat, . - _G2AnimController_GetSimpleWorldRotQuat
