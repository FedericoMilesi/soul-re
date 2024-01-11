.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_PlaneShift
/* 317E8 80040FE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 317EC 80040FEC 89BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C1)($gp)
/* 317F0 80040FF0 21288000 */  addu       $a1, $a0, $zero
/* 317F4 80040FF4 05004010 */  beqz       $v0, .L8004100C
/* 317F8 80040FF8 1000BFAF */   sw        $ra, 0x10($sp)
/* 317FC 80040FFC 6702010C */  jal        SOUND_PutMusicCommand
/* 31800 80041000 21200000 */   addu      $a0, $zero, $zero
/* 31804 80041004 05040108 */  j          .L80041014
/* 31808 80041008 00000000 */   nop
.L8004100C:
/* 3180C 8004100C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 31810 80041010 40C382AF */  sw         $v0, %gp_rel(musicInfo + 0x14)($gp)
.L80041014:
/* 31814 80041014 1000BF8F */  lw         $ra, 0x10($sp)
/* 31818 80041018 00000000 */  nop
/* 3181C 8004101C 0800E003 */  jr         $ra
/* 31820 80041020 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_PlaneShift, . - SOUND_PlaneShift
