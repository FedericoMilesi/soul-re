.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fx_setTex
/* 3EFEC 8004E7EC 00008290 */  lbu        $v0, 0x0($a0)
/* 3EFF0 8004E7F0 00000000 */  nop
/* 3EFF4 8004E7F4 23104600 */  subu       $v0, $v0, $a2
/* 3EFF8 8004E7F8 0000A2A0 */  sb         $v0, 0x0($a1)
/* 3EFFC 8004E7FC 02008284 */  lh         $v0, 0x2($a0)
/* 3F000 8004E800 00000000 */  nop
/* 3F004 8004E804 00014228 */  slti       $v0, $v0, 0x100
/* 3F008 8004E808 02004010 */  beqz       $v0, .L8004E814
/* 3F00C 8004E80C FF000224 */   addiu     $v0, $zero, 0xFF
/* 3F010 8004E810 02008290 */  lbu        $v0, 0x2($a0)
.L8004E814:
/* 3F014 8004E814 00000000 */  nop
/* 3F018 8004E818 0100A2A0 */  sb         $v0, 0x1($a1)
/* 3F01C 8004E81C 02008294 */  lhu        $v0, 0x2($a0)
/* 3F020 8004E820 00000000 */  nop
/* 3F024 8004E824 21104700 */  addu       $v0, $v0, $a3
/* 3F028 8004E828 0800E003 */  jr         $ra
/* 3F02C 8004E82C 020082A4 */   sh        $v0, 0x2($a0)
.size fx_setTex, . - fx_setTex
