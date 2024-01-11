.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_UpdateFog
/* 3704 80012F04 F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 3708 80012F08 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 370C 80012F0C 1000BFAF */  sw         $ra, 0x10($sp)
/* 3710 80012F10 FC62010C */  jal        FindStreamUnitFromLevel
/* 3714 80012F14 00000000 */   nop
/* 3718 80012F18 F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 371C 80012F1C 40808397 */  lhu        $v1, %gp_rel(debugFogFar)($gp)
/* 3720 80012F20 00000000 */  nop
/* 3724 80012F24 440083A4 */  sh         $v1, 0x44($a0)
/* 3728 80012F28 380043A4 */  sh         $v1, 0x38($v0)
/* 372C 80012F2C A40083A4 */  sh         $v1, 0xA4($a0)
/* 3730 80012F30 F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 3734 80012F34 44808397 */  lhu        $v1, %gp_rel(debugFogNear)($gp)
/* 3738 80012F38 00000000 */  nop
/* 373C 80012F3C 460083A4 */  sh         $v1, 0x46($a0)
/* 3740 80012F40 3A0043A4 */  sh         $v1, 0x3A($v0)
/* 3744 80012F44 A60083A4 */  sh         $v1, 0xA6($a0)
/* 3748 80012F48 5480838F */  lw         $v1, %gp_rel(debugFogBlu)($gp)
/* 374C 80012F4C 5080848F */  lw         $a0, %gp_rel(debugFogGrn)($gp)
/* 3750 80012F50 001C0300 */  sll        $v1, $v1, 16
/* 3754 80012F54 00220400 */  sll        $a0, $a0, 8
/* 3758 80012F58 25186400 */  or         $v1, $v1, $a0
/* 375C 80012F5C 4C80848F */  lw         $a0, %gp_rel(debugFogRed)($gp)
/* 3760 80012F60 F0BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x28)($gp)
/* 3764 80012F64 25186400 */  or         $v1, $v1, $a0
/* 3768 80012F68 300043AC */  sw         $v1, 0x30($v0)
/* 376C 80012F6C 3C00A3AC */  sw         $v1, 0x3C($a1)
/* 3770 80012F70 F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 3774 80012F74 6DDC000C */  jal        LIGHT_CalcDQPTable
/* 3778 80012F78 00000000 */   nop
/* 377C 80012F7C 1000BF8F */  lw         $ra, 0x10($sp)
/* 3780 80012F80 00000000 */  nop
/* 3784 80012F84 0800E003 */  jr         $ra
/* 3788 80012F88 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_UpdateFog, . - DEBUG_UpdateFog
