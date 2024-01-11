.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WORSHIP_Init
/* 7F748 8008EF48 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F74C 8008EF4C 1800B2AF */  sw         $s2, 0x18($sp)
/* 7F750 8008EF50 21908000 */  addu       $s2, $a0, $zero
/* 7F754 8008EF54 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 7F758 8008EF58 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F75C 8008EF5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F760 8008EF60 6C01518E */  lw         $s1, 0x16C($s2)
/* 7F764 8008EF64 00000000 */  nop
/* 7F768 8008EF68 5E012292 */  lbu        $v0, 0x15E($s1)
/* 7F76C 8008EF6C 2400508E */  lw         $s0, 0x24($s2)
/* 7F770 8008EF70 04004014 */  bnez       $v0, .L8008EF84
/* 7F774 8008EF74 0C000524 */   addiu     $a1, $zero, 0xC
/* 7F778 8008EF78 24000692 */  lbu        $a2, 0x24($s0)
/* 7F77C 8008EF7C E83B0208 */  j          .L8008EFA0
/* 7F780 8008EF80 00000000 */   nop
.L8008EF84:
/* 7F784 8008EF84 21204002 */  addu       $a0, $s2, $zero
/* 7F788 8008EF88 23000692 */  lbu        $a2, 0x23($s0)
/* 7F78C 8008EF8C 78F3010C */  jal        HUMAN_CreateWeapon
/* 7F790 8008EF90 0B000524 */   addiu     $a1, $zero, 0xB
/* 7F794 8008EF94 21204002 */  addu       $a0, $s2, $zero
/* 7F798 8008EF98 24000692 */  lbu        $a2, 0x24($s0)
/* 7F79C 8008EF9C 0B000524 */  addiu      $a1, $zero, 0xB
.L8008EFA0:
/* 7F7A0 8008EFA0 78F3010C */  jal        HUMAN_CreateWeapon
/* 7F7A4 8008EFA4 00000000 */   nop
/* 7F7A8 8008EFA8 03004010 */  beqz       $v0, .L8008EFB8
/* 7F7AC 8008EFAC 00000000 */   nop
/* 7F7B0 8008EFB0 ADF3010C */  jal        HUMAN_Init
/* 7F7B4 8008EFB4 21204002 */   addu      $a0, $s2, $zero
.L8008EFB8:
/* 7F7B8 8008EFB8 5E012292 */  lbu        $v0, 0x15E($s1)
/* 7F7BC 8008EFBC 00000000 */  nop
/* 7F7C0 8008EFC0 02004014 */  bnez       $v0, .L8008EFCC
/* 7F7C4 8008EFC4 00600224 */   addiu     $v0, $zero, 0x6000
/* 7F7C8 8008EFC8 00500224 */  addiu      $v0, $zero, 0x5000
.L8008EFCC:
/* 7F7CC 8008EFCC 480122A6 */  sh         $v0, 0x148($s1)
/* 7F7D0 8008EFD0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7F7D4 8008EFD4 1800B28F */  lw         $s2, 0x18($sp)
/* 7F7D8 8008EFD8 1400B18F */  lw         $s1, 0x14($sp)
/* 7F7DC 8008EFDC 1000B08F */  lw         $s0, 0x10($sp)
/* 7F7E0 8008EFE0 0800E003 */  jr         $ra
/* 7F7E4 8008EFE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size WORSHIP_Init, . - WORSHIP_Init
