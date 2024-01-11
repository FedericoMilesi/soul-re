.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStartMasterVolumeFade
/* 4263C 80051E3C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42640 80051E40 00000000 */  nop
/* 42644 80051E44 100045AC */  sw         $a1, 0x10($v0)
/* 42648 80051E48 140044AC */  sw         $a0, 0x14($v0)
/* 4264C 80051E4C 0800E003 */  jr         $ra
/* 42650 80051E50 180046AC */   sw        $a2, 0x18($v0)
.size aadStartMasterVolumeFade, . - aadStartMasterVolumeFade
