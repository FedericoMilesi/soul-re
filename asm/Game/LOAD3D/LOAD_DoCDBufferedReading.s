.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_DoCDBufferedReading
/* 27EB0 800376B0 C0BB838F */  lw         $v1, %gp_rel(loadStatus + 0x2C)($gp)
/* 27EB4 800376B4 05000224 */  addiu      $v0, $zero, 0x5
/* 27EB8 800376B8 02006214 */  bne        $v1, $v0, .L800376C4
/* 27EBC 800376BC 00000000 */   nop
/* 27EC0 800376C0 A8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x14)($gp)
.L800376C4:
/* 27EC4 800376C4 0800E003 */  jr         $ra
/* 27EC8 800376C8 00000000 */   nop
.size LOAD_DoCDBufferedReading, . - LOAD_DoCDBufferedReading
