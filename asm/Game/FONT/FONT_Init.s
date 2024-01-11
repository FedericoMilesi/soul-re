.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_Init
/* 1D758 8002CF58 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1D75C 8002CF5C 1800A427 */  addiu      $a0, $sp, 0x18
/* 1D760 8002CF60 1A00A527 */  addiu      $a1, $sp, 0x1A
/* 1D764 8002CF64 10000624 */  addiu      $a2, $zero, 0x10
/* 1D768 8002CF68 80000724 */  addiu      $a3, $zero, 0x80
/* 1D76C 8002CF6C 03000224 */  addiu      $v0, $zero, 0x3
/* 1D770 8002CF70 1000A2AF */  sw         $v0, 0x10($sp)
/* 1D774 8002CF74 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 1D778 8002CF78 2400BFAF */  sw         $ra, 0x24($sp)
/* 1D77C 8002CF7C 2000B0AF */  sw         $s0, 0x20($sp)
/* 1D780 8002CF80 80CD010C */  jal        VRAM_CheckVramSlot
/* 1D784 8002CF84 1400A2AF */   sw        $v0, 0x14($sp)
/* 1D788 8002CF88 E4B382AF */  sw         $v0, %gp_rel(FONT_vramBlock)($gp)
/* 1D78C 8002CF8C 2E004010 */  beqz       $v0, .L8002D048
/* 1D790 8002CF90 0D80043C */   lui       $a0, %hi(the_font_color_table + 0x3C)
/* 1D794 8002CF94 74068424 */  addiu      $a0, $a0, %lo(the_font_color_table + 0x3C)
/* 1D798 8002CF98 3E82010C */  jal        LOAD_ReadFile
/* 1D79C 8002CF9C 05000524 */   addiu     $a1, $zero, 0x5
/* 1D7A0 8002CFA0 21804000 */  addu       $s0, $v0, $zero
/* 1D7A4 8002CFA4 21200002 */  addu       $a0, $s0, $zero
/* 1D7A8 8002CFA8 1800A587 */  lh         $a1, 0x18($sp)
/* 1D7AC 8002CFAC 1A00A687 */  lh         $a2, 0x1A($sp)
/* 1D7B0 8002CFB0 2138A000 */  addu       $a3, $a1, $zero
/* 1D7B4 8002CFB4 7E00C224 */  addiu      $v0, $a2, 0x7E
/* 1D7B8 8002CFB8 2CE0000C */  jal        LOAD_LoadTIM
/* 1D7BC 8002CFBC 1000A2AF */   sw        $v0, 0x10($sp)
/* 1D7C0 8002CFC0 2641010C */  jal        MEMPACK_Free
/* 1D7C4 8002CFC4 21200002 */   addu      $a0, $s0, $zero
/* 1D7C8 8002CFC8 1800A797 */  lhu        $a3, 0x18($sp)
/* 1D7CC 8002CFCC 1A00A697 */  lhu        $a2, 0x1A($sp)
/* 1D7D0 8002CFD0 02BA80A7 */  sh         $zero, %gp_rel(fontTracker + 0x616)($gp)
/* 1D7D4 8002CFD4 00440700 */  sll        $t0, $a3, 16
/* 1D7D8 8002CFD8 03240800 */  sra        $a0, $t0, 16
/* 1D7DC 8002CFDC 002C0600 */  sll        $a1, $a2, 16
/* 1D7E0 8002CFE0 032C0500 */  sra        $a1, $a1, 16
/* 1D7E4 8002CFE4 0001C330 */  andi       $v1, $a2, 0x100
/* 1D7E8 8002CFE8 001C0300 */  sll        $v1, $v1, 16
/* 1D7EC 8002CFEC 031D0300 */  sra        $v1, $v1, 20
/* 1D7F0 8002CFF0 FF03E230 */  andi       $v0, $a3, 0x3FF
/* 1D7F4 8002CFF4 82110200 */  srl        $v0, $v0, 6
/* 1D7F8 8002CFF8 25186200 */  or         $v1, $v1, $v0
/* 1D7FC 8002CFFC 0002C230 */  andi       $v0, $a2, 0x200
/* 1D800 8002D000 80100200 */  sll        $v0, $v0, 2
/* 1D804 8002D004 25186200 */  or         $v1, $v1, $v0
/* 1D808 8002D008 7E00C224 */  addiu      $v0, $a2, 0x7E
/* 1D80C 8002D00C 80110200 */  sll        $v0, $v0, 6
/* 1D810 8002D010 03450800 */  sra        $t0, $t0, 20
/* 1D814 8002D014 3F000831 */  andi       $t0, $t0, 0x3F
/* 1D818 8002D018 25104800 */  or         $v0, $v0, $t0
/* 1D81C 8002D01C 04BA87A7 */  sh         $a3, %gp_rel(fontTracker + 0x618)($gp)
/* 1D820 8002D020 3F00E730 */  andi       $a3, $a3, 0x3F
/* 1D824 8002D024 80380700 */  sll        $a3, $a3, 2
/* 1D828 8002D028 06BA86A7 */  sh         $a2, %gp_rel(fontTracker + 0x61A)($gp)
/* 1D82C 8002D02C FF00C630 */  andi       $a2, $a2, 0xFF
/* 1D830 8002D030 F8B983A7 */  sh         $v1, %gp_rel(fontTracker + 0x60C)($gp)
/* 1D834 8002D034 FAB982A7 */  sh         $v0, %gp_rel(fontTracker + 0x60E)($gp)
/* 1D838 8002D038 FCB987A7 */  sh         $a3, %gp_rel(fontTracker + 0x610)($gp)
/* 1D83C 8002D03C FEB986A7 */  sh         $a2, %gp_rel(fontTracker + 0x612)($gp)
/* 1D840 8002D040 B5B3000C */  jal        FONT_MakeSpecialFogClut
/* 1D844 8002D044 7F00A524 */   addiu     $a1, $a1, 0x7F
.L8002D048:
/* 1D848 8002D048 2400BF8F */  lw         $ra, 0x24($sp)
/* 1D84C 8002D04C 2000B08F */  lw         $s0, 0x20($sp)
/* 1D850 8002D050 0A000224 */  addiu      $v0, $zero, 0xA
/* 1D854 8002D054 ECB982AF */  sw         $v0, %gp_rel(fontTracker + 0x600)($gp)
/* 1D858 8002D058 10000224 */  addiu      $v0, $zero, 0x10
/* 1D85C 8002D05C F0B982AF */  sw         $v0, %gp_rel(fontTracker + 0x604)($gp)
/* 1D860 8002D060 F4B980AF */  sw         $zero, %gp_rel(fontTracker + 0x608)($gp)
/* 1D864 8002D064 02BA80A7 */  sh         $zero, %gp_rel(fontTracker + 0x616)($gp)
/* 1D868 8002D068 08BA80A3 */  sb         $zero, %gp_rel(fontTracker + 0x61C)($gp)
/* 1D86C 8002D06C 09BA80A3 */  sb         $zero, %gp_rel(fontTracker + 0x61D)($gp)
/* 1D870 8002D070 0800E003 */  jr         $ra
/* 1D874 8002D074 2800BD27 */   addiu     $sp, $sp, 0x28
.size FONT_Init, . - FONT_Init
