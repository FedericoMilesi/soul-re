.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_DoMainInit
/* 29750 80038F50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29754 80038F54 1000BFAF */  sw         $ra, 0x10($sp)
/* 29758 80038F58 76E2000C */  jal        InitDisplay
/* 2975C 80038F5C 00000000 */   nop
/* 29760 80038F60 B3FC020C */  jal        InitGeom
/* 29764 80038F64 00000000 */   nop
/* 29768 80038F68 00010424 */  addiu      $a0, $zero, 0x100
/* 2976C 80038F6C A9FC020C */  jal        SetGeomOffset
/* 29770 80038F70 78000524 */   addiu     $a1, $zero, 0x78
/* 29774 80038F74 0AF3020C */  jal        SetGeomScreen
/* 29778 80038F78 40010424 */   addiu     $a0, $zero, 0x140
/* 2977C 80038F7C A5CB010C */  jal        VRAM_InitVramBlockCache
/* 29780 80038F80 00000000 */   nop
/* 29784 80038F84 D6B3000C */  jal        FONT_Init
/* 29788 80038F88 00000000 */   nop
/* 2978C 80038F8C 0480043C */  lui        $a0, %hi(VblTick)
/* 29790 80038F90 E0BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x118)($gp)
/* 29794 80038F94 C3E6020C */  jal        VSyncCallback
/* 29798 80038F98 C08B8424 */   addiu     $a0, $a0, %lo(VblTick)
/* 2979C 80038F9C 0480043C */  lui        $a0, %hi(DrawCallback)
/* 297A0 80038FA0 D1E8020C */  jal        DrawSyncCallback
/* 297A4 80038FA4 2C8C8424 */   addiu     $a0, $a0, %lo(DrawCallback)
/* 297A8 80038FA8 4AC6000C */  jal        GAMEPAD_Init
/* 297AC 80038FAC 00000000 */   nop
/* 297B0 80038FB0 3101010C */  jal        SOUND_Init
/* 297B4 80038FB4 00000000 */   nop
/* 297B8 80038FB8 B8DA020C */  jal        VOICEXA_Init
/* 297BC 80038FBC 00000000 */   nop
/* 297C0 80038FC0 5C94828F */  lw         $v0, %gp_rel(nosound)($gp)
/* 297C4 80038FC4 00000000 */  nop
/* 297C8 80038FC8 05004010 */  beqz       $v0, .L80038FE0
/* 297CC 80038FCC 00000000 */   nop
/* 297D0 80038FD0 EC01010C */  jal        SOUND_SfxOff
/* 297D4 80038FD4 00000000 */   nop
/* 297D8 80038FD8 88BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 297DC 80038FDC 8ABF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C2)($gp)
.L80038FE0:
/* 297E0 80038FE0 6094828F */  lw         $v0, %gp_rel(nomusic)($gp)
/* 297E4 80038FE4 00000000 */  nop
/* 297E8 80038FE8 04004010 */  beqz       $v0, .L80038FFC
/* 297EC 80038FEC 00000000 */   nop
/* 297F0 80038FF0 C501010C */  jal        SOUND_MusicOff
/* 297F4 80038FF4 00000000 */   nop
/* 297F8 80038FF8 89BF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C1)($gp)
.L80038FFC:
/* 297FC 80038FFC 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 29800 80039000 0800033C */  lui        $v1, (0x80000 >> 16)
/* 29804 80039004 24104300 */  and        $v0, $v0, $v1
/* 29808 80039008 02004014 */  bnez       $v0, .L80039014
/* 2980C 8003900C 00000000 */   nop
/* 29810 80039010 8ABF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C2)($gp)
.L80039014:
/* 29814 80039014 E0BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x118)
/* 29818 80039018 C1E3000C */  jal        init_menus
/* 2981C 8003901C E8FE8424 */   addiu     $a0, $a0, -0x118
/* 29820 80039020 88BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0xC0)
/* 29824 80039024 C0D4020C */  jal        SAVE_Init
/* 29828 80039028 40FF8424 */   addiu     $a0, $a0, -0xC0
/* 2982C 8003902C 46F2020C */  jal        srand
/* 29830 80039030 21200000 */   addu      $a0, $zero, $zero
/* 29834 80039034 1000BF8F */  lw         $ra, 0x10($sp)
/* 29838 80039038 00000000 */  nop
/* 2983C 8003903C 0800E003 */  jr         $ra
/* 29840 80039040 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_DoMainInit, . - MAIN_DoMainInit
