.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_GarbageCollectMalloc
/* 40F14 80050714 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 40F18 80050718 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 40F1C 8005071C 21888000 */  addu       $s1, $a0, $zero
/* 40F20 80050720 2800B4AF */  sw         $s4, 0x28($sp)
/* 40F24 80050724 21A0C000 */  addu       $s4, $a2, $zero
/* 40F28 80050728 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 40F2C 8005072C 2400B3AF */  sw         $s3, 0x24($sp)
/* 40F30 80050730 2000B2AF */  sw         $s2, 0x20($sp)
/* 40F34 80050734 1800B0AF */  sw         $s0, 0x18($sp)
/* 40F38 80050738 0000248E */  lw         $a0, 0x0($s1)
/* 40F3C 8005073C 2198A000 */  addu       $s3, $a1, $zero
/* 40F40 80050740 0B008424 */  addiu      $a0, $a0, 0xB
/* 40F44 80050744 82200400 */  srl        $a0, $a0, 2
/* 40F48 80050748 80200400 */  sll        $a0, $a0, 2
/* 40F4C 8005074C 3E40010C */  jal        MEMPACK_GetSmallestBlockTopBottom
/* 40F50 80050750 000024AE */   sw        $a0, 0x0($s1)
/* 40F54 80050754 21804000 */  addu       $s0, $v0, $zero
/* 40F58 80050758 18000016 */  bnez       $s0, .L800507BC
/* 40F5C 8005075C 00000000 */   nop
/* 40F60 80050760 617F010C */  jal        STREAM_DumpNonResidentObjects
/* 40F64 80050764 00000000 */   nop
/* 40F68 80050768 0000248E */  lw         $a0, 0x0($s1)
/* 40F6C 8005076C 3E40010C */  jal        MEMPACK_GetSmallestBlockTopBottom
/* 40F70 80050770 00000000 */   nop
/* 40F74 80050774 21804000 */  addu       $s0, $v0, $zero
/* 40F78 80050778 10000016 */  bnez       $s0, .L800507BC
/* 40F7C 8005077C FF007232 */   andi      $s2, $s3, 0xFF
/* 40F80 80050780 10000224 */  addiu      $v0, $zero, 0x10
/* 40F84 80050784 39004212 */  beq        $s2, $v0, .L8005086C
/* 40F88 80050788 21100000 */   addu      $v0, $zero, $zero
/* 40F8C 8005078C 8B41010C */  jal        MEMPACK_ReportMemory
/* 40F90 80050790 00000000 */   nop
/* 40F94 80050794 0D80043C */  lui        $a0, %hi(D_800D10C4)
/* 40F98 80050798 C4108424 */  addiu      $a0, $a0, %lo(D_800D10C4)
/* 40F9C 8005079C F4C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x4)($gp)
/* 40FA0 800507A0 F8C6838F */  lw         $v1, %gp_rel(newMemTracker + 0x8)($gp)
/* 40FA4 800507A4 21304002 */  addu       $a2, $s2, $zero
/* 40FA8 800507A8 23104300 */  subu       $v0, $v0, $v1
/* 40FAC 800507AC 1000A2AF */  sw         $v0, 0x10($sp)
/* 40FB0 800507B0 0000258E */  lw         $a1, 0x0($s1)
/* 40FB4 800507B4 2B52000C */  jal        DEBUG_FatalError
/* 40FB8 800507B8 21386000 */   addu      $a3, $v1, $zero
.L800507BC:
/* 40FBC 800507BC 0400038E */  lw         $v1, 0x4($s0)
/* 40FC0 800507C0 0000228E */  lw         $v0, 0x0($s1)
/* 40FC4 800507C4 00000000 */  nop
/* 40FC8 800507C8 23106200 */  subu       $v0, $v1, $v0
/* 40FCC 800507CC 0800422C */  sltiu      $v0, $v0, 0x8
/* 40FD0 800507D0 02004010 */  beqz       $v0, .L800507DC
/* 40FD4 800507D4 00000000 */   nop
/* 40FD8 800507D8 000023AE */  sw         $v1, 0x0($s1)
.L800507DC:
/* 40FDC 800507DC 0000238E */  lw         $v1, 0x0($s1)
/* 40FE0 800507E0 0400028E */  lw         $v0, 0x4($s0)
/* 40FE4 800507E4 00000000 */  nop
/* 40FE8 800507E8 11006210 */  beq        $v1, $v0, .L80050830
/* 40FEC 800507EC 23104300 */   subu      $v0, $v0, $v1
/* 40FF0 800507F0 000082AE */  sw         $v0, 0x0($s4)
/* 40FF4 800507F4 DEBA0234 */  ori        $v0, $zero, 0xBADE
/* 40FF8 800507F8 000002A6 */  sh         $v0, 0x0($s0)
/* 40FFC 800507FC 01000224 */  addiu      $v0, $zero, 0x1
/* 41000 80050800 020002A2 */  sb         $v0, 0x2($s0)
/* 41004 80050804 030013A2 */  sb         $s3, 0x3($s0)
/* 41008 80050808 0000228E */  lw         $v0, 0x0($s1)
/* 4100C 8005080C 00000000 */  nop
/* 41010 80050810 040002AE */  sw         $v0, 0x4($s0)
/* 41014 80050814 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 41018 80050818 0000238E */  lw         $v1, 0x0($s1)
/* 4101C 8005081C 00000000 */  nop
/* 41020 80050820 21104300 */  addu       $v0, $v0, $v1
/* 41024 80050824 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 41028 80050828 1B420108 */  j          .L8005086C
/* 4102C 8005082C 08000226 */   addiu     $v0, $s0, 0x8
.L80050830:
/* 41030 80050830 DEBA0234 */  ori        $v0, $zero, 0xBADE
/* 41034 80050834 000002A6 */  sh         $v0, 0x0($s0)
/* 41038 80050838 01000224 */  addiu      $v0, $zero, 0x1
/* 4103C 8005083C 020002A2 */  sb         $v0, 0x2($s0)
/* 41040 80050840 030013A2 */  sb         $s3, 0x3($s0)
/* 41044 80050844 0000228E */  lw         $v0, 0x0($s1)
/* 41048 80050848 00000000 */  nop
/* 4104C 8005084C 040002AE */  sw         $v0, 0x4($s0)
/* 41050 80050850 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 41054 80050854 0000238E */  lw         $v1, 0x0($s1)
/* 41058 80050858 00000000 */  nop
/* 4105C 8005085C 21104300 */  addu       $v0, $v0, $v1
/* 41060 80050860 F8C682AF */  sw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 41064 80050864 000080AE */  sw         $zero, 0x0($s4)
/* 41068 80050868 08000226 */  addiu      $v0, $s0, 0x8
.L8005086C:
/* 4106C 8005086C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 41070 80050870 2800B48F */  lw         $s4, 0x28($sp)
/* 41074 80050874 2400B38F */  lw         $s3, 0x24($sp)
/* 41078 80050878 2000B28F */  lw         $s2, 0x20($sp)
/* 4107C 8005087C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 41080 80050880 1800B08F */  lw         $s0, 0x18($sp)
/* 41084 80050884 0800E003 */  jr         $ra
/* 41088 80050888 3000BD27 */   addiu     $sp, $sp, 0x30
.size MEMPACK_GarbageCollectMalloc, . - MEMPACK_GarbageCollectMalloc
