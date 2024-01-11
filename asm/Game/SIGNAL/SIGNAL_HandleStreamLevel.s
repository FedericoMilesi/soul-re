.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleStreamLevel
/* E5C8 8001DDC8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* E5CC 8001DDCC 2800B2AF */  sw         $s2, 0x28($sp)
/* E5D0 8001DDD0 21908000 */  addu       $s2, $a0, $zero
/* E5D4 8001DDD4 3000B4AF */  sw         $s4, 0x30($sp)
/* E5D8 8001DDD8 21A0A000 */  addu       $s4, $a1, $zero
/* E5DC 8001DDDC 3400B5AF */  sw         $s5, 0x34($sp)
/* E5E0 8001DDE0 FFFF1524 */  addiu      $s5, $zero, -0x1
/* E5E4 8001DDE4 2C00B3AF */  sw         $s3, 0x2C($sp)
/* E5E8 8001DDE8 21980000 */  addu       $s3, $zero, $zero
/* E5EC 8001DDEC 1000A427 */  addiu      $a0, $sp, 0x10
/* E5F0 8001DDF0 0C008526 */  addiu      $a1, $s4, 0xC
/* E5F4 8001DDF4 3800BFAF */  sw         $ra, 0x38($sp)
/* E5F8 8001DDF8 2400B1AF */  sw         $s1, 0x24($sp)
/* E5FC 8001DDFC 1CF4020C */  jal        func_800BD070
/* E600 8001DE00 2000B0AF */   sw        $s0, 0x20($sp)
/* E604 8001DE04 1000A427 */  addiu      $a0, $sp, 0x10
/* E608 8001DE08 0CF4020C */  jal        func_800BD030
/* E60C 8001DE0C 2C000524 */   addiu     $a1, $zero, 0x2C
/* E610 8001DE10 21804000 */  addu       $s0, $v0, $zero
/* E614 8001DE14 06000012 */  beqz       $s0, .L8001DE30
/* E618 8001DE18 1000A427 */   addiu     $a0, $sp, 0x10
/* E61C 8001DE1C F9D1010C */  jal        atoi
/* E620 8001DE20 01000426 */   addiu     $a0, $s0, 0x1
/* E624 8001DE24 21A84000 */  addu       $s5, $v0, $zero
/* E628 8001DE28 000000A2 */  sb         $zero, 0x0($s0)
/* E62C 8001DE2C 1000A427 */  addiu      $a0, $sp, 0x10
.L8001DE30:
/* E630 8001DE30 0D80053C */  lui        $a1, %hi(HandleGlobalValueSignal + 0x8)
/* E634 8001DE34 1CD2010C */  jal        strcmpi
/* E638 8001DE38 1004A524 */   addiu     $a1, $a1, %lo(HandleGlobalValueSignal + 0x8)
/* E63C 8001DE3C 2C004014 */  bnez       $v0, .L8001DEF0
/* E640 8001DE40 00000000 */   nop
/* E644 8001DE44 3800448E */  lw         $a0, 0x38($s2)
/* E648 8001DE48 3266010C */  jal        STREAM_GetStreamUnitWithID
/* E64C 8001DE4C 00000000 */   nop
/* E650 8001DE50 F4BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x22C)($gp)
/* E654 8001DE54 748E848F */  lw         $a0, %gp_rel(HandleGlobalValueSignal + 0x4)($gp)
/* E658 8001DE58 00000000 */  nop
/* E65C 8001DE5C 23186400 */  subu       $v1, $v1, $a0
/* E660 8001DE60 6500632C */  sltiu      $v1, $v1, 0x65
/* E664 8001DE64 65006014 */  bnez       $v1, .L8001DFFC
/* E668 8001DE68 00000000 */   nop
/* E66C 8001DE6C 06004294 */  lhu        $v0, 0x6($v0)
/* E670 8001DE70 00000000 */  nop
/* E674 8001DE74 08004230 */  andi       $v0, $v0, 0x8
/* E678 8001DE78 61004010 */  beqz       $v0, .L8001E000
/* E67C 8001DE7C 01000224 */   addiu     $v0, $zero, 0x1
/* E680 8001DE80 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* E684 8001DE84 00A19027 */  addiu      $s0, $gp, %gp_rel(WarpRoomArray)
/* E688 8001DE88 80280200 */  sll        $a1, $v0, 2
/* E68C 8001DE8C 2128A200 */  addu       $a1, $a1, $v0
/* E690 8001DE90 80280500 */  sll        $a1, $a1, 2
/* E694 8001DE94 2128B000 */  addu       $a1, $a1, $s0
/* E698 8001DE98 1000A28C */  lw         $v0, 0x10($a1)
/* E69C 8001DE9C 00000000 */  nop
/* E6A0 8001DEA0 0000518C */  lw         $s1, 0x0($v0)
/* E6A4 8001DEA4 1CF4020C */  jal        func_800BD070
/* E6A8 8001DEA8 1000A427 */   addiu     $a0, $sp, 0x10
/* E6AC 8001DEAC FCA0838F */  lw         $v1, %gp_rel(CurrentWarpNumber)($gp)
/* E6B0 8001DEB0 00000000 */  nop
/* E6B4 8001DEB4 80100300 */  sll        $v0, $v1, 2
/* E6B8 8001DEB8 21104300 */  addu       $v0, $v0, $v1
/* E6BC 8001DEBC 80100200 */  sll        $v0, $v0, 2
/* E6C0 8001DEC0 21105000 */  addu       $v0, $v0, $s0
/* E6C4 8001DEC4 1000428C */  lw         $v0, 0x10($v0)
/* E6C8 8001DEC8 00000000 */  nop
/* E6CC 8001DECC 4B004010 */  beqz       $v0, .L8001DFFC
/* E6D0 8001DED0 01001324 */   addiu     $s3, $zero, 0x1
/* E6D4 8001DED4 06004294 */  lhu        $v0, 0x6($v0)
/* E6D8 8001DED8 00000000 */  nop
/* E6DC 8001DEDC 08004230 */  andi       $v0, $v0, 0x8
/* E6E0 8001DEE0 04004014 */  bnez       $v0, .L8001DEF4
/* E6E4 8001DEE4 01000224 */   addiu     $v0, $zero, 0x1
/* E6E8 8001DEE8 00780008 */  j          .L8001E000
/* E6EC 8001DEEC 00000000 */   nop
.L8001DEF0:
/* E6F0 8001DEF0 0800918E */  lw         $s1, 0x8($s4)
.L8001DEF4:
/* E6F4 8001DEF4 3800428E */  lw         $v0, 0x38($s2)
/* E6F8 8001DEF8 00000000 */  nop
/* E6FC 8001DEFC 40005110 */  beq        $v0, $s1, .L8001E000
/* E700 8001DF00 01000224 */   addiu     $v0, $zero, 0x1
/* E704 8001DF04 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* E708 8001DF08 00000000 */  nop
/* E70C 8001DF0C 23004216 */  bne        $s2, $v0, .L8001DF9C
/* E710 8001DF10 01000324 */   addiu     $v1, $zero, 0x1
/* E714 8001DF14 48BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x180)
/* E718 8001DF18 F4BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* E71C 8001DF1C 44BF83A7 */  sh         $v1, %gp_rel(gameTrackerX + 0x17C)($gp)
/* E720 8001DF20 748E82AF */  sw         $v0, %gp_rel(HandleGlobalValueSignal + 0x4)($gp)
/* E724 8001DF24 1CF4020C */  jal        func_800BD070
/* E728 8001DF28 1000A527 */   addiu     $a1, $sp, 0x10
/* E72C 8001DF2C 58BF95A7 */  sh         $s5, %gp_rel(gameTrackerX + 0x190)($gp)
/* E730 8001DF30 04008296 */  lhu        $v0, 0x4($s4)
/* E734 8001DF34 68BF91AF */  sw         $s1, %gp_rel(gameTrackerX + 0x1A0)($gp)
/* E738 8001DF38 5ABF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x192)($gp)
/* E73C 8001DF3C 14006012 */  beqz       $s3, .L8001DF90
/* E740 8001DF40 FFFF0224 */   addiu     $v0, $zero, -0x1
/* E744 8001DF44 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* E748 8001DF48 00000000 */  nop
/* E74C 8001DF4C 0A004014 */  bnez       $v0, .L8001DF78
/* E750 8001DF50 1000A427 */   addiu     $a0, $sp, 0x10
/* E754 8001DF54 0D80053C */  lui        $a1, %hi(HandleGlobalValueSignal + 0x14)
/* E758 8001DF58 1CD2010C */  jal        strcmpi
/* E75C 8001DF5C 1C04A524 */   addiu     $a1, $a1, %lo(HandleGlobalValueSignal + 0x14)
/* E760 8001DF60 05004014 */  bnez       $v0, .L8001DF78
/* E764 8001DF64 0010053C */   lui       $a1, (0x10002001 >> 16)
/* E768 8001DF68 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* E76C 8001DF6C 0120A534 */  ori        $a1, $a1, (0x10002001 & 0xFFFF)
/* E770 8001DF70 A1D1000C */  jal        INSTANCE_Post
/* E774 8001DF74 21300000 */   addu      $a2, $zero, $zero
.L8001DF78:
/* E778 8001DF78 24BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x15C)
/* E77C 8001DF7C B26C010C */  jal        WARPGATE_GetWarpRoomIndex
/* E780 8001DF80 00000000 */   nop
/* E784 8001DF84 46BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x17E)($gp)
/* E788 8001DF88 00780008 */  j          .L8001E000
/* E78C 8001DF8C 01000224 */   addiu     $v0, $zero, 0x1
.L8001DF90:
/* E790 8001DF90 46BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x17E)($gp)
/* E794 8001DF94 00780008 */  j          .L8001E000
/* E798 8001DF98 01000224 */   addiu     $v0, $zero, 0x1
.L8001DF9C:
/* E79C 8001DF9C 4801428E */  lw         $v0, 0x148($s2)
/* E7A0 8001DFA0 00000000 */  nop
/* E7A4 8001DFA4 16004014 */  bnez       $v0, .L8001E000
/* E7A8 8001DFA8 01000224 */   addiu     $v0, $zero, 0x1
/* E7AC 8001DFAC 1C66010C */  jal        STREAM_GetLevelWithID
/* E7B0 8001DFB0 21202002 */   addu      $a0, $s1, $zero
/* E7B4 8001DFB4 0C004014 */  bnez       $v0, .L8001DFE8
/* E7B8 8001DFB8 21204002 */   addu      $a0, $s2, $zero
/* E7BC 8001DFBC 3800448E */  lw         $a0, 0x38($s2)
/* E7C0 8001DFC0 1C66010C */  jal        STREAM_GetLevelWithID
/* E7C4 8001DFC4 00000000 */   nop
/* E7C8 8001DFC8 21204002 */  addu       $a0, $s2, $zero
/* E7CC 8001DFCC 2BD8020C */  jal        SAVE_Instance
/* E7D0 8001DFD0 21284000 */   addu      $a1, $v0, $zero
/* E7D4 8001DFD4 1400428E */  lw         $v0, 0x14($s2)
/* E7D8 8001DFD8 00000000 */  nop
/* E7DC 8001DFDC 20004234 */  ori        $v0, $v0, 0x20
/* E7E0 8001DFE0 FF770008 */  j          .L8001DFFC
/* E7E4 8001DFE4 140042AE */   sw        $v0, 0x14($s2)
.L8001DFE8:
/* E7E8 8001DFE8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* E7EC 8001DFEC C80082A4 */  sh         $v0, 0xC8($a0)
/* E7F0 8001DFF0 CC0080AC */  sw         $zero, 0xCC($a0)
/* E7F4 8001DFF4 EAD5000C */  jal        INSTANCE_UpdateFamilyStreamUnitID
/* E7F8 8001DFF8 380091AC */   sw        $s1, 0x38($a0)
.L8001DFFC:
/* E7FC 8001DFFC 01000224 */  addiu      $v0, $zero, 0x1
.L8001E000:
/* E800 8001E000 3800BF8F */  lw         $ra, 0x38($sp)
/* E804 8001E004 3400B58F */  lw         $s5, 0x34($sp)
/* E808 8001E008 3000B48F */  lw         $s4, 0x30($sp)
/* E80C 8001E00C 2C00B38F */  lw         $s3, 0x2C($sp)
/* E810 8001E010 2800B28F */  lw         $s2, 0x28($sp)
/* E814 8001E014 2400B18F */  lw         $s1, 0x24($sp)
/* E818 8001E018 2000B08F */  lw         $s0, 0x20($sp)
/* E81C 8001E01C 0800E003 */  jr         $ra
/* E820 8001E020 4000BD27 */   addiu     $sp, $sp, 0x40
.size SIGNAL_HandleStreamLevel, . - SIGNAL_HandleStreamLevel
