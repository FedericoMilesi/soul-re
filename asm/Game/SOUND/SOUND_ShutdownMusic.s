.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_ShutdownMusic
/* 31824 80041024 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31828 80041028 1000BFAF */  sw         $ra, 0x10($sp)
/* 3182C 8004102C 2E52010C */  jal        aadStopAllSlots
/* 31830 80041030 00000000 */   nop
/* 31834 80041034 A5FC020C */  jal        EnterCriticalSection
/* 31838 80041038 00000000 */   nop
/* 3183C 8004103C 2CC3838F */  lw         $v1, %gp_rel(musicInfo)($gp)
/* 31840 80041040 01000224 */  addiu      $v0, $zero, 0x1
/* 31844 80041044 05006210 */  beq        $v1, $v0, .L8004105C
/* 31848 80041048 03000224 */   addiu     $v0, $zero, 0x3
/* 3184C 8004104C 03006210 */  beq        $v1, $v0, .L8004105C
/* 31850 80041050 07000224 */   addiu     $v0, $zero, 0x7
/* 31854 80041054 10006214 */  bne        $v1, $v0, .L80041098
/* 31858 80041058 00000000 */   nop
.L8004105C:
/* 3185C 8004105C 30C380AF */  sw         $zero, %gp_rel(musicInfo + 0x4)($gp)
/* 31860 80041060 11FC020C */  jal        ExitCriticalSection
/* 31864 80041064 00000000 */   nop
/* 31868 80041068 2CC3828F */  lw         $v0, %gp_rel(musicInfo)($gp)
/* 3186C 8004106C 00000000 */  nop
/* 31870 80041070 0B004010 */  beqz       $v0, .L800410A0
/* 31874 80041074 00000000 */   nop
.L80041078:
/* 31878 80041078 7580010C */  jal        STREAM_PollLoadQueue
/* 3187C 8004107C 00000000 */   nop
/* 31880 80041080 2CC3828F */  lw         $v0, %gp_rel(musicInfo)($gp)
/* 31884 80041084 00000000 */  nop
/* 31888 80041088 05004010 */  beqz       $v0, .L800410A0
/* 3188C 8004108C 00000000 */   nop
/* 31890 80041090 1E040108 */  j          .L80041078
/* 31894 80041094 00000000 */   nop
.L80041098:
/* 31898 80041098 11FC020C */  jal        ExitCriticalSection
/* 3189C 8004109C 00000000 */   nop
.L800410A0:
/* 318A0 800410A0 44C380A3 */  sb         $zero, %gp_rel(musicInfo + 0x18)($gp)
/* 318A4 800410A4 584A010C */  jal        aadFreeDynamicSoundBank
/* 318A8 800410A8 21200000 */   addu      $a0, $zero, $zero
/* 318AC 800410AC 584A010C */  jal        aadFreeDynamicSoundBank
/* 318B0 800410B0 01000424 */   addiu     $a0, $zero, 0x1
/* 318B4 800410B4 01000524 */  addiu      $a1, $zero, 0x1
/* 318B8 800410B8 7CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B4)($gp)
/* 318BC 800410BC 2CC380AF */  sw         $zero, %gp_rel(musicInfo)($gp)
/* 318C0 800410C0 B247010C */  jal        aadStartMusicMasterVolFade
/* 318C4 800410C4 21300000 */   addu      $a2, $zero, $zero
/* 318C8 800410C8 1000BF8F */  lw         $ra, 0x10($sp)
/* 318CC 800410CC 00000000 */  nop
/* 318D0 800410D0 0800E003 */  jr         $ra
/* 318D4 800410D4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_ShutdownMusic, . - SOUND_ShutdownMusic
