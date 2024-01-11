.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_ExplodeCollide
/* 7FFB8 8008F7B8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7FFBC 8008F7BC 2800B2AF */  sw         $s2, 0x28($sp)
/* 7FFC0 8008F7C0 21908000 */  addu       $s2, $a0, $zero
/* 7FFC4 8008F7C4 3000B4AF */  sw         $s4, 0x30($sp)
/* 7FFC8 8008F7C8 01000224 */  addiu      $v0, $zero, 0x1
/* 7FFCC 8008F7CC 3400BFAF */  sw         $ra, 0x34($sp)
/* 7FFD0 8008F7D0 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7FFD4 8008F7D4 2400B1AF */  sw         $s1, 0x24($sp)
/* 7FFD8 8008F7D8 2000B0AF */  sw         $s0, 0x20($sp)
/* 7FFDC 8008F7DC C000448E */  lw         $a0, 0xC0($s2)
/* 7FFE0 8008F7E0 6C01518E */  lw         $s1, 0x16C($s2)
/* 7FFE4 8008F7E4 07009390 */  lbu        $s3, 0x7($a0)
/* 7FFE8 8008F7E8 0C00838C */  lw         $v1, 0xC($a0)
/* 7FFEC 8008F7EC 42006216 */  bne        $s3, $v0, .L8008F8F8
/* 7FFF0 8008F7F0 21A0A000 */   addu      $s4, $a1, $zero
/* 7FFF4 8008F7F4 04006390 */  lbu        $v1, 0x4($v1)
/* 7FFF8 8008F7F8 08000224 */  addiu      $v0, $zero, 0x8
/* 7FFFC 8008F7FC 3E006214 */  bne        $v1, $v0, .L8008F8F8
/* 80000 8008F800 00000000 */   nop
/* 80004 8008F804 1400908C */  lw         $s0, 0x14($a0)
/* 80008 8008F808 00000000 */  nop
/* 8000C 8008F80C 3A000012 */  beqz       $s0, .L8008F8F8
/* 80010 8008F810 21200002 */   addu      $a0, $s0, $zero
/* 80014 8008F814 92D1000C */  jal        INSTANCE_Query
/* 80018 8008F818 01000524 */   addiu     $a1, $zero, 0x1
/* 8001C 8008F81C 0100033C */  lui        $v1, (0x10102 >> 16)
/* 80020 8008F820 02016334 */  ori        $v1, $v1, (0x10102 & 0xFFFF)
/* 80024 8008F824 35004314 */  bne        $v0, $v1, .L8008F8FC
/* 80028 8008F828 21204002 */   addu      $a0, $s2, $zero
/* 8002C 8008F82C 4801428E */  lw         $v0, 0x148($s2)
/* 80030 8008F830 00000000 */  nop
/* 80034 8008F834 2C004014 */  bnez       $v0, .L8008F8E8
/* 80038 8008F838 0100033C */   lui       $v1, (0x10000 >> 16)
/* 8003C 8008F83C 0000228E */  lw         $v0, 0x0($s1)
/* 80040 8008F840 00000000 */  nop
/* 80044 8008F844 24104300 */  and        $v0, $v0, $v1
/* 80048 8008F848 10004010 */  beqz       $v0, .L8008F88C
/* 8004C 8008F84C 21200002 */   addu      $a0, $s0, $zero
/* 80050 8008F850 0001053C */  lui        $a1, (0x1000017 >> 16)
/* 80054 8008F854 1700A534 */  ori        $a1, $a1, (0x1000017 & 0xFFFF)
/* 80058 8008F858 A1D1000C */  jal        INSTANCE_Post
/* 8005C 8008F85C 02000624 */   addiu     $a2, $zero, 0x2
/* 80060 8008F860 21204002 */  addu       $a0, $s2, $zero
/* 80064 8008F864 21280000 */  addu       $a1, $zero, $zero
/* 80068 8008F868 04000624 */  addiu      $a2, $zero, 0x4
/* 8006C 8008F86C 2138A000 */  addu       $a3, $a1, $zero
/* 80070 8008F870 1000A0AF */  sw         $zero, 0x10($sp)
/* 80074 8008F874 1400B3AF */  sw         $s3, 0x14($sp)
/* 80078 8008F878 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 8007C 8008F87C 1800A0AF */   sw        $zero, 0x18($sp)
/* 80080 8008F880 0980023C */  lui        $v0, %hi(WCBEGG_ExplodeProcess)
/* 80084 8008F884 2D3E0208 */  j          .L8008F8B4
/* 80088 8008F888 78F44224 */   addiu     $v0, $v0, %lo(WCBEGG_ExplodeProcess)
.L8008F88C:
/* 8008C 8008F88C 21204002 */  addu       $a0, $s2, $zero
/* 80090 8008F890 21280000 */  addu       $a1, $zero, $zero
/* 80094 8008F894 03000624 */  addiu      $a2, $zero, 0x3
/* 80098 8008F898 2138A000 */  addu       $a3, $a1, $zero
/* 8009C 8008F89C 1000A0AF */  sw         $zero, 0x10($sp)
/* 800A0 8008F8A0 1400B3AF */  sw         $s3, 0x14($sp)
/* 800A4 8008F8A4 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 800A8 8008F8A8 1800A0AF */   sw        $zero, 0x18($sp)
/* 800AC 8008F8AC 0980023C */  lui        $v0, %hi(WCBEGG_SplitProcess)
/* 800B0 8008F8B0 B8F54224 */  addiu      $v0, $v0, %lo(WCBEGG_SplitProcess)
.L8008F8B4:
/* 800B4 8008F8B4 080142AE */  sw         $v0, 0x108($s2)
/* 800B8 8008F8B8 21204002 */  addu       $a0, $s2, $zero
/* 800BC 8008F8BC 0000228E */  lw         $v0, 0x0($s1)
/* 800C0 8008F8C0 FFBF0324 */  addiu      $v1, $zero, -0x4001
/* 800C4 8008F8C4 01104234 */  ori        $v0, $v0, 0x1001
/* 800C8 8008F8C8 24104300 */  and        $v0, $v0, $v1
/* 800CC 8008F8CC 000022AE */  sw         $v0, 0x0($s1)
/* 800D0 8008F8D0 7C0140AE */  sw         $zero, 0x17C($s2)
/* 800D4 8008F8D4 780140AE */  sw         $zero, 0x178($s2)
/* 800D8 8008F8D8 9006020C */  jal        MON_GetTime
/* 800DC 8008F8DC 740140AE */   sw        $zero, 0x174($s2)
/* 800E0 8008F8E0 280022AE */  sw         $v0, 0x28($s1)
/* 800E4 8008F8E4 21204002 */  addu       $a0, $s2, $zero
.L8008F8E8:
/* 800E8 8008F8E8 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 800EC 8008F8EC 07000524 */   addiu     $a1, $zero, 0x7
/* 800F0 8008F8F0 473E0208 */  j          .L8008F91C
/* 800F4 8008F8F4 00000000 */   nop
.L8008F8F8:
/* 800F8 8008F8F8 21204002 */  addu       $a0, $s2, $zero
.L8008F8FC:
/* 800FC 8008F8FC 89B5010C */  jal        CollidePhysicalObject
/* 80100 8008F900 21288002 */   addu      $a1, $s4, $zero
/* 80104 8008F904 36002296 */  lhu        $v0, 0x36($s1)
/* 80108 8008F908 3E0020A6 */  sh         $zero, 0x3E($s1)
/* 8010C 8008F90C 3C0020A6 */  sh         $zero, 0x3C($s1)
/* 80110 8008F910 3A0020A6 */  sh         $zero, 0x3A($s1)
/* 80114 8008F914 FEFF4230 */  andi       $v0, $v0, 0xFFFE
/* 80118 8008F918 360022A6 */  sh         $v0, 0x36($s1)
.L8008F91C:
/* 8011C 8008F91C 3400BF8F */  lw         $ra, 0x34($sp)
/* 80120 8008F920 3000B48F */  lw         $s4, 0x30($sp)
/* 80124 8008F924 2C00B38F */  lw         $s3, 0x2C($sp)
/* 80128 8008F928 2800B28F */  lw         $s2, 0x28($sp)
/* 8012C 8008F92C 2400B18F */  lw         $s1, 0x24($sp)
/* 80130 8008F930 2000B08F */  lw         $s0, 0x20($sp)
/* 80134 8008F934 0800E003 */  jr         $ra
/* 80138 8008F938 3800BD27 */   addiu     $sp, $sp, 0x38
.size WCBEGG_ExplodeCollide, . - WCBEGG_ExplodeCollide
