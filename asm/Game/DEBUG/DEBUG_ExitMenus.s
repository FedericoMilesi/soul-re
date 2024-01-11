.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ExitMenus
/* 3E64 80013664 0C8A848F */  lw         $a0, %gp_rel(currentMenu)($gp)
/* 3E68 80013668 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3E6C 8001366C 1000BFAF */  sw         $ra, 0x10($sp)
/* 3E70 80013670 8E4D000C */  jal        DEBUG_MenuCountLength
/* 3E74 80013674 00000000 */   nop
/* 3E78 80013678 40180200 */  sll        $v1, $v0, 1
/* 3E7C 8001367C 21186200 */  addu       $v1, $v1, $v0
/* 3E80 80013680 C0180300 */  sll        $v1, $v1, 3
/* 3E84 80013684 0C8A828F */  lw         $v0, %gp_rel(currentMenu)($gp)
/* 3E88 80013688 108A848F */  lw         $a0, %gp_rel(debugMenuChoice)($gp)
/* 3E8C 8001368C 21186200 */  addu       $v1, $v1, $v0
/* 3E90 80013690 040064AC */  sw         $a0, 0x4($v1)
/* 3E94 80013694 89BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C1)($gp)
/* 3E98 80013698 00000000 */  nop
/* 3E9C 8001369C 07004014 */  bnez       $v0, .L800136BC
/* 3EA0 800136A0 00000000 */   nop
/* 3EA4 800136A4 C501010C */  jal        SOUND_MusicOff
/* 3EA8 800136A8 00000000 */   nop
/* 3EAC 800136AC 0904010C */  jal        SOUND_ShutdownMusic
/* 3EB0 800136B0 00000000 */   nop
/* 3EB4 800136B4 B14D0008 */  j          .L800136C4
/* 3EB8 800136B8 00000000 */   nop
.L800136BC:
/* 3EBC 800136BC DE01010C */  jal        SOUND_MusicOn
/* 3EC0 800136C0 00000000 */   nop
.L800136C4:
/* 3EC4 800136C4 88BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 3EC8 800136C8 00000000 */  nop
/* 3ECC 800136CC 05004014 */  bnez       $v0, .L800136E4
/* 3ED0 800136D0 00000000 */   nop
/* 3ED4 800136D4 EC01010C */  jal        SOUND_SfxOff
/* 3ED8 800136D8 00000000 */   nop
/* 3EDC 800136DC BB4D0008 */  j          .L800136EC
/* 3EE0 800136E0 00000000 */   nop
.L800136E4:
/* 3EE4 800136E4 F401010C */  jal        SOUND_SfxOn
/* 3EE8 800136E8 00000000 */   nop
.L800136EC:
/* 3EEC 800136EC 1000BF8F */  lw         $ra, 0x10($sp)
/* 3EF0 800136F0 00000000 */  nop
/* 3EF4 800136F4 0800E003 */  jr         $ra
/* 3EF8 800136F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_ExitMenus, . - DEBUG_ExitMenus
