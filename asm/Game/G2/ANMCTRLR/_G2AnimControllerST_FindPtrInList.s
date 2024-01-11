.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimControllerST_FindPtrInList
/* 828AC 800920AC 0000C28C */  lw         $v0, 0x0($a2)
/* 828B0 800920B0 00000000 */  nop
/* 828B4 800920B4 00004394 */  lhu        $v1, 0x0($v0)
/* 828B8 800920B8 00000000 */  nop
/* 828BC 800920BC C0100300 */  sll        $v0, $v1, 3
/* 828C0 800920C0 21104300 */  addu       $v0, $v0, $v1
/* 828C4 800920C4 84F5838F */  lw         $v1, %gp_rel(_controllerPool + 0xC)($gp)
/* 828C8 800920C8 80100200 */  sll        $v0, $v0, 2
/* 828CC 800920CC 21386200 */  addu       $a3, $v1, $v0
/* 828D0 800920D0 2B186700 */  sltu       $v1, $v1, $a3
/* 828D4 800920D4 14006010 */  beqz       $v1, .L80092128
/* 828D8 800920D8 00000000 */   nop
.L800920DC:
/* 828DC 800920DC 0300E290 */  lbu        $v0, 0x3($a3)
/* 828E0 800920E0 00000000 */  nop
/* 828E4 800920E4 05004414 */  bne        $v0, $a0, .L800920FC
/* 828E8 800920E8 00000000 */   nop
/* 828EC 800920EC 0200E290 */  lbu        $v0, 0x2($a3)
/* 828F0 800920F0 00000000 */  nop
/* 828F4 800920F4 0C004510 */  beq        $v0, $a1, .L80092128
/* 828F8 800920F8 00000000 */   nop
.L800920FC:
/* 828FC 800920FC 0000C7AC */  sw         $a3, 0x0($a2)
/* 82900 80092100 0000E294 */  lhu        $v0, 0x0($a3)
/* 82904 80092104 00000000 */  nop
/* 82908 80092108 C0180200 */  sll        $v1, $v0, 3
/* 8290C 8009210C 21186200 */  addu       $v1, $v1, $v0
/* 82910 80092110 84F5828F */  lw         $v0, %gp_rel(_controllerPool + 0xC)($gp)
/* 82914 80092114 80180300 */  sll        $v1, $v1, 2
/* 82918 80092118 21384300 */  addu       $a3, $v0, $v1
/* 8291C 8009211C 2B104700 */  sltu       $v0, $v0, $a3
/* 82920 80092120 EEFF4014 */  bnez       $v0, .L800920DC
/* 82924 80092124 00000000 */   nop
.L80092128:
/* 82928 80092128 84F5828F */  lw         $v0, %gp_rel(_controllerPool + 0xC)($gp)
/* 8292C 8009212C 00000000 */  nop
/* 82930 80092130 0400E214 */  bne        $a3, $v0, .L80092144
/* 82934 80092134 2110E000 */   addu      $v0, $a3, $zero
/* 82938 80092138 0000C0AC */  sw         $zero, 0x0($a2)
/* 8293C 8009213C 0800E003 */  jr         $ra
/* 82940 80092140 21100000 */   addu      $v0, $zero, $zero
.L80092144:
/* 82944 80092144 0800E003 */  jr         $ra
/* 82948 80092148 00000000 */   nop
.size _G2AnimControllerST_FindPtrInList, . - _G2AnimControllerST_FindPtrInList
