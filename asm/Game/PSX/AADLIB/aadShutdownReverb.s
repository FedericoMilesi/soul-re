.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadShutdownReverb
/* 44D48 80054548 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 44D4C 8005454C 1000BFAF */  sw         $ra, 0x10($sp)
/* 44D50 80054550 2151010C */  jal        aadWaitForSramTransferComplete
/* 44D54 80054554 00000000 */   nop
/* 44D58 80054558 05004010 */  beqz       $v0, .L80054570
/* 44D5C 8005455C 00000000 */   nop
/* 44D60 80054560 6051010C */  jal        aadGetReverbMode
/* 44D64 80054564 00000000 */   nop
/* 44D68 80054568 5CFF020C */  jal        SpuClearReverbWorkArea
/* 44D6C 8005456C 21204000 */   addu      $a0, $v0, $zero
.L80054570:
/* 44D70 80054570 1000BF8F */  lw         $ra, 0x10($sp)
/* 44D74 80054574 00000000 */  nop
/* 44D78 80054578 0800E003 */  jr         $ra
/* 44D7C 8005457C 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadShutdownReverb, . - aadShutdownReverb
