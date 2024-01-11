.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericRibbon
/* 3D028 8004C828 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3D02C 8004C82C 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D030 8004C830 90A2438C */  lw         $v1, %lo(objectAccess + 0x54)($v0)
/* 3D034 8004C834 4000A68F */  lw         $a2, 0x40($sp)
/* 3D038 8004C838 26006010 */  beqz       $v1, .L8004C8D4
/* 3D03C 8004C83C 2800BFAF */   sw        $ra, 0x28($sp)
/* 3D040 8004C840 80100500 */  sll        $v0, $a1, 2
/* 3D044 8004C844 1C00638C */  lw         $v1, 0x1C($v1)
/* 3D048 8004C848 21104500 */  addu       $v0, $v0, $a1
/* 3D04C 8004C84C 0400638C */  lw         $v1, 0x4($v1)
/* 3D050 8004C850 80100200 */  sll        $v0, $v0, 2
/* 3D054 8004C854 21186200 */  addu       $v1, $v1, $v0
/* 3D058 8004C858 05006280 */  lb         $v0, 0x5($v1)
/* 3D05C 8004C85C 00000000 */  nop
/* 3D060 8004C860 05004010 */  beqz       $v0, .L8004C878
/* 3D064 8004C864 00000000 */   nop
/* 3D068 8004C868 4C01848C */  lw         $a0, 0x14C($a0)
/* 3D06C 8004C86C 00000000 */  nop
/* 3D070 8004C870 18008010 */  beqz       $a0, .L8004C8D4
/* 3D074 8004C874 00000000 */   nop
.L8004C878:
/* 3D078 8004C878 0500C010 */  beqz       $a2, .L8004C890
/* 3D07C 8004C87C 00000000 */   nop
/* 3D080 8004C880 01006280 */  lb         $v0, 0x1($v1)
/* 3D084 8004C884 00000000 */  nop
/* 3D088 8004C888 12004010 */  beqz       $v0, .L8004C8D4
/* 3D08C 8004C88C 00000000 */   nop
.L8004C890:
/* 3D090 8004C890 06006284 */  lh         $v0, 0x6($v1)
/* 3D094 8004C894 02006580 */  lb         $a1, 0x2($v1)
/* 3D098 8004C898 03006680 */  lb         $a2, 0x3($v1)
/* 3D09C 8004C89C 04006780 */  lb         $a3, 0x4($v1)
/* 3D0A0 8004C8A0 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D0A4 8004C8A4 08006284 */  lh         $v0, 0x8($v1)
/* 3D0A8 8004C8A8 00000000 */  nop
/* 3D0AC 8004C8AC 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D0B0 8004C8B0 0A006284 */  lh         $v0, 0xA($v1)
/* 3D0B4 8004C8B4 00000000 */  nop
/* 3D0B8 8004C8B8 1800A2AF */  sw         $v0, 0x18($sp)
/* 3D0BC 8004C8BC 0C00628C */  lw         $v0, 0xC($v1)
/* 3D0C0 8004C8C0 00000000 */  nop
/* 3D0C4 8004C8C4 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3D0C8 8004C8C8 1000628C */  lw         $v0, 0x10($v1)
/* 3D0CC 8004C8CC 681D010C */  jal        FX_StartRibbon
/* 3D0D0 8004C8D0 2000A2AF */   sw        $v0, 0x20($sp)
.L8004C8D4:
/* 3D0D4 8004C8D4 2800BF8F */  lw         $ra, 0x28($sp)
/* 3D0D8 8004C8D8 00000000 */  nop
/* 3D0DC 8004C8DC 0800E003 */  jr         $ra
/* 3D0E0 8004C8E0 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_StartGenericRibbon, . - FX_StartGenericRibbon
