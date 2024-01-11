.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_draw_item
/* A852C 800B7D2C B0FEBD27 */  addiu      $sp, $sp, -0x150
/* A8530 800B7D30 4C01BFAF */  sw         $ra, 0x14C($sp)
/* A8534 800B7D34 4801BEAF */  sw         $fp, 0x148($sp)
/* A8538 800B7D38 4401B7AF */  sw         $s7, 0x144($sp)
/* A853C 800B7D3C 4001B6AF */  sw         $s6, 0x140($sp)
/* A8540 800B7D40 3C01B5AF */  sw         $s5, 0x13C($sp)
/* A8544 800B7D44 3801B4AF */  sw         $s4, 0x138($sp)
/* A8548 800B7D48 3401B3AF */  sw         $s3, 0x134($sp)
/* A854C 800B7D4C 3001B2AF */  sw         $s2, 0x130($sp)
/* A8550 800B7D50 2C01B1AF */  sw         $s1, 0x12C($sp)
/* A8554 800B7D54 2801B0AF */  sw         $s0, 0x128($sp)
/* A8558 800B7D58 5401A5AF */  sw         $a1, 0x154($sp)
/* A855C 800B7D5C 5801A6AF */  sw         $a2, 0x158($sp)
/* A8560 800B7D60 0000838C */  lw         $v1, 0x0($a0)
/* A8564 800B7D64 6801A88F */  lw         $t0, 0x168($sp)
/* A8568 800B7D68 6001B08F */  lw         $s0, 0x160($sp)
/* A856C 800B7D6C 6C01B78F */  lw         $s7, 0x16C($sp)
/* A8570 800B7D70 1401A0AF */  sw         $zero, 0x114($sp)
/* A8574 800B7D74 C0100300 */  sll        $v0, $v1, 3
/* A8578 800B7D78 21104300 */  addu       $v0, $v0, $v1
/* A857C 800B7D7C 80100200 */  sll        $v0, $v0, 2
/* A8580 800B7D80 21104400 */  addu       $v0, $v0, $a0
/* A8584 800B7D84 F0FF4224 */  addiu      $v0, $v0, -0x10
/* A8588 800B7D88 1001A2AF */  sw         $v0, 0x110($sp)
/* A858C 800B7D8C 01000231 */  andi       $v0, $t0, 0x1
/* A8590 800B7D90 09004014 */  bnez       $v0, .L800B7DB8
/* A8594 800B7D94 01000924 */   addiu     $t1, $zero, 0x1
/* A8598 800B7D98 6801A88F */  lw         $t0, 0x168($sp)
/* A859C 800B7D9C 00000000 */  nop
/* A85A0 800B7DA0 02000231 */  andi       $v0, $t0, 0x2
/* A85A4 800B7DA4 06004014 */  bnez       $v0, .L800B7DC0
/* A85A8 800B7DA8 1801A0AF */   sw        $zero, 0x118($sp)
/* A85AC 800B7DAC 1001A98F */  lw         $t1, 0x110($sp)
/* A85B0 800B7DB0 00000000 */  nop
/* A85B4 800B7DB4 1400298D */  lw         $t1, 0x14($t1)
.L800B7DB8:
/* A85B8 800B7DB8 00000000 */  nop
/* A85BC 800B7DBC 1801A9AF */  sw         $t1, 0x118($sp)
.L800B7DC0:
/* A85C0 800B7DC0 5401A88F */  lw         $t0, 0x154($sp)
/* A85C4 800B7DC4 00000000 */  nop
/* A85C8 800B7DC8 07000015 */  bnez       $t0, .L800B7DE8
/* A85CC 800B7DCC 21200002 */   addu      $a0, $s0, $zero
/* A85D0 800B7DD0 1001A98F */  lw         $t1, 0x110($sp)
/* A85D4 800B7DD4 00000000 */  nop
/* A85D8 800B7DD8 0400298D */  lw         $t1, 0x4($t1)
/* A85DC 800B7DDC 00000000 */  nop
/* A85E0 800B7DE0 5401A9AF */  sw         $t1, 0x154($sp)
/* A85E4 800B7DE4 5401A88F */  lw         $t0, 0x154($sp)
.L800B7DE8:
/* A85E8 800B7DE8 00000000 */  nop
/* A85EC 800B7DEC 21400701 */  addu       $t0, $t0, $a3
/* A85F0 800B7DF0 ACF4020C */  jal        func_800BD2B0
/* A85F4 800B7DF4 5401A8AF */   sw        $t0, 0x154($sp)
/* A85F8 800B7DF8 01000524 */  addiu      $a1, $zero, 0x1
/* A85FC 800B7DFC 21204000 */  addu       $a0, $v0, $zero
/* A8600 800B7E00 0C008018 */  blez       $a0, .L800B7E34
/* A8604 800B7E04 21180000 */   addu      $v1, $zero, $zero
/* A8608 800B7E08 09000624 */  addiu      $a2, $zero, 0x9
/* A860C 800B7E0C 21100302 */  addu       $v0, $s0, $v1
.L800B7E10:
/* A8610 800B7E10 00004290 */  lbu        $v0, 0x0($v0)
/* A8614 800B7E14 00000000 */  nop
/* A8618 800B7E18 02004614 */  bne        $v0, $a2, .L800B7E24
/* A861C 800B7E1C 00000000 */   nop
/* A8620 800B7E20 0100A524 */  addiu      $a1, $a1, 0x1
.L800B7E24:
/* A8624 800B7E24 01006324 */  addiu      $v1, $v1, 0x1
/* A8628 800B7E28 2A106400 */  slt        $v0, $v1, $a0
/* A862C 800B7E2C F8FF4014 */  bnez       $v0, .L800B7E10
/* A8630 800B7E30 21100302 */   addu      $v0, $s0, $v1
.L800B7E34:
/* A8634 800B7E34 1001A98F */  lw         $t1, 0x110($sp)
/* A8638 800B7E38 00000000 */  nop
/* A863C 800B7E3C 1000248D */  lw         $a0, 0x10($t1)
/* A8640 800B7E40 1400228D */  lw         $v0, 0x14($t1)
/* A8644 800B7E44 1A008500 */  div        $zero, $a0, $a1
/* A8648 800B7E48 12F00000 */  mflo       $fp
/* A864C 800B7E4C 07004010 */  beqz       $v0, .L800B7E6C
/* A8650 800B7E50 43180400 */   sra       $v1, $a0, 1
/* A8654 800B7E54 0000228D */  lw         $v0, 0x0($t1)
/* A8658 800B7E58 5801A88F */  lw         $t0, 0x158($sp)
/* A865C 800B7E5C 00000000 */  nop
/* A8660 800B7E60 21104800 */  addu       $v0, $v0, $t0
/* A8664 800B7E64 9FDF0208 */  j          .L800B7E7C
/* A8668 800B7E68 23104300 */   subu      $v0, $v0, $v1
.L800B7E6C:
/* A866C 800B7E6C 5801A88F */  lw         $t0, 0x158($sp)
/* A8670 800B7E70 0000228D */  lw         $v0, 0x0($t1)
/* A8674 800B7E74 00000000 */  nop
/* A8678 800B7E78 21104800 */  addu       $v0, $v0, $t0
.L800B7E7C:
/* A867C 800B7E7C 1C01A2AF */  sw         $v0, 0x11C($sp)
/* A8680 800B7E80 21200002 */  addu       $a0, $s0, $zero
/* A8684 800B7E84 0D80053C */  lui        $a1, %hi(voiceList + 0x58)
/* A8688 800B7E88 BD02030C */  jal        func_800C0AF4
/* A868C 800B7E8C 3C1FA524 */   addiu     $a1, $a1, %lo(voiceList + 0x58)
/* A8690 800B7E90 21284000 */  addu       $a1, $v0, $zero
/* A8694 800B7E94 8300A010 */  beqz       $a1, .L800B80A4
/* A8698 800B7E98 00000000 */   nop
/* A869C 800B7E9C 2001A0AF */  sw         $zero, 0x120($sp)
.L800B7EA0:
/* A86A0 800B7EA0 1C01A98F */  lw         $t1, 0x11C($sp)
/* A86A4 800B7EA4 5801A88F */  lw         $t0, 0x158($sp)
/* A86A8 800B7EA8 00000000 */  nop
/* A86AC 800B7EAC 21102801 */  addu       $v0, $t1, $t0
/* A86B0 800B7EB0 2001A98F */  lw         $t1, 0x120($sp)
/* A86B4 800B7EB4 1801A88F */  lw         $t0, 0x118($sp)
/* A86B8 800B7EB8 00000000 */  nop
/* A86BC 800B7EBC 03000011 */  beqz       $t0, .L800B7ECC
/* A86C0 800B7EC0 21A04900 */   addu      $s4, $v0, $t1
/* A86C4 800B7EC4 43101E00 */  sra        $v0, $fp, 1
/* A86C8 800B7EC8 21A08202 */  addu       $s4, $s4, $v0
.L800B7ECC:
/* A86CC 800B7ECC 0800E28E */  lw         $v0, 0x8($s7)
/* A86D0 800B7ED0 5401B58F */  lw         $s5, 0x154($sp)
/* A86D4 800B7ED4 00000000 */  nop
/* A86D8 800B7ED8 2A10A202 */  slt        $v0, $s5, $v0
/* A86DC 800B7EDC 02004010 */  beqz       $v0, .L800B7EE8
/* A86E0 800B7EE0 00000000 */   nop
/* A86E4 800B7EE4 0800F5AE */  sw         $s5, 0x8($s7)
.L800B7EE8:
/* A86E8 800B7EE8 1CF4020C */  jal        func_800BD070
/* A86EC 800B7EEC 1000A427 */   addiu     $a0, $sp, 0x10
/* A86F0 800B7EF0 1000B127 */  addiu      $s1, $sp, 0x10
.L800B7EF4:
/* A86F4 800B7EF4 21202002 */  addu       $a0, $s1, $zero
/* A86F8 800B7EF8 0CF4020C */  jal        func_800BD030
/* A86FC 800B7EFC 0A000524 */   addiu     $a1, $zero, 0xA
/* A8700 800B7F00 21B04000 */  addu       $s6, $v0, $zero
/* A8704 800B7F04 0200C012 */  beqz       $s6, .L800B7F10
/* A8708 800B7F08 00000000 */   nop
/* A870C 800B7F0C 0000C0A2 */  sb         $zero, 0x0($s6)
.L800B7F10:
/* A8710 800B7F10 50002012 */  beqz       $s1, .L800B8054
/* A8714 800B7F14 00000000 */   nop
.L800B7F18:
/* A8718 800B7F18 21202002 */  addu       $a0, $s1, $zero
/* A871C 800B7F1C 0CF4020C */  jal        func_800BD030
/* A8720 800B7F20 20000524 */   addiu     $a1, $zero, 0x20
/* A8724 800B7F24 21904000 */  addu       $s2, $v0, $zero
/* A8728 800B7F28 17004012 */  beqz       $s2, .L800B7F88
/* A872C 800B7F2C 00000000 */   nop
.L800B7F30:
/* A8730 800B7F30 01004426 */  addiu      $a0, $s2, 0x1
/* A8734 800B7F34 0CF4020C */  jal        func_800BD030
/* A8738 800B7F38 20000524 */   addiu     $a1, $zero, 0x20
/* A873C 800B7F3C 21804000 */  addu       $s0, $v0, $zero
/* A8740 800B7F40 02000012 */  beqz       $s0, .L800B7F4C
/* A8744 800B7F44 00000000 */   nop
/* A8748 800B7F48 000000A2 */  sb         $zero, 0x0($s0)
.L800B7F4C:
/* A874C 800B7F4C 67E1020C */  jal        menu_text_width
/* A8750 800B7F50 21202002 */   addu      $a0, $s1, $zero
/* A8754 800B7F54 03000012 */  beqz       $s0, .L800B7F64
/* A8758 800B7F58 00000000 */   nop
/* A875C 800B7F5C 20000924 */  addiu      $t1, $zero, 0x20
/* A8760 800B7F60 000009A2 */  sb         $t1, 0x0($s0)
.L800B7F64:
/* A8764 800B7F64 2A10C203 */  slt        $v0, $fp, $v0
/* A8768 800B7F68 04004014 */  bnez       $v0, .L800B7F7C
/* A876C 800B7F6C 00000000 */   nop
/* A8770 800B7F70 21900002 */  addu       $s2, $s0, $zero
/* A8774 800B7F74 EEFF4016 */  bnez       $s2, .L800B7F30
/* A8778 800B7F78 00000000 */   nop
.L800B7F7C:
/* A877C 800B7F7C 02004012 */  beqz       $s2, .L800B7F88
/* A8780 800B7F80 00000000 */   nop
/* A8784 800B7F84 000040A2 */  sb         $zero, 0x0($s2)
.L800B7F88:
/* A8788 800B7F88 1801A88F */  lw         $t0, 0x118($sp)
/* A878C 800B7F8C 00000000 */  nop
/* A8790 800B7F90 13000011 */  beqz       $t0, .L800B7FE0
/* A8794 800B7F94 00000000 */   nop
/* A8798 800B7F98 67E1020C */  jal        menu_text_width
/* A879C 800B7F9C 21202002 */   addu      $a0, $s1, $zero
/* A87A0 800B7FA0 43980200 */  sra        $s3, $v0, 1
/* A87A4 800B7FA4 23809302 */  subu       $s0, $s4, $s3
/* A87A8 800B7FA8 21200002 */  addu       $a0, $s0, $zero
/* A87AC 800B7FAC 2128A002 */  addu       $a1, $s5, $zero
/* A87B0 800B7FB0 6401A78F */  lw         $a3, 0x164($sp)
/* A87B4 800B7FB4 4DE1020C */  jal        menu_print
/* A87B8 800B7FB8 21302002 */   addu      $a2, $s1, $zero
/* A87BC 800B7FBC 0000E28E */  lw         $v0, 0x0($s7)
/* A87C0 800B7FC0 00000000 */  nop
/* A87C4 800B7FC4 2A100202 */  slt        $v0, $s0, $v0
/* A87C8 800B7FC8 02004010 */  beqz       $v0, .L800B7FD4
/* A87CC 800B7FCC 00000000 */   nop
/* A87D0 800B7FD0 0000F0AE */  sw         $s0, 0x0($s7)
.L800B7FD4:
/* A87D4 800B7FD4 0400E28E */  lw         $v0, 0x4($s7)
/* A87D8 800B7FD8 08E00208 */  j          .L800B8020
/* A87DC 800B7FDC 21189302 */   addu      $v1, $s4, $s3
.L800B7FE0:
/* A87E0 800B7FE0 67E1020C */  jal        menu_text_width
/* A87E4 800B7FE4 21202002 */   addu      $a0, $s1, $zero
/* A87E8 800B7FE8 21208002 */  addu       $a0, $s4, $zero
/* A87EC 800B7FEC 2128A002 */  addu       $a1, $s5, $zero
/* A87F0 800B7FF0 21302002 */  addu       $a2, $s1, $zero
/* A87F4 800B7FF4 6401A78F */  lw         $a3, 0x164($sp)
/* A87F8 800B7FF8 4DE1020C */  jal        menu_print
/* A87FC 800B7FFC 21804000 */   addu      $s0, $v0, $zero
/* A8800 800B8000 0000E28E */  lw         $v0, 0x0($s7)
/* A8804 800B8004 00000000 */  nop
/* A8808 800B8008 2A108202 */  slt        $v0, $s4, $v0
/* A880C 800B800C 02004010 */  beqz       $v0, .L800B8018
/* A8810 800B8010 00000000 */   nop
/* A8814 800B8014 0000F4AE */  sw         $s4, 0x0($s7)
.L800B8018:
/* A8818 800B8018 0400E28E */  lw         $v0, 0x4($s7)
/* A881C 800B801C 21189002 */  addu       $v1, $s4, $s0
.L800B8020:
/* A8820 800B8020 2A104300 */  slt        $v0, $v0, $v1
/* A8824 800B8024 02004010 */  beqz       $v0, .L800B8030
/* A8828 800B8028 00000000 */   nop
/* A882C 800B802C 0400E3AE */  sw         $v1, 0x4($s7)
.L800B8030:
/* A8830 800B8030 1001A98F */  lw         $t1, 0x110($sp)
/* A8834 800B8034 00000000 */  nop
/* A8838 800B8038 0800228D */  lw         $v0, 0x8($t1)
/* A883C 800B803C 05004012 */  beqz       $s2, .L800B8054
/* A8840 800B8040 21A8A202 */   addu      $s5, $s5, $v0
/* A8844 800B8044 20000824 */  addiu      $t0, $zero, 0x20
/* A8848 800B8048 01005126 */  addiu      $s1, $s2, 0x1
/* A884C 800B804C B2FF2016 */  bnez       $s1, .L800B7F18
/* A8850 800B8050 000048A2 */   sb        $t0, 0x0($s2)
.L800B8054:
/* A8854 800B8054 0400C012 */  beqz       $s6, .L800B8068
/* A8858 800B8058 0A000224 */   addiu     $v0, $zero, 0xA
/* A885C 800B805C 0100D126 */  addiu      $s1, $s6, 0x1
/* A8860 800B8060 A4FF2016 */  bnez       $s1, .L800B7EF4
/* A8864 800B8064 0000C2A2 */   sb        $v0, 0x0($s6)
.L800B8068:
/* A8868 800B8068 21200000 */  addu       $a0, $zero, $zero
/* A886C 800B806C 0D80053C */  lui        $a1, %hi(voiceList + 0x58)
/* A8870 800B8070 2001A98F */  lw         $t1, 0x120($sp)
/* A8874 800B8074 3C1FA524 */  addiu      $a1, $a1, %lo(voiceList + 0x58)
/* A8878 800B8078 21483E01 */  addu       $t1, $t1, $fp
/* A887C 800B807C BD02030C */  jal        func_800C0AF4
/* A8880 800B8080 2001A9AF */   sw        $t1, 0x120($sp)
/* A8884 800B8084 1401A88F */  lw         $t0, 0x114($sp)
/* A8888 800B8088 21284000 */  addu       $a1, $v0, $zero
/* A888C 800B808C 2A101501 */  slt        $v0, $t0, $s5
/* A8890 800B8090 02004010 */  beqz       $v0, .L800B809C
/* A8894 800B8094 00000000 */   nop
/* A8898 800B8098 1401B5AF */  sw         $s5, 0x114($sp)
.L800B809C:
/* A889C 800B809C 80FFA014 */  bnez       $a1, .L800B7EA0
/* A88A0 800B80A0 00000000 */   nop
.L800B80A4:
/* A88A4 800B80A4 0C00E28E */  lw         $v0, 0xC($s7)
/* A88A8 800B80A8 1401A98F */  lw         $t1, 0x114($sp)
/* A88AC 800B80AC 00000000 */  nop
/* A88B0 800B80B0 2A104900 */  slt        $v0, $v0, $t1
/* A88B4 800B80B4 02004010 */  beqz       $v0, .L800B80C0
/* A88B8 800B80B8 00000000 */   nop
/* A88BC 800B80BC 0C00E9AE */  sw         $t1, 0xC($s7)
.L800B80C0:
/* A88C0 800B80C0 1001A88F */  lw         $t0, 0x110($sp)
/* A88C4 800B80C4 1401A98F */  lw         $t1, 0x114($sp)
/* A88C8 800B80C8 0C00028D */  lw         $v0, 0xC($t0)
/* A88CC 800B80CC 6801A88F */  lw         $t0, 0x168($sp)
/* A88D0 800B80D0 21482201 */  addu       $t1, $t1, $v0
/* A88D4 800B80D4 04000231 */  andi       $v0, $t0, 0x4
/* A88D8 800B80D8 08004010 */  beqz       $v0, .L800B80FC
/* A88DC 800B80DC 1401A9AF */   sw        $t1, 0x114($sp)
/* A88E0 800B80E0 1001A98F */  lw         $t1, 0x110($sp)
/* A88E4 800B80E4 00000000 */  nop
/* A88E8 800B80E8 0800228D */  lw         $v0, 0x8($t1)
/* A88EC 800B80EC 1401A88F */  lw         $t0, 0x114($sp)
/* A88F0 800B80F0 43100200 */  sra        $v0, $v0, 1
/* A88F4 800B80F4 21400201 */  addu       $t0, $t0, $v0
/* A88F8 800B80F8 1401A8AF */  sw         $t0, 0x114($sp)
.L800B80FC:
/* A88FC 800B80FC 1401A28F */  lw         $v0, 0x114($sp)
/* A8900 800B8100 4C01BF8F */  lw         $ra, 0x14C($sp)
/* A8904 800B8104 4801BE8F */  lw         $fp, 0x148($sp)
/* A8908 800B8108 4401B78F */  lw         $s7, 0x144($sp)
/* A890C 800B810C 4001B68F */  lw         $s6, 0x140($sp)
/* A8910 800B8110 3C01B58F */  lw         $s5, 0x13C($sp)
/* A8914 800B8114 3801B48F */  lw         $s4, 0x138($sp)
/* A8918 800B8118 3401B38F */  lw         $s3, 0x134($sp)
/* A891C 800B811C 3001B28F */  lw         $s2, 0x130($sp)
/* A8920 800B8120 2C01B18F */  lw         $s1, 0x12C($sp)
/* A8924 800B8124 2801B08F */  lw         $s0, 0x128($sp)
/* A8928 800B8128 0800E003 */  jr         $ra
/* A892C 800B812C 5001BD27 */   addiu     $sp, $sp, 0x150
.size menu_draw_item, . - menu_draw_item
