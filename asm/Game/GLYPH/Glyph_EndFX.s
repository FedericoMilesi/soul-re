.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Glyph_EndFX
/* 6C944 8007C144 F4A4828F */  lw         $v0, %gp_rel(fx_blastring)($gp)
/* 6C948 8007C148 F0A480A7 */  sh         $zero, %gp_rel(fx_going)($gp)
/* 6C94C 8007C14C F4A480AF */  sw         $zero, %gp_rel(fx_blastring)($gp)
/* 6C950 8007C150 0800E003 */  jr         $ra
/* 6C954 8007C154 0E0040A4 */   sh        $zero, 0xE($v0)
.size Glyph_EndFX, . - Glyph_EndFX
