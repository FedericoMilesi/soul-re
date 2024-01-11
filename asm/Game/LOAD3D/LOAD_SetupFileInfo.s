.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_SetupFileInfo
/* 28428 80037C28 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2842C 80037C2C 1000B0AF */  sw         $s0, 0x10($sp)
/* 28430 80037C30 21808000 */  addu       $s0, $a0, $zero
/* 28434 80037C34 1400BFAF */  sw         $ra, 0x14($sp)
/* 28438 80037C38 0000048E */  lw         $a0, 0x0($s0)
/* 2843C 80037C3C F3DF000C */  jal        LOAD_GetBigFileEntryByHash
/* 28440 80037C40 00000000 */   nop
/* 28444 80037C44 21184000 */  addu       $v1, $v0, $zero
/* 28448 80037C48 0C006014 */  bnez       $v1, .L80037C7C
/* 2844C 80037C4C 00000000 */   nop
/* 28450 80037C50 0400038E */  lw         $v1, 0x4($s0)
/* 28454 80037C54 00BC828F */  lw         $v0, %gp_rel(loadStatus + 0x6C)($gp)
/* 28458 80037C58 00000000 */  nop
/* 2845C 80037C5C 10006214 */  bne        $v1, $v0, .L80037CA0
/* 28460 80037C60 21100000 */   addu      $v0, $zero, $zero
/* 28464 80037C64 0D80043C */  lui        $a0, %hi(default_lightgroup + 0x94)
/* 28468 80037C68 5C098424 */  addiu      $a0, $a0, %lo(default_lightgroup + 0x94)
/* 2846C 80037C6C 2B52000C */  jal        DEBUG_FatalError
/* 28470 80037C70 34000526 */   addiu     $a1, $s0, 0x34
/* 28474 80037C74 28DF0008 */  j          .L80037CA0
/* 28478 80037C78 21100000 */   addu      $v0, $zero, $zero
.L80037C7C:
/* 2847C 80037C7C 0800628C */  lw         $v0, 0x8($v1)
/* 28480 80037C80 00000000 */  nop
/* 28484 80037C84 080002AE */  sw         $v0, 0x8($s0)
/* 28488 80037C88 0400628C */  lw         $v0, 0x4($v1)
/* 2848C 80037C8C 00000000 */  nop
/* 28490 80037C90 100002AE */  sw         $v0, 0x10($s0)
/* 28494 80037C94 0C00638C */  lw         $v1, 0xC($v1)
/* 28498 80037C98 01000224 */  addiu      $v0, $zero, 0x1
/* 2849C 80037C9C 140003AE */  sw         $v1, 0x14($s0)
.L80037CA0:
/* 284A0 80037CA0 1400BF8F */  lw         $ra, 0x14($sp)
/* 284A4 80037CA4 1000B08F */  lw         $s0, 0x10($sp)
/* 284A8 80037CA8 0800E003 */  jr         $ra
/* 284AC 80037CAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_SetupFileInfo, . - LOAD_SetupFileInfo
