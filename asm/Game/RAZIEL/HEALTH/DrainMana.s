.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrainMana
/* 95578 800A4D78 40FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x410)($gp)
/* 9557C 800A4D7C 00000000 */  nop
/* 95580 800A4D80 23104400 */  subu       $v0, $v0, $a0
/* 95584 800A4D84 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* 95588 800A4D88 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 9558C 800A4D8C 02004014 */  bnez       $v0, .L800A4D98
/* 95590 800A4D90 00000000 */   nop
/* 95594 800A4D94 40FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x410)($gp)
.L800A4D98:
/* 95598 800A4D98 42FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x412)($gp)
/* 9559C 800A4D9C 40FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x410)($gp)
/* 955A0 800A4DA0 00000000 */  nop
/* 955A4 800A4DA4 2B106200 */  sltu       $v0, $v1, $v0
/* 955A8 800A4DA8 02004010 */  beqz       $v0, .L800A4DB4
/* 955AC 800A4DAC 00000000 */   nop
/* 955B0 800A4DB0 40FA83A7 */  sh         $v1, %gp_rel(Raziel + 0x410)($gp)
.L800A4DB4:
/* 955B4 800A4DB4 0800E003 */  jr         $ra
/* 955B8 800A4DB8 00000000 */   nop
.size DrainMana, . - DrainMana
