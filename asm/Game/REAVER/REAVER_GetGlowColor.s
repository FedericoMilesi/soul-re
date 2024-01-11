.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel REAVER_GetGlowColor
/* 6B178 8007A978 6C01828C */  lw         $v0, 0x16C($a0)
/* 6B17C 8007A97C 00000000 */  nop
/* 6B180 8007A980 04004284 */  lh         $v0, 0x4($v0)
/* 6B184 8007A984 2400838C */  lw         $v1, 0x24($a0)
/* 6B188 8007A988 80100200 */  sll        $v0, $v0, 2
/* 6B18C 8007A98C 21104300 */  addu       $v0, $v0, $v1
/* 6B190 8007A990 FCFF428C */  lw         $v0, -0x4($v0)
/* 6B194 8007A994 0800E003 */  jr         $ra
/* 6B198 8007A998 00000000 */   nop
.size REAVER_GetGlowColor, . - REAVER_GetGlowColor
