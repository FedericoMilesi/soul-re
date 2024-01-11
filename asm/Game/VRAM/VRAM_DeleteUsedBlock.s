.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_DeleteUsedBlock
/* 63A98 80073298 44EC838F */  lw         $v1, %gp_rel(usedVramBlocks)($gp)
/* 63A9C 8007329C 00000000 */  nop
/* 63AA0 800732A0 0A008310 */  beq        $a0, $v1, .L800732CC
/* 63AA4 800732A4 21280000 */   addu      $a1, $zero, $zero
.L800732A8:
/* 63AA8 800732A8 06006010 */  beqz       $v1, .L800732C4
/* 63AAC 800732AC 00000000 */   nop
/* 63AB0 800732B0 21286000 */  addu       $a1, $v1, $zero
/* 63AB4 800732B4 0000A38C */  lw         $v1, 0x0($a1)
/* 63AB8 800732B8 00000000 */  nop
/* 63ABC 800732BC FAFF8314 */  bne        $a0, $v1, .L800732A8
/* 63AC0 800732C0 00000000 */   nop
.L800732C4:
/* 63AC4 800732C4 0B008314 */  bne        $a0, $v1, .L800732F4
/* 63AC8 800732C8 00000000 */   nop
.L800732CC:
/* 63ACC 800732CC 0600A014 */  bnez       $a1, .L800732E8
/* 63AD0 800732D0 00000000 */   nop
/* 63AD4 800732D4 0000828C */  lw         $v0, 0x0($a0)
/* 63AD8 800732D8 00000000 */  nop
/* 63ADC 800732DC 44EC82AF */  sw         $v0, %gp_rel(usedVramBlocks)($gp)
/* 63AE0 800732E0 0800E003 */  jr         $ra
/* 63AE4 800732E4 00000000 */   nop
.L800732E8:
/* 63AE8 800732E8 0000828C */  lw         $v0, 0x0($a0)
/* 63AEC 800732EC 00000000 */  nop
/* 63AF0 800732F0 0000A2AC */  sw         $v0, 0x0($a1)
.L800732F4:
/* 63AF4 800732F4 0800E003 */  jr         $ra
/* 63AF8 800732F8 00000000 */   nop
.size VRAM_DeleteUsedBlock, . - VRAM_DeleteUsedBlock
