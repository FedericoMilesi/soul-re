.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadInstallUpdateFunc
/* 4255C 80051D5C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 42560 80051D60 1000B0AF */  sw         $s0, 0x10($sp)
/* 42564 80051D64 21808000 */  addu       $s0, $a0, $zero
/* 42568 80051D68 1400B1AF */  sw         $s1, 0x14($sp)
/* 4256C 80051D6C 1800BFAF */  sw         $ra, 0x18($sp)
/* 42570 80051D70 A5FC020C */  jal        func_800BF294
/* 42574 80051D74 2188A000 */   addu      $s1, $a1, $zero
/* 42578 80051D78 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 4257C 80051D7C 01008434 */  ori        $a0, $a0, (0xF2000001 & 0xFFFF)
/* 42580 80051D80 02000524 */  addiu      $a1, $zero, 0x2
/* 42584 80051D84 00100624 */  addiu      $a2, $zero, 0x1000
/* 42588 80051D88 D9FC020C */  jal        func_800BF364
/* 4258C 80051D8C 21380002 */   addu      $a3, $s0, $zero
/* 42590 80051D90 04C782AF */  sw         $v0, %gp_rel(__hblankEvent)($gp)
/* 42594 80051D94 D5FC020C */  jal        func_800BF354
/* 42598 80051D98 21204000 */   addu      $a0, $v0, $zero
/* 4259C 80051D9C 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 425A0 80051DA0 01008434 */  ori        $a0, $a0, (0xF2000001 & 0xFFFF)
/* 425A4 80051DA4 FFFF2532 */  andi       $a1, $s1, 0xFFFF
/* 425A8 80051DA8 C4F4020C */  jal        func_800BD310
/* 425AC 80051DAC 00100624 */   addiu     $a2, $zero, 0x1000
/* 425B0 80051DB0 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 425B4 80051DB4 F9F4020C */  jal        func_800BD3E4
/* 425B8 80051DB8 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
/* 425BC 80051DBC 11FC020C */  jal        func_800BF044
/* 425C0 80051DC0 00000000 */   nop
/* 425C4 80051DC4 1800BF8F */  lw         $ra, 0x18($sp)
/* 425C8 80051DC8 1400B18F */  lw         $s1, 0x14($sp)
/* 425CC 80051DCC 1000B08F */  lw         $s0, 0x10($sp)
/* 425D0 80051DD0 0800E003 */  jr         $ra
/* 425D4 80051DD4 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadInstallUpdateFunc, . - aadInstallUpdateFunc
