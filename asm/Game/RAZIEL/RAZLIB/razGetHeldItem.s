.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razGetHeldItem
/* 96484 800A5C84 34F6828F */  lw         $v0, %gp_rel(Raziel + 0x4)($gp)
/* 96488 800A5C88 60FA838F */  lw         $v1, %gp_rel(Raziel + 0x430)($gp)
/* 9648C 800A5C8C 4C01428C */  lw         $v0, 0x14C($v0)
/* 96490 800A5C90 08006010 */  beqz       $v1, .L800A5CB4
/* 96494 800A5C94 00000000 */   nop
/* 96498 800A5C98 06004314 */  bne        $v0, $v1, .L800A5CB4
/* 9649C 800A5C9C 00000000 */   nop
/* 964A0 800A5CA0 04004010 */  beqz       $v0, .L800A5CB4
/* 964A4 800A5CA4 00000000 */   nop
/* 964A8 800A5CA8 5001428C */  lw         $v0, 0x150($v0)
/* 964AC 800A5CAC 0800E003 */  jr         $ra
/* 964B0 800A5CB0 00000000 */   nop
.L800A5CB4:
/* 964B4 800A5CB4 0800E003 */  jr         $ra
/* 964B8 800A5CB8 00000000 */   nop
.size razGetHeldItem, . - razGetHeldItem
