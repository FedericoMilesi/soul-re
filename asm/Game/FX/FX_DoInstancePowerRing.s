.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DoInstancePowerRing
/* 3B7A8 8004AFA8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 3B7AC 8004AFAC 3000B4AF */  sw         $s4, 0x30($sp)
/* 3B7B0 8004AFB0 21A08000 */  addu       $s4, $a0, $zero
/* 3B7B4 8004AFB4 2400B1AF */  sw         $s1, 0x24($sp)
/* 3B7B8 8004AFB8 2188A000 */  addu       $s1, $a1, $zero
/* 3B7BC 8004AFBC 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 3B7C0 8004AFC0 2198C000 */  addu       $s3, $a2, $zero
/* 3B7C4 8004AFC4 2800B2AF */  sw         $s2, 0x28($sp)
/* 3B7C8 8004AFC8 2190E000 */  addu       $s2, $a3, $zero
/* 3B7CC 8004AFCC 80201200 */  sll        $a0, $s2, 2
/* 3B7D0 8004AFD0 2C008424 */  addiu      $a0, $a0, 0x2C
/* 3B7D4 8004AFD4 0D000524 */  addiu      $a1, $zero, 0xD
/* 3B7D8 8004AFD8 3400BFAF */  sw         $ra, 0x34($sp)
/* 3B7DC 8004AFDC 8140010C */  jal        MEMPACK_Malloc
/* 3B7E0 8004AFE0 2000B0AF */   sw        $s0, 0x20($sp)
/* 3B7E4 8004AFE4 21804000 */  addu       $s0, $v0, $zero
/* 3B7E8 8004AFE8 47000012 */  beqz       $s0, .L8004B108
/* 3B7EC 8004AFEC 4E1B023C */   lui       $v0, (0x1B4E81B5 >> 16)
/* 3B7F0 8004AFF0 B5814234 */  ori        $v0, $v0, (0x1B4E81B5 & 0xFFFF)
/* 3B7F4 8004AFF4 40191100 */  sll        $v1, $s1, 5
/* 3B7F8 8004AFF8 23187100 */  subu       $v1, $v1, $s1
/* 3B7FC 8004AFFC 80180300 */  sll        $v1, $v1, 2
/* 3B800 8004B000 21187100 */  addu       $v1, $v1, $s1
/* 3B804 8004B004 C0180300 */  sll        $v1, $v1, 3
/* 3B808 8004B008 18006200 */  mult       $v1, $v0
/* 3B80C 8004B00C 82000224 */  addiu      $v0, $zero, 0x82
/* 3B810 8004B010 0C0002A2 */  sb         $v0, 0xC($s0)
/* 3B814 8004B014 0580023C */  lui        $v0, %hi(FX_UpdateInstanceSplitRing)
/* 3B818 8004B018 ACB34224 */  addiu      $v0, $v0, %lo(FX_UpdateInstanceSplitRing)
/* 3B81C 8004B01C 040002AE */  sw         $v0, 0x4($s0)
/* 3B820 8004B020 100000AE */  sw         $zero, 0x10($s0)
/* 3B824 8004B024 080014AE */  sw         $s4, 0x8($s0)
/* 3B828 8004B028 4800A28F */  lw         $v0, 0x48($sp)
/* 3B82C 8004B02C C31F0300 */  sra        $v1, $v1, 31
/* 3B830 8004B030 240000AE */  sw         $zero, 0x24($s0)
/* 3B834 8004B034 2A0000A6 */  sh         $zero, 0x2A($s0)
/* 3B838 8004B038 280012A6 */  sh         $s2, 0x28($s0)
/* 3B83C 8004B03C 0D0002A2 */  sb         $v0, 0xD($s0)
/* 3B840 8004B040 10400000 */  mfhi       $t0
/* 3B844 8004B044 C3110800 */  sra        $v0, $t0, 7
/* 3B848 8004B048 23104300 */  subu       $v0, $v0, $v1
/* 3B84C 8004B04C 0E0002A6 */  sh         $v0, 0xE($s0)
/* 3B850 8004B050 0200422A */  slti       $v0, $s2, 0x2
/* 3B854 8004B054 05004010 */  beqz       $v0, .L8004B06C
/* 3B858 8004B058 00000000 */   nop
/* 3B85C 8004B05C 17006016 */  bnez       $s3, .L8004B0BC
/* 3B860 8004B060 FF00023C */   lui       $v0, (0xFF8010 >> 16)
/* 3B864 8004B064 302C0108 */  j          .L8004B0C0
/* 3B868 8004B068 10804234 */   ori       $v0, $v0, (0xFF8010 & 0xFFFF)
.L8004B06C:
/* 3B86C 8004B06C 2C000226 */  addiu      $v0, $s0, 0x2C
/* 3B870 8004B070 240002AE */  sw         $v0, 0x24($s0)
/* 3B874 8004B074 0B00401A */  blez       $s2, .L8004B0A4
/* 3B878 8004B078 21280000 */   addu      $a1, $zero, $zero
/* 3B87C 8004B07C 21306002 */  addu       $a2, $s3, $zero
.L8004B080:
/* 3B880 8004B080 0000C48C */  lw         $a0, 0x0($a2)
/* 3B884 8004B084 80100500 */  sll        $v0, $a1, 2
/* 3B888 8004B088 2400038E */  lw         $v1, 0x24($s0)
/* 3B88C 8004B08C 0100A524 */  addiu      $a1, $a1, 0x1
/* 3B890 8004B090 21104300 */  addu       $v0, $v0, $v1
/* 3B894 8004B094 000044AC */  sw         $a0, 0x0($v0)
/* 3B898 8004B098 2A10B200 */  slt        $v0, $a1, $s2
/* 3B89C 8004B09C F8FF4014 */  bnez       $v0, .L8004B080
/* 3B8A0 8004B0A0 0400C624 */   addiu     $a2, $a2, 0x4
.L8004B0A4:
/* 3B8A4 8004B0A4 0E000286 */  lh         $v0, 0xE($s0)
/* 3B8A8 8004B0A8 FFFF4326 */  addiu      $v1, $s2, -0x1
/* 3B8AC 8004B0AC 1A004300 */  div        $zero, $v0, $v1
/* 3B8B0 8004B0B0 12100000 */  mflo       $v0
/* 3B8B4 8004B0B4 00000000 */  nop
/* 3B8B8 8004B0B8 2A0002A6 */  sh         $v0, 0x2A($s0)
.L8004B0BC:
/* 3B8BC 8004B0BC 0000628E */  lw         $v0, 0x0($s3)
.L8004B0C0:
/* 3B8C0 8004B0C0 00000000 */  nop
/* 3B8C4 8004B0C4 200002AE */  sw         $v0, 0x20($s0)
/* 3B8C8 8004B0C8 00100224 */  addiu      $v0, $zero, 0x1000
/* 3B8CC 8004B0CC 1200A0A7 */  sh         $zero, 0x12($sp)
/* 3B8D0 8004B0D0 1000A0A7 */  sh         $zero, 0x10($sp)
/* 3B8D4 8004B0D4 1400A2A7 */  sh         $v0, 0x14($sp)
/* 3B8D8 8004B0D8 5C008296 */  lhu        $v0, 0x5C($s4)
/* 3B8DC 8004B0DC 1000A427 */  addiu      $a0, $sp, 0x10
/* 3B8E0 8004B0E0 1800A2A7 */  sh         $v0, 0x18($sp)
/* 3B8E4 8004B0E4 5E008296 */  lhu        $v0, 0x5E($s4)
/* 3B8E8 8004B0E8 1800A527 */  addiu      $a1, $sp, 0x18
/* 3B8EC 8004B0EC 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 3B8F0 8004B0F0 60008296 */  lhu        $v0, 0x60($s4)
/* 3B8F4 8004B0F4 14000626 */  addiu      $a2, $s0, 0x14
/* 3B8F8 8004B0F8 CD2B010C */  jal        FX_GetPlaneEquation
/* 3B8FC 8004B0FC 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 3B900 8004B100 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3B904 8004B104 21200002 */   addu      $a0, $s0, $zero
.L8004B108:
/* 3B908 8004B108 3400BF8F */  lw         $ra, 0x34($sp)
/* 3B90C 8004B10C 3000B48F */  lw         $s4, 0x30($sp)
/* 3B910 8004B110 2C00B38F */  lw         $s3, 0x2C($sp)
/* 3B914 8004B114 2800B28F */  lw         $s2, 0x28($sp)
/* 3B918 8004B118 2400B18F */  lw         $s1, 0x24($sp)
/* 3B91C 8004B11C 2000B08F */  lw         $s0, 0x20($sp)
/* 3B920 8004B120 0800E003 */  jr         $ra
/* 3B924 8004B124 3800BD27 */   addiu     $sp, $sp, 0x38
.size FX_DoInstancePowerRing, . - FX_DoInstancePowerRing
