.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_GarbageCollect
/* 63938 80073138 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6393C 8007313C 1000B0AF */  sw         $s0, 0x10($sp)
/* 63940 80073140 01001024 */  addiu      $s0, $zero, 0x1
/* 63944 80073144 1400BFAF */  sw         $ra, 0x14($sp)
.L80073148:
/* 63948 80073148 48EC848F */  lw         $a0, %gp_rel(openVramBlocks)($gp)
/* 6394C 8007314C D4CB010C */  jal        VRAM_ConcatanateMemory
/* 63950 80073150 00000000 */   nop
/* 63954 80073154 FCFF5010 */  beq        $v0, $s0, .L80073148
/* 63958 80073158 00000000 */   nop
/* 6395C 8007315C 1400BF8F */  lw         $ra, 0x14($sp)
/* 63960 80073160 1000B08F */  lw         $s0, 0x10($sp)
/* 63964 80073164 0800E003 */  jr         $ra
/* 63968 80073168 1800BD27 */   addiu     $sp, $sp, 0x18
.size VRAM_GarbageCollect, . - VRAM_GarbageCollect
