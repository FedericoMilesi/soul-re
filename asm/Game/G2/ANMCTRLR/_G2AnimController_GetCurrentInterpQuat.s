.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_GetCurrentInterpQuat
/* 82680 80091E80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 82684 80091E84 2000B0AF */  sw         $s0, 0x20($sp)
/* 82688 80091E88 21808000 */  addu       $s0, $a0, $zero
/* 8268C 80091E8C 2400B1AF */  sw         $s1, 0x24($sp)
/* 82690 80091E90 2188C000 */  addu       $s1, $a2, $zero
/* 82694 80091E94 2800BFAF */  sw         $ra, 0x28($sp)
/* 82698 80091E98 08000696 */  lhu        $a2, 0x8($s0)
/* 8269C 80091E9C 00000000 */  nop
/* 826A0 80091EA0 0040C230 */  andi       $v0, $a2, 0x4000
/* 826A4 80091EA4 1E004010 */  beqz       $v0, .L80091F20
/* 826A8 80091EA8 2138A000 */   addu      $a3, $a1, $zero
/* 826AC 80091EAC 0020C230 */  andi       $v0, $a2, 0x2000
/* 826B0 80091EB0 0B004010 */  beqz       $v0, .L80091EE0
/* 826B4 80091EB4 00000000 */   nop
/* 826B8 80091EB8 1F00088A */  lwl        $t0, 0x1F($s0)
/* 826BC 80091EBC 1C00089A */  lwr        $t0, 0x1C($s0)
/* 826C0 80091EC0 2300098A */  lwl        $t1, 0x23($s0)
/* 826C4 80091EC4 2000099A */  lwr        $t1, 0x20($s0)
/* 826C8 80091EC8 030028AA */  swl        $t0, 0x3($s1)
/* 826CC 80091ECC 000028BA */  swr        $t0, 0x0($s1)
/* 826D0 80091ED0 070029AA */  swl        $t1, 0x7($s1)
/* 826D4 80091ED4 040029BA */  swr        $t1, 0x4($s1)
/* 826D8 80091ED8 EA470208 */  j          .L80091FA8
/* 826DC 80091EDC 00000000 */   nop
.L80091EE0:
/* 826E0 80091EE0 0C000586 */  lh         $a1, 0xC($s0)
/* 826E4 80091EE4 0A000286 */  lh         $v0, 0xA($s0)
/* 826E8 80091EE8 002B0500 */  sll        $a1, $a1, 12
/* 826EC 80091EEC 1A00A200 */  div        $zero, $a1, $v0
/* 826F0 80091EF0 12280000 */  mflo       $a1
/* 826F4 80091EF4 1000048E */  lw         $a0, 0x10($s0)
/* 826F8 80091EF8 9B53020C */  jal        _G2AnimAlphaTable_GetValue
/* 826FC 80091EFC 00000000 */   nop
/* 82700 80091F00 21204000 */  addu       $a0, $v0, $zero
/* 82704 80091F04 14000526 */  addiu      $a1, $s0, 0x14
/* 82708 80091F08 1C000626 */  addiu      $a2, $s0, 0x1C
/* 8270C 80091F0C 21382002 */  addu       $a3, $s1, $zero
/* 82710 80091F10 0D59020C */  jal        G2Quat_Slerp_VM
/* 82714 80091F14 1000A0AF */   sw        $zero, 0x10($sp)
/* 82718 80091F18 EA470208 */  j          .L80091FA8
/* 8271C 80091F1C 00000000 */   nop
.L80091F20:
/* 82720 80091F20 02000392 */  lbu        $v1, 0x2($s0)
/* 82724 80091F24 08000224 */  addiu      $v0, $zero, 0x8
/* 82728 80091F28 09006214 */  bne        $v1, $v0, .L80091F50
/* 8272C 80091F2C 4C000224 */   addiu     $v0, $zero, 0x4C
/* 82730 80091F30 21202002 */  addu       $a0, $s1, $zero
/* 82734 80091F34 03000592 */  lbu        $a1, 0x3($s0)
/* 82738 80091F38 1400E28C */  lw         $v0, 0x14($a3)
/* 8273C 80091F3C 40290500 */  sll        $a1, $a1, 5
/* 82740 80091F40 A4E6010C */  jal        func_80079A90
/* 82744 80091F44 21284500 */   addu      $a1, $v0, $a1
/* 82748 80091F48 EA470208 */  j          .L80091FA8
/* 8274C 80091F4C 00000000 */   nop
.L80091F50:
/* 82750 80091F50 05006214 */  bne        $v1, $v0, .L80091F68
/* 82754 80091F54 0E000224 */   addiu     $v0, $zero, 0xE
/* 82758 80091F58 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 8275C 80091F5C 000020AE */  sw         $zero, 0x0($s1)
/* 82760 80091F60 EA470208 */  j          .L80091FA8
/* 82764 80091F64 040022AE */   sw        $v0, 0x4($s1)
.L80091F68:
/* 82768 80091F68 07006214 */  bne        $v1, $v0, .L80091F88
/* 8276C 80091F6C 2120E000 */   addu      $a0, $a3, $zero
/* 82770 80091F70 14000426 */  addiu      $a0, $s0, 0x14
/* 82774 80091F74 1800A527 */  addiu      $a1, $sp, 0x18
/* 82778 80091F78 A745020C */  jal        _G2Anim_CopyVectorWithOrder
/* 8277C 80091F7C FF00C630 */   andi      $a2, $a2, 0xFF
/* 82780 80091F80 E8470208 */  j          .L80091FA0
/* 82784 80091F84 21202002 */   addu      $a0, $s1, $zero
.L80091F88:
/* 82788 80091F88 1800A627 */  addiu      $a2, $sp, 0x18
/* 8278C 80091F8C 03000592 */  lbu        $a1, 0x3($s0)
/* 82790 80091F90 814C020C */  jal        G2Anim_GetSegChannelValue
/* 82794 80091F94 07000724 */   addiu     $a3, $zero, 0x7
/* 82798 80091F98 1E00A0A7 */  sh         $zero, 0x1E($sp)
/* 8279C 80091F9C 21202002 */  addu       $a0, $s1, $zero
.L80091FA0:
/* 827A0 80091FA0 63E7010C */  jal        func_80079D8C
/* 827A4 80091FA4 1800A527 */   addiu     $a1, $sp, 0x18
.L80091FA8:
/* 827A8 80091FA8 2800BF8F */  lw         $ra, 0x28($sp)
/* 827AC 80091FAC 2400B18F */  lw         $s1, 0x24($sp)
/* 827B0 80091FB0 2000B08F */  lw         $s0, 0x20($sp)
/* 827B4 80091FB4 0800E003 */  jr         $ra
/* 827B8 80091FB8 3000BD27 */   addiu     $sp, $sp, 0x30
.size _G2AnimController_GetCurrentInterpQuat, . - _G2AnimController_GetCurrentInterpQuat
