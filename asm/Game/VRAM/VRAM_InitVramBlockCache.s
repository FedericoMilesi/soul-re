.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InitVramBlockCache
/* 63694 80072E94 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 63698 80072E98 59000324 */  addiu      $v1, $zero, 0x59
/* 6369C 80072E9C 04EC8227 */  addiu      $v0, $gp, %gp_rel(vramBlockList + 0x9BC)
/* 636A0 80072EA0 1800BFAF */  sw         $ra, 0x18($sp)
/* 636A4 80072EA4 48EC80AF */  sw         $zero, %gp_rel(openVramBlocks)($gp)
/* 636A8 80072EA8 44EC80AF */  sw         $zero, %gp_rel(usedVramBlocks)($gp)
/* 636AC 80072EAC 24EC80AF */  sw         $zero, %gp_rel(numOfBlocksUsed)($gp)
.L80072EB0:
/* 636B0 80072EB0 050040A0 */  sb         $zero, 0x5($v0)
/* 636B4 80072EB4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 636B8 80072EB8 FDFF6104 */  bgez       $v1, .L80072EB0
/* 636BC 80072EBC E4FF4224 */   addiu     $v0, $v0, -0x1C
/* 636C0 80072EC0 01000224 */  addiu      $v0, $zero, 0x1
/* 636C4 80072EC4 00020424 */  addiu      $a0, $zero, 0x200
/* 636C8 80072EC8 00010524 */  addiu      $a1, $zero, 0x100
/* 636CC 80072ECC 21308000 */  addu       $a2, $a0, $zero
/* 636D0 80072ED0 2138A000 */  addu       $a3, $a1, $zero
/* 636D4 80072ED4 18CD010C */  jal        VRAM_InsertFreeVram
/* 636D8 80072ED8 1000A2AF */   sw        $v0, 0x10($sp)
/* 636DC 80072EDC 00D1010C */  jal        VRAM_InitMorphPalettes
/* 636E0 80072EE0 00000000 */   nop
/* 636E4 80072EE4 1800BF8F */  lw         $ra, 0x18($sp)
/* 636E8 80072EE8 00000000 */  nop
/* 636EC 80072EEC 0800E003 */  jr         $ra
/* 636F0 80072EF0 2000BD27 */   addiu     $sp, $sp, 0x20
.size VRAM_InitVramBlockCache, . - VRAM_InitVramBlockCache
