.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CD_ReadPartOfFile
/* 28534 80037D34 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28538 80037D38 1000B0AF */  sw         $s0, 0x10($sp)
/* 2853C 80037D3C 1400BFAF */  sw         $ra, 0x14($sp)
/* 28540 80037D40 0ADF000C */  jal        LOAD_SetupFileInfo
/* 28544 80037D44 21808000 */   addu      $s0, $a0, $zero
/* 28548 80037D48 1D004010 */  beqz       $v0, .L80037DC0
/* 2854C 80037D4C 01000224 */   addiu     $v0, $zero, 0x1
/* 28550 80037D50 1000028E */  lw         $v0, 0x10($s0)
/* 28554 80037D54 94BB8327 */  addiu      $v1, $gp, %gp_rel(loadStatus)
/* 28558 80037D58 080060AC */  sw         $zero, 0x8($v1)
/* 2855C 80037D5C 040062AC */  sw         $v0, 0x4($v1)
/* 28560 80037D60 0C00028E */  lw         $v0, 0xC($s0)
/* 28564 80037D64 00000000 */  nop
/* 28568 80037D68 0C0062AC */  sw         $v0, 0xC($v1)
/* 2856C 80037D6C 0C00028E */  lw         $v0, 0xC($s0)
/* 28570 80037D70 00000000 */  nop
/* 28574 80037D74 100062AC */  sw         $v0, 0x10($v1)
/* 28578 80037D78 0800048E */  lw         $a0, 0x8($s0)
/* 2857C 80037D7C 05000224 */  addiu      $v0, $zero, 0x5
/* 28580 80037D80 140062AC */  sw         $v0, 0x14($v1)
/* 28584 80037D84 1C0060AC */  sw         $zero, 0x1C($v1)
/* 28588 80037D88 94BB84AF */  sw         $a0, %gp_rel(loadStatus)($gp)
/* 2858C 80037D8C 1400028E */  lw         $v0, 0x14($s0)
/* 28590 80037D90 00000000 */  nop
/* 28594 80037D94 180062AC */  sw         $v0, 0x18($v1)
/* 28598 80037D98 2400028E */  lw         $v0, 0x24($s0)
/* 2859C 80037D9C 00000000 */  nop
/* 285A0 80037DA0 200062AC */  sw         $v0, 0x20($v1)
/* 285A4 80037DA4 2800028E */  lw         $v0, 0x28($s0)
/* 285A8 80037DA8 00000000 */  nop
/* 285AC 80037DAC 240062AC */  sw         $v0, 0x24($v1)
/* 285B0 80037DB0 2C00028E */  lw         $v0, 0x2C($s0)
/* 285B4 80037DB4 1CBC80AF */  sw         $zero, %gp_rel(loadStatus + 0x88)($gp)
/* 285B8 80037DB8 71DF0008 */  j          .L80037DC4
/* 285BC 80037DBC 280062AC */   sw        $v0, 0x28($v1)
.L80037DC0:
/* 285C0 80037DC0 1CBC82AF */  sw         $v0, %gp_rel(loadStatus + 0x88)($gp)
.L80037DC4:
/* 285C4 80037DC4 1400BF8F */  lw         $ra, 0x14($sp)
/* 285C8 80037DC8 1000B08F */  lw         $s0, 0x10($sp)
/* 285CC 80037DCC 0800E003 */  jr         $ra
/* 285D0 80037DD0 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_CD_ReadPartOfFile, . - LOAD_CD_ReadPartOfFile
