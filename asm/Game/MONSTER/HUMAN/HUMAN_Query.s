.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Query
/* 6D7CC 8007CFCC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6D7D0 8007CFD0 1000BFAF */  sw         $ra, 0x10($sp)
/* 6D7D4 8007CFD4 2400838C */  lw         $v1, 0x24($a0)
/* 6D7D8 8007CFD8 6C01878C */  lw         $a3, 0x16C($a0)
/* 6D7DC 8007CFDC 33006010 */  beqz       $v1, .L8007D0AC
/* 6D7E0 8007CFE0 21100000 */   addu      $v0, $zero, $zero
/* 6D7E4 8007CFE4 0500A010 */  beqz       $a1, .L8007CFFC
/* 6D7E8 8007CFE8 25000224 */   addiu     $v0, $zero, 0x25
/* 6D7EC 8007CFEC 1F00A210 */  beq        $a1, $v0, .L8007D06C
/* 6D7F0 8007CFF0 00000000 */   nop
/* 6D7F4 8007CFF4 27F40108 */  j          .L8007D09C
/* 6D7F8 8007CFF8 00000000 */   nop
.L8007CFFC:
/* 6D7FC 8007CFFC 0000E68C */  lw         $a2, 0x0($a3)
/* 6D800 8007D000 00000000 */  nop
/* 6D804 8007D004 0002C230 */  andi       $v0, $a2, 0x200
/* 6D808 8007D008 27004014 */  bnez       $v0, .L8007D0A8
/* 6D80C 8007D00C 0040053C */   lui       $a1, (0x40000000 >> 16)
/* 6D810 8007D010 9801838C */  lw         $v1, 0x198($a0)
/* 6D814 8007D014 1E000224 */  addiu      $v0, $zero, 0x1E
/* 6D818 8007D018 23006210 */  beq        $v1, $v0, .L8007D0A8
/* 6D81C 8007D01C 0012053C */   lui       $a1, (0x12000000 >> 16)
/* 6D820 8007D020 0001C230 */  andi       $v0, $a2, 0x100
/* 6D824 8007D024 2B100200 */  sltu       $v0, $zero, $v0
/* 6D828 8007D028 402F0200 */  sll        $a1, $v0, 29
/* 6D82C 8007D02C 2000023C */  lui        $v0, (0x200000 >> 16)
/* 6D830 8007D030 2410C200 */  and        $v0, $a2, $v0
/* 6D834 8007D034 1D004014 */  bnez       $v0, .L8007D0AC
/* 6D838 8007D038 2110A000 */   addu      $v0, $a1, $zero
/* 6D83C 8007D03C 4401E284 */  lh         $v0, 0x144($a3)
/* 6D840 8007D040 00000000 */  nop
/* 6D844 8007D044 01104228 */  slti       $v0, $v0, 0x1001
/* 6D848 8007D048 06004014 */  bnez       $v0, .L8007D064
/* 6D84C 8007D04C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 6D850 8007D050 0400E28C */  lw         $v0, 0x4($a3)
/* 6D854 8007D054 00000000 */  nop
/* 6D858 8007D058 03004230 */  andi       $v0, $v0, 0x3
/* 6D85C 8007D05C 12004010 */  beqz       $v0, .L8007D0A8
/* 6D860 8007D060 0008023C */   lui       $v0, (0x8000000 >> 16)
.L8007D064:
/* 6D864 8007D064 2AF40108 */  j          .L8007D0A8
/* 6D868 8007D068 2528A200 */   or        $a1, $a1, $v0
.L8007D06C:
/* 6D86C 8007D06C 1000628C */  lw         $v0, 0x10($v1)
/* 6D870 8007D070 00000000 */  nop
/* 6D874 8007D074 00804230 */  andi       $v0, $v0, 0x8000
/* 6D878 8007D078 0B004014 */  bnez       $v0, .L8007D0A8
/* 6D87C 8007D07C 21280000 */   addu      $a1, $zero, $zero
/* 6D880 8007D080 6801E28C */  lw         $v0, 0x168($a3)
/* 6D884 8007D084 00000000 */  nop
/* 6D888 8007D088 0C00428C */  lw         $v0, 0xC($v0)
/* 6D88C 8007D08C 00000000 */  nop
/* 6D890 8007D090 0000428C */  lw         $v0, 0x0($v0)
/* 6D894 8007D094 2AF40108 */  j          .L8007D0A8
/* 6D898 8007D098 01004530 */   andi      $a1, $v0, 0x1
.L8007D09C:
/* 6D89C 8007D09C 7EF9010C */  jal        MonsterQuery
/* 6D8A0 8007D0A0 00000000 */   nop
/* 6D8A4 8007D0A4 21284000 */  addu       $a1, $v0, $zero
.L8007D0A8:
/* 6D8A8 8007D0A8 2110A000 */  addu       $v0, $a1, $zero
.L8007D0AC:
/* 6D8AC 8007D0AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 6D8B0 8007D0B0 00000000 */  nop
/* 6D8B4 8007D0B4 0800E003 */  jr         $ra
/* 6D8B8 8007D0B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size HUMAN_Query, . - HUMAN_Query
