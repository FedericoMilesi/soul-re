.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ReloadCurrentLevel
/* 4CBC 800144BC 36BF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x16E)($gp)
/* 4CC0 800144C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4CC4 800144C4 12004014 */  bnez       $v0, .L80014510
/* 4CC8 800144C8 1000BFAF */   sw        $ra, 0x10($sp)
/* 4CCC 800144CC 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 4CD0 800144D0 2000033C */  lui        $v1, (0x200000 >> 16)
/* 4CD4 800144D4 24104300 */  and        $v0, $v0, $v1
/* 4CD8 800144D8 03004010 */  beqz       $v0, .L800144E8
/* 4CDC 800144DC 00000000 */   nop
/* 4CE0 800144E0 3DDA020C */  jal        SAVE_SaveGame
/* 4CE4 800144E4 00000000 */   nop
.L800144E8:
/* 4CE8 800144E8 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4CEC 800144EC 00000000 */  nop
/* 4CF0 800144F0 01004234 */  ori        $v0, $v0, 0x1
/* 4CF4 800144F4 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4CF8 800144F8 B901010C */  jal        SOUND_ResetAllSound
/* 4CFC 800144FC 00000000 */   nop
/* 4D00 80014500 01000224 */  addiu      $v0, $zero, 0x1
/* 4D04 80014504 36BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x16E)($gp)
/* 4D08 80014508 04000224 */  addiu      $v0, $zero, 0x4
/* 4D0C 8001450C 34BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x16C)($gp)
.L80014510:
/* 4D10 80014510 1000BF8F */  lw         $ra, 0x10($sp)
/* 4D14 80014514 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 4D18 80014518 0800E003 */  jr         $ra
/* 4D1C 8001451C 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_ReloadCurrentLevel, . - DEBUG_ReloadCurrentLevel
