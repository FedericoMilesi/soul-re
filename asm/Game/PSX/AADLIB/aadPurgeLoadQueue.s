.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadPurgeLoadQueue
/* 436D0 80052ED0 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 436D4 80052ED4 00000000 */  nop
/* 436D8 80052ED8 400740AC */  sw         $zero, 0x740($v0)
/* 436DC 80052EDC 440740AC */  sw         $zero, 0x744($v0)
/* 436E0 80052EE0 0800E003 */  jr         $ra
/* 436E4 80052EE4 480740AC */   sw        $zero, 0x748($v0)
.size aadPurgeLoadQueue, . - aadPurgeLoadQueue
