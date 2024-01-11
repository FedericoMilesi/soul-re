.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InsertFreeBlock
/* 6396C 8007316C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 63970 80073170 1000BFAF */  sw         $ra, 0x10($sp)
/* 63974 80073174 03008014 */  bnez       $a0, .L80073184
/* 63978 80073178 21280000 */   addu      $a1, $zero, $zero
/* 6397C 8007317C 7BCC0108 */  j          .L800731EC
/* 63980 80073180 2110A000 */   addu      $v0, $a1, $zero
.L80073184:
/* 63984 80073184 48EC838F */  lw         $v1, %gp_rel(openVramBlocks)($gp)
/* 63988 80073188 00000000 */  nop
/* 6398C 8007318C 0C006010 */  beqz       $v1, .L800731C0
/* 63990 80073190 00000000 */   nop
/* 63994 80073194 1400868C */  lw         $a2, 0x14($a0)
.L80073198:
/* 63998 80073198 1400628C */  lw         $v0, 0x14($v1)
/* 6399C 8007319C 00000000 */  nop
/* 639A0 800731A0 2A104600 */  slt        $v0, $v0, $a2
/* 639A4 800731A4 06004010 */  beqz       $v0, .L800731C0
/* 639A8 800731A8 00000000 */   nop
/* 639AC 800731AC 21286000 */  addu       $a1, $v1, $zero
/* 639B0 800731B0 0000A38C */  lw         $v1, 0x0($a1)
/* 639B4 800731B4 00000000 */  nop
/* 639B8 800731B8 F7FF6014 */  bnez       $v1, .L80073198
/* 639BC 800731BC 00000000 */   nop
.L800731C0:
/* 639C0 800731C0 0500A014 */  bnez       $a1, .L800731D8
/* 639C4 800731C4 00000000 */   nop
/* 639C8 800731C8 48EC828F */  lw         $v0, %gp_rel(openVramBlocks)($gp)
/* 639CC 800731CC 48EC84AF */  sw         $a0, %gp_rel(openVramBlocks)($gp)
/* 639D0 800731D0 78CC0108 */  j          .L800731E0
/* 639D4 800731D4 000082AC */   sw        $v0, 0x0($a0)
.L800731D8:
/* 639D8 800731D8 000083AC */  sw         $v1, 0x0($a0)
/* 639DC 800731DC 0000A4AC */  sw         $a0, 0x0($a1)
.L800731E0:
/* 639E0 800731E0 4ECC010C */  jal        VRAM_GarbageCollect
/* 639E4 800731E4 00000000 */   nop
/* 639E8 800731E8 01000224 */  addiu      $v0, $zero, 0x1
.L800731EC:
/* 639EC 800731EC 1000BF8F */  lw         $ra, 0x10($sp)
/* 639F0 800731F0 00000000 */  nop
/* 639F4 800731F4 0800E003 */  jr         $ra
/* 639F8 800731F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size VRAM_InsertFreeBlock, . - VRAM_InsertFreeBlock
