.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStartMusicMasterVolFade
/* 426C8 80051EC8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 426CC 80051ECC 00000000 */  nop
/* 426D0 80051ED0 280045AC */  sw         $a1, 0x28($v0)
/* 426D4 80051ED4 2C0044AC */  sw         $a0, 0x2C($v0)
/* 426D8 80051ED8 0800E003 */  jr         $ra
/* 426DC 80051EDC 300046AC */   sw        $a2, 0x30($v0)
.size aadStartMusicMasterVolFade, . - aadStartMusicMasterVolFade
