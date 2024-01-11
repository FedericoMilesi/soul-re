.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_PrintInfo
/* 6364C 80072E4C 44EC828F */  lw         $v0, %gp_rel(usedVramBlocks)($gp)
/* 63650 80072E50 00000000 */  nop
/* 63654 80072E54 05004010 */  beqz       $v0, .L80072E6C
/* 63658 80072E58 00000000 */   nop
.L80072E5C:
/* 6365C 80072E5C 0000428C */  lw         $v0, 0x0($v0)
/* 63660 80072E60 00000000 */  nop
/* 63664 80072E64 FDFF4014 */  bnez       $v0, .L80072E5C
/* 63668 80072E68 00000000 */   nop
.L80072E6C:
/* 6366C 80072E6C 48EC828F */  lw         $v0, %gp_rel(openVramBlocks)($gp)
/* 63670 80072E70 00000000 */  nop
/* 63674 80072E74 05004010 */  beqz       $v0, .L80072E8C
/* 63678 80072E78 00000000 */   nop
.L80072E7C:
/* 6367C 80072E7C 0000428C */  lw         $v0, 0x0($v0)
/* 63680 80072E80 00000000 */  nop
/* 63684 80072E84 FDFF4014 */  bnez       $v0, .L80072E7C
/* 63688 80072E88 00000000 */   nop
.L80072E8C:
/* 6368C 80072E8C 0800E003 */  jr         $ra
/* 63690 80072E90 00000000 */   nop
.size VRAM_PrintInfo, . - VRAM_PrintInfo
