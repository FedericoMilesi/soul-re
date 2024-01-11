.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSelectSlot
/* 46730 80055F30 D89B868F */  lw         $a2, %gp_rel(aadMem)($gp)
/* 46734 80055F34 06008390 */  lbu        $v1, 0x6($a0)
/* 46738 80055F38 0400C28C */  lw         $v0, 0x4($a2)
/* 4673C 80055F3C 00000000 */  nop
/* 46740 80055F40 2A106200 */  slt        $v0, $v1, $v0
/* 46744 80055F44 07004010 */  beqz       $v0, .L80055F64
/* 46748 80055F48 7F000224 */   addiu     $v0, $zero, 0x7F
/* 4674C 80055F4C 80100300 */  sll        $v0, $v1, 2
/* 46750 80055F50 2110C200 */  addu       $v0, $a2, $v0
/* 46754 80055F54 3400428C */  lw         $v0, 0x34($v0)
/* 46758 80055F58 3C05A3A0 */  sb         $v1, 0x53C($a1)
/* 4675C 80055F5C 0800E003 */  jr         $ra
/* 46760 80055F60 3805A2AC */   sw        $v0, 0x538($a1)
.L80055F64:
/* 46764 80055F64 04006214 */  bne        $v1, $v0, .L80055F78
/* 46768 80055F68 00000000 */   nop
/* 4676C 80055F6C 3F05A290 */  lbu        $v0, 0x53F($a1)
/* 46770 80055F70 3805A5AC */  sw         $a1, 0x538($a1)
/* 46774 80055F74 3C05A2A0 */  sb         $v0, 0x53C($a1)
.L80055F78:
/* 46778 80055F78 0800E003 */  jr         $ra
/* 4677C 80055F7C 00000000 */   nop
.size metaCmdSelectSlot, . - metaCmdSelectSlot
