.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStopAllSfx
/* 47798 80056F98 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4779C 80056F9C 04000424 */  addiu      $a0, $zero, 0x4
/* 477A0 80056FA0 21280000 */  addu       $a1, $zero, $zero
/* 477A4 80056FA4 2130A000 */  addu       $a2, $a1, $zero
/* 477A8 80056FA8 2138A000 */  addu       $a3, $a1, $zero
/* 477AC 80056FAC 1800BFAF */  sw         $ra, 0x18($sp)
/* 477B0 80056FB0 AA5C010C */  jal        aadPutSfxCommand
/* 477B4 80056FB4 1000A0AF */   sw        $zero, 0x10($sp)
/* 477B8 80056FB8 1800BF8F */  lw         $ra, 0x18($sp)
/* 477BC 80056FBC 00000000 */  nop
/* 477C0 80056FC0 0800E003 */  jr         $ra
/* 477C4 80056FC4 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadStopAllSfx, . - aadStopAllSfx
