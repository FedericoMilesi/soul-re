.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VOICEXA_Pause
/* A79BC 800B71BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A79C0 800B71C0 1000B0AF */  sw         $s0, 0x10($sp)
/* A79C4 800B71C4 F0FE9027 */  addiu      $s0, $gp, %gp_rel(voiceTracker)
/* A79C8 800B71C8 1400BFAF */  sw         $ra, 0x14($sp)
/* A79CC 800B71CC 5EDC020C */  jal        VOICEXA_FinalStatus
/* A79D0 800B71D0 21200002 */   addu      $a0, $s0, $zero
/* A79D4 800B71D4 21204000 */  addu       $a0, $v0, $zero
/* A79D8 800B71D8 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* A79DC 800B71DC 0800033C */  lui        $v1, (0x80000 >> 16)
/* A79E0 800B71E0 24104300 */  and        $v0, $v0, $v1
/* A79E4 800B71E4 0D004010 */  beqz       $v0, .L800B721C
/* A79E8 800B71E8 FFFF8224 */   addiu     $v0, $a0, -0x1
/* A79EC 800B71EC 0200422C */  sltiu      $v0, $v0, 0x2
/* A79F0 800B71F0 04004010 */  beqz       $v0, .L800B7204
/* A79F4 800B71F4 02000524 */   addiu     $a1, $zero, 0x2
/* A79F8 800B71F8 21200002 */  addu       $a0, $s0, $zero
/* A79FC 800B71FC 85DC0208 */  j          .L800B7214
/* A7A00 800B7200 03000624 */   addiu     $a2, $zero, 0x3
.L800B7204:
/* A7A04 800B7204 05008014 */  bnez       $a0, .L800B721C
/* A7A08 800B7208 21200002 */   addu      $a0, $s0, $zero
/* A7A0C 800B720C 04000524 */  addiu      $a1, $zero, 0x4
/* A7A10 800B7210 2130A000 */  addu       $a2, $a1, $zero
.L800B7214:
/* A7A14 800B7214 51DB020C */  jal        putVoiceCommand
/* A7A18 800B7218 21380000 */   addu      $a3, $zero, $zero
.L800B721C:
/* A7A1C 800B721C 1400BF8F */  lw         $ra, 0x14($sp)
/* A7A20 800B7220 1000B08F */  lw         $s0, 0x10($sp)
/* A7A24 800B7224 0800E003 */  jr         $ra
/* A7A28 800B7228 1800BD27 */   addiu     $sp, $sp, 0x18
.size VOICEXA_Pause, . - VOICEXA_Pause
