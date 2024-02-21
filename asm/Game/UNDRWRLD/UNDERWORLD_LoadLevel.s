.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_LoadLevel
/* A56A0 800B4EA0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* A56A4 800B4EA4 4000B2AF */  sw         $s2, 0x40($sp)
/* A56A8 800B4EA8 00BF928F */  lw         $s2, %gp_rel(gameTrackerX + 0x138)($gp)
/* A56AC 800B4EAC 3800B0AF */  sw         $s0, 0x38($sp)
/* A56B0 800B4EB0 21808000 */  addu       $s0, $a0, $zero
/* A56B4 800B4EB4 4800B4AF */  sw         $s4, 0x48($sp)
/* A56B8 800B4EB8 21A0A000 */  addu       $s4, $a1, $zero
/* A56BC 800B4EBC 5000BFAF */  sw         $ra, 0x50($sp)
/* A56C0 800B4EC0 4C00B5AF */  sw         $s5, 0x4C($sp)
/* A56C4 800B4EC4 4400B3AF */  sw         $s3, 0x44($sp)
/* A56C8 800B4EC8 3C00B1AF */  sw         $s1, 0x3C($sp)
.L800B4ECC:
/* A56CC 800B4ECC 7580010C */  jal        STREAM_PollLoadQueue
/* A56D0 800B4ED0 00000000 */   nop
/* A56D4 800B4ED4 05004010 */  beqz       $v0, .L800B4EEC
/* A56D8 800B4ED8 00000000 */   nop
/* A56DC 800B4EDC 2BD2020C */  jal        UNDERWORLD_RotateScreenStep
/* A56E0 800B4EE0 21204002 */   addu      $a0, $s2, $zero
/* A56E4 800B4EE4 B3D30208 */  j          .L800B4ECC
/* A56E8 800B4EE8 21904000 */   addu      $s2, $v0, $zero
.L800B4EEC:
/* A56EC 800B4EEC 5182010C */  jal        LOAD_ChangeDirectory
/* A56F0 800B4EF0 21200002 */   addu      $a0, $s0, $zero
/* A56F4 800B4EF4 21200002 */  addu       $a0, $s0, $zero
/* A56F8 800B4EF8 21280000 */  addu       $a1, $zero, $zero
/* A56FC 800B4EFC A76A010C */  jal        STREAM_LoadLevel
/* A5700 800B4F00 2130A000 */   addu      $a2, $a1, $zero
/* A5704 800B4F04 21984000 */  addu       $s3, $v0, $zero
.L800B4F08:
/* A5708 800B4F08 7580010C */  jal        STREAM_PollLoadQueue
/* A570C 800B4F0C 00000000 */   nop
/* A5710 800B4F10 05004010 */  beqz       $v0, .L800B4F28
/* A5714 800B4F14 00000000 */   nop
/* A5718 800B4F18 2BD2020C */  jal        UNDERWORLD_RotateScreenStep
/* A571C 800B4F1C 21204002 */   addu      $a0, $s2, $zero
/* A5720 800B4F20 C2D30208 */  j          .L800B4F08
/* A5724 800B4F24 21904000 */   addu      $s2, $v0, $zero
.L800B4F28:
/* A5728 800B4F28 0800628E */  lw         $v0, 0x8($s3)
/* A572C 800B4F2C 00000000 */  nop
/* A5730 800B4F30 C000458C */  lw         $a1, 0xC0($v0)
/* A5734 800B4F34 00000000 */  nop
/* A5738 800B4F38 0600A010 */  beqz       $a1, .L800B4F54
/* A573C 800B4F3C 21208002 */   addu      $a0, $s4, $zero
/* A5740 800B4F40 2C00848E */  lw         $a0, 0x2C($s4)
/* A5744 800B4F44 0800A524 */  addiu      $a1, $a1, 0x8
/* A5748 800B4F48 7279000C */  jal        SIGNAL_HandleSignal
/* A574C 800B4F4C 21300000 */   addu      $a2, $zero, $zero
/* A5750 800B4F50 21208002 */  addu       $a0, $s4, $zero
.L800B4F54:
/* A5754 800B4F54 0D80053C */  lui        $a1, %hi(D_800D1DC8)
/* A5758 800B4F58 C81DA524 */  addiu      $a1, $a1, %lo(D_800D1DC8)
/* A575C 800B4F5C 586A010C */  jal        STREAM_LoadMainVram
/* A5760 800B4F60 21306002 */   addu      $a2, $s3, $zero
/* A5764 800B4F64 0400053C */  lui        $a1, (0x40001 >> 16)
/* A5768 800B4F68 0800628E */  lw         $v0, 0x8($s3)
/* A576C 800B4F6C 2C00848E */  lw         $a0, 0x2C($s4)
/* A5770 800B4F70 F800468C */  lw         $a2, 0xF8($v0)
/* A5774 800B4F74 A1D1000C */  jal        INSTANCE_Post
/* A5778 800B4F78 0100A534 */   ori       $a1, $a1, (0x40001 & 0xFFFF)
/* A577C 800B4F7C 0800628E */  lw         $v0, 0x8($s3)
/* A5780 800B4F80 00000000 */  nop
/* A5784 800B4F84 0000428C */  lw         $v0, 0x0($v0)
/* A5788 800B4F88 00000000 */  nop
/* A578C 800B4F8C 4800428C */  lw         $v0, 0x48($v0)
/* A5790 800B4F90 00000000 */  nop
/* A5794 800B4F94 0000428C */  lw         $v0, 0x0($v0)
/* A5798 800B4F98 00000000 */  nop
/* A579C 800B4F9C 00004394 */  lhu        $v1, 0x0($v0)
/* A57A0 800B4FA0 02004494 */  lhu        $a0, 0x2($v0)
/* A57A4 800B4FA4 04004594 */  lhu        $a1, 0x4($v0)
/* A57A8 800B4FA8 1000A227 */  addiu      $v0, $sp, 0x10
/* A57AC 800B4FAC 1000A3A7 */  sh         $v1, 0x10($sp)
/* A57B0 800B4FB0 020044A4 */  sh         $a0, 0x2($v0)
/* A57B4 800B4FB4 040045A4 */  sh         $a1, 0x4($v0)
/* A57B8 800B4FB8 1200A297 */  lhu        $v0, 0x12($sp)
/* A57BC 800B4FBC 23180300 */  negu       $v1, $v1
/* A57C0 800B4FC0 1000A3A7 */  sh         $v1, 0x10($sp)
/* A57C4 800B4FC4 1400A397 */  lhu        $v1, 0x14($sp)
/* A57C8 800B4FC8 23100200 */  negu       $v0, $v0
/* A57CC 800B4FCC 23180300 */  negu       $v1, $v1
/* A57D0 800B4FD0 1200A2A7 */  sh         $v0, 0x12($sp)
/* A57D4 800B4FD4 1400A3A7 */  sh         $v1, 0x14($sp)
/* A57D8 800B4FD8 0800638E */  lw         $v1, 0x8($s3)
/* A57DC 800B4FDC 00000000 */  nop
/* A57E0 800B4FE0 7800628C */  lw         $v0, 0x78($v1)
/* A57E4 800B4FE4 00000000 */  nop
/* A57E8 800B4FE8 1A004018 */  blez       $v0, .L800B5054
/* A57EC 800B4FEC 21880000 */   addu      $s1, $zero, $zero
/* A57F0 800B4FF0 0D80153C */  lui        $s5, %hi(D_800D1DD0)
/* A57F4 800B4FF4 21802002 */  addu       $s0, $s1, $zero
.L800B4FF8:
/* A57F8 800B4FF8 7C00648C */  lw         $a0, 0x7C($v1)
/* A57FC 800B4FFC D01DA526 */  addiu      $a1, $s5, %lo(D_800D1DD0)
/* A5800 800B5000 1CD2010C */  jal        strcmpi
/* A5804 800B5004 21209000 */   addu      $a0, $a0, $s0
/* A5808 800B5008 0B004014 */  bnez       $v0, .L800B5038
/* A580C 800B500C 00000000 */   nop
/* A5810 800B5010 0800628E */  lw         $v0, 0x8($s3)
/* A5814 800B5014 00000000 */  nop
/* A5818 800B5018 7C00438C */  lw         $v1, 0x7C($v0)
/* A581C 800B501C 00000000 */  nop
/* A5820 800B5020 21180302 */  addu       $v1, $s0, $v1
/* A5824 800B5024 2C00628C */  lw         $v0, 0x2C($v1)
/* A5828 800B5028 00000000 */  nop
/* A582C 800B502C 08004234 */  ori        $v0, $v0, 0x8
/* A5830 800B5030 15D40208 */  j          .L800B5054
/* A5834 800B5034 2C0062AC */   sw        $v0, 0x2C($v1)
.L800B5038:
/* A5838 800B5038 0800638E */  lw         $v1, 0x8($s3)
/* A583C 800B503C 00000000 */  nop
/* A5840 800B5040 7800628C */  lw         $v0, 0x78($v1)
/* A5844 800B5044 01003126 */  addiu      $s1, $s1, 0x1
/* A5848 800B5048 2A102202 */  slt        $v0, $s1, $v0
/* A584C 800B504C EAFF4014 */  bnez       $v0, .L800B4FF8
/* A5850 800B5050 4C001026 */   addiu     $s0, $s0, 0x4C
.L800B5054:
/* A5854 800B5054 80201100 */  sll        $a0, $s1, 2
/* A5858 800B5058 21209100 */  addu       $a0, $a0, $s1
/* A585C 800B505C 80200400 */  sll        $a0, $a0, 2
/* A5860 800B5060 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A5864 800B5064 7801828E */  lw         $v0, 0x178($s4)
/* A5868 800B5068 23209100 */  subu       $a0, $a0, $s1
/* A586C 800B506C 380062AC */  sw         $v0, 0x38($v1)
/* A5870 800B5070 0800628E */  lw         $v0, 0x8($s3)
/* A5874 800B5074 80200400 */  sll        $a0, $a0, 2
/* A5878 800B5078 7C00428C */  lw         $v0, 0x7C($v0)
/* A587C 800B507C F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A5880 800B5080 66D4020C */  jal        UNDERWORLD_UpdatePlayer
/* A5884 800B5084 21204400 */   addu      $a0, $v0, $a0
/* A5888 800B5088 2BD2020C */  jal        UNDERWORLD_RotateScreenStep
/* A588C 800B508C 21204002 */   addu      $a0, $s2, $zero
/* A5890 800B5090 21904000 */  addu       $s2, $v0, $zero
/* A5894 800B5094 21206002 */  addu       $a0, $s3, $zero
/* A5898 800B5098 4C6E010C */  jal        PreloadAllConnectedUnits
/* A589C 800B509C 1000A527 */   addiu     $a1, $sp, 0x10
/* A58A0 800B50A0 78018396 */  lhu        $v1, 0x178($s4)
/* A58A4 800B50A4 0A000224 */  addiu      $v0, $zero, 0xA
/* A58A8 800B50A8 D00082A6 */  sh         $v0, 0xD0($s4)
/* A58AC 800B50AC 1E000224 */  addiu      $v0, $zero, 0x1E
/* A58B0 800B50B0 CE0082A6 */  sh         $v0, 0xCE($s4)
/* A58B4 800B50B4 CC0082A6 */  sh         $v0, 0xCC($s4)
/* A58B8 800B50B8 4CBA83A7 */  sh         $v1, %gp_rel(RENDER_currentStreamUnitID)($gp)
.L800B50BC:
/* A58BC 800B50BC 7580010C */  jal        STREAM_PollLoadQueue
/* A58C0 800B50C0 00000000 */   nop
/* A58C4 800B50C4 05004010 */  beqz       $v0, .L800B50DC
/* A58C8 800B50C8 00E1033C */   lui       $v1, (0xE1000740 >> 16)
/* A58CC 800B50CC 2BD2020C */  jal        UNDERWORLD_RotateScreenStep
/* A58D0 800B50D0 21204002 */   addu      $a0, $s2, $zero
/* A58D4 800B50D4 2FD40208 */  j          .L800B50BC
/* A58D8 800B50D8 21904000 */   addu      $s2, $v0, $zero
.L800B50DC:
/* A58DC 800B50DC 40076334 */  ori        $v1, $v1, (0xE1000740 & 0xFFFF)
/* A58E0 800B50E0 21880000 */  addu       $s1, $zero, $zero
/* A58E4 800B50E4 01000224 */  addiu      $v0, $zero, 0x1
/* A58E8 800B50E8 3300A2A3 */  sb         $v0, 0x33($sp)
/* A58EC 800B50EC 05000224 */  addiu      $v0, $zero, 0x5
/* A58F0 800B50F0 1B00A2A3 */  sb         $v0, 0x1B($sp)
/* A58F4 800B50F4 28000224 */  addiu      $v0, $zero, 0x28
/* A58F8 800B50F8 3400A3AF */  sw         $v1, 0x34($sp)
/* A58FC 800B50FC 00020324 */  addiu      $v1, $zero, 0x200
/* A5900 800B5100 1F00A2A3 */  sb         $v0, 0x1F($sp)
/* A5904 800B5104 F0000224 */  addiu      $v0, $zero, 0xF0
/* A5908 800B5108 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* A590C 800B510C 2E00A2A7 */  sh         $v0, 0x2E($sp)
/* A5910 800B5110 08000224 */  addiu      $v0, $zero, 0x8
/* A5914 800B5114 1C00A2A3 */  sb         $v0, 0x1C($sp)
/* A5918 800B5118 1D00A2A3 */  sb         $v0, 0x1D($sp)
/* A591C 800B511C 1E00A2A3 */  sb         $v0, 0x1E($sp)
/* A5920 800B5120 2A000224 */  addiu      $v0, $zero, 0x2A
/* A5924 800B5124 2000A0A7 */  sh         $zero, 0x20($sp)
/* A5928 800B5128 2200A0A7 */  sh         $zero, 0x22($sp)
/* A592C 800B512C 2400A3A7 */  sh         $v1, 0x24($sp)
/* A5930 800B5130 2600A0A7 */  sh         $zero, 0x26($sp)
/* A5934 800B5134 2800A0A7 */  sh         $zero, 0x28($sp)
/* A5938 800B5138 2C00A3A7 */  sh         $v1, 0x2C($sp)
/* A593C 800B513C 1F00A2A3 */  sb         $v0, 0x1F($sp)
.L800B5140:
/* A5940 800B5140 5EF2020C */  jal        VSync
/* A5944 800B5144 21200000 */   addu      $a0, $zero, $zero
/* A5948 800B5148 05EA020C */  jal        DrawPrim
/* A594C 800B514C 3000A427 */   addiu     $a0, $sp, 0x30
/* A5950 800B5150 05EA020C */  jal        DrawPrim
/* A5954 800B5154 1800A427 */   addiu     $a0, $sp, 0x18
/* A5958 800B5158 01003126 */  addiu      $s1, $s1, 0x1
/* A595C 800B515C 1E00222A */  slti       $v0, $s1, 0x1E
/* A5960 800B5160 F7FF4014 */  bnez       $v0, .L800B5140
/* A5964 800B5164 00000000 */   nop
/* A5968 800B5168 0FE9020C */  jal        DrawSync
/* A596C 800B516C 21200000 */   addu      $a0, $zero, $zero
/* A5970 800B5170 21106002 */  addu       $v0, $s3, $zero
/* A5974 800B5174 5000BF8F */  lw         $ra, 0x50($sp)
/* A5978 800B5178 4C00B58F */  lw         $s5, 0x4C($sp)
/* A597C 800B517C 4800B48F */  lw         $s4, 0x48($sp)
/* A5980 800B5180 4400B38F */  lw         $s3, 0x44($sp)
/* A5984 800B5184 4000B28F */  lw         $s2, 0x40($sp)
/* A5988 800B5188 3C00B18F */  lw         $s1, 0x3C($sp)
/* A598C 800B518C 3800B08F */  lw         $s0, 0x38($sp)
/* A5990 800B5190 0800E003 */  jr         $ra
/* A5994 800B5194 5800BD27 */   addiu     $sp, $sp, 0x58
.size UNDERWORLD_LoadLevel, . - UNDERWORLD_LoadLevel
