.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetSfxMasterVolume
/* 42654 80051E54 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42658 80051E58 FF008430 */  andi       $a0, $a0, 0xFF
/* 4265C 80051E5C 0800E003 */  jr         $ra
/* 42660 80051E60 1C0044AC */   sw        $a0, 0x1C($v0)
.size aadSetSfxMasterVolume, . - aadSetSfxMasterVolume
