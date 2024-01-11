.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_MemoryValidFunc
/* 40EE0 800506E0 FBFA023C */  lui        $v0, (0xFAFBFCFD >> 16)
/* 40EE4 800506E4 FDFC4234 */  ori        $v0, $v0, (0xFAFBFCFD & 0xFFFF)
/* 40EE8 800506E8 08008210 */  beq        $a0, $v0, .L8005070C
/* 40EEC 800506EC 00000000 */   nop
/* 40EF0 800506F0 06008010 */  beqz       $a0, .L8005070C
/* 40EF4 800506F4 00000000 */   nop
/* 40EF8 800506F8 FAFF8290 */  lbu        $v0, -0x6($a0)
/* 40EFC 800506FC 00000000 */  nop
/* 40F00 80050700 01004238 */  xori       $v0, $v0, 0x1
/* 40F04 80050704 0800E003 */  jr         $ra
/* 40F08 80050708 0100422C */   sltiu     $v0, $v0, 0x1
.L8005070C:
/* 40F0C 8005070C 0800E003 */  jr         $ra
/* 40F10 80050710 21100000 */   addu      $v0, $zero, $zero
.size MEMPACK_MemoryValidFunc, . - MEMPACK_MemoryValidFunc
