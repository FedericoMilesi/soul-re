.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_NoMonsters
/* 49714 80058F14 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 49718 80058F18 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4971C 80058F1C 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 49720 80058F20 1000BFAF */  sw         $ra, 0x10($sp)
/* 49724 80058F24 25104300 */  or         $v0, $v0, $v1
/* 49728 80058F28 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4972C 80058F2C A163010C */  jal        STREAM_DumpSomeMonsters
/* 49730 80058F30 00000000 */   nop
/* 49734 80058F34 1000BF8F */  lw         $ra, 0x10($sp)
/* 49738 80058F38 00000000 */  nop
/* 4973C 80058F3C 0800E003 */  jr         $ra
/* 49740 80058F40 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_NoMonsters, . - STREAM_NoMonsters
