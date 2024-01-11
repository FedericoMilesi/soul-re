.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeWaterBubble
/* 36EB0 800466B0 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 36EB4 800466B4 0D80023C */  lui        $v0, %hi(objectAccess + 0x1C)
/* 36EB8 800466B8 3400B3AF */  sw         $s3, 0x34($sp)
/* 36EBC 800466BC 58A2538C */  lw         $s3, %lo(objectAccess + 0x1C)($v0)
/* 36EC0 800466C0 3000B2AF */  sw         $s2, 0x30($sp)
/* 36EC4 800466C4 5800B28F */  lw         $s2, 0x58($sp)
/* 36EC8 800466C8 2800B0AF */  sw         $s0, 0x28($sp)
/* 36ECC 800466CC 21808000 */  addu       $s0, $a0, $zero
/* 36ED0 800466D0 3800B4AF */  sw         $s4, 0x38($sp)
/* 36ED4 800466D4 21A0A000 */  addu       $s4, $a1, $zero
/* 36ED8 800466D8 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 36EDC 800466DC 21A8C000 */  addu       $s5, $a2, $zero
/* 36EE0 800466E0 4000B6AF */  sw         $s6, 0x40($sp)
/* 36EE4 800466E4 21B0E000 */  addu       $s6, $a3, $zero
/* 36EE8 800466E8 4400BFAF */  sw         $ra, 0x44($sp)
/* 36EEC 800466EC 52006012 */  beqz       $s3, .L80046838
/* 36EF0 800466F0 2C00B1AF */   sw        $s1, 0x2C($sp)
/* 36EF4 800466F4 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 36EF8 800466F8 C009010C */  jal        FX_GetPrim
/* 36EFC 800466FC 00000000 */   nop
/* 36F00 80046700 21884000 */  addu       $s1, $v0, $zero
/* 36F04 80046704 4C002012 */  beqz       $s1, .L80046838
/* 36F08 80046708 21202002 */   addu      $a0, $s1, $zero
/* 36F0C 8004670C 21280002 */  addu       $a1, $s0, $zero
/* 36F10 80046710 0C000624 */  addiu      $a2, $zero, 0xC
/* 36F14 80046714 002C103C */  lui        $s0, (0x2C000000 >> 16)
/* 36F18 80046718 00141600 */  sll        $v0, $s6, 16
/* 36F1C 8004671C 03140200 */  sra        $v0, $v0, 16
/* 36F20 80046720 44BA838F */  lw         $v1, %gp_rel(gFXT)($gp)
/* 36F24 80046724 2138C000 */  addu       $a3, $a2, $zero
/* 36F28 80046728 1000B0AF */  sw         $s0, 0x10($sp)
/* 36F2C 8004672C 1400B4AF */  sw         $s4, 0x14($sp)
/* 36F30 80046730 1800B5AF */  sw         $s5, 0x18($sp)
/* 36F34 80046734 2000A2AF */  sw         $v0, 0x20($sp)
/* 36F38 80046738 5C22010C */  jal        FX_DFacadeParticleSetup
/* 36F3C 8004673C 1C00A3AF */   sw        $v1, 0x1C($sp)
/* 36F40 80046740 3AF2020C */  jal        func_800BC8E8
/* 36F44 80046744 00000000 */   nop
/* 36F48 80046748 12004386 */  lh         $v1, 0x12($s2)
/* 36F4C 8004674C 00000000 */  nop
/* 36F50 80046750 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 36F54 80046754 1A004300 */  div        $zero, $v0, $v1
/* 36F58 80046758 10300000 */  mfhi       $a2
/* 36F5C 8004675C 21206002 */  addu       $a0, $s3, $zero
/* 36F60 80046760 9D19010C */  jal        FX_GetTextureObject
/* 36F64 80046764 02000524 */   addiu     $a1, $zero, 0x2
/* 36F68 80046768 FF03043C */  lui        $a0, (0x3FFFFFF >> 16)
/* 36F6C 8004676C 0C00238E */  lw         $v1, 0xC($s1)
/* 36F70 80046770 FFFF8434 */  ori        $a0, $a0, (0x3FFFFFF & 0xFFFF)
/* 36F74 80046774 080022AE */  sw         $v0, 0x8($s1)
/* 36F78 80046778 01006334 */  ori        $v1, $v1, 0x1
/* 36F7C 8004677C 0C0023AE */  sw         $v1, 0xC($s1)
/* 36F80 80046780 21184000 */  addu       $v1, $v0, $zero
/* 36F84 80046784 0480023C */  lui        $v0, %hi(FX_WaterBubbleProcess)
/* 36F88 80046788 0C00638C */  lw         $v1, 0xC($v1)
/* 36F8C 8004678C 24644224 */  addiu      $v0, $v0, %lo(FX_WaterBubbleProcess)
/* 36F90 80046790 140022AE */  sw         $v0, 0x14($s1)
/* 36F94 80046794 420020A6 */  sh         $zero, 0x42($s1)
/* 36F98 80046798 24186400 */  and        $v1, $v1, $a0
/* 36F9C 8004679C 25187000 */  or         $v1, $v1, $s0
/* 36FA0 800467A0 3AF2020C */  jal        func_800BC8E8
/* 36FA4 800467A4 1C0023AE */   sw        $v1, 0x1C($s1)
/* 36FA8 800467A8 08004386 */  lh         $v1, 0x8($s2)
/* 36FAC 800467AC 00000000 */  nop
/* 36FB0 800467B0 1A004300 */  div        $zero, $v0, $v1
/* 36FB4 800467B4 10180000 */  mfhi       $v1
/* 36FB8 800467B8 06004296 */  lhu        $v0, 0x6($s2)
/* 36FBC 800467BC 00000000 */  nop
/* 36FC0 800467C0 21104300 */  addu       $v0, $v0, $v1
/* 36FC4 800467C4 3AF2020C */  jal        func_800BC8E8
/* 36FC8 800467C8 4A0022A6 */   sh        $v0, 0x4A($s1)
/* 36FCC 800467CC 0C004386 */  lh         $v1, 0xC($s2)
/* 36FD0 800467D0 00000000 */  nop
/* 36FD4 800467D4 1A004300 */  div        $zero, $v0, $v1
/* 36FD8 800467D8 10180000 */  mfhi       $v1
/* 36FDC 800467DC 0A004296 */  lhu        $v0, 0xA($s2)
/* 36FE0 800467E0 00000000 */  nop
/* 36FE4 800467E4 21104300 */  addu       $v0, $v0, $v1
/* 36FE8 800467E8 3AF2020C */  jal        func_800BC8E8
/* 36FEC 800467EC 520022A6 */   sh        $v0, 0x52($s1)
/* 36FF0 800467F0 10004386 */  lh         $v1, 0x10($s2)
/* 36FF4 800467F4 00000000 */  nop
/* 36FF8 800467F8 1A004300 */  div        $zero, $v0, $v1
/* 36FFC 800467FC 10180000 */  mfhi       $v1
/* 37000 80046800 0E004296 */  lhu        $v0, 0xE($s2)
/* 37004 80046804 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 37008 80046808 21104300 */  addu       $v0, $v0, $v1
/* 3700C 8004680C 5A0022A6 */  sh         $v0, 0x5A($s1)
/* 37010 80046810 00004296 */  lhu        $v0, 0x0($s2)
/* 37014 80046814 00000000 */  nop
/* 37018 80046818 620022A6 */  sh         $v0, 0x62($s1)
/* 3701C 8004681C 02004296 */  lhu        $v0, 0x2($s2)
/* 37020 80046820 21282002 */  addu       $a1, $s1, $zero
/* 37024 80046824 6400A2A4 */  sh         $v0, 0x64($a1)
/* 37028 80046828 04004296 */  lhu        $v0, 0x4($s2)
/* 3702C 8004682C 986D8424 */  addiu      $a0, $a0, 0x6D98
/* 37030 80046830 8F19010C */  jal        FX_Sprite_Insert
/* 37034 80046834 4600A2A4 */   sh        $v0, 0x46($a1)
.L80046838:
/* 37038 80046838 4400BF8F */  lw         $ra, 0x44($sp)
/* 3703C 8004683C 4000B68F */  lw         $s6, 0x40($sp)
/* 37040 80046840 3C00B58F */  lw         $s5, 0x3C($sp)
/* 37044 80046844 3800B48F */  lw         $s4, 0x38($sp)
/* 37048 80046848 3400B38F */  lw         $s3, 0x34($sp)
/* 3704C 8004684C 3000B28F */  lw         $s2, 0x30($sp)
/* 37050 80046850 2C00B18F */  lw         $s1, 0x2C($sp)
/* 37054 80046854 2800B08F */  lw         $s0, 0x28($sp)
/* 37058 80046858 0800E003 */  jr         $ra
/* 3705C 8004685C 4800BD27 */   addiu     $sp, $sp, 0x48
.size FX_MakeWaterBubble, . - FX_MakeWaterBubble
