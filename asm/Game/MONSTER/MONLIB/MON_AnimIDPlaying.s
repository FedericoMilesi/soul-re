.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AnimIDPlaying
/* 705E4 8007FDE4 00290500 */  sll        $a1, $a1, 4
/* 705E8 8007FDE8 2400828C */  lw         $v0, 0x24($a0)
/* 705EC 8007FDEC 6C01848C */  lw         $a0, 0x16C($a0)
/* 705F0 8007FDF0 4000438C */  lw         $v1, 0x40($v0)
/* 705F4 8007FDF4 BC00828C */  lw         $v0, 0xBC($a0)
/* 705F8 8007FDF8 21186500 */  addu       $v1, $v1, $a1
/* 705FC 8007FDFC 26104300 */  xor        $v0, $v0, $v1
/* 70600 8007FE00 0800E003 */  jr         $ra
/* 70604 8007FE04 0100422C */   sltiu     $v0, $v0, 0x1
.size MON_AnimIDPlaying, . - MON_AnimIDPlaying
