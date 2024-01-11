.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadShutdown
/* 426E0 80051EE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 426E4 80051EE4 1000BFAF */  sw         $ra, 0x10($sp)
/* 426E8 80051EE8 A5FC020C */  jal        func_800BF294
/* 426EC 80051EEC 00000000 */   nop
/* 426F0 80051EF0 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 426F4 80051EF4 05F5020C */  jal        func_800BD414
/* 426F8 80051EF8 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
/* 426FC 80051EFC 04C7848F */  lw         $a0, %gp_rel(__hblankEvent)($gp)
/* 42700 80051F00 DDFC020C */  jal        func_800BF374
/* 42704 80051F04 00000000 */   nop
/* 42708 80051F08 04C7848F */  lw         $a0, %gp_rel(__hblankEvent)($gp)
/* 4270C 80051F0C 11FD020C */  jal        func_800BF444
/* 42710 80051F10 00000000 */   nop
/* 42714 80051F14 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 42718 80051F18 00000000 */  nop
/* 4271C 80051F1C 2400628C */  lw         $v0, 0x24($v1)
/* 42720 80051F20 00000000 */  nop
/* 42724 80051F24 02004234 */  ori        $v0, $v0, 0x2
/* 42728 80051F28 11FC020C */  jal        func_800BF044
/* 4272C 80051F2C 240062AC */   sw        $v0, 0x24($v1)
/* 42730 80051F30 21200000 */  addu       $a0, $zero, $zero
/* 42734 80051F34 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 42738 80051F38 C9FE020C */  jal        func_800BFB24
/* 4273C 80051F3C FFFFA534 */   ori       $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 42740 80051F40 6051010C */  jal        aadGetReverbMode
/* 42744 80051F44 00000000 */   nop
/* 42748 80051F48 5CFF020C */  jal        func_800BFD70
/* 4274C 80051F4C 21204000 */   addu      $a0, $v0, $zero
/* 42750 80051F50 3C00030C */  jal        func_800C00F0
/* 42754 80051F54 00000000 */   nop
/* 42758 80051F58 1000BF8F */  lw         $ra, 0x10($sp)
/* 4275C 80051F5C D89B80AF */  sw         $zero, %gp_rel(aadMem)($gp)
/* 42760 80051F60 0800E003 */  jr         $ra
/* 42764 80051F64 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadShutdown, . - aadShutdown
