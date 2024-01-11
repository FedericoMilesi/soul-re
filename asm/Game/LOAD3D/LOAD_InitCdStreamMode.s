.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_InitCdStreamMode
/* 28AD4 800382D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28AD8 800382D8 A0000224 */  addiu      $v0, $zero, 0xA0
/* 28ADC 800382DC 0380043C */  lui        $a0, %hi(LOAD_CdReadReady)
/* 28AE0 800382E0 64748424 */  addiu      $a0, $a0, %lo(LOAD_CdReadReady)
/* 28AE4 800382E4 1800BFAF */  sw         $ra, 0x18($sp)
/* 28AE8 800382E8 4BF8020C */  jal        func_800BE12C
/* 28AEC 800382EC 1000A2A3 */   sb        $v0, 0x10($sp)
/* 28AF0 800382F0 0380043C */  lui        $a0, %hi(LOAD_CdSeekCallback)
/* 28AF4 800382F4 46F8020C */  jal        func_800BE118
/* 28AF8 800382F8 F8728424 */   addiu     $a0, $a0, %lo(LOAD_CdSeekCallback)
/* 28AFC 800382FC 0E000424 */  addiu      $a0, $zero, 0xE
/* 28B00 80038300 1000A527 */  addiu      $a1, $sp, 0x10
/* 28B04 80038304 50F8020C */  jal        func_800BE140
/* 28B08 80038308 21300000 */   addu      $a2, $zero, $zero
/* 28B0C 8003830C 1800BF8F */  lw         $ra, 0x18($sp)
/* 28B10 80038310 00000000 */  nop
/* 28B14 80038314 0800E003 */  jr         $ra
/* 28B18 80038318 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_InitCdStreamMode, . - LOAD_InitCdStreamMode
