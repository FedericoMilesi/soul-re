.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_FontPrintCentered
/* 1E2A0 8002DAA0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1E2A4 8002DAA4 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E2A8 8002DAA8 21888000 */  addu       $s1, $a0, $zero
/* 1E2AC 8002DAAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 1E2B0 8002DAB0 1800BFAF */  sw         $ra, 0x18($sp)
/* 1E2B4 8002DAB4 FBB5000C */  jal        FONT_GetStringWidth
/* 1E2B8 8002DAB8 2180A000 */   addu      $s0, $a1, $zero
/* 1E2BC 8002DABC 43100200 */  sra        $v0, $v0, 1
/* 1E2C0 8002DAC0 00010424 */  addiu      $a0, $zero, 0x100
/* 1E2C4 8002DAC4 23208200 */  subu       $a0, $a0, $v0
/* 1E2C8 8002DAC8 00240400 */  sll        $a0, $a0, 16
/* 1E2CC 8002DACC 03240400 */  sra        $a0, $a0, 16
/* 1E2D0 8002DAD0 00841000 */  sll        $s0, $s0, 16
/* 1E2D4 8002DAD4 3CB6000C */  jal        FONT_SetCursor
/* 1E2D8 8002DAD8 032C1000 */   sra       $a1, $s0, 16
/* 1E2DC 8002DADC E7B5000C */  jal        FONT_Print2
/* 1E2E0 8002DAE0 21202002 */   addu      $a0, $s1, $zero
/* 1E2E4 8002DAE4 1800BF8F */  lw         $ra, 0x18($sp)
/* 1E2E8 8002DAE8 1400B18F */  lw         $s1, 0x14($sp)
/* 1E2EC 8002DAEC 1000B08F */  lw         $s0, 0x10($sp)
/* 1E2F0 8002DAF0 0800E003 */  jr         $ra
/* 1E2F4 8002DAF4 2000BD27 */   addiu     $sp, $sp, 0x20
.size FONT_FontPrintCentered, . - FONT_FontPrintCentered
