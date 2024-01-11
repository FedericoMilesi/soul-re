.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_SoulSuck
/* 7E62C 8008DE2C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 7E630 8008DE30 2800B2AF */  sw         $s2, 0x28($sp)
/* 7E634 8008DE34 21908000 */  addu       $s2, $a0, $zero
/* 7E638 8008DE38 3000B4AF */  sw         $s4, 0x30($sp)
/* 7E63C 8008DE3C 21A00000 */  addu       $s4, $zero, $zero
/* 7E640 8008DE40 3800B6AF */  sw         $s6, 0x38($sp)
/* 7E644 8008DE44 21B08002 */  addu       $s6, $s4, $zero
/* 7E648 8008DE48 3400B5AF */  sw         $s5, 0x34($sp)
/* 7E64C 8008DE4C 21A88002 */  addu       $s5, $s4, $zero
/* 7E650 8008DE50 4000BEAF */  sw         $fp, 0x40($sp)
/* 7E654 8008DE54 76051E3C */  lui        $fp, (0x57619F1 >> 16)
/* 7E658 8008DE58 F119DE37 */  ori        $fp, $fp, (0x57619F1 & 0xFFFF)
/* 7E65C 8008DE5C 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 7E660 8008DE60 1800B727 */  addiu      $s7, $sp, 0x18
/* 7E664 8008DE64 4400BFAF */  sw         $ra, 0x44($sp)
/* 7E668 8008DE68 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7E66C 8008DE6C 2400B1AF */  sw         $s1, 0x24($sp)
/* 7E670 8008DE70 2000B0AF */  sw         $s0, 0x20($sp)
/* 7E674 8008DE74 6C01538E */  lw         $s3, 0x16C($s2)
.L8008DE78:
/* 7E678 8008DE78 27C3010C */  jal        DeMessageQueue
/* 7E67C 8008DE7C 08006426 */   addiu     $a0, $s3, 0x8
/* 7E680 8008DE80 21804000 */  addu       $s0, $v0, $zero
/* 7E684 8008DE84 E6000012 */  beqz       $s0, .L8008E220
/* 7E688 8008DE88 0001023C */   lui       $v0, (0x1000008 >> 16)
/* 7E68C 8008DE8C 0000038E */  lw         $v1, 0x0($s0)
/* 7E690 8008DE90 08004234 */  ori        $v0, $v0, (0x1000008 & 0xFFFF)
/* 7E694 8008DE94 CD006210 */  beq        $v1, $v0, .L8008E1CC
/* 7E698 8008DE98 2A104300 */   slt       $v0, $v0, $v1
/* 7E69C 8008DE9C 06004014 */  bnez       $v0, .L8008DEB8
/* 7E6A0 8008DEA0 0001023C */   lui       $v0, (0x1000007 >> 16)
/* 7E6A4 8008DEA4 07004234 */  ori        $v0, $v0, (0x1000007 & 0xFFFF)
/* 7E6A8 8008DEA8 C6006210 */  beq        $v1, $v0, .L8008E1C4
/* 7E6AC 8008DEAC 21204002 */   addu      $a0, $s2, $zero
/* 7E6B0 8008DEB0 84380208 */  j          .L8008E210
/* 7E6B4 8008DEB4 00000000 */   nop
.L8008DEB8:
/* 7E6B8 8008DEB8 09004234 */  ori        $v0, $v0, (0x1000009 & 0xFFFF)
/* 7E6BC 8008DEBC 06006210 */  beq        $v1, $v0, .L8008DED8
/* 7E6C0 8008DEC0 0001023C */   lui       $v0, (0x100000B >> 16)
/* 7E6C4 8008DEC4 0B004234 */  ori        $v0, $v0, (0x100000B & 0xFFFF)
/* 7E6C8 8008DEC8 EBFF6210 */  beq        $v1, $v0, .L8008DE78
/* 7E6CC 8008DECC 21204002 */   addu      $a0, $s2, $zero
/* 7E6D0 8008DED0 84380208 */  j          .L8008E210
/* 7E6D4 8008DED4 00000000 */   nop
.L8008DED8:
/* 7E6D8 8008DED8 0400108E */  lw         $s0, 0x4($s0)
/* 7E6DC 8008DEDC 00000000 */  nop
/* 7E6E0 8008DEE0 04000296 */  lhu        $v0, 0x4($s0)
/* 7E6E4 8008DEE4 00000000 */  nop
/* 7E6E8 8008DEE8 240162A6 */  sh         $v0, 0x124($s3)
/* 7E6EC 8008DEEC 0000628E */  lw         $v0, 0x0($s3)
/* 7E6F0 8008DEF0 06000396 */  lhu        $v1, 0x6($s0)
/* 7E6F4 8008DEF4 00084230 */  andi       $v0, $v0, 0x800
/* 7E6F8 8008DEF8 04004010 */  beqz       $v0, .L8008DF0C
/* 7E6FC 8008DEFC 260163A6 */   sh        $v1, 0x126($s3)
/* 7E700 8008DF00 08000296 */  lhu        $v0, 0x8($s0)
/* 7E704 8008DF04 C6370208 */  j          .L8008DF18
/* 7E708 8008DF08 280162A6 */   sh        $v0, 0x128($s3)
.L8008DF0C:
/* 7E70C 8008DF0C 60004296 */  lhu        $v0, 0x60($s2)
/* 7E710 8008DF10 00000000 */  nop
/* 7E714 8008DF14 280162A6 */  sh         $v0, 0x128($s3)
.L8008DF18:
/* 7E718 8008DF18 24016426 */  addiu      $a0, $s3, 0x124
/* 7E71C 8008DF1C CAE7000C */  jal        MATH3D_DistanceBetweenPositions
/* 7E720 8008DF20 5C004526 */   addiu     $a1, $s2, 0x5C
/* 7E724 8008DF24 21884000 */  addu       $s1, $v0, $zero
/* 7E728 8008DF28 581B222A */  slti       $v0, $s1, 0x1B58
/* 7E72C 8008DF2C A1004010 */  beqz       $v0, .L8008E1B4
/* 7E730 8008DF30 21204002 */   addu      $a0, $s2, $zero
/* 7E734 8008DF34 0000148E */  lw         $s4, 0x0($s0)
/* 7E738 8008DF38 071A020C */  jal        MONSENSE_SetEnemy
/* 7E73C 8008DF3C 21288002 */   addu      $a1, $s4, $zero
/* 7E740 8008DF40 6801628E */  lw         $v0, 0x168($s3)
/* 7E744 8008DF44 00000000 */  nop
/* 7E748 8008DF48 0000428C */  lw         $v0, 0x0($v0)
/* 7E74C 8008DF4C 00000000 */  nop
/* 7E750 8008DF50 2D004380 */  lb         $v1, 0x2D($v0)
/* 7E754 8008DF54 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7E758 8008DF58 03006210 */  beq        $v1, $v0, .L8008DF68
/* 7E75C 8008DF5C 0105222A */   slti      $v0, $s1, 0x501
/* 7E760 8008DF60 1C004014 */  bnez       $v0, .L8008DFD4
/* 7E764 8008DF64 00000000 */   nop
.L8008DF68:
/* 7E768 8008DF68 21302002 */  addu       $a2, $s1, $zero
/* 7E76C 8008DF6C 24016286 */  lh         $v0, 0x124($s3)
/* 7E770 8008DF70 5C004486 */  lh         $a0, 0x5C($s2)
/* 7E774 8008DF74 7401458E */  lw         $a1, 0x174($s2)
/* 7E778 8008DF78 7B37020C */  jal        SOUL_CalcAccel
/* 7E77C 8008DF7C 23204400 */   subu      $a0, $v0, $a0
/* 7E780 8008DF80 21302002 */  addu       $a2, $s1, $zero
/* 7E784 8008DF84 800142AE */  sw         $v0, 0x180($s2)
/* 7E788 8008DF88 26016286 */  lh         $v0, 0x126($s3)
/* 7E78C 8008DF8C 5E004486 */  lh         $a0, 0x5E($s2)
/* 7E790 8008DF90 7801458E */  lw         $a1, 0x178($s2)
/* 7E794 8008DF94 7B37020C */  jal        SOUL_CalcAccel
/* 7E798 8008DF98 23204400 */   subu      $a0, $v0, $a0
/* 7E79C 8008DF9C 21302002 */  addu       $a2, $s1, $zero
/* 7E7A0 8008DFA0 840142AE */  sw         $v0, 0x184($s2)
/* 7E7A4 8008DFA4 28016286 */  lh         $v0, 0x128($s3)
/* 7E7A8 8008DFA8 60004486 */  lh         $a0, 0x60($s2)
/* 7E7AC 8008DFAC 7C01458E */  lw         $a1, 0x17C($s2)
/* 7E7B0 8008DFB0 7B37020C */  jal        SOUL_CalcAccel
/* 7E7B4 8008DFB4 23204400 */   subu      $a0, $v0, $a0
/* 7E7B8 8008DFB8 880142AE */  sw         $v0, 0x188($s2)
/* 7E7BC 8008DFBC 58020224 */  addiu      $v0, $zero, 0x258
/* 7E7C0 8008DFC0 8C0142AE */  sw         $v0, 0x18C($s2)
/* 7E7C4 8008DFC4 900142AE */  sw         $v0, 0x190($s2)
/* 7E7C8 8008DFC8 11000224 */  addiu      $v0, $zero, 0x11
/* 7E7CC 8008DFCC 9E370208 */  j          .L8008DE78
/* 7E7D0 8008DFD0 940142AE */   sw        $v0, 0x194($s2)
.L8008DFD4:
/* 7E7D4 8008DFD4 60004286 */  lh         $v0, 0x60($s2)
/* 7E7D8 8008DFD8 28016386 */  lh         $v1, 0x128($s3)
/* 7E7DC 8008DFDC 00000000 */  nop
/* 7E7E0 8008DFE0 23104300 */  subu       $v0, $v0, $v1
/* 7E7E4 8008DFE4 02004104 */  bgez       $v0, .L8008DFF0
/* 7E7E8 8008DFE8 00000000 */   nop
/* 7E7EC 8008DFEC 23100200 */  negu       $v0, $v0
.L8008DFF0:
/* 7E7F0 8008DFF0 C8004228 */  slti       $v0, $v0, 0xC8
/* 7E7F4 8008DFF4 A0FF4010 */  beqz       $v0, .L8008DE78
/* 7E7F8 8008DFF8 21204002 */   addu      $a0, $s2, $zero
/* 7E7FC 8008DFFC C3FF010C */  jal        MON_AnimPlaying
/* 7E800 8008E000 2D000524 */   addiu     $a1, $zero, 0x2D
/* 7E804 8008E004 0A004014 */  bnez       $v0, .L8008E030
/* 7E808 8008E008 3300222A */   slti      $v0, $s1, 0x33
/* 7E80C 8008E00C 08004014 */  bnez       $v0, .L8008E030
/* 7E810 8008E010 21204002 */   addu      $a0, $s2, $zero
/* 7E814 8008E014 2D000524 */  addiu      $a1, $zero, 0x2D
/* 7E818 8008E018 B6FF010C */  jal        MON_PlayAnim
/* 7E81C 8008E01C 01000624 */   addiu     $a2, $zero, 0x1
/* 7E820 8008E020 1800428E */  lw         $v0, 0x18($s2)
/* 7E824 8008E024 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 7E828 8008E028 25104300 */  or         $v0, $v0, $v1
/* 7E82C 8008E02C 180042AE */  sw         $v0, 0x18($s2)
.L8008E030:
/* 7E830 8008E030 6801628E */  lw         $v0, 0x168($s3)
/* 7E834 8008E034 21204002 */  addu       $a0, $s2, $zero
/* 7E838 8008E038 0000458C */  lw         $a1, 0x0($v0)
/* 7E83C 8008E03C F4FE010C */  jal        MON_GetAnim
/* 7E840 8008E040 2D000624 */   addiu     $a2, $zero, 0x2D
/* 7E844 8008E044 1C00438E */  lw         $v1, 0x1C($s2)
/* 7E848 8008E048 0C004280 */  lb         $v0, 0xC($v0)
/* 7E84C 8008E04C 1000638C */  lw         $v1, 0x10($v1)
/* 7E850 8008E050 80100200 */  sll        $v0, $v0, 2
/* 7E854 8008E054 21104300 */  addu       $v0, $v0, $v1
/* 7E858 8008E058 0000448C */  lw         $a0, 0x0($v0)
/* 7E85C 8008E05C D33F020C */  jal        G2AnimKeylist_GetDuration
/* 7E860 8008E060 00000000 */   nop
/* 7E864 8008E064 00140200 */  sll        $v0, $v0, 16
/* 7E868 8008E068 03140200 */  sra        $v0, $v0, 16
/* 7E86C 8008E06C 00190200 */  sll        $v1, $v0, 4
/* 7E870 8008E070 23186200 */  subu       $v1, $v1, $v0
/* 7E874 8008E074 401B0300 */  sll        $v1, $v1, 13
/* 7E878 8008E078 18007E00 */  mult       $v1, $fp
/* 7E87C 8008E07C C8014426 */  addiu      $a0, $s2, 0x1C8
/* 7E880 8008E080 C31F0300 */  sra        $v1, $v1, 31
/* 7E884 8008E084 10400000 */  mfhi       $t0
/* 7E888 8008E088 83110800 */  sra        $v0, $t0, 6
/* 7E88C 8008E08C D43E020C */  jal        G2Anim_GetElapsedTime
/* 7E890 8008E090 23804300 */   subu      $s0, $v0, $v1
/* 7E894 8008E094 00140200 */  sll        $v0, $v0, 16
/* 7E898 8008E098 03140200 */  sra        $v0, $v0, 16
/* 7E89C 8008E09C 00190200 */  sll        $v1, $v0, 4
/* 7E8A0 8008E0A0 23186200 */  subu       $v1, $v1, $v0
/* 7E8A4 8008E0A4 401B0300 */  sll        $v1, $v1, 13
/* 7E8A8 8008E0A8 18007E00 */  mult       $v1, $fp
/* 7E8AC 8008E0AC C31F0300 */  sra        $v1, $v1, 31
/* 7E8B0 8008E0B0 10400000 */  mfhi       $t0
/* 7E8B4 8008E0B4 83110800 */  sra        $v0, $t0, 6
/* 7E8B8 8008E0B8 23104300 */  subu       $v0, $v0, $v1
/* 7E8BC 8008E0BC 23800202 */  subu       $s0, $s0, $v0
/* 7E8C0 8008E0C0 2800001A */  blez       $s0, .L8008E164
/* 7E8C4 8008E0C4 5C004526 */   addiu     $a1, $s2, 0x5C
/* 7E8C8 8008E0C8 24016796 */  lhu        $a3, 0x124($s3)
/* 7E8CC 8008E0CC 5C004296 */  lhu        $v0, 0x5C($s2)
/* 7E8D0 8008E0D0 00000000 */  nop
/* 7E8D4 8008E0D4 2338E200 */  subu       $a3, $a3, $v0
/* 7E8D8 8008E0D8 00140700 */  sll        $v0, $a3, 16
/* 7E8DC 8008E0DC 03110200 */  sra        $v0, $v0, 4
/* 7E8E0 8008E0E0 1A005000 */  div        $zero, $v0, $s0
/* 7E8E4 8008E0E4 12100000 */  mflo       $v0
/* 7E8E8 8008E0E8 0200A694 */  lhu        $a2, 0x2($a1)
/* 7E8EC 8008E0EC 0400A594 */  lhu        $a1, 0x4($a1)
/* 7E8F0 8008E0F0 24016326 */  addiu      $v1, $s3, 0x124
/* 7E8F4 8008E0F4 02006494 */  lhu        $a0, 0x2($v1)
/* 7E8F8 8008E0F8 04006394 */  lhu        $v1, 0x4($v1)
/* 7E8FC 8008E0FC 1800A7A7 */  sh         $a3, 0x18($sp)
/* 7E900 8008E100 23208600 */  subu       $a0, $a0, $a2
/* 7E904 8008E104 23186500 */  subu       $v1, $v1, $a1
/* 7E908 8008E108 0200E4A6 */  sh         $a0, 0x2($s7)
/* 7E90C 8008E10C 0400E3A6 */  sh         $v1, 0x4($s7)
/* 7E910 8008E110 00140200 */  sll        $v0, $v0, 16
/* 7E914 8008E114 03140200 */  sra        $v0, $v0, 16
/* 7E918 8008E118 740142AE */  sw         $v0, 0x174($s2)
/* 7E91C 8008E11C 1A00A287 */  lh         $v0, 0x1A($sp)
/* 7E920 8008E120 00000000 */  nop
/* 7E924 8008E124 00130200 */  sll        $v0, $v0, 12
/* 7E928 8008E128 1A005000 */  div        $zero, $v0, $s0
/* 7E92C 8008E12C 12100000 */  mflo       $v0
/* 7E930 8008E130 00000000 */  nop
/* 7E934 8008E134 00140200 */  sll        $v0, $v0, 16
/* 7E938 8008E138 03140200 */  sra        $v0, $v0, 16
/* 7E93C 8008E13C 780142AE */  sw         $v0, 0x178($s2)
/* 7E940 8008E140 1C00A287 */  lh         $v0, 0x1C($sp)
/* 7E944 8008E144 00000000 */  nop
/* 7E948 8008E148 00130200 */  sll        $v0, $v0, 12
/* 7E94C 8008E14C 1A005000 */  div        $zero, $v0, $s0
/* 7E950 8008E150 12100000 */  mflo       $v0
/* 7E954 8008E154 00000000 */  nop
/* 7E958 8008E158 00140200 */  sll        $v0, $v0, 16
/* 7E95C 8008E15C 03140200 */  sra        $v0, $v0, 16
/* 7E960 8008E160 7C0142AE */  sw         $v0, 0x17C($s2)
.L8008E164:
/* 7E964 8008E164 0000628E */  lw         $v0, 0x0($s3)
/* 7E968 8008E168 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 7E96C 8008E16C 24104300 */  and        $v0, $v0, $v1
/* 7E970 8008E170 02004014 */  bnez       $v0, .L8008E17C
/* 7E974 8008E174 21208002 */   addu      $a0, $s4, $zero
/* 7E978 8008E178 21B08002 */  addu       $s6, $s4, $zero
.L8008E17C:
/* 7E97C 8008E17C 21284002 */  addu       $a1, $s2, $zero
/* 7E980 8008E180 880140AE */  sw         $zero, 0x188($s2)
/* 7E984 8008E184 840140AE */  sw         $zero, 0x184($s2)
/* 7E988 8008E188 6700020C */  jal        MON_FacingOffset
/* 7E98C 8008E18C 800140AE */   sw        $zero, 0x180($s2)
/* 7E990 8008E190 78004396 */  lhu        $v1, 0x78($s2)
/* 7E994 8008E194 00000000 */  nop
/* 7E998 8008E198 21186200 */  addu       $v1, $v1, $v0
/* 7E99C 8008E19C 780043A6 */  sh         $v1, 0x78($s2)
/* 7E9A0 8008E1A0 0000628E */  lw         $v0, 0x0($s3)
/* 7E9A4 8008E1A4 FFF70324 */  addiu      $v1, $zero, -0x801
/* 7E9A8 8008E1A8 24104300 */  and        $v0, $v0, $v1
/* 7E9AC 8008E1AC 9E370208 */  j          .L8008DE78
/* 7E9B0 8008E1B0 000062AE */   sw        $v0, 0x0($s3)
.L8008E1B4:
/* 7E9B4 8008E1B4 880140AE */  sw         $zero, 0x188($s2)
/* 7E9B8 8008E1B8 840140AE */  sw         $zero, 0x184($s2)
/* 7E9BC 8008E1BC 9E370208 */  j          .L8008DE78
/* 7E9C0 8008E1C0 800140AE */   sw        $zero, 0x180($s2)
.L8008E1C4:
/* 7E9C4 8008E1C4 9E370208 */  j          .L8008DE78
/* 7E9C8 8008E1C8 0100B526 */   addiu     $s5, $s5, 0x1
.L8008E1CC:
/* 7E9CC 8008E1CC 0100B526 */  addiu      $s5, $s5, 0x1
/* 7E9D0 8008E1D0 6801628E */  lw         $v0, 0x168($s3)
/* 7E9D4 8008E1D4 21204002 */  addu       $a0, $s2, $zero
/* 7E9D8 8008E1D8 0000458C */  lw         $a1, 0x0($v0)
/* 7E9DC 8008E1DC F4FE010C */  jal        MON_GetAnim
/* 7E9E0 8008E1E0 2D000624 */   addiu     $a2, $zero, 0x2D
/* 7E9E4 8008E1E4 06004010 */  beqz       $v0, .L8008E200
/* 7E9E8 8008E1E8 0004033C */   lui       $v1, (0x4000000 >> 16)
/* 7E9EC 8008E1EC 0000628E */  lw         $v0, 0x0($s3)
/* 7E9F0 8008E1F0 00000000 */  nop
/* 7E9F4 8008E1F4 24104300 */  and        $v0, $v0, $v1
/* 7E9F8 8008E1F8 05004014 */  bnez       $v0, .L8008E210
/* 7E9FC 8008E1FC 21204002 */   addu      $a0, $s2, $zero
.L8008E200:
/* 7EA00 8008E200 0400028E */  lw         $v0, 0x4($s0)
/* 7EA04 8008E204 00000000 */  nop
/* 7EA08 8008E208 0000568C */  lw         $s6, 0x0($v0)
/* 7EA0C 8008E20C 21204002 */  addu       $a0, $s2, $zero
.L8008E210:
/* 7EA10 8008E210 6513020C */  jal        MON_DefaultMessageHandler
/* 7EA14 8008E214 21280002 */   addu      $a1, $s0, $zero
/* 7EA18 8008E218 9E370208 */  j          .L8008DE78
/* 7EA1C 8008E21C 00000000 */   nop
.L8008E220:
/* 7EA20 8008E220 0800A012 */  beqz       $s5, .L8008E244
/* 7EA24 8008E224 00000000 */   nop
/* 7EA28 8008E228 06008012 */  beqz       $s4, .L8008E244
/* 7EA2C 8008E22C 00000000 */   nop
/* 7EA30 8008E230 1801628E */  lw         $v0, 0x118($s3)
/* 7EA34 8008E234 00000000 */  nop
/* 7EA38 8008E238 01004224 */  addiu      $v0, $v0, 0x1
/* 7EA3C 8008E23C 92380208 */  j          .L8008E248
/* 7EA40 8008E240 180162AE */   sw        $v0, 0x118($s3)
.L8008E244:
/* 7EA44 8008E244 180160AE */  sw         $zero, 0x118($s3)
.L8008E248:
/* 7EA48 8008E248 1801628E */  lw         $v0, 0x118($s3)
/* 7EA4C 8008E24C 00000000 */  nop
/* 7EA50 8008E250 0B00422C */  sltiu      $v0, $v0, 0xB
/* 7EA54 8008E254 04004014 */  bnez       $v0, .L8008E268
/* 7EA58 8008E258 21204002 */   addu      $a0, $s2, $zero
/* 7EA5C 8008E25C 180160AE */  sw         $zero, 0x118($s3)
/* 7EA60 8008E260 CC36020C */  jal        SOUL_MovePastWall
/* 7EA64 8008E264 21288002 */   addu      $a1, $s4, $zero
.L8008E268:
/* 7EA68 8008E268 0000628E */  lw         $v0, 0x0($s3)
/* 7EA6C 8008E26C 00000000 */  nop
/* 7EA70 8008E270 00084230 */  andi       $v0, $v0, 0x800
/* 7EA74 8008E274 06004010 */  beqz       $v0, .L8008E290
/* 7EA78 8008E278 21204002 */   addu      $a0, $s2, $zero
/* 7EA7C 8008E27C 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7EA80 8008E280 4B36020C */  jal        SOUL_Physics
/* 7EA84 8008E284 21204002 */   addu      $a0, $s2, $zero
/* 7EA88 8008E288 A7380208 */  j          .L8008E29C
/* 7EA8C 8008E28C 00000000 */   nop
.L8008E290:
/* 7EA90 8008E290 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7EA94 8008E294 4FDE010C */  jal        PhysicsMove
/* 7EA98 8008E298 5C004526 */   addiu     $a1, $s2, 0x5C
.L8008E29C:
/* 7EA9C 8008E29C 2E00C012 */  beqz       $s6, .L8008E358
/* 7EAA0 8008E2A0 00000000 */   nop
/* 7EAA4 8008E2A4 2C00D416 */  bne        $s6, $s4, .L8008E358
/* 7EAA8 8008E2A8 21204002 */   addu      $a0, $s2, $zero
/* 7EAAC 8008E2AC 21280000 */  addu       $a1, $zero, $zero
/* 7EAB0 8008E2B0 2130A000 */  addu       $a2, $a1, $zero
/* 7EAB4 8008E2B4 E4C3010C */  jal        SetMonsterSoulSuckData
/* 7EAB8 8008E2B8 2138A000 */   addu      $a3, $a1, $zero
/* 7EABC 8008E2BC 21208002 */  addu       $a0, $s4, $zero
/* 7EAC0 8008E2C0 0001053C */  lui        $a1, (0x1000009 >> 16)
/* 7EAC4 8008E2C4 0900A534 */  ori        $a1, $a1, (0x1000009 & 0xFFFF)
/* 7EAC8 8008E2C8 A1D1000C */  jal        INSTANCE_Post
/* 7EACC 8008E2CC 21304000 */   addu      $a2, $v0, $zero
/* 7EAD0 8008E2D0 21208002 */  addu       $a0, $s4, $zero
/* 7EAD4 8008E2D4 0001053C */  lui        $a1, (0x1000016 >> 16)
/* 7EAD8 8008E2D8 48016686 */  lh         $a2, 0x148($s3)
/* 7EADC 8008E2DC A1D1000C */  jal        INSTANCE_Post
/* 7EAE0 8008E2E0 1600A534 */   ori       $a1, $a1, (0x1000016 & 0xFFFF)
/* 7EAE4 8008E2E4 5C004426 */  addiu      $a0, $s2, 0x5C
/* 7EAE8 8008E2E8 08000524 */  addiu      $a1, $zero, 0x8
/* 7EAEC 8008E2EC 3EFE0624 */  addiu      $a2, $zero, -0x1C2
/* 7EAF0 8008E2F0 50000724 */  addiu      $a3, $zero, 0x50
/* 7EAF4 8008E2F4 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* 7EAF8 8008E2F8 1300010C */  jal        SOUND_Play3dSound
/* 7EAFC 8008E2FC 1000A2AF */   sw        $v0, 0x10($sp)
/* 7EB00 8008E300 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7EB04 8008E304 00000000 */  nop
/* 7EB08 8008E308 03008216 */  bne        $s4, $v0, .L8008E318
/* 7EB0C 8008E30C 80000424 */   addiu     $a0, $zero, 0x80
/* 7EB10 8008E310 F9C5000C */  jal        GAMEPAD_Shock1
/* 7EB14 8008E314 00500524 */   addiu     $a1, $zero, 0x5000
.L8008E318:
/* 7EB18 8008E318 D800648E */  lw         $a0, 0xD8($s3)
/* 7EB1C 8008E31C 00000000 */  nop
/* 7EB20 8008E320 09008010 */  beqz       $a0, .L8008E348
/* 7EB24 8008E324 00000000 */   nop
/* 7EB28 8008E328 62D2000C */  jal        INSTANCE_Find
/* 7EB2C 8008E32C 00000000 */   nop
/* 7EB30 8008E330 03004010 */  beqz       $v0, .L8008E340
/* 7EB34 8008E334 00000000 */   nop
/* 7EB38 8008E338 1711020C */  jal        MON_SoulSucked
/* 7EB3C 8008E33C 21204000 */   addu      $a0, $v0, $zero
.L8008E340:
/* 7EB40 8008E340 B8D8020C */  jal        SAVE_DeleteInstance
/* 7EB44 8008E344 21204002 */   addu      $a0, $s2, $zero
.L8008E348:
/* 7EB48 8008E348 D00B020C */  jal        MON_KillMonster
/* 7EB4C 8008E34C 21204002 */   addu      $a0, $s2, $zero
/* 7EB50 8008E350 E9380208 */  j          .L8008E3A4
/* 7EB54 8008E354 00000000 */   nop
.L8008E358:
/* 7EB58 8008E358 12008016 */  bnez       $s4, .L8008E3A4
/* 7EB5C 8008E35C 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 7EB60 8008E360 1800438E */  lw         $v1, 0x18($s2)
/* 7EB64 8008E364 00000000 */  nop
/* 7EB68 8008E368 24106200 */  and        $v0, $v1, $v0
/* 7EB6C 8008E36C 04004010 */  beqz       $v0, .L8008E380
/* 7EB70 8008E370 FFDF023C */   lui       $v0, (0xDFFFFFFF >> 16)
/* 7EB74 8008E374 FFFF4234 */  ori        $v0, $v0, (0xDFFFFFFF & 0xFFFF)
/* 7EB78 8008E378 24106200 */  and        $v0, $v1, $v0
/* 7EB7C 8008E37C 180042AE */  sw         $v0, 0x18($s2)
.L8008E380:
/* 7EB80 8008E380 C400628E */  lw         $v0, 0xC4($s3)
/* 7EB84 8008E384 00000000 */  nop
/* 7EB88 8008E388 03004010 */  beqz       $v0, .L8008E398
/* 7EB8C 8008E38C 21204002 */   addu      $a0, $s2, $zero
/* 7EB90 8008E390 E7380208 */  j          .L8008E39C
/* 7EB94 8008E394 13000524 */   addiu     $a1, $zero, 0x13
.L8008E398:
/* 7EB98 8008E398 02000524 */  addiu      $a1, $zero, 0x2
.L8008E39C:
/* 7EB9C 8008E39C 91FE010C */  jal        MON_SwitchState
/* 7EBA0 8008E3A0 00000000 */   nop
.L8008E3A4:
/* 7EBA4 8008E3A4 4400BF8F */  lw         $ra, 0x44($sp)
/* 7EBA8 8008E3A8 4000BE8F */  lw         $fp, 0x40($sp)
/* 7EBAC 8008E3AC 3C00B78F */  lw         $s7, 0x3C($sp)
/* 7EBB0 8008E3B0 3800B68F */  lw         $s6, 0x38($sp)
/* 7EBB4 8008E3B4 3400B58F */  lw         $s5, 0x34($sp)
/* 7EBB8 8008E3B8 3000B48F */  lw         $s4, 0x30($sp)
/* 7EBBC 8008E3BC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 7EBC0 8008E3C0 2800B28F */  lw         $s2, 0x28($sp)
/* 7EBC4 8008E3C4 2400B18F */  lw         $s1, 0x24($sp)
/* 7EBC8 8008E3C8 2000B08F */  lw         $s0, 0x20($sp)
/* 7EBCC 8008E3CC 0800E003 */  jr         $ra
/* 7EBD0 8008E3D0 4800BD27 */   addiu     $sp, $sp, 0x48
.size SOUL_SoulSuck, . - SOUL_SoulSuck
