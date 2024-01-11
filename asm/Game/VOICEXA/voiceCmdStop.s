.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel voiceCmdStop
/* A77E0 800B6FE0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A77E4 800B6FE4 3800BFAF */  sw         $ra, 0x38($sp)
/* A77E8 800B6FE8 AA008290 */  lbu        $v0, 0xAA($a0)
/* A77EC 800B6FEC 00000000 */  nop
/* A77F0 800B6FF0 0E004010 */  beqz       $v0, .L800B702C
/* A77F4 800B6FF4 09000524 */   addiu     $a1, $zero, 0x9
/* A77F8 800B6FF8 21300000 */  addu       $a2, $zero, $zero
/* A77FC 800B6FFC EBDA020C */  jal        putCdCommand
/* A7800 800B7000 2138C000 */   addu      $a3, $a2, $zero
/* A7804 800B7004 1000A427 */  addiu      $a0, $sp, 0x10
/* A7808 800B7008 00220224 */  addiu      $v0, $zero, 0x2200
/* A780C 800B700C 1000A2AF */  sw         $v0, 0x10($sp)
/* A7810 800B7010 2800A0AF */  sw         $zero, 0x28($sp)
/* A7814 800B7014 DD01030C */  jal        func_800C0774
/* A7818 800B7018 3400A0AF */   sw        $zero, 0x34($sp)
/* A781C 800B701C 01000524 */  addiu      $a1, $zero, 0x1
/* A7820 800B7020 7CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B4)($gp)
/* A7824 800B7024 B247010C */  jal        aadStartMusicMasterVolFade
/* A7828 800B7028 21300000 */   addu      $a2, $zero, $zero
.L800B702C:
/* A782C 800B702C 3800BF8F */  lw         $ra, 0x38($sp)
/* A7830 800B7030 00000000 */  nop
/* A7834 800B7034 0800E003 */  jr         $ra
/* A7838 800B7038 4000BD27 */   addiu     $sp, $sp, 0x40
.size voiceCmdStop, . - voiceCmdStop
