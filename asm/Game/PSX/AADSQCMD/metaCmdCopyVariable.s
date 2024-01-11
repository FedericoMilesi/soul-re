.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdCopyVariable
/* 46FFC 800567FC 06008390 */  lbu        $v1, 0x6($a0)
/* 47000 80056800 07008490 */  lbu        $a0, 0x7($a0)
/* 47004 80056804 80006228 */  slti       $v0, $v1, 0x80
/* 47008 80056808 09004010 */  beqz       $v0, .L80056830
/* 4700C 8005680C 80008228 */   slti      $v0, $a0, 0x80
/* 47010 80056810 07004010 */  beqz       $v0, .L80056830
/* 47014 80056814 00000000 */   nop
/* 47018 80056818 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4701C 8005681C 00000000 */  nop
/* 47020 80056820 21184300 */  addu       $v1, $v0, $v1
/* 47024 80056824 081C6390 */  lbu        $v1, 0x1C08($v1)
/* 47028 80056828 21104400 */  addu       $v0, $v0, $a0
/* 4702C 8005682C 081C43A0 */  sb         $v1, 0x1C08($v0)
.L80056830:
/* 47030 80056830 0800E003 */  jr         $ra
/* 47034 80056834 00000000 */   nop
.size metaCmdCopyVariable, . - metaCmdCopyVariable
