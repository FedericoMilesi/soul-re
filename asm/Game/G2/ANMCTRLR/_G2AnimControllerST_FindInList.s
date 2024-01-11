.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimControllerST_FindInList
/* 8283C 8009203C 0000C294 */  lhu        $v0, 0x0($a2)
/* 82840 80092040 84F5878F */  lw         $a3, %gp_rel(_controllerPool + 0xC)($gp)
/* 82844 80092044 1E480208 */  j          .L80092078
/* 82848 80092048 C0180200 */   sll       $v1, $v0, 3
.L8009204C:
/* 8284C 8009204C 0300C290 */  lbu        $v0, 0x3($a2)
/* 82850 80092050 00000000 */  nop
/* 82854 80092054 05004414 */  bne        $v0, $a0, .L8009206C
/* 82858 80092058 00000000 */   nop
/* 8285C 8009205C 0200C290 */  lbu        $v0, 0x2($a2)
/* 82860 80092060 00000000 */  nop
/* 82864 80092064 0A004510 */  beq        $v0, $a1, .L80092090
/* 82868 80092068 00000000 */   nop
.L8009206C:
/* 8286C 8009206C 0000C294 */  lhu        $v0, 0x0($a2)
/* 82870 80092070 00000000 */  nop
/* 82874 80092074 C0180200 */  sll        $v1, $v0, 3
.L80092078:
/* 82878 80092078 21186200 */  addu       $v1, $v1, $v0
/* 8287C 8009207C 80180300 */  sll        $v1, $v1, 2
/* 82880 80092080 2130E300 */  addu       $a2, $a3, $v1
/* 82884 80092084 2B10E600 */  sltu       $v0, $a3, $a2
/* 82888 80092088 F0FF4014 */  bnez       $v0, .L8009204C
/* 8288C 8009208C 00000000 */   nop
.L80092090:
/* 82890 80092090 84F5838F */  lw         $v1, %gp_rel(_controllerPool + 0xC)($gp)
/* 82894 80092094 00000000 */  nop
/* 82898 80092098 0200C310 */  beq        $a2, $v1, .L800920A4
/* 8289C 8009209C 21100000 */   addu      $v0, $zero, $zero
/* 828A0 800920A0 2110C000 */  addu       $v0, $a2, $zero
.L800920A4:
/* 828A4 800920A4 0800E003 */  jr         $ra
/* 828A8 800920A8 00000000 */   nop
.size _G2AnimControllerST_FindInList, . - _G2AnimControllerST_FindInList
