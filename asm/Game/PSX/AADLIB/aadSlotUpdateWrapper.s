.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSlotUpdateWrapper
/* 42768 80051F68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4276C 80051F6C 1400BFAF */  sw         $ra, 0x14($sp)
/* 42770 80051F70 3800030C */  jal        GetGp
/* 42774 80051F74 1000B0AF */   sw        $s0, 0x10($sp)
/* 42778 80051F78 0D80043C */  lui        $a0, %hi(aadGp)
/* 4277C 80051F7C F4C3848C */  lw         $a0, %lo(aadGp)($a0)
/* 42780 80051F80 00E5010C */  jal        SetGp
/* 42784 80051F84 21804000 */   addu      $s0, $v0, $zero
/* 42788 80051F88 EB47010C */  jal        aadSlotUpdate
/* 4278C 80051F8C 00000000 */   nop
/* 42790 80051F90 00E5010C */  jal        SetGp
/* 42794 80051F94 21200002 */   addu      $a0, $s0, $zero
/* 42798 80051F98 1400BF8F */  lw         $ra, 0x14($sp)
/* 4279C 80051F9C 1000B08F */  lw         $s0, 0x10($sp)
/* 427A0 80051FA0 21100000 */  addu       $v0, $zero, $zero
/* 427A4 80051FA4 0800E003 */  jr         $ra
/* 427A8 80051FA8 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadSlotUpdateWrapper, . - aadSlotUpdateWrapper
