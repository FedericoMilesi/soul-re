.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadInitVolume
/* 425D8 80051DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 425DC 80051DDC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 425E0 80051DE0 21200000 */  addu       $a0, $zero, $zero
/* 425E4 80051DE4 1000BFAF */  sw         $ra, 0x10($sp)
/* 425E8 80051DE8 B9FE020C */  jal        func_800BFAE4
/* 425EC 80051DEC 0C0040AC */   sw        $zero, 0xC($v0)
/* 425F0 80051DF0 21200000 */  addu       $a0, $zero, $zero
/* 425F4 80051DF4 C4FF020C */  jal        func_800BFF10
/* 425F8 80051DF8 21288000 */   addu      $a1, $a0, $zero
/* 425FC 80051DFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 42600 80051E00 00000000 */  nop
/* 42604 80051E04 0800E003 */  jr         $ra
/* 42608 80051E08 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadInitVolume, . - aadInitVolume
