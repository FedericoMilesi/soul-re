.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceQueryPassedFrame
/* 62F30 80072730 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62F34 80072734 1800B2AF */  sw         $s2, 0x18($sp)
/* 62F38 80072738 21908000 */  addu       $s2, $a0, $zero
/* 62F3C 8007273C FF00A530 */  andi       $a1, $a1, 0xFF
/* 62F40 80072740 40100500 */  sll        $v0, $a1, 1
/* 62F44 80072744 21104500 */  addu       $v0, $v0, $a1
/* 62F48 80072748 00110200 */  sll        $v0, $v0, 4
/* 62F4C 8007274C EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62F50 80072750 1000B0AF */  sw         $s0, 0x10($sp)
/* 62F54 80072754 21804202 */  addu       $s0, $s2, $v0
/* 62F58 80072758 21200002 */  addu       $a0, $s0, $zero
/* 62F5C 8007275C 1400B1AF */  sw         $s1, 0x14($sp)
/* 62F60 80072760 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 62F64 80072764 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 62F68 80072768 2188C000 */   addu      $s1, $a2, $zero
/* 62F6C 8007276C 14004014 */  bnez       $v0, .L800727C0
/* 62F70 80072770 21100000 */   addu      $v0, $zero, $zero
/* 62F74 80072774 12002012 */  beqz       $s1, .L800727C0
/* 62F78 80072778 01000224 */   addiu     $v0, $zero, 0x1
/* 62F7C 8007277C DD3E020C */  jal        G2Anim_GetKeylist
/* 62F80 80072780 C8014426 */   addiu     $a0, $s2, 0x1C8
/* 62F84 80072784 01004290 */  lbu        $v0, 0x1($v0)
/* 62F88 80072788 00000000 */  nop
/* 62F8C 8007278C 18002202 */  mult       $s1, $v0
/* 62F90 80072790 06000286 */  lh         $v0, 0x6($s0)
/* 62F94 80072794 12380000 */  mflo       $a3
/* 62F98 80072798 001C0700 */  sll        $v1, $a3, 16
/* 62F9C 8007279C 031C0300 */  sra        $v1, $v1, 16
/* 62FA0 800727A0 2A104300 */  slt        $v0, $v0, $v1
/* 62FA4 800727A4 05004010 */  beqz       $v0, .L800727BC
/* 62FA8 800727A8 21200000 */   addu      $a0, $zero, $zero
/* 62FAC 800727AC 04000286 */  lh         $v0, 0x4($s0)
/* 62FB0 800727B0 00000000 */  nop
/* 62FB4 800727B4 2A104300 */  slt        $v0, $v0, $v1
/* 62FB8 800727B8 01004438 */  xori       $a0, $v0, 0x1
.L800727BC:
/* 62FBC 800727BC 21108000 */  addu       $v0, $a0, $zero
.L800727C0:
/* 62FC0 800727C0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 62FC4 800727C4 1800B28F */  lw         $s2, 0x18($sp)
/* 62FC8 800727C8 1400B18F */  lw         $s1, 0x14($sp)
/* 62FCC 800727CC 1000B08F */  lw         $s0, 0x10($sp)
/* 62FD0 800727D0 0800E003 */  jr         $ra
/* 62FD4 800727D4 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationInstanceQueryPassedFrame, . - G2EmulationInstanceQueryPassedFrame
