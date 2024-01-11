.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_MusicInit
/* 311E4 800409E4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 311E8 800409E8 2CC380AF */  sw         $zero, %gp_rel(musicInfo)($gp)
/* 311EC 800409EC 34C380AF */  sw         $zero, %gp_rel(musicInfo + 0x8)($gp)
/* 311F0 800409F0 3CC380AF */  sw         $zero, %gp_rel(musicInfo + 0x10)($gp)
/* 311F4 800409F4 40C382AF */  sw         $v0, %gp_rel(musicInfo + 0x14)($gp)
/* 311F8 800409F8 44C380A3 */  sb         $zero, %gp_rel(musicInfo + 0x18)($gp)
/* 311FC 800409FC 74C380AF */  sw         $zero, %gp_rel(musicInfo + 0x48)($gp)
/* 31200 80040A00 70C380AF */  sw         $zero, %gp_rel(musicInfo + 0x44)($gp)
/* 31204 80040A04 6CC380AF */  sw         $zero, %gp_rel(musicInfo + 0x40)($gp)
/* 31208 80040A08 0800E003 */  jr         $ra
/* 3120C 80040A0C 00000000 */   nop
.size SOUND_MusicInit, . - SOUND_MusicInit
