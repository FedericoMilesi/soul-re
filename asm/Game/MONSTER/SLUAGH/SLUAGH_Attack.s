.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_Attack
/* 7DEFC 8008D6FC C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7DF00 8008D700 3000B2AF */  sw         $s2, 0x30($sp)
/* 7DF04 8008D704 21908000 */  addu       $s2, $a0, $zero
/* 7DF08 8008D708 3400BFAF */  sw         $ra, 0x34($sp)
/* 7DF0C 8008D70C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 7DF10 8008D710 2800B0AF */  sw         $s0, 0x28($sp)
/* 7DF14 8008D714 6C01518E */  lw         $s1, 0x16C($s2)
/* 7DF18 8008D718 00000000 */  nop
/* 7DF1C 8008D71C 0400228E */  lw         $v0, 0x4($s1)
/* 7DF20 8008D720 00000000 */  nop
/* 7DF24 8008D724 04004230 */  andi       $v0, $v0, 0x4
/* 7DF28 8008D728 51004010 */  beqz       $v0, .L8008D870
/* 7DF2C 8008D72C 00000000 */   nop
/* 7DF30 8008D730 1800428E */  lw         $v0, 0x18($s2)
/* 7DF34 8008D734 00000000 */  nop
/* 7DF38 8008D738 10004230 */  andi       $v0, $v0, 0x10
/* 7DF3C 8008D73C 03004010 */  beqz       $v0, .L8008D74C
/* 7DF40 8008D740 0D000524 */   addiu     $a1, $zero, 0xD
.L8008D744:
/* 7DF44 8008D744 91FE010C */  jal        MON_SwitchState
/* 7DF48 8008D748 00000000 */   nop
.L8008D74C:
/* 7DF4C 8008D74C 27C3010C */  jal        DeMessageQueue
/* 7DF50 8008D750 08002426 */   addiu     $a0, $s1, 0x8
/* 7DF54 8008D754 21284000 */  addu       $a1, $v0, $zero
/* 7DF58 8008D758 2B00A010 */  beqz       $a1, .L8008D808
/* 7DF5C 8008D75C 0001033C */   lui       $v1, (0x1000009 >> 16)
/* 7DF60 8008D760 0000A28C */  lw         $v0, 0x0($a1)
/* 7DF64 8008D764 09006334 */  ori        $v1, $v1, (0x1000009 & 0xFFFF)
/* 7DF68 8008D768 23004314 */  bne        $v0, $v1, .L8008D7F8
/* 7DF6C 8008D76C 00000000 */   nop
/* 7DF70 8008D770 0400A28C */  lw         $v0, 0x4($a1)
/* 7DF74 8008D774 00000000 */  nop
/* 7DF78 8008D778 0000438C */  lw         $v1, 0x0($v0)
/* 7DF7C 8008D77C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7DF80 8008D780 00000000 */  nop
/* 7DF84 8008D784 F1FF6210 */  beq        $v1, $v0, .L8008D74C
/* 7DF88 8008D788 00000000 */   nop
/* 7DF8C 8008D78C DC00228E */  lw         $v0, 0xDC($s1)
/* 7DF90 8008D790 00000000 */  nop
/* 7DF94 8008D794 16004014 */  bnez       $v0, .L8008D7F0
/* 7DF98 8008D798 21204002 */   addu      $a0, $s2, $zero
/* 7DF9C 8008D79C 44012486 */  lh         $a0, 0x144($s1)
/* 7DFA0 8008D7A0 2400508E */  lw         $s0, 0x24($s2)
/* 7DFA4 8008D7A4 02008104 */  bgez       $a0, .L8008D7B0
/* 7DFA8 8008D7A8 00000000 */   nop
/* 7DFAC 8008D7AC FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8008D7B0:
/* 7DFB0 8008D7B0 3434010C */  jal        FX_GetHealthColor
/* 7DFB4 8008D7B4 03230400 */   sra       $a0, $a0, 12
/* 7DFB8 8008D7B8 21204002 */  addu       $a0, $s2, $zero
/* 7DFBC 8008D7BC 2000A627 */  addiu      $a2, $sp, 0x20
/* 7DFC0 8008D7C0 01000724 */  addiu      $a3, $zero, 0x1
/* 7DFC4 8008D7C4 2000A2AF */  sw         $v0, 0x20($sp)
/* 7DFC8 8008D7C8 19000592 */  lbu        $a1, 0x19($s0)
/* 7DFCC 8008D7CC B0040224 */  addiu      $v0, $zero, 0x4B0
/* 7DFD0 8008D7D0 1000A2AF */  sw         $v0, 0x10($sp)
/* 7DFD4 8008D7D4 68000224 */  addiu      $v0, $zero, 0x68
/* 7DFD8 8008D7D8 1400A2AF */  sw         $v0, 0x14($sp)
/* 7DFDC 8008D7DC 70000224 */  addiu      $v0, $zero, 0x70
/* 7DFE0 8008D7E0 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 7DFE4 8008D7E4 1800A2AF */   sw        $v0, 0x18($sp)
/* 7DFE8 8008D7E8 DC0022AE */  sw         $v0, 0xDC($s1)
/* 7DFEC 8008D7EC 21204002 */  addu       $a0, $s2, $zero
.L8008D7F0:
/* 7DFF0 8008D7F0 D1350208 */  j          .L8008D744
/* 7DFF4 8008D7F4 02000524 */   addiu     $a1, $zero, 0x2
.L8008D7F8:
/* 7DFF8 8008D7F8 6513020C */  jal        MON_DefaultMessageHandler
/* 7DFFC 8008D7FC 21204002 */   addu      $a0, $s2, $zero
/* 7E000 8008D800 D3350208 */  j          .L8008D74C
/* 7E004 8008D804 00000000 */   nop
.L8008D808:
/* 7E008 8008D808 9801438E */  lw         $v1, 0x198($s2)
/* 7E00C 8008D80C 06000224 */  addiu      $v0, $zero, 0x6
/* 7E010 8008D810 05006214 */  bne        $v1, $v0, .L8008D828
/* 7E014 8008D814 00000000 */   nop
/* 7E018 8008D818 C400228E */  lw         $v0, 0xC4($s1)
/* 7E01C 8008D81C 00000000 */  nop
/* 7E020 8008D820 06004014 */  bnez       $v0, .L8008D83C
/* 7E024 8008D824 00000000 */   nop
.L8008D828:
/* 7E028 8008D828 0400228E */  lw         $v0, 0x4($s1)
/* 7E02C 8008D82C FBFF0324 */  addiu      $v1, $zero, -0x5
/* 7E030 8008D830 24104300 */  and        $v0, $v0, $v1
/* 7E034 8008D834 1E360208 */  j          .L8008D878
/* 7E038 8008D838 040022AE */   sw        $v0, 0x4($s1)
.L8008D83C:
/* 7E03C 8008D83C 5C004586 */  lh         $a1, 0x5C($s2)
/* 7E040 8008D840 5E004686 */  lh         $a2, 0x5E($s2)
/* 7E044 8008D844 60004786 */  lh         $a3, 0x60($s2)
/* 7E048 8008D848 E4C3010C */  jal        SetMonsterSoulSuckData
/* 7E04C 8008D84C 21204002 */   addu      $a0, $s2, $zero
/* 7E050 8008D850 0001053C */  lui        $a1, (0x1000009 >> 16)
/* 7E054 8008D854 C400238E */  lw         $v1, 0xC4($s1)
/* 7E058 8008D858 0900A534 */  ori        $a1, $a1, (0x1000009 & 0xFFFF)
/* 7E05C 8008D85C 0400648C */  lw         $a0, 0x4($v1)
/* 7E060 8008D860 A1D1000C */  jal        INSTANCE_Post
/* 7E064 8008D864 21304000 */   addu      $a2, $v0, $zero
/* 7E068 8008D868 1E360208 */  j          .L8008D878
/* 7E06C 8008D86C 00000000 */   nop
.L8008D870:
/* 7E070 8008D870 0B27020C */  jal        MON_Attack
/* 7E074 8008D874 21204002 */   addu      $a0, $s2, $zero
.L8008D878:
/* 7E078 8008D878 3400BF8F */  lw         $ra, 0x34($sp)
/* 7E07C 8008D87C 3000B28F */  lw         $s2, 0x30($sp)
/* 7E080 8008D880 2C00B18F */  lw         $s1, 0x2C($sp)
/* 7E084 8008D884 2800B08F */  lw         $s0, 0x28($sp)
/* 7E088 8008D888 0800E003 */  jr         $ra
/* 7E08C 8008D88C 3800BD27 */   addiu     $sp, $sp, 0x38
.size SLUAGH_Attack, . - SLUAGH_Attack
