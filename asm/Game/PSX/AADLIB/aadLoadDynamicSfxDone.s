.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSfxDone
/* 43AAC 800532AC 0800E003 */  jr         $ra
/* 43AB0 800532B0 5C0080AC */   sw        $zero, 0x5C($a0)
.size aadLoadDynamicSfxDone, . - aadLoadDynamicSfxDone
