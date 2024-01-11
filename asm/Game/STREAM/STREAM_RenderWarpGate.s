.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_RenderWarpGate
/* 4FE74 8005F674 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4FE78 8005F678 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4FE7C 8005F67C 21988000 */  addu       $s3, $a0, $zero
/* 4FE80 8005F680 1800B2AF */  sw         $s2, 0x18($sp)
/* 4FE84 8005F684 2190A000 */  addu       $s2, $a1, $zero
/* 4FE88 8005F688 1400B1AF */  sw         $s1, 0x14($sp)
/* 4FE8C 8005F68C 2188C000 */  addu       $s1, $a2, $zero
/* 4FE90 8005F690 2000B4AF */  sw         $s4, 0x20($sp)
/* 4FE94 8005F694 21A0E000 */  addu       $s4, $a3, $zero
/* 4FE98 8005F698 21202002 */  addu       $a0, $s1, $zero
/* 4FE9C 8005F69C 01000524 */  addiu      $a1, $zero, 0x1
/* 4FEA0 8005F6A0 2400BFAF */  sw         $ra, 0x24($sp)
/* 4FEA4 8005F6A4 517D010C */  jal        WARPGATE_DrawWarpGateRim
/* 4FEA8 8005F6A8 1000B0AF */   sw        $s0, 0x10($sp)
/* 4FEAC 8005F6AC 01000224 */  addiu      $v0, $zero, 0x1
/* 4FEB0 8005F6B0 1CC78383 */  lb         $v1, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4FEB4 8005F6B4 2800508E */  lw         $s0, 0x28($s2)
/* 4FEB8 8005F6B8 24006214 */  bne        $v1, $v0, .L8005F74C
/* 4FEBC 8005F6BC 02000224 */   addiu     $v0, $zero, 0x2
/* 4FEC0 8005F6C0 20C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4FEC4 8005F6C4 24C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo + 0xC)($gp)
/* 4FEC8 8005F6C8 00000000 */  nop
/* 4FECC 8005F6CC 2A104300 */  slt        $v0, $v0, $v1
/* 4FED0 8005F6D0 12004014 */  bnez       $v0, .L8005F71C
/* 4FED4 8005F6D4 00000000 */   nop
/* 4FED8 8005F6D8 28C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4FEDC 8005F6DC 00000000 */  nop
/* 4FEE0 8005F6E0 09004014 */  bnez       $v0, .L8005F708
/* 4FEE4 8005F6E4 00000000 */   nop
/* 4FEE8 8005F6E8 677D010C */  jal        WARPGATE_HideAllCloudCovers
/* 4FEEC 8005F6EC 00000000 */   nop
/* 4FEF0 8005F6F0 0000248E */  lw         $a0, 0x0($s1)
/* 4FEF4 8005F6F4 7F7D010C */  jal        WARPGATE_UnHideCloudCoverInUnit
/* 4FEF8 8005F6F8 00000000 */   nop
/* 4FEFC 8005F6FC 28C782AF */  sw         $v0, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4FF00 8005F700 00100224 */  addiu      $v0, $zero, 0x1000
/* 4FF04 8005F704 1EC782A7 */  sh         $v0, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
.L8005F708:
/* 4FF08 8005F708 08C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 4FF0C 8005F70C FA6D010C */  jal        WARPGATE_CalcWarpFade
/* 4FF10 8005F710 00000000 */   nop
/* 4FF14 8005F714 017E0108 */  j          .L8005F804
/* 4FF18 8005F718 00000000 */   nop
.L8005F71C:
/* 4FF1C 8005F71C 03000012 */  beqz       $s0, .L8005F72C
/* 4FF20 8005F720 21200002 */   addu      $a0, $s0, $zero
/* 4FF24 8005F724 A76B010C */  jal        STREAM_DumpUnit
/* 4FF28 8005F728 01000524 */   addiu     $a1, $zero, 0x1
.L8005F72C:
/* 4FF2C 8005F72C 21204002 */  addu       $a0, $s2, $zero
/* 4FF30 8005F730 02000224 */  addiu      $v0, $zero, 0x2
/* 4FF34 8005F734 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4FF38 8005F738 596C010C */  jal        STREAM_LoadCurrentWarpRoom
/* 4FF3C 8005F73C 21282002 */   addu      $a1, $s1, $zero
/* 4FF40 8005F740 28C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4FF44 8005F744 637E0108 */  j          .L8005F98C
/* 4FF48 8005F748 040140A4 */   sh        $zero, 0x104($v0)
.L8005F74C:
/* 4FF4C 8005F74C 0D006214 */  bne        $v1, $v0, .L8005F784
/* 4FF50 8005F750 03000224 */   addiu     $v0, $zero, 0x3
/* 4FF54 8005F754 1EC780A7 */  sh         $zero, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
/* 4FF58 8005F758 2A000012 */  beqz       $s0, .L8005F804
/* 4FF5C 8005F75C 00000000 */   nop
/* 4FF60 8005F760 04000286 */  lh         $v0, 0x4($s0)
/* 4FF64 8005F764 00000000 */  nop
/* 4FF68 8005F768 26004314 */  bne        $v0, $v1, .L8005F804
/* 4FF6C 8005F76C 03000224 */   addiu     $v0, $zero, 0x3
/* 4FF70 8005F770 24C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo + 0xC)($gp)
/* 4FF74 8005F774 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4FF78 8005F778 20C783AF */  sw         $v1, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4FF7C 8005F77C 017E0108 */  j          .L8005F804
/* 4FF80 8005F780 00000000 */   nop
.L8005F784:
/* 4FF84 8005F784 1F006214 */  bne        $v1, $v0, .L8005F804
/* 4FF88 8005F788 00000000 */   nop
/* 4FF8C 8005F78C 20C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4FF90 8005F790 00000000 */  nop
/* 4FF94 8005F794 06004004 */  bltz       $v0, .L8005F7B0
/* 4FF98 8005F798 00000000 */   nop
/* 4FF9C 8005F79C 08C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 4FFA0 8005F7A0 FA6D010C */  jal        WARPGATE_CalcWarpFade
/* 4FFA4 8005F7A4 23200400 */   negu      $a0, $a0
/* 4FFA8 8005F7A8 017E0108 */  j          .L8005F804
/* 4FFAC 8005F7AC 00000000 */   nop
.L8005F7B0:
/* 4FFB0 8005F7B0 677D010C */  jal        WARPGATE_HideAllCloudCovers
/* 4FFB4 8005F7B4 00000000 */   nop
/* 4FFB8 8005F7B8 176D010C */  jal        WARPGATE_IsWarpgateInUse
/* 4FFBC 8005F7BC 00000000 */   nop
/* 4FFC0 8005F7C0 0B004014 */  bnez       $v0, .L8005F7F0
/* 4FFC4 8005F7C4 04000224 */   addiu     $v0, $zero, 0x4
/* 4FFC8 8005F7C8 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4FFCC 8005F7CC 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 4FFD0 8005F7D0 80280200 */  sll        $a1, $v0, 2
/* 4FFD4 8005F7D4 2128A200 */  addu       $a1, $a1, $v0
/* 4FFD8 8005F7D8 80280500 */  sll        $a1, $a1, 2
/* 4FFDC 8005F7DC 00A18227 */  addiu      $v0, $gp, %gp_rel(WarpRoomArray)
/* 4FFE0 8005F7E0 1CD2010C */  jal        strcmpi
/* 4FFE4 8005F7E4 2128A200 */   addu      $a1, $a1, $v0
/* 4FFE8 8005F7E8 04004010 */  beqz       $v0, .L8005F7FC
/* 4FFEC 8005F7EC 04000224 */   addiu     $v0, $zero, 0x4
.L8005F7F0:
/* 4FFF0 8005F7F0 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4FFF4 8005F7F4 017E0108 */  j          .L8005F804
/* 4FFF8 8005F7F8 00000000 */   nop
.L8005F7FC:
/* 4FFFC 8005F7FC 1CC780A3 */  sb         $zero, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 50000 8005F800 FCA080AF */  sw         $zero, %gp_rel(CurrentWarpNumber)($gp)
.L8005F804:
/* 50004 8005F804 1CC78283 */  lb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 50008 8005F808 00000000 */  nop
/* 5000C 8005F80C 39004010 */  beqz       $v0, .L8005F8F4
/* 50010 8005F810 00000000 */   nop
/* 50014 8005F814 09000012 */  beqz       $s0, .L8005F83C
/* 50018 8005F818 02000224 */   addiu     $v0, $zero, 0x2
/* 5001C 8005F81C 04000386 */  lh         $v1, 0x4($s0)
/* 50020 8005F820 00000000 */  nop
/* 50024 8005F824 05006214 */  bne        $v1, $v0, .L8005F83C
/* 50028 8005F828 21206002 */   addu      $a0, $s3, $zero
/* 5002C 8005F82C 21284002 */  addu       $a1, $s2, $zero
/* 50030 8005F830 21302002 */  addu       $a2, $s1, $zero
/* 50034 8005F834 6B7E010C */  jal        WARPGATE_RenderWarpUnit
/* 50038 8005F838 21388002 */   addu      $a3, $s4, $zero
.L8005F83C:
/* 5003C 8005F83C 1CC78383 */  lb         $v1, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 50040 8005F840 04000224 */  addiu      $v0, $zero, 0x4
/* 50044 8005F844 51006214 */  bne        $v1, $v0, .L8005F98C
/* 50048 8005F848 00000000 */   nop
/* 5004C 8005F84C 176D010C */  jal        WARPGATE_IsWarpgateInUse
/* 50050 8005F850 00000000 */   nop
/* 50054 8005F854 4D004014 */  bnez       $v0, .L8005F98C
/* 50058 8005F858 4992113C */   lui       $s1, (0x92492493 >> 16)
/* 5005C 8005F85C 00A18227 */  addiu      $v0, $gp, %gp_rel(WarpRoomArray)
/* 50060 8005F860 21804000 */  addu       $s0, $v0, $zero
/* 50064 8005F864 93243136 */  ori        $s1, $s1, (0x92492493 & 0xFFFF)
/* 50068 8005F868 FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 5006C 8005F86C 01000224 */  addiu      $v0, $zero, 0x1
/* 50070 8005F870 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 50074 8005F874 20C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 50078 8005F878 28C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 5007C 8005F87C 80100300 */  sll        $v0, $v1, 2
/* 50080 8005F880 21104300 */  addu       $v0, $v0, $v1
/* 50084 8005F884 80100200 */  sll        $v0, $v0, 2
/* 50088 8005F888 21105000 */  addu       $v0, $v0, $s0
/* 5008C 8005F88C 100040AC */  sw         $zero, 0x10($v0)
.L8005F890:
/* 50090 8005F890 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 50094 8005F894 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 50098 8005F898 80280200 */  sll        $a1, $v0, 2
/* 5009C 8005F89C 2128A200 */  addu       $a1, $a1, $v0
/* 500A0 8005F8A0 80280500 */  sll        $a1, $a1, 2
/* 500A4 8005F8A4 1CD2010C */  jal        strcmpi
/* 500A8 8005F8A8 2128B000 */   addu      $a1, $a1, $s0
/* 500AC 8005F8AC 37004010 */  beqz       $v0, .L8005F98C
/* 500B0 8005F8B0 00000000 */   nop
/* 500B4 8005F8B4 FCA0848F */  lw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 500B8 8005F8B8 00000000 */  nop
/* 500BC 8005F8BC 01008424 */  addiu      $a0, $a0, 0x1
/* 500C0 8005F8C0 18009100 */  mult       $a0, $s1
/* 500C4 8005F8C4 C3170400 */  sra        $v0, $a0, 31
/* 500C8 8005F8C8 10400000 */  mfhi       $t0
/* 500CC 8005F8CC 21180401 */  addu       $v1, $t0, $a0
/* 500D0 8005F8D0 C3180300 */  sra        $v1, $v1, 3
/* 500D4 8005F8D4 23186200 */  subu       $v1, $v1, $v0
/* 500D8 8005F8D8 C0100300 */  sll        $v0, $v1, 3
/* 500DC 8005F8DC 23104300 */  subu       $v0, $v0, $v1
/* 500E0 8005F8E0 40100200 */  sll        $v0, $v0, 1
/* 500E4 8005F8E4 23208200 */  subu       $a0, $a0, $v0
/* 500E8 8005F8E8 FCA084AF */  sw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 500EC 8005F8EC 247E0108 */  j          .L8005F890
/* 500F0 8005F8F0 00000000 */   nop
.L8005F8F4:
/* 500F4 8005F8F4 176D010C */  jal        WARPGATE_IsWarpgateInUse
/* 500F8 8005F8F8 00000000 */   nop
/* 500FC 8005F8FC 21004010 */  beqz       $v0, .L8005F984
/* 50100 8005F900 21202002 */   addu      $a0, $s1, $zero
/* 50104 8005F904 FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* 50108 8005F908 0800228E */  lw         $v0, 0x8($s1)
/* 5010C 8005F90C 80280300 */  sll        $a1, $v1, 2
/* 50110 8005F910 2128A300 */  addu       $a1, $a1, $v1
/* 50114 8005F914 80280500 */  sll        $a1, $a1, 2
/* 50118 8005F918 9800448C */  lw         $a0, 0x98($v0)
/* 5011C 8005F91C 00A18227 */  addiu      $v0, $gp, %gp_rel(WarpRoomArray)
/* 50120 8005F920 1CD2010C */  jal        strcmpi
/* 50124 8005F924 2128A200 */   addu      $a1, $a1, $v0
/* 50128 8005F928 11004014 */  bnez       $v0, .L8005F970
/* 5012C 8005F92C 01000224 */   addiu     $v0, $zero, 0x1
/* 50130 8005F930 4992023C */  lui        $v0, (0x92492493 >> 16)
/* 50134 8005F934 FCA0848F */  lw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 50138 8005F938 93244234 */  ori        $v0, $v0, (0x92492493 & 0xFFFF)
/* 5013C 8005F93C 01008424 */  addiu      $a0, $a0, 0x1
/* 50140 8005F940 18008200 */  mult       $a0, $v0
/* 50144 8005F944 C3170400 */  sra        $v0, $a0, 31
/* 50148 8005F948 10400000 */  mfhi       $t0
/* 5014C 8005F94C 21180401 */  addu       $v1, $t0, $a0
/* 50150 8005F950 C3180300 */  sra        $v1, $v1, 3
/* 50154 8005F954 23186200 */  subu       $v1, $v1, $v0
/* 50158 8005F958 C0100300 */  sll        $v0, $v1, 3
/* 5015C 8005F95C 23104300 */  subu       $v0, $v0, $v1
/* 50160 8005F960 40100200 */  sll        $v0, $v0, 1
/* 50164 8005F964 23208200 */  subu       $a0, $a0, $v0
/* 50168 8005F968 FCA084AF */  sw         $a0, %gp_rel(CurrentWarpNumber)($gp)
/* 5016C 8005F96C 01000224 */  addiu      $v0, $zero, 0x1
.L8005F970:
/* 50170 8005F970 1CC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 50174 8005F974 28C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 50178 8005F978 20C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 5017C 8005F97C 637E0108 */  j          .L8005F98C
/* 50180 8005F980 00000000 */   nop
.L8005F984:
/* 50184 8005F984 357D010C */  jal        WARPGATE_BlockWarpGateEntrance
/* 50188 8005F988 01000524 */   addiu     $a1, $zero, 0x1
.L8005F98C:
/* 5018C 8005F98C 2400BF8F */  lw         $ra, 0x24($sp)
/* 50190 8005F990 2000B48F */  lw         $s4, 0x20($sp)
/* 50194 8005F994 1C00B38F */  lw         $s3, 0x1C($sp)
/* 50198 8005F998 1800B28F */  lw         $s2, 0x18($sp)
/* 5019C 8005F99C 1400B18F */  lw         $s1, 0x14($sp)
/* 501A0 8005F9A0 1000B08F */  lw         $s0, 0x10($sp)
/* 501A4 8005F9A4 0800E003 */  jr         $ra
/* 501A8 8005F9A8 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_RenderWarpGate, . - STREAM_RenderWarpGate
