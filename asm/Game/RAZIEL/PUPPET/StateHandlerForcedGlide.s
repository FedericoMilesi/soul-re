.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerForcedGlide
/* 8BE8C 8009B68C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 8BE90 8009B690 2400B1AF */  sw         $s1, 0x24($sp)
/* 8BE94 8009B694 21888000 */  addu       $s1, $a0, $zero
/* 8BE98 8009B698 2800B2AF */  sw         $s2, 0x28($sp)
/* 8BE9C 8009B69C 2190A000 */  addu       $s2, $a1, $zero
/* 8BEA0 8009B6A0 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 8BEA4 8009B6A4 21B8C000 */  addu       $s7, $a2, $zero
/* 8BEA8 8009B6A8 3000B4AF */  sw         $s4, 0x30($sp)
/* 8BEAC 8009B6AC 21A00000 */  addu       $s4, $zero, $zero
/* 8BEB0 8009B6B0 4000BFAF */  sw         $ra, 0x40($sp)
/* 8BEB4 8009B6B4 3800B6AF */  sw         $s6, 0x38($sp)
/* 8BEB8 8009B6B8 3400B5AF */  sw         $s5, 0x34($sp)
/* 8BEBC 8009B6BC 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 8BEC0 8009B6C0 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8BEC4 8009B6C4 2000B0AF */   sw        $s0, 0x20($sp)
/* 8BEC8 8009B6C8 21B04000 */  addu       $s6, $v0, $zero
/* 8BECC 8009B6CC C0101200 */  sll        $v0, $s2, 3
/* 8BED0 8009B6D0 21105200 */  addu       $v0, $v0, $s2
/* 8BED4 8009B6D4 C0100200 */  sll        $v0, $v0, 3
/* 8BED8 8009B6D8 23105200 */  subu       $v0, $v0, $s2
/* 8BEDC 8009B6DC 80100200 */  sll        $v0, $v0, 2
/* 8BEE0 8009B6E0 08004224 */  addiu      $v0, $v0, 0x8
/* 8BEE4 8009B6E4 21982202 */  addu       $s3, $s1, $v0
/* 8BEE8 8009B6E8 E8FF1524 */  addiu      $s5, $zero, -0x18
.L8009B6EC:
/* 8BEEC 8009B6EC 39C3010C */  jal        PeekMessageQueue
/* 8BEF0 8009B6F0 04006426 */   addiu     $a0, $s3, 0x4
/* 8BEF4 8009B6F4 21804000 */  addu       $s0, $v0, $zero
/* 8BEF8 8009B6F8 C4000012 */  beqz       $s0, .L8009BA0C
/* 8BEFC 8009B6FC 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 8BF00 8009B700 0000038E */  lw         $v1, 0x0($s0)
/* 8BF04 8009B704 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8BF08 8009B708 BC006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BF0C 8009B70C 2A104300 */   slt       $v0, $v0, $v1
/* 8BF10 8009B710 24004014 */  bnez       $v0, .L8009B7A4
/* 8BF14 8009B714 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8BF18 8009B718 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 8BF1C 8009B71C 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8BF20 8009B720 B6006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BF24 8009B724 2A104300 */   slt       $v0, $v0, $v1
/* 8BF28 8009B728 10004014 */  bnez       $v0, .L8009B76C
/* 8BF2C 8009B72C 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8BF30 8009B730 0080023C */  lui        $v0, (0x80000004 >> 16)
/* 8BF34 8009B734 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 8BF38 8009B738 B0006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BF3C 8009B73C 2A104300 */   slt       $v0, $v0, $v1
/* 8BF40 8009B740 05004014 */  bnez       $v0, .L8009B758
/* 8BF44 8009B744 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 8BF48 8009B748 AC006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BF4C 8009B74C 21202002 */   addu      $a0, $s1, $zero
/* 8BF50 8009B750 7D6E0208 */  j          .L8009B9F4
/* 8BF54 8009B754 21284002 */   addu      $a1, $s2, $zero
.L8009B758:
/* 8BF58 8009B758 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8BF5C 8009B75C A7006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BF60 8009B760 21202002 */   addu      $a0, $s1, $zero
/* 8BF64 8009B764 7D6E0208 */  j          .L8009B9F4
/* 8BF68 8009B768 21284002 */   addu      $a1, $s2, $zero
.L8009B76C:
/* 8BF6C 8009B76C 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8BF70 8009B770 32006210 */  beq        $v1, $v0, .L8009B83C
/* 8BF74 8009B774 2A104300 */   slt       $v0, $v0, $v1
/* 8BF78 8009B778 05004014 */  bnez       $v0, .L8009B790
/* 8BF7C 8009B77C 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8BF80 8009B780 64006210 */  beq        $v1, $v0, .L8009B914
/* 8BF84 8009B784 21202002 */   addu      $a0, $s1, $zero
/* 8BF88 8009B788 7D6E0208 */  j          .L8009B9F4
/* 8BF8C 8009B78C 21284002 */   addu      $a1, $s2, $zero
.L8009B790:
/* 8BF90 8009B790 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8BF94 8009B794 52006210 */  beq        $v1, $v0, .L8009B8E0
/* 8BF98 8009B798 21202002 */   addu      $a0, $s1, $zero
/* 8BF9C 8009B79C 7D6E0208 */  j          .L8009B9F4
/* 8BFA0 8009B7A0 21284002 */   addu      $a1, $s2, $zero
.L8009B7A4:
/* 8BFA4 8009B7A4 95006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BFA8 8009B7A8 2A104300 */   slt       $v0, $v0, $v1
/* 8BFAC 8009B7AC 12004014 */  bnez       $v0, .L8009B7F8
/* 8BFB0 8009B7B0 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8BFB4 8009B7B4 0004023C */  lui        $v0, (0x4000007 >> 16)
/* 8BFB8 8009B7B8 07004234 */  ori        $v0, $v0, (0x4000007 & 0xFFFF)
/* 8BFBC 8009B7BC 8F006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BFC0 8009B7C0 2A104300 */   slt       $v0, $v0, $v1
/* 8BFC4 8009B7C4 07004014 */  bnez       $v0, .L8009B7E4
/* 8BFC8 8009B7C8 0104023C */   lui       $v0, (0x4010008 >> 16)
/* 8BFCC 8009B7CC 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 8BFD0 8009B7D0 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8BFD4 8009B7D4 89006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BFD8 8009B7D8 21202002 */   addu      $a0, $s1, $zero
/* 8BFDC 8009B7DC 7D6E0208 */  j          .L8009B9F4
/* 8BFE0 8009B7E0 21284002 */   addu      $a1, $s2, $zero
.L8009B7E4:
/* 8BFE4 8009B7E4 08004234 */  ori        $v0, $v0, (0x4010008 & 0xFFFF)
/* 8BFE8 8009B7E8 7B006210 */  beq        $v1, $v0, .L8009B9D8
/* 8BFEC 8009B7EC 21202002 */   addu      $a0, $s1, $zero
/* 8BFF0 8009B7F0 7D6E0208 */  j          .L8009B9F4
/* 8BFF4 8009B7F4 21284002 */   addu      $a1, $s2, $zero
.L8009B7F8:
/* 8BFF8 8009B7F8 80006210 */  beq        $v1, $v0, .L8009B9FC
/* 8BFFC 8009B7FC 2A104300 */   slt       $v0, $v0, $v1
/* 8C000 8009B800 06004014 */  bnez       $v0, .L8009B81C
/* 8C004 8009B804 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 8C008 8009B808 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 8C00C 8009B80C 5C006210 */  beq        $v1, $v0, .L8009B980
/* 8C010 8009B810 21202002 */   addu      $a0, $s1, $zero
/* 8C014 8009B814 7D6E0208 */  j          .L8009B9F4
/* 8C018 8009B818 21284002 */   addu      $a1, $s2, $zero
.L8009B81C:
/* 8C01C 8009B81C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 8C020 8009B820 76006210 */  beq        $v1, $v0, .L8009B9FC
/* 8C024 8009B824 0020023C */   lui       $v0, (0x20000004 >> 16)
/* 8C028 8009B828 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* 8C02C 8009B82C 73006210 */  beq        $v1, $v0, .L8009B9FC
/* 8C030 8009B830 21202002 */   addu      $a0, $s1, $zero
/* 8C034 8009B834 7D6E0208 */  j          .L8009B9F4
/* 8C038 8009B838 21284002 */   addu      $a1, $s2, $zero
.L8009B83C:
/* 8C03C 8009B83C 1E004016 */  bnez       $s2, .L8009B8B8
/* 8C040 8009B840 21202002 */   addu      $a0, $s1, $zero
/* 8C044 8009B844 00200224 */  addiu      $v0, $zero, 0x2000
/* 8C048 8009B848 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8C04C 8009B84C 0000248E */  lw         $a0, 0x0($s1)
/* 8C050 8009B850 C8FD80AF */  sw         $zero, %gp_rel(ControlFlag)($gp)
/* 8C054 8009B854 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8C058 8009B858 938B020C */  jal        SteerSwitchMode
/* 8C05C 8009B85C 21280000 */   addu      $a1, $zero, $zero
/* 8C060 8009B860 0000248E */  lw         $a0, 0x0($s1)
/* 8C064 8009B864 3B87020C */  jal        DeInitAlgorithmicWings
/* 8C068 8009B868 00000000 */   nop
/* 8C06C 8009B86C E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 8C070 8009B870 04000624 */  addiu      $a2, $zero, 0x4
/* 8C074 8009B874 18000224 */  addiu      $v0, $zero, 0x18
/* 8C078 8009B878 1000A2AF */  sw         $v0, 0x10($sp)
/* 8C07C 8009B87C 1400B5AF */  sw         $s5, 0x14($sp)
/* 8C080 8009B880 0000258E */  lw         $a1, 0x0($s1)
/* 8C084 8009B884 3E69020C */  jal        SetExternalTransitionForce
/* 8C088 8009B888 21380000 */   addu      $a3, $zero, $zero
/* 8C08C 8009B88C CCFB838F */  lw         $v1, %gp_rel(Raziel + 0x59C)($gp)
/* 8C090 8009B890 0B000224 */  addiu      $v0, $zero, 0xB
/* 8C094 8009B894 98BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 8C098 8009B898 F6FF0224 */  addiu      $v0, $zero, -0xA
/* 8C09C 8009B89C 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 8C0A0 8009B8A0 0A000224 */  addiu      $v0, $zero, 0xA
/* 8C0A4 8009B8A4 96BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 8C0A8 8009B8A8 E9FF632C */  sltiu      $v1, $v1, -0x17
/* 8C0AC 8009B8AC 02006014 */  bnez       $v1, .L8009B8B8
/* 8C0B0 8009B8B0 21202002 */   addu      $a0, $s1, $zero
/* 8C0B4 8009B8B4 CCFB95AF */  sw         $s5, %gp_rel(Raziel + 0x59C)($gp)
.L8009B8B8:
/* 8C0B8 8009B8B8 21284002 */  addu       $a1, $s2, $zero
/* 8C0BC 8009B8BC 05000224 */  addiu      $v0, $zero, 0x5
/* 8C0C0 8009B8C0 1000A2AF */  sw         $v0, 0x10($sp)
/* 8C0C4 8009B8C4 01000224 */  addiu      $v0, $zero, 0x1
/* 8C0C8 8009B8C8 1400A2AF */  sw         $v0, 0x14($sp)
/* 8C0CC 8009B8CC 0400078E */  lw         $a3, 0x4($s0)
/* 8C0D0 8009B8D0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8C0D4 8009B8D4 10000624 */   addiu     $a2, $zero, 0x10
/* 8C0D8 8009B8D8 7F6E0208 */  j          .L8009B9FC
/* 8C0DC 8009B8DC 00000000 */   nop
.L8009B8E0:
/* 8C0E0 8009B8E0 46004016 */  bnez       $s2, .L8009B9FC
/* 8C0E4 8009B8E4 00000000 */   nop
/* 8C0E8 8009B8E8 0000248E */  lw         $a0, 0x0($s1)
/* 8C0EC 8009B8EC D586020C */  jal        InitAlgorithmicWings
/* 8C0F0 8009B8F0 00000000 */   nop
/* 8C0F4 8009B8F4 0B000224 */  addiu      $v0, $zero, 0xB
/* 8C0F8 8009B8F8 98BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 8C0FC 8009B8FC 0A000224 */  addiu      $v0, $zero, 0xA
/* 8C100 8009B900 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 8C104 8009B904 96BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 8C108 8009B908 CCFB95AF */  sw         $s5, %gp_rel(Raziel + 0x59C)($gp)
/* 8C10C 8009B90C 7F6E0208 */  j          .L8009B9FC
/* 8C110 8009B910 00000000 */   nop
.L8009B914:
/* 8C114 8009B914 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 8C118 8009B918 21300000 */  addu       $a2, $zero, $zero
/* 8C11C 8009B91C 1000A0AF */  sw         $zero, 0x10($sp)
/* 8C120 8009B920 0000248E */  lw         $a0, 0x0($s1)
/* 8C124 8009B924 4E68020C */  jal        SetPhysics
/* 8C128 8009B928 2138C000 */   addu      $a3, $a2, $zero
/* 8C12C 8009B92C 18000524 */  addiu      $a1, $zero, 0x18
/* 8C130 8009B930 21300000 */  addu       $a2, $zero, $zero
/* 8C134 8009B934 0000248E */  lw         $a0, 0x0($s1)
/* 8C138 8009B938 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 8C13C 8009B93C 2138C000 */   addu      $a3, $a2, $zero
/* 8C140 8009B940 07004010 */  beqz       $v0, .L8009B960
/* 8C144 8009B944 01000224 */   addiu     $v0, $zero, 0x1
/* 8C148 8009B948 1000A2AF */  sw         $v0, 0x10($sp)
/* 8C14C 8009B94C 21202002 */  addu       $a0, $s1, $zero
/* 8C150 8009B950 24000524 */  addiu      $a1, $zero, 0x24
/* 8C154 8009B954 21300000 */  addu       $a2, $zero, $zero
/* 8C158 8009B958 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8C15C 8009B95C 04000724 */   addiu     $a3, $zero, 0x4
.L8009B960:
/* 8C160 8009B960 01001424 */  addiu      $s4, $zero, 0x1
/* 8C164 8009B964 21202002 */  addu       $a0, $s1, $zero
/* 8C168 8009B968 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* 8C16C 8009B96C A8BDA524 */  addiu      $a1, $a1, %lo(StateHandlerFall)
/* 8C170 8009B970 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8C174 8009B974 21300000 */   addu      $a2, $zero, $zero
/* 8C178 8009B978 7F6E0208 */  j          .L8009B9FC
/* 8C17C 8009B97C 00000000 */   nop
.L8009B980:
/* 8C180 8009B980 10000224 */  addiu      $v0, $zero, 0x10
/* 8C184 8009B984 1D00C216 */  bne        $s6, $v0, .L8009B9FC
/* 8C188 8009B988 21284002 */   addu      $a1, $s2, $zero
/* 8C18C 8009B98C 11000624 */  addiu      $a2, $zero, 0x11
/* 8C190 8009B990 21380000 */  addu       $a3, $zero, $zero
/* 8C194 8009B994 05000224 */  addiu      $v0, $zero, 0x5
/* 8C198 8009B998 1000A2AF */  sw         $v0, 0x10($sp)
/* 8C19C 8009B99C 01000224 */  addiu      $v0, $zero, 0x1
/* 8C1A0 8009B9A0 1400A2AF */  sw         $v0, 0x14($sp)
/* 8C1A4 8009B9A4 04000224 */  addiu      $v0, $zero, 0x4
/* 8C1A8 8009B9A8 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 8C1AC 8009B9AC 1800A2AF */   sw        $v0, 0x18($sp)
/* 8C1B0 8009B9B0 E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 8C1B4 8009B9B4 CCFB828F */  lw         $v0, %gp_rel(Raziel + 0x59C)($gp)
/* 8C1B8 8009B9B8 04000624 */  addiu      $a2, $zero, 0x4
/* 8C1BC 8009B9BC 1000A0AF */  sw         $zero, 0x10($sp)
/* 8C1C0 8009B9C0 1400A2AF */  sw         $v0, 0x14($sp)
/* 8C1C4 8009B9C4 0000258E */  lw         $a1, 0x0($s1)
/* 8C1C8 8009B9C8 3E69020C */  jal        SetExternalTransitionForce
/* 8C1CC 8009B9CC 21380000 */   addu      $a3, $zero, $zero
/* 8C1D0 8009B9D0 7F6E0208 */  j          .L8009B9FC
/* 8C1D4 8009B9D4 00000000 */   nop
.L8009B9D8:
/* 8C1D8 8009B9D8 21284002 */  addu       $a1, $s2, $zero
/* 8C1DC 8009B9DC 0B80063C */  lui        $a2, %hi(StateHandlerDeCompression)
/* 8C1E0 8009B9E0 18C8C624 */  addiu      $a2, $a2, %lo(StateHandlerDeCompression)
/* 8C1E4 8009B9E4 C1CA010C */  jal        StateSwitchStateData
/* 8C1E8 8009B9E8 21380000 */   addu      $a3, $zero, $zero
/* 8C1EC 8009B9EC 7F6E0208 */  j          .L8009B9FC
/* 8C1F0 8009B9F0 00000000 */   nop
.L8009B9F4:
/* 8C1F4 8009B9F4 B9BF020C */  jal        DefaultStateHandler
/* 8C1F8 8009B9F8 2130E002 */   addu      $a2, $s7, $zero
.L8009B9FC:
/* 8C1FC 8009B9FC 27C3010C */  jal        DeMessageQueue
/* 8C200 8009BA00 04006426 */   addiu     $a0, $s3, 0x4
/* 8C204 8009BA04 BB6D0208 */  j          .L8009B6EC
/* 8C208 8009BA08 00000000 */   nop
.L8009BA0C:
/* 8C20C 8009BA0C 10008016 */  bnez       $s4, .L8009BA50
/* 8C210 8009BA10 00000000 */   nop
/* 8C214 8009BA14 0E004016 */  bnez       $s2, .L8009BA50
/* 8C218 8009BA18 00000000 */   nop
/* 8C21C 8009BA1C 0000228E */  lw         $v0, 0x0($s1)
/* 8C220 8009BA20 00000000 */  nop
/* 8C224 8009BA24 3800448C */  lw         $a0, 0x38($v0)
/* 8C228 8009BA28 1C66010C */  jal        STREAM_GetLevelWithID
/* 8C22C 8009BA2C 00000000 */   nop
/* 8C230 8009BA30 CC00428C */  lw         $v0, 0xCC($v0)
/* 8C234 8009BA34 00000000 */  nop
/* 8C238 8009BA38 00104230 */  andi       $v0, $v0, 0x1000
/* 8C23C 8009BA3C 04004014 */  bnez       $v0, .L8009BA50
/* 8C240 8009BA40 0C002426 */   addiu     $a0, $s1, 0xC
/* 8C244 8009BA44 1000053C */  lui        $a1, (0x100000 >> 16)
/* 8C248 8009BA48 4EC3010C */  jal        EnMessageQueueData
/* 8C24C 8009BA4C 21300000 */   addu      $a2, $zero, $zero
.L8009BA50:
/* 8C250 8009BA50 4000BF8F */  lw         $ra, 0x40($sp)
/* 8C254 8009BA54 3C00B78F */  lw         $s7, 0x3C($sp)
/* 8C258 8009BA58 3800B68F */  lw         $s6, 0x38($sp)
/* 8C25C 8009BA5C 3400B58F */  lw         $s5, 0x34($sp)
/* 8C260 8009BA60 3000B48F */  lw         $s4, 0x30($sp)
/* 8C264 8009BA64 2C00B38F */  lw         $s3, 0x2C($sp)
/* 8C268 8009BA68 2800B28F */  lw         $s2, 0x28($sp)
/* 8C26C 8009BA6C 2400B18F */  lw         $s1, 0x24($sp)
/* 8C270 8009BA70 2000B08F */  lw         $s0, 0x20($sp)
/* 8C274 8009BA74 0800E003 */  jr         $ra
/* 8C278 8009BA78 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerForcedGlide, . - StateHandlerForcedGlide
