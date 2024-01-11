.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_DeleteFreeBlock
/* 639FC 800731FC 48EC838F */  lw         $v1, %gp_rel(openVramBlocks)($gp)
/* 63A00 80073200 11008010 */  beqz       $a0, .L80073248
/* 63A04 80073204 21280000 */   addu      $a1, $zero, $zero
/* 63A08 80073208 0A008310 */  beq        $a0, $v1, .L80073234
/* 63A0C 8007320C 00000000 */   nop
.L80073210:
/* 63A10 80073210 06006010 */  beqz       $v1, .L8007322C
/* 63A14 80073214 00000000 */   nop
/* 63A18 80073218 21286000 */  addu       $a1, $v1, $zero
/* 63A1C 8007321C 0000A38C */  lw         $v1, 0x0($a1)
/* 63A20 80073220 00000000 */  nop
/* 63A24 80073224 FAFF8314 */  bne        $a0, $v1, .L80073210
/* 63A28 80073228 00000000 */   nop
.L8007322C:
/* 63A2C 8007322C 0B008314 */  bne        $a0, $v1, .L8007325C
/* 63A30 80073230 00000000 */   nop
.L80073234:
/* 63A34 80073234 0600A014 */  bnez       $a1, .L80073250
/* 63A38 80073238 00000000 */   nop
/* 63A3C 8007323C 0000828C */  lw         $v0, 0x0($a0)
/* 63A40 80073240 00000000 */  nop
/* 63A44 80073244 48EC82AF */  sw         $v0, %gp_rel(openVramBlocks)($gp)
.L80073248:
/* 63A48 80073248 0800E003 */  jr         $ra
/* 63A4C 8007324C 00000000 */   nop
.L80073250:
/* 63A50 80073250 0000828C */  lw         $v0, 0x0($a0)
/* 63A54 80073254 00000000 */  nop
/* 63A58 80073258 0000A2AC */  sw         $v0, 0x0($a1)
.L8007325C:
/* 63A5C 8007325C 0800E003 */  jr         $ra
/* 63A60 80073260 00000000 */   nop
.size VRAM_DeleteFreeBlock, . - VRAM_DeleteFreeBlock
