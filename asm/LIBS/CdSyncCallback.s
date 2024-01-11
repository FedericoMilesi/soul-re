.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdSyncCallback
/* AE918 800BE118 0D80023C */  lui        $v0, %hi(CD_cbsync)
/* AE91C 800BE11C 84E9428C */  lw         $v0, %lo(CD_cbsync)($v0)
/* AE920 800BE120 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AE924 800BE124 0800E003 */  jr         $ra
/* AE928 800BE128 84E924AC */   sw        $a0, %lo(CD_cbsync)($at)
.size CdSyncCallback, . - CdSyncCallback
