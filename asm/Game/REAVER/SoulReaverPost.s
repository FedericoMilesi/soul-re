.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverPost
/* 6AE1C 8007A61C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 6AE20 8007A620 2400B1AF */  sw         $s1, 0x24($sp)
/* 6AE24 8007A624 21888000 */  addu       $s1, $a0, $zero
/* 6AE28 8007A628 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 6AE2C 8007A62C 8000023C */  lui        $v0, (0x800101 >> 16)
/* 6AE30 8007A630 01014234 */  ori        $v0, $v0, (0x800101 & 0xFFFF)
/* 6AE34 8007A634 3000BFAF */  sw         $ra, 0x30($sp)
/* 6AE38 8007A638 2800B2AF */  sw         $s2, 0x28($sp)
/* 6AE3C 8007A63C 2000B0AF */  sw         $s0, 0x20($sp)
/* 6AE40 8007A640 6C01308E */  lw         $s0, 0x16C($s1)
/* 6AE44 8007A644 4800A210 */  beq        $a1, $v0, .L8007A768
/* 6AE48 8007A648 2198C000 */   addu      $s3, $a2, $zero
/* 6AE4C 8007A64C 2B104500 */  sltu       $v0, $v0, $a1
/* 6AE50 8007A650 17004014 */  bnez       $v0, .L8007A6B0
/* 6AE54 8007A654 8000023C */   lui       $v0, (0x800002 >> 16)
/* 6AE58 8007A658 02004234 */  ori        $v0, $v0, (0x800002 & 0xFFFF)
/* 6AE5C 8007A65C 3000A210 */  beq        $a1, $v0, .L8007A720
/* 6AE60 8007A660 2B104500 */   sltu      $v0, $v0, $a1
/* 6AE64 8007A664 0A004014 */  bnez       $v0, .L8007A690
/* 6AE68 8007A668 8000023C */   lui       $v0, (0x800010 >> 16)
/* 6AE6C 8007A66C 2000023C */  lui        $v0, (0x200002 >> 16)
/* 6AE70 8007A670 02004234 */  ori        $v0, $v0, (0x200002 & 0xFFFF)
/* 6AE74 8007A674 A100A210 */  beq        $a1, $v0, .L8007A8FC
/* 6AE78 8007A678 2000023C */   lui       $v0, (0x200003 >> 16)
/* 6AE7C 8007A67C 03004234 */  ori        $v0, $v0, (0x200003 & 0xFFFF)
/* 6AE80 8007A680 A300A210 */  beq        $a1, $v0, .L8007A910
/* 6AE84 8007A684 21202002 */   addu      $a0, $s1, $zero
/* 6AE88 8007A688 57EA0108 */  j          .L8007A95C
/* 6AE8C 8007A68C 00000000 */   nop
.L8007A690:
/* 6AE90 8007A690 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* 6AE94 8007A694 5B00A210 */  beq        $a1, $v0, .L8007A804
/* 6AE98 8007A698 8000023C */   lui       $v0, (0x800100 >> 16)
/* 6AE9C 8007A69C 00014234 */  ori        $v0, $v0, (0x800100 & 0xFFFF)
/* 6AEA0 8007A6A0 2B00A210 */  beq        $a1, $v0, .L8007A750
/* 6AEA4 8007A6A4 01000224 */   addiu     $v0, $zero, 0x1
/* 6AEA8 8007A6A8 57EA0108 */  j          .L8007A95C
/* 6AEAC 8007A6AC 00000000 */   nop
.L8007A6B0:
/* 6AEB0 8007A6B0 05014234 */  ori        $v0, $v0, (0x800105 & 0xFFFF)
/* 6AEB4 8007A6B4 9A00A210 */  beq        $a1, $v0, .L8007A920
/* 6AEB8 8007A6B8 2B104500 */   sltu      $v0, $v0, $a1
/* 6AEBC 8007A6BC 09004014 */  bnez       $v0, .L8007A6E4
/* 6AEC0 8007A6C0 8000023C */   lui       $v0, (0x800103 >> 16)
/* 6AEC4 8007A6C4 03014234 */  ori        $v0, $v0, (0x800103 & 0xFFFF)
/* 6AEC8 8007A6C8 3000A210 */  beq        $a1, $v0, .L8007A78C
/* 6AECC 8007A6CC 8000023C */   lui       $v0, (0x800104 >> 16)
/* 6AED0 8007A6D0 04014234 */  ori        $v0, $v0, (0x800104 & 0xFFFF)
/* 6AED4 8007A6D4 3C00A210 */  beq        $a1, $v0, .L8007A7C8
/* 6AED8 8007A6D8 00F00234 */   ori       $v0, $zero, 0xF000
/* 6AEDC 8007A6DC 57EA0108 */  j          .L8007A95C
/* 6AEE0 8007A6E0 00000000 */   nop
.L8007A6E4:
/* 6AEE4 8007A6E4 08014234 */  ori        $v0, $v0, (0x800108 & 0xFFFF)
/* 6AEE8 8007A6E8 9200A210 */  beq        $a1, $v0, .L8007A934
/* 6AEEC 8007A6EC 2B104500 */   sltu      $v0, $v0, $a1
/* 6AEF0 8007A6F0 06004014 */  bnez       $v0, .L8007A70C
/* 6AEF4 8007A6F4 8000023C */   lui       $v0, (0x800107 >> 16)
/* 6AEF8 8007A6F8 07014234 */  ori        $v0, $v0, (0x800107 & 0xFFFF)
/* 6AEFC 8007A6FC 3F00A210 */  beq        $a1, $v0, .L8007A7FC
/* 6AF00 8007A700 00000000 */   nop
/* 6AF04 8007A704 57EA0108 */  j          .L8007A95C
/* 6AF08 8007A708 00000000 */   nop
.L8007A70C:
/* 6AF0C 8007A70C 09014234 */  ori        $v0, $v0, (0x800109 & 0xFFFF)
/* 6AF10 8007A710 8F00A210 */  beq        $a1, $v0, .L8007A950
/* 6AF14 8007A714 21200002 */   addu      $a0, $s0, $zero
/* 6AF18 8007A718 57EA0108 */  j          .L8007A95C
/* 6AF1C 8007A71C 00000000 */   nop
.L8007A720:
/* 6AF20 8007A720 4801228E */  lw         $v0, 0x148($s1)
/* 6AF24 8007A724 00000000 */  nop
/* 6AF28 8007A728 06004014 */  bnez       $v0, .L8007A744
/* 6AF2C 8007A72C 01000224 */   addiu     $v0, $zero, 0x1
/* 6AF30 8007A730 21202002 */  addu       $a0, $s1, $zero
/* 6AF34 8007A734 21286002 */  addu       $a1, $s3, $zero
/* 6AF38 8007A738 47D5000C */  jal        INSTANCE_LinkToParent
/* 6AF3C 8007A73C 29000624 */   addiu     $a2, $zero, 0x29
/* 6AF40 8007A740 01000224 */  addiu      $v0, $zero, 0x1
.L8007A744:
/* 6AF44 8007A744 010002A2 */  sb         $v0, 0x1($s0)
/* 6AF48 8007A748 4FEA0108 */  j          .L8007A93C
/* 6AF4C 8007A74C 000002A2 */   sb        $v0, 0x0($s0)
.L8007A750:
/* 6AF50 8007A750 1E000386 */  lh         $v1, 0x1E($s0)
/* 6AF54 8007A754 00000000 */  nop
/* 6AF58 8007A758 78006014 */  bnez       $v1, .L8007A93C
/* 6AF5C 8007A75C 010002A2 */   sb        $v0, 0x1($s0)
/* 6AF60 8007A760 4EEA0108 */  j          .L8007A938
/* 6AF64 8007A764 00100224 */   addiu     $v0, $zero, 0x1000
.L8007A768:
/* 6AF68 8007A768 21200002 */  addu       $a0, $s0, $zero
/* 6AF6C 8007A76C 21282002 */  addu       $a1, $s1, $zero
/* 6AF70 8007A770 77E9010C */  jal        StopSoulReaverCharge
/* 6AF74 8007A774 010080A0 */   sb        $zero, 0x1($a0)
/* 6AF78 8007A778 1400228E */  lw         $v0, 0x14($s1)
/* 6AF7C 8007A77C 00000000 */  nop
/* 6AF80 8007A780 00084234 */  ori        $v0, $v0, 0x800
/* 6AF84 8007A784 57EA0108 */  j          .L8007A95C
/* 6AF88 8007A788 140022AE */   sw        $v0, 0x14($s1)
.L8007A78C:
/* 6AF8C 8007A78C 00141300 */  sll        $v0, $s3, 16
/* 6AF90 8007A790 03140200 */  sra        $v0, $v0, 16
/* 6AF94 8007A794 06000324 */  addiu      $v1, $zero, 0x6
/* 6AF98 8007A798 05004314 */  bne        $v0, $v1, .L8007A7B0
/* 6AF9C 8007A79C 040013A6 */   sh        $s3, 0x4($s0)
/* 6AFA0 8007A7A0 01000224 */  addiu      $v0, $zero, 0x1
/* 6AFA4 8007A7A4 D4EC82A7 */  sh         $v0, %gp_rel(FireReaverFlag)($gp)
/* 6AFA8 8007A7A8 EEE90108 */  j          .L8007A7B8
/* 6AFAC 8007A7AC 21202002 */   addu      $a0, $s1, $zero
.L8007A7B0:
/* 6AFB0 8007A7B0 D4EC80A7 */  sh         $zero, %gp_rel(FireReaverFlag)($gp)
/* 6AFB4 8007A7B4 21202002 */  addu       $a0, $s1, $zero
.L8007A7B8:
/* 6AFB8 8007A7B8 0BE9010C */  jal        SoulReaverImbue
/* 6AFBC 8007A7BC 21286002 */   addu      $a1, $s3, $zero
/* 6AFC0 8007A7C0 57EA0108 */  j          .L8007A95C
/* 6AFC4 8007A7C4 00000000 */   nop
.L8007A7C8:
/* 6AFC8 8007A7C8 080002AE */  sw         $v0, 0x8($s0)
/* 6AFCC 8007A7CC 21202002 */  addu       $a0, $s1, $zero
/* 6AFD0 8007A7D0 21280000 */  addu       $a1, $zero, $zero
/* 6AFD4 8007A7D4 7DC6010C */  jal        SetObjectAbsorbData
/* 6AFD8 8007A7D8 3C000624 */   addiu     $a2, $zero, 0x3C
/* 6AFDC 8007A7DC 21202002 */  addu       $a0, $s1, $zero
/* 6AFE0 8007A7E0 20000524 */  addiu      $a1, $zero, 0x20
/* 6AFE4 8007A7E4 8000063C */  lui        $a2, (0x800028 >> 16)
/* 6AFE8 8007A7E8 2800C634 */  ori        $a2, $a2, (0x800028 & 0xFFFF)
/* 6AFEC 8007A7EC BAD1000C */  jal        INSTANCE_Broadcast
/* 6AFF0 8007A7F0 21384000 */   addu      $a3, $v0, $zero
/* 6AFF4 8007A7F4 57EA0108 */  j          .L8007A95C
/* 6AFF8 8007A7F8 00000000 */   nop
.L8007A7FC:
/* 6AFFC 8007A7FC 57EA0108 */  j          .L8007A95C
/* 6B000 8007A800 1E0013A6 */   sh        $s3, 0x1E($s0)
.L8007A804:
/* 6B004 8007A804 21200002 */  addu       $a0, $s0, $zero
/* 6B008 8007A808 77E9010C */  jal        StopSoulReaverCharge
/* 6B00C 8007A80C 21282002 */   addu      $a1, $s1, $zero
/* 6B010 8007A810 1000A527 */  addiu      $a1, $sp, 0x10
/* 6B014 8007A814 90010224 */  addiu      $v0, $zero, 0x190
/* 6B018 8007A818 1800B227 */  addiu      $s2, $sp, 0x18
/* 6B01C 8007A81C 1000A0A7 */  sh         $zero, 0x10($sp)
/* 6B020 8007A820 1200A0A7 */  sh         $zero, 0x12($sp)
/* 6B024 8007A824 1400A2A7 */  sh         $v0, 0x14($sp)
/* 6B028 8007A828 4000248E */  lw         $a0, 0x40($s1)
/* 6B02C 8007A82C 0EF3020C */  jal        func_800BCC38
/* 6B030 8007A830 21304002 */   addu      $a2, $s2, $zero
/* 6B034 8007A834 1800A297 */  lhu        $v0, 0x18($sp)
/* 6B038 8007A838 5C002396 */  lhu        $v1, 0x5C($s1)
/* 6B03C 8007A83C 00000000 */  nop
/* 6B040 8007A840 21104300 */  addu       $v0, $v0, $v1
/* 6B044 8007A844 1800A2A7 */  sh         $v0, 0x18($sp)
/* 6B048 8007A848 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 6B04C 8007A84C 5E002396 */  lhu        $v1, 0x5E($s1)
/* 6B050 8007A850 00000000 */  nop
/* 6B054 8007A854 21104300 */  addu       $v0, $v0, $v1
/* 6B058 8007A858 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 6B05C 8007A85C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 6B060 8007A860 60002396 */  lhu        $v1, 0x60($s1)
/* 6B064 8007A864 00000000 */  nop
/* 6B068 8007A868 21104300 */  addu       $v0, $v0, $v1
/* 6B06C 8007A86C 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 6B070 8007A870 6C01228E */  lw         $v0, 0x16C($s1)
/* 6B074 8007A874 21280000 */  addu       $a1, $zero, $zero
/* 6B078 8007A878 04004684 */  lh         $a2, 0x4($v0)
/* 6B07C 8007A87C 4801248E */  lw         $a0, 0x148($s1)
/* 6B080 8007A880 77AA010C */  jal        PHYSOB_BirthProjectile
/* 6B084 8007A884 0200C624 */   addiu     $a2, $a2, 0x2
/* 6B088 8007A888 21804000 */  addu       $s0, $v0, $zero
/* 6B08C 8007A88C 0C00038E */  lw         $v1, 0xC($s0)
/* 6B090 8007A890 00000000 */  nop
/* 6B094 8007A894 31006010 */  beqz       $v1, .L8007A95C
/* 6B098 8007A898 0880023C */   lui       $v0, %hi(CollideReaverProjectile)
/* 6B09C 8007A89C 8000053C */  lui        $a1, (0x800010 >> 16)
/* 6B0A0 8007A8A0 4CA24224 */  addiu      $v0, $v0, %lo(CollideReaverProjectile)
/* 6B0A4 8007A8A4 0C0162AC */  sw         $v0, 0x10C($v1)
/* 6B0A8 8007A8A8 0C00028E */  lw         $v0, 0xC($s0)
/* 6B0AC 8007A8AC 1800A397 */  lhu        $v1, 0x18($sp)
/* 6B0B0 8007A8B0 02004496 */  lhu        $a0, 0x2($s2)
/* 6B0B4 8007A8B4 04004696 */  lhu        $a2, 0x4($s2)
/* 6B0B8 8007A8B8 1000A534 */  ori        $a1, $a1, (0x800010 & 0xFFFF)
/* 6B0BC 8007A8BC 5C0043A4 */  sh         $v1, 0x5C($v0)
/* 6B0C0 8007A8C0 5C004224 */  addiu      $v0, $v0, 0x5C
/* 6B0C4 8007A8C4 020044A4 */  sh         $a0, 0x2($v0)
/* 6B0C8 8007A8C8 040046A4 */  sh         $a2, 0x4($v0)
/* 6B0CC 8007A8CC 0C00048E */  lw         $a0, 0xC($s0)
/* 6B0D0 8007A8D0 A1D1000C */  jal        INSTANCE_Post
/* 6B0D4 8007A8D4 21306002 */   addu      $a2, $s3, $zero
/* 6B0D8 8007A8D8 0C00028E */  lw         $v0, 0xC($s0)
/* 6B0DC 8007A8DC 1800A397 */  lhu        $v1, 0x18($sp)
/* 6B0E0 8007A8E0 02004496 */  lhu        $a0, 0x2($s2)
/* 6B0E4 8007A8E4 04004596 */  lhu        $a1, 0x4($s2)
/* 6B0E8 8007A8E8 5C0043A4 */  sh         $v1, 0x5C($v0)
/* 6B0EC 8007A8EC 5C004224 */  addiu      $v0, $v0, 0x5C
/* 6B0F0 8007A8F0 020044A4 */  sh         $a0, 0x2($v0)
/* 6B0F4 8007A8F4 57EA0108 */  j          .L8007A95C
/* 6B0F8 8007A8F8 040045A4 */   sh        $a1, 0x4($v0)
.L8007A8FC:
/* 6B0FC 8007A8FC 21202002 */  addu       $a0, $s1, $zero
/* 6B100 8007A900 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 6B104 8007A904 21280000 */   addu      $a1, $zero, $zero
/* 6B108 8007A908 57EA0108 */  j          .L8007A95C
/* 6B10C 8007A90C 00000000 */   nop
.L8007A910:
/* 6B110 8007A910 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 6B114 8007A914 21280000 */   addu      $a1, $zero, $zero
/* 6B118 8007A918 57EA0108 */  j          .L8007A95C
/* 6B11C 8007A91C 00000000 */   nop
.L8007A920:
/* 6B120 8007A920 21200002 */  addu       $a0, $s0, $zero
/* 6B124 8007A924 77E9010C */  jal        StopSoulReaverCharge
/* 6B128 8007A928 21282002 */   addu      $a1, $s1, $zero
/* 6B12C 8007A92C 57EA0108 */  j          .L8007A95C
/* 6B130 8007A930 00000000 */   nop
.L8007A934:
/* 6B134 8007A934 00100224 */  addiu      $v0, $zero, 0x1000
.L8007A938:
/* 6B138 8007A938 1E0002A6 */  sh         $v0, 0x1E($s0)
.L8007A93C:
/* 6B13C 8007A93C 1400228E */  lw         $v0, 0x14($s1)
/* 6B140 8007A940 FFF70324 */  addiu      $v1, $zero, -0x801
/* 6B144 8007A944 24104300 */  and        $v0, $v0, $v1
/* 6B148 8007A948 57EA0108 */  j          .L8007A95C
/* 6B14C 8007A94C 140022AE */   sw        $v0, 0x14($s1)
.L8007A950:
/* 6B150 8007A950 77E9010C */  jal        StopSoulReaverCharge
/* 6B154 8007A954 21282002 */   addu      $a1, $s1, $zero
/* 6B158 8007A958 1E0000A6 */  sh         $zero, 0x1E($s0)
.L8007A95C:
/* 6B15C 8007A95C 3000BF8F */  lw         $ra, 0x30($sp)
/* 6B160 8007A960 2C00B38F */  lw         $s3, 0x2C($sp)
/* 6B164 8007A964 2800B28F */  lw         $s2, 0x28($sp)
/* 6B168 8007A968 2400B18F */  lw         $s1, 0x24($sp)
/* 6B16C 8007A96C 2000B08F */  lw         $s0, 0x20($sp)
/* 6B170 8007A970 0800E003 */  jr         $ra
/* 6B174 8007A974 3800BD27 */   addiu     $sp, $sp, 0x38
.size SoulReaverPost, . - SoulReaverPost
