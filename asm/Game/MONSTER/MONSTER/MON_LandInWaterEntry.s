.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_LandInWaterEntry
/* 78D78 80088578 5800828C */  lw         $v0, 0x58($a0)
/* 78D7C 8008857C DFFF0324 */  addiu      $v1, $zero, -0x21
/* 78D80 80088580 24104300 */  and        $v0, $v0, $v1
/* 78D84 80088584 0800E003 */  jr         $ra
/* 78D88 80088588 580082AC */   sw        $v0, 0x58($a0)
.size MON_LandInWaterEntry, . - MON_LandInWaterEntry
