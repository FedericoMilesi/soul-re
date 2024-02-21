.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_RestoreGlobalSaveTracker
/* A6F70 800B6770 40A8848F */  lw         $a0, %gp_rel(GlobalSave)($gp)
/* A6F74 800B6774 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6F78 800B6778 1000BFAF */  sw         $ra, 0x10($sp)
/* A6F7C 800B677C 06008384 */  lh         $v1, 0x6($a0)
/* A6F80 800B6780 21550224 */  addiu      $v0, $zero, 0x5521
/* A6F84 800B6784 06006210 */  beq        $v1, $v0, .L800B67A0
/* A6F88 800B6788 00000000 */   nop
/* A6F8C 800B678C 0D80043C */  lui        $a0, %hi(D_800D1E84)
/* A6F90 800B6790 2B52000C */  jal        DEBUG_FatalError
/* A6F94 800B6794 841E8424 */   addiu     $a0, $a0, %lo(D_800D1E84)
/* A6F98 800B6798 0CDA0208 */  j          .L800B6830
/* A6F9C 800B679C 00000000 */   nop
.L800B67A0:
/* A6FA0 800B67A0 0800828C */  lw         $v0, 0x8($a0)
/* A6FA4 800B67A4 00000000 */  nop
/* A6FA8 800B67A8 F4BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* A6FAC 800B67AC 78BF8827 */  addiu      $t0, $gp, %gp_rel(gameTrackerX + 0x1B0)
/* A6FB0 800B67B0 6000858C */  lw         $a1, 0x60($a0)
/* A6FB4 800B67B4 6400868C */  lw         $a2, 0x64($a0)
/* A6FB8 800B67B8 6800878C */  lw         $a3, 0x68($a0)
/* A6FBC 800B67BC 000005AD */  sw         $a1, 0x0($t0)
/* A6FC0 800B67C0 040006AD */  sw         $a2, 0x4($t0)
/* A6FC4 800B67C4 080007AD */  sw         $a3, 0x8($t0)
/* A6FC8 800B67C8 6C00858C */  lw         $a1, 0x6C($a0)
/* A6FCC 800B67CC 7000868C */  lw         $a2, 0x70($a0)
/* A6FD0 800B67D0 0C0005AD */  sw         $a1, 0xC($t0)
/* A6FD4 800B67D4 100006AD */  sw         $a2, 0x10($t0)
/* A6FD8 800B67D8 80BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B8)($gp)
/* A6FDC 800B67DC 7C01010C */  jal        SOUND_SetSfxVolume
/* A6FE0 800B67E0 00000000 */   nop
/* A6FE4 800B67E4 7CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B4)($gp)
/* A6FE8 800B67E8 6F01010C */  jal        SOUND_SetMusicVolume
/* A6FEC 800B67EC 00000000 */   nop
/* A6FF0 800B67F0 84BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1BC)($gp)
/* A6FF4 800B67F4 8901010C */  jal        SOUND_SetVoiceVolume
/* A6FF8 800B67F8 00000000 */   nop
/* A6FFC 800B67FC 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* A7000 800B6800 00000000 */  nop
/* A7004 800B6804 04004294 */  lhu        $v0, 0x4($v0)
/* A7008 800B6808 00000000 */  nop
/* A700C 800B680C 02004230 */  andi       $v0, $v0, 0x2
/* A7010 800B6810 05004010 */  beqz       $v0, .L800B6828
/* A7014 800B6814 00000000 */   nop
/* A7018 800B6818 96C5000C */  jal        GAMEPAD_EnableDualShock
/* A701C 800B681C 00000000 */   nop
/* A7020 800B6820 0CDA0208 */  j          .L800B6830
/* A7024 800B6824 00000000 */   nop
.L800B6828:
/* A7028 800B6828 86C5000C */  jal        GAMEPAD_DisableDualShock
/* A702C 800B682C 00000000 */   nop
.L800B6830:
/* A7030 800B6830 1000BF8F */  lw         $ra, 0x10($sp)
/* A7034 800B6834 00000000 */  nop
/* A7038 800B6838 0800E003 */  jr         $ra
/* A703C 800B683C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_RestoreGlobalSaveTracker, . - SAVE_RestoreGlobalSaveTracker
