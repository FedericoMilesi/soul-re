.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_DebugHealthFillUp
/* 956D0 800A4ED0 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 956D4 800A4ED4 01000224 */  addiu      $v0, $zero, 0x1
/* 956D8 800A4ED8 10006214 */  bne        $v1, $v0, .L800A4F1C
/* 956DC 800A4EDC 0100053C */   lui       $a1, (0x186A0 >> 16)
/* 956E0 800A4EE0 28FA8487 */  lh         $a0, %gp_rel(Raziel + 0x3F8)($gp)
/* 956E4 800A4EE4 A086A534 */  ori        $a1, $a1, (0x186A0 & 0xFFFF)
/* 956E8 800A4EE8 04104400 */  sllv       $v0, $a0, $v0
/* 956EC 800A4EEC 21104400 */  addu       $v0, $v0, $a0
/* 956F0 800A4EF0 80190200 */  sll        $v1, $v0, 6
/* 956F4 800A4EF4 21104300 */  addu       $v0, $v0, $v1
/* 956F8 800A4EF8 80100200 */  sll        $v0, $v0, 2
/* 956FC 800A4EFC 21104400 */  addu       $v0, $v0, $a0
/* 95700 800A4F00 80100200 */  sll        $v0, $v0, 2
/* 95704 800A4F04 21104400 */  addu       $v0, $v0, $a0
/* 95708 800A4F08 40110200 */  sll        $v0, $v0, 5
/* 9570C 800A4F0C 21104500 */  addu       $v0, $v0, $a1
/* 95710 800A4F10 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95714 800A4F14 0800E003 */  jr         $ra
/* 95718 800A4F18 00000000 */   nop
.L800A4F1C:
/* 9571C 800A4F1C 0100023C */  lui        $v0, (0x186A0 >> 16)
/* 95720 800A4F20 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 95724 800A4F24 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95728 800A4F28 0800E003 */  jr         $ra
/* 9572C 800A4F2C 00000000 */   nop
.size RAZIEL_DebugHealthFillUp, . - RAZIEL_DebugHealthFillUp
