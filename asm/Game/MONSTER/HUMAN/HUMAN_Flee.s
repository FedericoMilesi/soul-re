.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Flee
/* 6DF60 8007D760 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6DF64 8007D764 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6DF68 8007D768 21888000 */  addu       $s1, $a0, $zero
/* 6DF6C 8007D76C 2400BFAF */  sw         $ra, 0x24($sp)
/* 6DF70 8007D770 2000B2AF */  sw         $s2, 0x20($sp)
/* 6DF74 8007D774 1800B0AF */  sw         $s0, 0x18($sp)
/* 6DF78 8007D778 6C01308E */  lw         $s0, 0x16C($s1)
/* 6DF7C 8007D77C 00000000 */  nop
/* 6DF80 8007D780 C400128E */  lw         $s2, 0xC4($s0)
/* 6DF84 8007D784 00000000 */  nop
/* 6DF88 8007D788 2E004012 */  beqz       $s2, .L8007D844
/* 6DF8C 8007D78C 00000000 */   nop
/* 6DF90 8007D790 14004286 */  lh         $v0, 0x14($s2)
/* 6DF94 8007D794 00000000 */  nop
/* 6DF98 8007D798 80024228 */  slti       $v0, $v0, 0x280
/* 6DF9C 8007D79C 29004010 */  beqz       $v0, .L8007D844
/* 6DFA0 8007D7A0 00000000 */   nop
/* 6DFA4 8007D7A4 0400028E */  lw         $v0, 0x4($s0)
/* 6DFA8 8007D7A8 00000000 */  nop
/* 6DFAC 8007D7AC 08004230 */  andi       $v0, $v0, 0x8
/* 6DFB0 8007D7B0 1A004014 */  bnez       $v0, .L8007D81C
/* 6DFB4 8007D7B4 02000624 */   addiu     $a2, $zero, 0x2
/* 6DFB8 8007D7B8 2400228E */  lw         $v0, 0x24($s1)
/* 6DFBC 8007D7BC 00000000 */  nop
/* 6DFC0 8007D7C0 0800458C */  lw         $a1, 0x8($v0)
/* 6DFC4 8007D7C4 6FFF010C */  jal        MON_PlayAnimFromList
/* 6DFC8 8007D7C8 2138C000 */   addu      $a3, $a2, $zero
/* 6DFCC 8007D7CC 0400028E */  lw         $v0, 0x4($s0)
/* 6DFD0 8007D7D0 00000000 */  nop
/* 6DFD4 8007D7D4 08004234 */  ori        $v0, $v0, 0x8
/* 6DFD8 8007D7D8 040002AE */  sw         $v0, 0x4($s0)
/* 6DFDC 8007D7DC 20004230 */  andi       $v0, $v0, 0x20
/* 6DFE0 8007D7E0 07004010 */  beqz       $v0, .L8007D800
/* 6DFE4 8007D7E4 AC0D0224 */   addiu     $v0, $zero, 0xDAC
/* 6DFE8 8007D7E8 1000A2AF */  sw         $v0, 0x10($sp)
/* 6DFEC 8007D7EC 5C002426 */  addiu      $a0, $s1, 0x5C
/* 6DFF0 8007D7F0 CB010524 */  addiu      $a1, $zero, 0x1CB
/* 6DFF4 8007D7F4 21300000 */  addu       $a2, $zero, $zero
/* 6DFF8 8007D7F8 05F60108 */  j          .L8007D814
/* 6DFFC 8007D7FC 58000724 */   addiu     $a3, $zero, 0x58
.L8007D800:
/* 6E000 8007D800 1000A2AF */  sw         $v0, 0x10($sp)
/* 6E004 8007D804 5C002426 */  addiu      $a0, $s1, 0x5C
/* 6E008 8007D808 CA010524 */  addiu      $a1, $zero, 0x1CA
/* 6E00C 8007D80C 9CFF0624 */  addiu      $a2, $zero, -0x64
/* 6E010 8007D810 5C000724 */  addiu      $a3, $zero, 0x5C
.L8007D814:
/* 6E014 8007D814 1300010C */  jal        SOUND_Play3dSound
/* 6E018 8007D818 00000000 */   nop
.L8007D81C:
/* 6E01C 8007D81C 21202002 */  addu       $a0, $s1, $zero
/* 6E020 8007D820 6801028E */  lw         $v0, 0x168($s0)
/* 6E024 8007D824 0400458E */  lw         $a1, 0x4($s2)
/* 6E028 8007D828 1C004684 */  lh         $a2, 0x1C($v0)
/* 6E02C 8007D82C 6604020C */  jal        MON_TurnToPosition
/* 6E030 8007D830 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 6E034 8007D834 0917020C */  jal        MON_DefaultQueueHandler
/* 6E038 8007D838 21202002 */   addu      $a0, $s1, $zero
/* 6E03C 8007D83C 1CF60108 */  j          .L8007D870
/* 6E040 8007D840 00000000 */   nop
.L8007D844:
/* 6E044 8007D844 0400028E */  lw         $v0, 0x4($s0)
/* 6E048 8007D848 00000000 */  nop
/* 6E04C 8007D84C 08004230 */  andi       $v0, $v0, 0x8
/* 6E050 8007D850 05004010 */  beqz       $v0, .L8007D868
/* 6E054 8007D854 21202002 */   addu      $a0, $s1, $zero
/* 6E058 8007D858 91FE010C */  jal        MON_SwitchState
/* 6E05C 8007D85C 13000524 */   addiu     $a1, $zero, 0x13
/* 6E060 8007D860 1CF60108 */  j          .L8007D870
/* 6E064 8007D864 00000000 */   nop
.L8007D868:
/* 6E068 8007D868 8129020C */  jal        MON_Flee
/* 6E06C 8007D86C 21202002 */   addu      $a0, $s1, $zero
.L8007D870:
/* 6E070 8007D870 0400038E */  lw         $v1, 0x4($s0)
/* 6E074 8007D874 00000000 */  nop
/* 6E078 8007D878 08006230 */  andi       $v0, $v1, 0x8
/* 6E07C 8007D87C 08004010 */  beqz       $v0, .L8007D8A0
/* 6E080 8007D880 00000000 */   nop
/* 6E084 8007D884 0000028E */  lw         $v0, 0x0($s0)
/* 6E088 8007D888 00000000 */  nop
/* 6E08C 8007D88C 01004230 */  andi       $v0, $v0, 0x1
/* 6E090 8007D890 03004010 */  beqz       $v0, .L8007D8A0
/* 6E094 8007D894 F7FF0224 */   addiu     $v0, $zero, -0x9
/* 6E098 8007D898 24106200 */  and        $v0, $v1, $v0
/* 6E09C 8007D89C 040002AE */  sw         $v0, 0x4($s0)
.L8007D8A0:
/* 6E0A0 8007D8A0 2400BF8F */  lw         $ra, 0x24($sp)
/* 6E0A4 8007D8A4 2000B28F */  lw         $s2, 0x20($sp)
/* 6E0A8 8007D8A8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6E0AC 8007D8AC 1800B08F */  lw         $s0, 0x18($sp)
/* 6E0B0 8007D8B0 0800E003 */  jr         $ra
/* 6E0B4 8007D8B4 2800BD27 */   addiu     $sp, $sp, 0x28
.size HUMAN_Flee, . - HUMAN_Flee
