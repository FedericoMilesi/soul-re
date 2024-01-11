.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7CC0
/* B84C0 800C7CC0 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2DC)
/* B84C4 800C7CC4 C8F4428C */  lw         $v0, %lo(_spu_rev_param + 0x2DC)($v0)
/* B84C8 800C7CC8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B84CC 800C7CCC 1400B1AF */  sw         $s1, 0x14($sp)
/* B84D0 800C7CD0 21888000 */  addu       $s1, $a0, $zero
/* B84D4 800C7CD4 2800BFAF */  sw         $ra, 0x28($sp)
/* B84D8 800C7CD8 2400B5AF */  sw         $s5, 0x24($sp)
/* B84DC 800C7CDC 2000B4AF */  sw         $s4, 0x20($sp)
/* B84E0 800C7CE0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B84E4 800C7CE4 1800B2AF */  sw         $s2, 0x18($sp)
/* B84E8 800C7CE8 06004010 */  beqz       $v0, .L800C7D04
/* B84EC 800C7CEC 1000B0AF */   sw        $s0, 0x10($sp)
/* B84F0 800C7CF0 0D80023C */  lui        $v0, %hi(_padFuncCurrLimit)
/* B84F4 800C7CF4 10E9428C */  lw         $v0, %lo(_padFuncCurrLimit)($v0)
/* B84F8 800C7CF8 00000000 */  nop
/* B84FC 800C7CFC 09F84000 */  jalr       $v0
/* B8500 800C7D00 00000000 */   nop
.L800C7D04:
/* B8504 800C7D04 0D80143C */  lui        $s4, %hi(_spu_rev_param + 0x2DC)
/* B8508 800C7D08 C8F4948E */  lw         $s4, %lo(_spu_rev_param + 0x2DC)($s4)
/* B850C 800C7D0C 00000000 */  nop
/* B8510 800C7D10 25008012 */  beqz       $s4, .L800C7DA8
/* B8514 800C7D14 FFFF1024 */   addiu     $s0, $zero, -0x1
/* B8518 800C7D18 10FF1224 */  addiu      $s2, $zero, -0xF0
.L800C7D1C:
/* B851C 800C7D1C 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D0)
/* B8520 800C7D20 BCF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D0)($v0)
/* B8524 800C7D24 00000000 */  nop
/* B8528 800C7D28 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B852C 800C7D2C 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B8530 800C7D30 1D004018 */  blez       $v0, .L800C7DA8
/* B8534 800C7D34 BCF422AC */   sw        $v0, %lo(_spu_rev_param + 0x2D0)($at)
/* B8538 800C7D38 07000006 */  bltz       $s0, .L800C7D58
/* B853C 800C7D3C 00000000 */   nop
/* B8540 800C7D40 0C00248E */  lw         $a0, 0xC($s1)
/* B8544 800C7D44 0D80023C */  lui        $v0, %hi(_padFuncCurrLimit)
/* B8548 800C7D48 10E9428C */  lw         $v0, %lo(_padFuncCurrLimit)($v0)
/* B854C 800C7D4C 00000000 */  nop
/* B8550 800C7D50 09F84000 */  jalr       $v0
/* B8554 800C7D54 21209200 */   addu      $a0, $a0, $s2
.L800C7D58:
/* B8558 800C7D58 21202002 */  addu       $a0, $s1, $zero
/* B855C 800C7D5C 0D80023C */  lui        $v0, %hi(_padFuncGetTxd)
/* B8560 800C7D60 0CE9428C */  lw         $v0, %lo(_padFuncGetTxd)($v0)
/* B8564 800C7D64 00000000 */  nop
/* B8568 800C7D68 09F84000 */  jalr       $v0
/* B856C 800C7D6C 01000524 */   addiu     $a1, $zero, 0x1
/* B8570 800C7D70 21202002 */  addu       $a0, $s1, $zero
/* B8574 800C7D74 3F0B030C */  jal        func_800C2CFC
/* B8578 800C7D78 FF004530 */   andi      $a1, $v0, 0xFF
/* B857C 800C7D7C AC004004 */  bltz       $v0, .L800C8030
/* B8580 800C7D80 00000000 */   nop
/* B8584 800C7D84 5C1E030C */  jal        func_800C7970
/* B8588 800C7D88 3C000424 */   addiu     $a0, $zero, 0x3C
/* B858C 800C7D8C DD0B030C */  jal        func_800C2F74
/* B8590 800C7D90 00000000 */   nop
/* B8594 800C7D94 62004010 */  beqz       $v0, .L800C7F20
/* B8598 800C7D98 01001026 */   addiu     $s0, $s0, 0x1
/* B859C 800C7D9C 0400022A */  slti       $v0, $s0, 0x4
/* B85A0 800C7DA0 DEFF4014 */  bnez       $v0, .L800C7D1C
/* B85A4 800C7DA4 F0005226 */   addiu     $s2, $s2, 0xF0
.L800C7DA8:
/* B85A8 800C7DA8 21800000 */  addu       $s0, $zero, $zero
/* B85AC 800C7DAC 0D80033C */  lui        $v1, %hi(_padSioChan)
/* B85B0 800C7DB0 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* B85B4 800C7DB4 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D0)
/* B85B8 800C7DB8 BCF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D0)($v0)
/* B85BC 800C7DBC 00000000 */  nop
/* B85C0 800C7DC0 02004228 */  slti       $v0, $v0, 0x2
/* B85C4 800C7DC4 61004014 */  bnez       $v0, .L800C7F4C
/* B85C8 800C7DC8 0100642C */   sltiu     $a0, $v1, 0x1
/* B85CC 800C7DCC 0D80033C */  lui        $v1, %hi(_padFixResult)
/* B85D0 800C7DD0 5CE96324 */  addiu      $v1, $v1, %lo(_padFixResult)
/* B85D4 800C7DD4 80100400 */  sll        $v0, $a0, 2
/* B85D8 800C7DD8 21904300 */  addu       $s2, $v0, $v1
/* B85DC 800C7DDC 00110400 */  sll        $v0, $a0, 4
/* B85E0 800C7DE0 23104400 */  subu       $v0, $v0, $a0
/* B85E4 800C7DE4 00990200 */  sll        $s3, $v0, 4
/* B85E8 800C7DE8 03001524 */  addiu      $s5, $zero, 0x3
.L800C7DEC:
/* B85EC 800C7DEC 0000448E */  lw         $a0, 0x0($s2)
/* B85F0 800C7DF0 00000000 */  nop
/* B85F4 800C7DF4 55008004 */  bltz       $a0, .L800C7F4C
/* B85F8 800C7DF8 00000000 */   nop
/* B85FC 800C7DFC 0E008018 */  blez       $a0, .L800C7E38
/* B8600 800C7E00 00110400 */   sll       $v0, $a0, 4
/* B8604 800C7E04 0D80033C */  lui        $v1, %hi(_padInfoDir)
/* B8608 800C7E08 38E9638C */  lw         $v1, %lo(_padInfoDir)($v1)
/* B860C 800C7E0C 23104400 */  subu       $v0, $v0, $a0
/* B8610 800C7E10 21186302 */  addu       $v1, $s3, $v1
/* B8614 800C7E14 0C00638C */  lw         $v1, 0xC($v1)
/* B8618 800C7E18 00110200 */  sll        $v0, $v0, 4
/* B861C 800C7E1C 21186200 */  addu       $v1, $v1, $v0
/* B8620 800C7E20 10FF7024 */  addiu      $s0, $v1, -0xF0
/* B8624 800C7E24 0D80023C */  lui        $v0, %hi(_padFuncRecvAuto)
/* B8628 800C7E28 24E9428C */  lw         $v0, %lo(_padFuncRecvAuto)($v0)
/* B862C 800C7E2C 00000000 */  nop
/* B8630 800C7E30 09F84000 */  jalr       $v0
/* B8634 800C7E34 21200002 */   addu      $a0, $s0, $zero
.L800C7E38:
/* B8638 800C7E38 0000438E */  lw         $v1, 0x0($s2)
/* B863C 800C7E3C 00000000 */  nop
/* B8640 800C7E40 0F007510 */  beq        $v1, $s5, .L800C7E80
/* B8644 800C7E44 00000000 */   nop
/* B8648 800C7E48 04006228 */  slti       $v0, $v1, 0x4
/* B864C 800C7E4C 07004010 */  beqz       $v0, .L800C7E6C
/* B8650 800C7E50 02006228 */   slti      $v0, $v1, 0x2
/* B8654 800C7E54 22004010 */  beqz       $v0, .L800C7EE0
/* B8658 800C7E58 21202002 */   addu      $a0, $s1, $zero
/* B865C 800C7E5C 20006004 */  bltz       $v1, .L800C7EE0
/* B8660 800C7E60 00000000 */   nop
/* B8664 800C7E64 A71F0308 */  j          .L800C7E9C
/* B8668 800C7E68 00000000 */   nop
.L800C7E6C:
/* B866C 800C7E6C 04000224 */  addiu      $v0, $zero, 0x4
/* B8670 800C7E70 1B006214 */  bne        $v1, $v0, .L800C7EE0
/* B8674 800C7E74 21202002 */   addu      $a0, $s1, $zero
/* B8678 800C7E78 B81F0308 */  j          .L800C7EE0
/* B867C 800C7E7C 000055AE */   sw        $s5, 0x0($s2)
.L800C7E80:
/* B8680 800C7E80 0D80023C */  lui        $v0, %hi(_padFuncRecvAuto)
/* B8684 800C7E84 24E9428C */  lw         $v0, %lo(_padFuncRecvAuto)($v0)
/* B8688 800C7E88 00000000 */  nop
/* B868C 800C7E8C 09F84000 */  jalr       $v0
/* B8690 800C7E90 10FF0426 */   addiu     $a0, $s0, -0xF0
/* B8694 800C7E94 B61F0308 */  j          .L800C7ED8
/* B8698 800C7E98 01000224 */   addiu     $v0, $zero, 0x1
.L800C7E9C:
/* B869C 800C7E9C 0D80023C */  lui        $v0, %hi(_padInfoDir)
/* B86A0 800C7EA0 38E9428C */  lw         $v0, %lo(_padInfoDir)($v0)
/* B86A4 800C7EA4 00000000 */  nop
/* B86A8 800C7EA8 21805300 */  addu       $s0, $v0, $s3
/* B86AC 800C7EAC 0D80023C */  lui        $v0, %hi(_padFuncRecvAuto)
/* B86B0 800C7EB0 24E9428C */  lw         $v0, %lo(_padFuncRecvAuto)($v0)
/* B86B4 800C7EB4 00000000 */  nop
/* B86B8 800C7EB8 09F84000 */  jalr       $v0
/* B86BC 800C7EBC 21200002 */   addu      $a0, $s0, $zero
/* B86C0 800C7EC0 0D80023C */  lui        $v0, %hi(_padFuncClrCmdNo)
/* B86C4 800C7EC4 28E9428C */  lw         $v0, %lo(_padFuncClrCmdNo)($v0)
/* B86C8 800C7EC8 00000000 */  nop
/* B86CC 800C7ECC 09F84000 */  jalr       $v0
/* B86D0 800C7ED0 21200002 */   addu      $a0, $s0, $zero
/* B86D4 800C7ED4 FFFF0224 */  addiu      $v0, $zero, -0x1
.L800C7ED8:
/* B86D8 800C7ED8 000042AE */  sw         $v0, 0x0($s2)
/* B86DC 800C7EDC 21202002 */  addu       $a0, $s1, $zero
.L800C7EE0:
/* B86E0 800C7EE0 0D80023C */  lui        $v0, %hi(_padFuncGetTxd)
/* B86E4 800C7EE4 0CE9428C */  lw         $v0, %lo(_padFuncGetTxd)($v0)
/* B86E8 800C7EE8 00000000 */  nop
/* B86EC 800C7EEC 09F84000 */  jalr       $v0
/* B86F0 800C7EF0 21288002 */   addu      $a1, $s4, $zero
/* B86F4 800C7EF4 21202002 */  addu       $a0, $s1, $zero
/* B86F8 800C7EF8 BB0A030C */  jal        func_800C2AEC
/* B86FC 800C7EFC FF004530 */   andi      $a1, $v0, 0xFF
/* B8700 800C7F00 4B004004 */  bltz       $v0, .L800C8030
/* B8704 800C7F04 00000000 */   nop
/* B8708 800C7F08 5C1E030C */  jal        func_800C7970
/* B870C 800C7F0C 3C000424 */   addiu     $a0, $zero, 0x3C
/* B8710 800C7F10 DD0B030C */  jal        func_800C2F74
/* B8714 800C7F14 00000000 */   nop
/* B8718 800C7F18 03004014 */  bnez       $v0, .L800C7F28
/* B871C 800C7F1C 00000000 */   nop
.L800C7F20:
/* B8720 800C7F20 0C200308 */  j          .L800C8030
/* B8724 800C7F24 FDFF0224 */   addiu     $v0, $zero, -0x3
.L800C7F28:
/* B8728 800C7F28 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D0)
/* B872C 800C7F2C BCF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D0)($v0)
/* B8730 800C7F30 00000000 */  nop
/* B8734 800C7F34 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B8738 800C7F38 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B873C 800C7F3C BCF422AC */  sw         $v0, %lo(_spu_rev_param + 0x2D0)($at)
/* B8740 800C7F40 02004228 */  slti       $v0, $v0, 0x2
/* B8744 800C7F44 A9FF4010 */  beqz       $v0, .L800C7DEC
/* B8748 800C7F48 00000000 */   nop
.L800C7F4C:
/* B874C 800C7F4C 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D0)
/* B8750 800C7F50 BCF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D0)($v0)
/* B8754 800C7F54 00000000 */  nop
/* B8758 800C7F58 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B875C 800C7F5C 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B8760 800C7F60 21004018 */  blez       $v0, .L800C7FE8
/* B8764 800C7F64 BCF422AC */   sw        $v0, %lo(_spu_rev_param + 0x2D0)($at)
/* B8768 800C7F68 22001024 */  addiu      $s0, $zero, 0x22
.L800C7F6C:
/* B876C 800C7F6C 21202002 */  addu       $a0, $s1, $zero
/* B8770 800C7F70 0D80023C */  lui        $v0, %hi(_padFuncGetTxd)
/* B8774 800C7F74 0CE9428C */  lw         $v0, %lo(_padFuncGetTxd)($v0)
/* B8778 800C7F78 00000000 */  nop
/* B877C 800C7F7C 09F84000 */  jalr       $v0
/* B8780 800C7F80 21288002 */   addu      $a1, $s4, $zero
/* B8784 800C7F84 21202002 */  addu       $a0, $s1, $zero
/* B8788 800C7F88 BB0A030C */  jal        func_800C2AEC
/* B878C 800C7F8C FF004530 */   andi      $a1, $v0, 0xFF
/* B8790 800C7F90 27004004 */  bltz       $v0, .L800C8030
/* B8794 800C7F94 00000000 */   nop
/* B8798 800C7F98 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D4)
/* B879C 800C7F9C C0F4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D4)($v0)
/* B87A0 800C7FA0 00000000 */  nop
/* B87A4 800C7FA4 0E004294 */  lhu        $v0, 0xE($v0)
/* B87A8 800C7FA8 00000000 */  nop
/* B87AC 800C7FAC 07005010 */  beq        $v0, $s0, .L800C7FCC
/* B87B0 800C7FB0 00000000 */   nop
/* B87B4 800C7FB4 5C1E030C */  jal        func_800C7970
/* B87B8 800C7FB8 3C000424 */   addiu     $a0, $zero, 0x3C
/* B87BC 800C7FBC DD0B030C */  jal        func_800C2F74
/* B87C0 800C7FC0 00000000 */   nop
/* B87C4 800C7FC4 1A004010 */  beqz       $v0, .L800C8030
/* B87C8 800C7FC8 FDFF0224 */   addiu     $v0, $zero, -0x3
.L800C7FCC:
/* B87CC 800C7FCC 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D0)
/* B87D0 800C7FD0 BCF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D0)($v0)
/* B87D4 800C7FD4 00000000 */  nop
/* B87D8 800C7FD8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B87DC 800C7FDC 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B87E0 800C7FE0 E2FF401C */  bgtz       $v0, .L800C7F6C
/* B87E4 800C7FE4 BCF422AC */   sw        $v0, %lo(_spu_rev_param + 0x2D0)($at)
.L800C7FE8:
/* B87E8 800C7FE8 010C030C */  jal        func_800C3004
/* B87EC 800C7FEC 00000000 */   nop
/* B87F0 800C7FF0 44002392 */  lbu        $v1, 0x44($s1)
/* B87F4 800C7FF4 00000000 */  nop
/* B87F8 800C7FF8 01006224 */  addiu      $v0, $v1, 0x1
/* B87FC 800C7FFC 440022A2 */  sb         $v0, 0x44($s1)
/* B8800 800C8000 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D4)
/* B8804 800C8004 C0F4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D4)($v0)
/* B8808 800C8008 3C00248E */  lw         $a0, 0x3C($s1)
/* B880C 800C800C 00004290 */  lbu        $v0, 0x0($v0)
/* B8810 800C8010 21186400 */  addu       $v1, $v1, $a0
/* B8814 800C8014 000062A0 */  sb         $v0, 0x0($v1)
/* B8818 800C8018 0D80023C */  lui        $v0, %hi(_padFuncNextPort)
/* B881C 800C801C 04E9428C */  lw         $v0, %lo(_padFuncNextPort)($v0)
/* B8820 800C8020 00000000 */  nop
/* B8824 800C8024 09F84000 */  jalr       $v0
/* B8828 800C8028 21200000 */   addu      $a0, $zero, $zero
/* B882C 800C802C 21100000 */  addu       $v0, $zero, $zero
.L800C8030:
/* B8830 800C8030 2800BF8F */  lw         $ra, 0x28($sp)
/* B8834 800C8034 2400B58F */  lw         $s5, 0x24($sp)
/* B8838 800C8038 2000B48F */  lw         $s4, 0x20($sp)
/* B883C 800C803C 1C00B38F */  lw         $s3, 0x1C($sp)
/* B8840 800C8040 1800B28F */  lw         $s2, 0x18($sp)
/* B8844 800C8044 1400B18F */  lw         $s1, 0x14($sp)
/* B8848 800C8048 1000B08F */  lw         $s0, 0x10($sp)
/* B884C 800C804C 0800E003 */  jr         $ra
/* B8850 800C8050 3000BD27 */   addiu     $sp, $sp, 0x30
/* B8854 800C8054 00000000 */  nop
/* B8858 800C8058 00000000 */  nop
/* B885C 800C805C 00000000 */  nop
.size func_800C7CC0, . - func_800C7CC0
