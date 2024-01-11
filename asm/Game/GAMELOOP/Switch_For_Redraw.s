.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Switch_For_Redraw
/* 2093C 8003013C A0BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 20940 80030140 9CBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 20944 80030144 F8BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 20948 80030148 9CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 2094C 8003014C A0BF83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 20950 80030150 05008010 */  beqz       $a0, .L80030168
/* 20954 80030154 01000224 */   addiu     $v0, $zero, 0x1
/* 20958 80030158 F8BD80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x30)($gp)
/* 2095C 8003015C CCBD82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x4)($gp)
/* 20960 80030160 5CC00008 */  j          .L80030170
/* 20964 80030164 00000000 */   nop
.L80030168:
/* 20968 80030168 F8BD82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 2096C 8003016C CCBD80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x4)($gp)
.L80030170:
/* 20970 80030170 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20974 80030174 14BA838F */  lw         $v1, %gp_rel(primPool)($gp)
/* 20978 80030178 00000000 */  nop
/* 2097C 8003017C 06004314 */  bne        $v0, $v1, .L80030198
/* 20980 80030180 00000000 */   nop
/* 20984 80030184 18BA828F */  lw         $v0, %gp_rel(primPool + 0x4)($gp)
/* 20988 80030188 00000000 */  nop
/* 2098C 8003018C 08BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20990 80030190 67C00008 */  j          .L8003019C
/* 20994 80030194 00000000 */   nop
.L80030198:
/* 20998 80030198 08BE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
.L8003019C:
/* 2099C 8003019C 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 209A0 800301A0 00000000 */  nop
/* 209A4 800301A4 0C004324 */  addiu      $v1, $v0, 0xC
/* 209A8 800301A8 040043AC */  sw         $v1, 0x4($v0)
/* 209AC 800301AC 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 209B0 800301B0 0800E003 */  jr         $ra
/* 209B4 800301B4 000040AC */   sw        $zero, 0x0($v0)
.size Switch_For_Redraw, . - Switch_For_Redraw
