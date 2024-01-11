.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_PlayXA
/* 510B0 800608B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 510B4 800608B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 510B8 800608B8 1400BFAF */  sw         $ra, 0x14($sp)
/* 510BC 800608BC 2580010C */  jal        STREAM_AddQueueEntryToTail
/* 510C0 800608C0 21808000 */   addu      $s0, $a0, $zero
/* 510C4 800608C4 08000324 */  addiu      $v1, $zero, 0x8
/* 510C8 800608C8 040043A4 */  sh         $v1, 0x4($v0)
/* 510CC 800608CC 0D80033C */  lui        $v1, %hi(gCurDir + 0x64)
/* 510D0 800608D0 080050AC */  sw         $s0, 0x8($v0)
/* 510D4 800608D4 E0196824 */  addiu      $t0, $v1, %lo(gCurDir + 0x64)
/* 510D8 800608D8 0000058D */  lw         $a1, 0x0($t0)
/* 510DC 800608DC 04000685 */  lh         $a2, 0x4($t0)
/* 510E0 800608E0 3C0045AC */  sw         $a1, 0x3C($v0)
/* 510E4 800608E4 400046A4 */  sh         $a2, 0x40($v0)
/* 510E8 800608E8 1400BF8F */  lw         $ra, 0x14($sp)
/* 510EC 800608EC 1000B08F */  lw         $s0, 0x10($sp)
/* 510F0 800608F0 0800E003 */  jr         $ra
/* 510F4 800608F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_PlayXA, . - LOAD_PlayXA
