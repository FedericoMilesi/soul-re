.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadRelocateSfxMemory
/* 43654 80052E54 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 43658 80052E58 00000000 */  nop
/* 4365C 80052E5C E007438C */  lw         $v1, 0x7E0($v0)
/* 43660 80052E60 00000000 */  nop
/* 43664 80052E64 03008314 */  bne        $a0, $v1, .L80052E74
/* 43668 80052E68 00000000 */   nop
/* 4366C 80052E6C 21186500 */  addu       $v1, $v1, $a1
/* 43670 80052E70 E00743AC */  sw         $v1, 0x7E0($v0)
.L80052E74:
/* 43674 80052E74 0F006010 */  beqz       $v1, .L80052EB4
/* 43678 80052E78 21288500 */   addu      $a1, $a0, $a1
.L80052E7C:
/* 4367C 80052E7C 0C00628C */  lw         $v0, 0xC($v1)
/* 43680 80052E80 00000000 */  nop
/* 43684 80052E84 02008214 */  bne        $a0, $v0, .L80052E90
/* 43688 80052E88 00000000 */   nop
/* 4368C 80052E8C 0C0065AC */  sw         $a1, 0xC($v1)
.L80052E90:
/* 43690 80052E90 1000628C */  lw         $v0, 0x10($v1)
/* 43694 80052E94 00000000 */  nop
/* 43698 80052E98 02008214 */  bne        $a0, $v0, .L80052EA4
/* 4369C 80052E9C 00000000 */   nop
/* 436A0 80052EA0 100065AC */  sw         $a1, 0x10($v1)
.L80052EA4:
/* 436A4 80052EA4 1000638C */  lw         $v1, 0x10($v1)
/* 436A8 80052EA8 00000000 */  nop
/* 436AC 80052EAC F3FF6014 */  bnez       $v1, .L80052E7C
/* 436B0 80052EB0 00000000 */   nop
.L80052EB4:
/* 436B4 80052EB4 0800E003 */  jr         $ra
/* 436B8 80052EB8 00000000 */   nop
.size aadRelocateSfxMemory, . - aadRelocateSfxMemory
