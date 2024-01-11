.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_WaitForLoad
/* 1E788 8002DF88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E78C 8002DF8C 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 1E790 8002DF90 0800033C */  lui        $v1, (0x80000 >> 16)
/* 1E794 8002DF94 24104300 */  and        $v0, $v0, $v1
/* 1E798 8002DF98 03004010 */  beqz       $v0, .L8002DFA8
/* 1E79C 8002DF9C 1000BFAF */   sw        $ra, 0x10($sp)
/* 1E7A0 8002DFA0 A7DC020C */  jal        VOICEXA_Tick
/* 1E7A4 8002DFA4 00000000 */   nop
.L8002DFA8:
/* 1E7A8 8002DFA8 7580010C */  jal        STREAM_PollLoadQueue
/* 1E7AC 8002DFAC 00000000 */   nop
/* 1E7B0 8002DFB0 1000BF8F */  lw         $ra, 0x10($sp)
/* 1E7B4 8002DFB4 00000000 */  nop
/* 1E7B8 8002DFB8 0800E003 */  jr         $ra
/* 1E7BC 8002DFBC 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_WaitForLoad, . - GAMELOOP_WaitForLoad
