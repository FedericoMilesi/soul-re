.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericInit
/* 2EFA0 8003E7A0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2EFA4 8003E7A4 1800B0AF */  sw         $s0, 0x18($sp)
/* 2EFA8 8003E7A8 21808000 */  addu       $s0, $a0, $zero
/* 2EFAC 8003E7AC 2000BFAF */  sw         $ra, 0x20($sp)
/* 2EFB0 8003E7B0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 2EFB4 8003E7B4 2000028E */  lw         $v0, 0x20($s0)
/* 2EFB8 8003E7B8 1C00118E */  lw         $s1, 0x1C($s0)
/* 2EFBC 8003E7BC 06004010 */  beqz       $v0, .L8003E7D8
/* 2EFC0 8003E7C0 21180000 */   addu      $v1, $zero, $zero
/* 2EFC4 8003E7C4 3800428C */  lw         $v0, 0x38($v0)
/* 2EFC8 8003E7C8 00000000 */  nop
/* 2EFCC 8003E7CC 02004010 */  beqz       $v0, .L8003E7D8
/* 2EFD0 8003E7D0 00000000 */   nop
/* 2EFD4 8003E7D4 0000438C */  lw         $v1, 0x0($v0)
.L8003E7D8:
/* 2EFD8 8003E7D8 00000000 */  nop
/* 2EFDC 8003E7DC 06006014 */  bnez       $v1, .L8003E7F8
/* 2EFE0 8003E7E0 F6FF0224 */   addiu     $v0, $zero, -0xA
/* 2EFE4 8003E7E4 880102AE */  sw         $v0, 0x188($s0)
/* 2EFE8 8003E7E8 64000224 */  addiu      $v0, $zero, 0x64
/* 2EFEC 8003E7EC 8C0102AE */  sw         $v0, 0x18C($s0)
/* 2EFF0 8003E7F0 900102AE */  sw         $v0, 0x190($s0)
/* 2EFF4 8003E7F4 940102AE */  sw         $v0, 0x194($s0)
.L8003E7F8:
/* 2EFF8 8003E7F8 33002012 */  beqz       $s1, .L8003E8C8
/* 2EFFC 8003E7FC 00000000 */   nop
/* 2F000 8003E800 0A002286 */  lh         $v0, 0xA($s1)
/* 2F004 8003E804 00000000 */  nop
/* 2F008 8003E808 2F004010 */  beqz       $v0, .L8003E8C8
/* 2F00C 8003E80C 0040033C */   lui       $v1, (0x40000000 >> 16)
/* 2F010 8003E810 2C00228E */  lw         $v0, 0x2C($s1)
/* 2F014 8003E814 00000000 */  nop
/* 2F018 8003E818 24104300 */  and        $v0, $v0, $v1
/* 2F01C 8003E81C 2A004014 */  bnez       $v0, .L8003E8C8
/* 2F020 8003E820 00000000 */   nop
/* 2F024 8003E824 21200002 */  addu       $a0, $s0, $zero
/* 2F028 8003E828 31CA010C */  jal        G2EmulationInstanceSetTotalSections
/* 2F02C 8003E82C 01000524 */   addiu     $a1, $zero, 0x1
/* 2F030 8003E830 21200002 */  addu       $a0, $s0, $zero
/* 2F034 8003E834 26010286 */  lh         $v0, 0x126($s0)
/* 2F038 8003E838 0C00238E */  lw         $v1, 0xC($s1)
/* 2F03C 8003E83C 80100200 */  sll        $v0, $v0, 2
/* 2F040 8003E840 21104300 */  addu       $v0, $v0, $v1
/* 2F044 8003E844 0000428C */  lw         $v0, 0x0($v0)
/* 2F048 8003E848 21280000 */  addu       $a1, $zero, $zero
/* 2F04C 8003E84C 18004794 */  lhu        $a3, 0x18($v0)
/* 2F050 8003E850 2130A000 */  addu       $a2, $a1, $zero
/* 2F054 8003E854 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 2F058 8003E858 003C0700 */  sll        $a3, $a3, 16
/* 2F05C 8003E85C 1ACA010C */  jal        G2EmulationInstanceSetStartAndEndSegment
/* 2F060 8003E860 033C0700 */   sra       $a3, $a3, 16
/* 2F064 8003E864 21200002 */  addu       $a0, $s0, $zero
/* 2F068 8003E868 21280000 */  addu       $a1, $zero, $zero
/* 2F06C 8003E86C 2130A000 */  addu       $a2, $a1, $zero
/* 2F070 8003E870 2138A000 */  addu       $a3, $a1, $zero
/* 2F074 8003E874 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 2F078 8003E878 1000A0AF */   sw        $zero, 0x10($sp)
/* 2F07C 8003E87C 21200002 */  addu       $a0, $s0, $zero
/* 2F080 8003E880 21280000 */  addu       $a1, $zero, $zero
/* 2F084 8003E884 71C9010C */  jal        G2EmulationInstanceSetMode
/* 2F088 8003E888 2130A000 */   addu      $a2, $a1, $zero
/* 2F08C 8003E88C 0D80023C */  lui        $v0, %hi(D_800D0F14)
/* 2F090 8003E890 2400258E */  lw         $a1, 0x24($s1)
/* 2F094 8003E894 140F438C */  lw         $v1, %lo(D_800D0F14)($v0)
/* 2F098 8003E898 0000A48C */  lw         $a0, 0x0($a1)
/* 2F09C 8003E89C 00000000 */  nop
/* 2F0A0 8003E8A0 09008314 */  bne        $a0, $v1, .L8003E8C8
/* 2F0A4 8003E8A4 140F4224 */   addiu     $v0, $v0, %lo(D_800D0F14)
/* 2F0A8 8003E8A8 0400A38C */  lw         $v1, 0x4($a1)
/* 2F0AC 8003E8AC 0400428C */  lw         $v0, 0x4($v0)
/* 2F0B0 8003E8B0 00000000 */  nop
/* 2F0B4 8003E8B4 04006214 */  bne        $v1, $v0, .L8003E8C8
/* 2F0B8 8003E8B8 00000000 */   nop
/* 2F0BC 8003E8BC CCC08527 */  addiu      $a1, $gp, %gp_rel(crap.24)
/* 2F0C0 8003E8C0 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 2F0C4 8003E8C4 EC010426 */   addiu     $a0, $s0, 0x1EC
.L8003E8C8:
/* 2F0C8 8003E8C8 2000BF8F */  lw         $ra, 0x20($sp)
/* 2F0CC 8003E8CC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 2F0D0 8003E8D0 1800B08F */  lw         $s0, 0x18($sp)
/* 2F0D4 8003E8D4 0800E003 */  jr         $ra
/* 2F0D8 8003E8D8 2800BD27 */   addiu     $sp, $sp, 0x28
.size GenericInit, . - GenericInit
