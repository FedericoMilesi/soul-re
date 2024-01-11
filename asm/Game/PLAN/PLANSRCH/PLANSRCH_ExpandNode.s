.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANSRCH_ExpandNode
/* 8A690 80099E90 21308000 */  addu       $a2, $a0, $zero
/* 8A694 80099E94 21400000 */  addu       $t0, $zero, $zero
/* 8A698 80099E98 2320A600 */  subu       $a0, $a1, $a2
/* 8A69C 80099E9C 0800AA8C */  lw         $t2, 0x8($a1)
/* 8A6A0 80099EA0 0C00A98C */  lw         $t1, 0xC($a1)
/* 8A6A4 80099EA4 0600A294 */  lhu        $v0, 0x6($a1)
/* 8A6A8 80099EA8 ECF5878F */  lw         $a3, %gp_rel(poolManagementData)($gp)
/* 8A6AC 80099EAC 02004234 */  ori        $v0, $v0, 0x2
/* 8A6B0 80099EB0 0600A2A4 */  sh         $v0, 0x6($a1)
/* 8A6B4 80099EB4 C0100400 */  sll        $v0, $a0, 3
/* 8A6B8 80099EB8 21104400 */  addu       $v0, $v0, $a0
/* 8A6BC 80099EBC 80190200 */  sll        $v1, $v0, 6
/* 8A6C0 80099EC0 21104300 */  addu       $v0, $v0, $v1
/* 8A6C4 80099EC4 C0100200 */  sll        $v0, $v0, 3
/* 8A6C8 80099EC8 21104400 */  addu       $v0, $v0, $a0
/* 8A6CC 80099ECC C01B0200 */  sll        $v1, $v0, 15
/* 8A6D0 80099ED0 21104300 */  addu       $v0, $v0, $v1
/* 8A6D4 80099ED4 C0100200 */  sll        $v0, $v0, 3
/* 8A6D8 80099ED8 21104400 */  addu       $v0, $v0, $a0
/* 8A6DC 80099EDC 23100200 */  negu       $v0, $v0
/* 8A6E0 80099EE0 0100E390 */  lbu        $v1, 0x1($a3)
/* 8A6E4 80099EE4 00000000 */  nop
/* 8A6E8 80099EE8 30006010 */  beqz       $v1, .L80099FAC
/* 8A6EC 80099EEC 83580200 */   sra       $t3, $v0, 2
/* 8A6F0 80099EF0 21606001 */  addu       $t4, $t3, $zero
.L80099EF4:
/* 8A6F4 80099EF4 01004231 */  andi       $v0, $t2, 0x1
/* 8A6F8 80099EF8 23004010 */  beqz       $v0, .L80099F88
/* 8A6FC 80099EFC 01002231 */   andi      $v0, $t1, 0x1
/* 8A700 80099F00 21004010 */  beqz       $v0, .L80099F88
/* 8A704 80099F04 00000000 */   nop
/* 8A708 80099F08 1F00C510 */  beq        $a2, $a1, .L80099F88
/* 8A70C 80099F0C 80110B00 */   sll       $v0, $t3, 6
/* 8A710 80099F10 40180800 */  sll        $v1, $t0, 1
/* 8A714 80099F14 1000E48C */  lw         $a0, 0x10($a3)
/* 8A718 80099F18 00000000 */  nop
/* 8A71C 80099F1C 21104400 */  addu       $v0, $v0, $a0
/* 8A720 80099F20 21186200 */  addu       $v1, $v1, $v0
/* 8A724 80099F24 1000A494 */  lhu        $a0, 0x10($a1)
/* 8A728 80099F28 00006384 */  lh         $v1, 0x0($v1)
/* 8A72C 80099F2C 0600C294 */  lhu        $v0, 0x6($a2)
/* 8A730 80099F30 00000000 */  nop
/* 8A734 80099F34 01004230 */  andi       $v0, $v0, 0x1
/* 8A738 80099F38 06004010 */  beqz       $v0, .L80099F54
/* 8A73C 80099F3C 21208300 */   addu      $a0, $a0, $v1
/* 8A740 80099F40 1000C294 */  lhu        $v0, 0x10($a2)
/* 8A744 80099F44 00000000 */  nop
/* 8A748 80099F48 2A108200 */  slt        $v0, $a0, $v0
/* 8A74C 80099F4C 0E004010 */  beqz       $v0, .L80099F88
/* 8A750 80099F50 00000000 */   nop
.L80099F54:
/* 8A754 80099F54 01808228 */  slti       $v0, $a0, -0x7FFF
/* 8A758 80099F58 02004010 */  beqz       $v0, .L80099F64
/* 8A75C 80099F5C 1200CCA4 */   sh        $t4, 0x12($a2)
/* 8A760 80099F60 01800424 */  addiu      $a0, $zero, -0x7FFF
.L80099F64:
/* 8A764 80099F64 FF7F0224 */  addiu      $v0, $zero, 0x7FFF
/* 8A768 80099F68 2A104400 */  slt        $v0, $v0, $a0
/* 8A76C 80099F6C 02004010 */  beqz       $v0, .L80099F78
/* 8A770 80099F70 00000000 */   nop
/* 8A774 80099F74 FF7F0424 */  addiu      $a0, $zero, 0x7FFF
.L80099F78:
/* 8A778 80099F78 0600C294 */  lhu        $v0, 0x6($a2)
/* 8A77C 80099F7C 1000C4A4 */  sh         $a0, 0x10($a2)
/* 8A780 80099F80 01004234 */  ori        $v0, $v0, 0x1
/* 8A784 80099F84 0600C2A4 */  sh         $v0, 0x6($a2)
.L80099F88:
/* 8A788 80099F88 43500A00 */  sra        $t2, $t2, 1
/* 8A78C 80099F8C 43480900 */  sra        $t1, $t1, 1
/* 8A790 80099F90 ECF5878F */  lw         $a3, %gp_rel(poolManagementData)($gp)
/* 8A794 80099F94 00000000 */  nop
/* 8A798 80099F98 0100E290 */  lbu        $v0, 0x1($a3)
/* 8A79C 80099F9C 01000825 */  addiu      $t0, $t0, 0x1
/* 8A7A0 80099FA0 2A100201 */  slt        $v0, $t0, $v0
/* 8A7A4 80099FA4 D3FF4014 */  bnez       $v0, .L80099EF4
/* 8A7A8 80099FA8 1C00C624 */   addiu     $a2, $a2, 0x1C
.L80099FAC:
/* 8A7AC 80099FAC 0800E003 */  jr         $ra
/* 8A7B0 80099FB0 00000000 */   nop
.size PLANSRCH_ExpandNode, . - PLANSRCH_ExpandNode
