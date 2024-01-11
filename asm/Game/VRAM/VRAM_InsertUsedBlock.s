.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InsertUsedBlock
/* 63A64 80073264 0A008010 */  beqz       $a0, .L80073290
/* 63A68 80073268 00000000 */   nop
/* 63A6C 8007326C 44EC828F */  lw         $v0, %gp_rel(usedVramBlocks)($gp)
/* 63A70 80073270 00000000 */  nop
/* 63A74 80073274 04004014 */  bnez       $v0, .L80073288
/* 63A78 80073278 00000000 */   nop
/* 63A7C 8007327C 44EC84AF */  sw         $a0, %gp_rel(usedVramBlocks)($gp)
/* 63A80 80073280 0800E003 */  jr         $ra
/* 63A84 80073284 00000000 */   nop
.L80073288:
/* 63A88 80073288 000082AC */  sw         $v0, 0x0($a0)
/* 63A8C 8007328C 44EC84AF */  sw         $a0, %gp_rel(usedVramBlocks)($gp)
.L80073290:
/* 63A90 80073290 0800E003 */  jr         $ra
/* 63A94 80073294 00000000 */   nop
.size VRAM_InsertUsedBlock, . - VRAM_InsertUsedBlock
