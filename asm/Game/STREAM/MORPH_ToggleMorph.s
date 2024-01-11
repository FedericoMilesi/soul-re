.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_ToggleMorph
/* 4E7D0 8005DFD0 D2BD8487 */  lh         $a0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E7D4 8005DFD4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4E7D8 8005DFD8 2400BFAF */  sw         $ra, 0x24($sp)
/* 4E7DC 8005DFDC 2000B2AF */  sw         $s2, 0x20($sp)
/* 4E7E0 8005DFE0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4E7E4 8005DFE4 1800B0AF */  sw         $s0, 0x18($sp)
/* 4E7E8 8005DFE8 FA03010C */  jal        SOUND_PlaneShift
/* 4E7EC 8005DFEC 0100842C */   sltiu     $a0, $a0, 0x1
/* 4E7F0 8005DFF0 21200000 */  addu       $a0, $zero, $zero
/* 4E7F4 8005DFF4 0A000524 */  addiu      $a1, $zero, 0xA
/* 4E7F8 8005DFF8 0001063C */  lui        $a2, (0x1000020 >> 16)
/* 4E7FC 8005DFFC D2BD8787 */  lh         $a3, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E800 8005E000 BAD1000C */  jal        INSTANCE_Broadcast
/* 4E804 8005E004 2000C634 */   ori       $a2, $a2, (0x1000020 & 0xFFFF)
/* 4E808 8005E008 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E80C 8005E00C 00000000 */  nop
/* 4E810 8005E010 B400448C */  lw         $a0, 0xB4($v0)
/* 4E814 8005E014 BC00458C */  lw         $a1, 0xBC($v0)
/* 4E818 8005E018 B576010C */  jal        MORPH_GetComponentsForTrackingPoint
/* 4E81C 8005E01C 10001224 */   addiu     $s2, $zero, 0x10
/* 4E820 8005E020 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E824 8005E024 00000000 */  nop
/* 4E828 8005E028 B400448C */  lw         $a0, 0xB4($v0)
/* 4E82C 8005E02C BC00458C */  lw         $a1, 0xBC($v0)
/* 4E830 8005E030 8B77010C */  jal        MORPH_UpdateTrackingPoint
/* 4E834 8005E034 00000000 */   nop
/* 4E838 8005E038 D0BD80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4E83C 8005E03C 1A000524 */  addiu      $a1, $zero, 0x1A
/* 4E840 8005E040 A2FE0624 */  addiu      $a2, $zero, -0x15E
/* 4E844 8005E044 7F000724 */  addiu      $a3, $zero, 0x7F
/* 4E848 8005E048 44C79127 */  addiu      $s1, $gp, %gp_rel(StreamTracker + 0x8)
/* 4E84C 8005E04C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E850 8005E050 FF7F0224 */  addiu      $v0, $zero, 0x7FFF
/* 4E854 8005E054 1000A2AF */  sw         $v0, 0x10($sp)
/* 4E858 8005E058 1300010C */  jal        SOUND_Play3dSound
/* 4E85C 8005E05C 5C008424 */   addiu     $a0, $a0, 0x5C
.L8005E060:
/* 4E860 8005E060 FCFF2386 */  lh         $v1, -0x4($s1)
/* 4E864 8005E064 02000224 */  addiu      $v0, $zero, 0x2
/* 4E868 8005E068 23006214 */  bne        $v1, $v0, .L8005E0F8
/* 4E86C 8005E06C 01000324 */   addiu     $v1, $zero, 0x1
/* 4E870 8005E070 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E874 8005E074 0000308E */  lw         $s0, 0x0($s1)
/* 4E878 8005E078 10004314 */  bne        $v0, $v1, .L8005E0BC
/* 4E87C 8005E07C 00000000 */   nop
/* 4E880 8005E080 B800038E */  lw         $v1, 0xB8($s0)
/* 4E884 8005E084 00000000 */  nop
/* 4E888 8005E088 1B006010 */  beqz       $v1, .L8005E0F8
/* 4E88C 8005E08C 21300000 */   addu      $a2, $zero, $zero
/* 4E890 8005E090 06006294 */  lhu        $v0, 0x6($v1)
/* 4E894 8005E094 00000000 */  nop
/* 4E898 8005E098 01004234 */  ori        $v0, $v0, 0x1
/* 4E89C 8005E09C 060062A4 */  sh         $v0, 0x6($v1)
/* 4E8A0 8005E0A0 B800058E */  lw         $a1, 0xB8($s0)
/* 4E8A4 8005E0A4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E8A8 8005E0A8 7279000C */  jal        SIGNAL_HandleSignal
/* 4E8AC 8005E0AC 0800A524 */   addiu     $a1, $a1, 0x8
/* 4E8B0 8005E0B0 B800048E */  lw         $a0, 0xB8($s0)
/* 4E8B4 8005E0B4 3C780108 */  j          .L8005E0F0
/* 4E8B8 8005E0B8 00000000 */   nop
.L8005E0BC:
/* 4E8BC 8005E0BC B400038E */  lw         $v1, 0xB4($s0)
/* 4E8C0 8005E0C0 00000000 */  nop
/* 4E8C4 8005E0C4 0C006010 */  beqz       $v1, .L8005E0F8
/* 4E8C8 8005E0C8 21300000 */   addu      $a2, $zero, $zero
/* 4E8CC 8005E0CC 06006294 */  lhu        $v0, 0x6($v1)
/* 4E8D0 8005E0D0 00000000 */  nop
/* 4E8D4 8005E0D4 01004234 */  ori        $v0, $v0, 0x1
/* 4E8D8 8005E0D8 060062A4 */  sh         $v0, 0x6($v1)
/* 4E8DC 8005E0DC B400058E */  lw         $a1, 0xB4($s0)
/* 4E8E0 8005E0E0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E8E4 8005E0E4 7279000C */  jal        SIGNAL_HandleSignal
/* 4E8E8 8005E0E8 0800A524 */   addiu     $a1, $a1, 0x8
/* 4E8EC 8005E0EC B400048E */  lw         $a0, 0xB4($s0)
.L8005E0F0:
/* 4E8F0 8005E0F0 3483010C */  jal        EVENT_AddSignalToReset
/* 4E8F4 8005E0F4 00000000 */   nop
.L8005E0F8:
/* 4E8F8 8005E0F8 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 4E8FC 8005E0FC D8FF401E */  bgtz       $s2, .L8005E060
/* 4E900 8005E100 40003126 */   addiu     $s1, $s1, 0x40
/* 4E904 8005E104 2400BF8F */  lw         $ra, 0x24($sp)
/* 4E908 8005E108 2000B28F */  lw         $s2, 0x20($sp)
/* 4E90C 8005E10C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4E910 8005E110 1800B08F */  lw         $s0, 0x18($sp)
/* 4E914 8005E114 0800E003 */  jr         $ra
/* 4E918 8005E118 2800BD27 */   addiu     $sp, $sp, 0x28
.size MORPH_ToggleMorph, . - MORPH_ToggleMorph
