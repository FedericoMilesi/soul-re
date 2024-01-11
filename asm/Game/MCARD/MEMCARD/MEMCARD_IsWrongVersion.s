.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMCARD_IsWrongVersion
/* A9D9C 800B959C 02008010 */  beqz       $a0, .L800B95A8
/* A9DA0 800B95A0 01000224 */   addiu     $v0, $zero, 0x1
/* A9DA4 800B95A4 0E008284 */  lh         $v0, 0xE($a0)
.L800B95A8:
/* A9DA8 800B95A8 0800E003 */  jr         $ra
/* A9DAC 800B95AC 00000000 */   nop
.size MEMCARD_IsWrongVersion, . - MEMCARD_IsWrongVersion
