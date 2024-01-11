.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdSetDebug
/* AE8C4 800BE0C4 0D80023C */  lui        $v0, %hi(CD_debug)
/* AE8C8 800BE0C8 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AE8CC 800BE0CC 0D80013C */  lui        $at, %hi(CD_debug)
/* AE8D0 800BE0D0 0800E003 */  jr         $ra
/* AE8D4 800BE0D4 8CE924AC */   sw        $a0, %lo(CD_debug)($at)
.size CdSetDebug, . - CdSetDebug
