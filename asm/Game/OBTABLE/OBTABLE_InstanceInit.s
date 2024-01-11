.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_InstanceInit
/* 2E7B8 8003DFB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2E7BC 8003DFBC 1000B0AF */  sw         $s0, 0x10($sp)
/* 2E7C0 8003DFC0 21808000 */  addu       $s0, $a0, $zero
/* 2E7C4 8003DFC4 1400BFAF */  sw         $ra, 0x14($sp)
/* 2E7C8 8003DFC8 1C00028E */  lw         $v0, 0x1C($s0)
/* 2E7CC 8003DFCC 00000000 */  nop
/* 2E7D0 8003DFD0 04004484 */  lh         $a0, 0x4($v0)
/* 2E7D4 8003DFD4 00000000 */  nop
/* 2E7D8 8003DFD8 06008104 */  bgez       $a0, .L8003DFF4
/* 2E7DC 8003DFDC 0D80033C */   lui       $v1, %hi(objectFunc)
/* 2E7E0 8003DFE0 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 2E7E4 8003DFE4 E8F9000C */  jal        GenericInit
/* 2E7E8 8003DFE8 21200002 */   addu      $a0, $s0, $zero
/* 2E7EC 8003DFEC 09F80008 */  j          .L8003E024
/* 2E7F0 8003DFF0 00000000 */   nop
.L8003DFF4:
/* 2E7F4 8003DFF4 1CA36324 */  addiu      $v1, $v1, %lo(objectFunc)
/* 2E7F8 8003DFF8 C0100400 */  sll        $v0, $a0, 3
/* 2E7FC 8003DFFC 21104400 */  addu       $v0, $v0, $a0
/* 2E800 8003E000 80100200 */  sll        $v0, $v0, 2
/* 2E804 8003E004 21104300 */  addu       $v0, $v0, $v1
/* 2E808 8003E008 0400428C */  lw         $v0, 0x4($v0)
/* 2E80C 8003E00C 00000000 */  nop
/* 2E810 8003E010 04004010 */  beqz       $v0, .L8003E024
/* 2E814 8003E014 00000000 */   nop
/* 2E818 8003E018 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 2E81C 8003E01C 09F84000 */  jalr       $v0
/* 2E820 8003E020 21200002 */   addu      $a0, $s0, $zero
.L8003E024:
/* 2E824 8003E024 1800028E */  lw         $v0, 0x18($s0)
/* 2E828 8003E028 2000033C */  lui        $v1, (0x200000 >> 16)
/* 2E82C 8003E02C 25104300 */  or         $v0, $v0, $v1
/* 2E830 8003E030 180002AE */  sw         $v0, 0x18($s0)
/* 2E834 8003E034 1400028E */  lw         $v0, 0x14($s0)
/* 2E838 8003E038 1000033C */  lui        $v1, (0x100000 >> 16)
/* 2E83C 8003E03C 24104300 */  and        $v0, $v0, $v1
/* 2E840 8003E040 03004014 */  bnez       $v0, .L8003E050
/* 2E844 8003E044 00000000 */   nop
/* 2E848 8003E048 4FF3000C */  jal        SCRIPT_InstanceSplineInit
/* 2E84C 8003E04C 21200002 */   addu      $a0, $s0, $zero
.L8003E050:
/* 2E850 8003E050 2000028E */  lw         $v0, 0x20($s0)
/* 2E854 8003E054 00000000 */  nop
/* 2E858 8003E058 0C004010 */  beqz       $v0, .L8003E08C
/* 2E85C 8003E05C 00000000 */   nop
/* 2E860 8003E060 2C00428C */  lw         $v0, 0x2C($v0)
/* 2E864 8003E064 00000000 */  nop
/* 2E868 8003E068 20004230 */  andi       $v0, $v0, 0x20
/* 2E86C 8003E06C 07004010 */  beqz       $v0, .L8003E08C
/* 2E870 8003E070 FDFF023C */   lui       $v0, (0xFFFDFFFF >> 16)
/* 2E874 8003E074 FFFF4234 */  ori        $v0, $v0, (0xFFFDFFFF & 0xFFFF)
/* 2E878 8003E078 1800038E */  lw         $v1, 0x18($s0)
/* 2E87C 8003E07C FBFF0424 */  addiu      $a0, $zero, -0x5
/* 2E880 8003E080 24186400 */  and        $v1, $v1, $a0
/* 2E884 8003E084 24186200 */  and        $v1, $v1, $v0
/* 2E888 8003E088 180003AE */  sw         $v1, 0x18($s0)
.L8003E08C:
/* 2E88C 8003E08C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2E890 8003E090 1000B08F */  lw         $s0, 0x10($sp)
/* 2E894 8003E094 0800E003 */  jr         $ra
/* 2E898 8003E098 1800BD27 */   addiu     $sp, $sp, 0x18
.size OBTABLE_InstanceInit, . - OBTABLE_InstanceInit
