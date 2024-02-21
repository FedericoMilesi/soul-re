.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ProcessHints
/* 51770 80060F70 18CF8297 */  lhu        $v0, %gp_rel(gHintSystem)($gp)
/* 51774 80060F74 68FFBD27 */  addiu      $sp, $sp, -0x98
/* 51778 80060F78 9400BFAF */  sw         $ra, 0x94($sp)
/* 5177C 80060F7C 01004230 */  andi       $v0, $v0, 0x1
/* 51780 80060F80 67004010 */  beqz       $v0, .L80061120
/* 51784 80060F84 9000B0AF */   sw        $s0, 0x90($sp)
/* 51788 80060F88 1CCF8487 */  lh         $a0, %gp_rel(gHintSystem + 0x4)($gp)
/* 5178C 80060F8C B3DD020C */  jal        localstr_get
/* 51790 80060F90 00000000 */   nop
/* 51794 80060F94 1000A427 */  addiu      $a0, $sp, 0x10
/* 51798 80060F98 0D80053C */  lui        $a1, %hi(D_800D1A08)
/* 5179C 80060F9C 081AA524 */  addiu      $a1, $a1, %lo(D_800D1A08)
/* 517A0 80060FA0 1AD1010C */  jal        sprintf
/* 517A4 80060FA4 21304000 */   addu      $a2, $v0, $zero
/* 517A8 80060FA8 18CF8397 */  lhu        $v1, %gp_rel(gHintSystem)($gp)
/* 517AC 80060FAC 00000000 */  nop
/* 517B0 80060FB0 02006230 */  andi       $v0, $v1, 0x2
/* 517B4 80060FB4 10004010 */  beqz       $v0, .L80060FF8
/* 517B8 80060FB8 8888043C */   lui       $a0, (0x88888889 >> 16)
/* 517BC 80060FBC 20CF838F */  lw         $v1, %gp_rel(gHintSystem + 0x8)($gp)
/* 517C0 80060FC0 89888434 */  ori        $a0, $a0, (0x88888889 & 0xFFFF)
/* 517C4 80060FC4 40100300 */  sll        $v0, $v1, 1
/* 517C8 80060FC8 21104300 */  addu       $v0, $v0, $v1
/* 517CC 80060FCC 80100200 */  sll        $v0, $v0, 2
/* 517D0 80060FD0 21104300 */  addu       $v0, $v0, $v1
/* 517D4 80060FD4 80100200 */  sll        $v0, $v0, 2
/* 517D8 80060FD8 18004400 */  mult       $v0, $a0
/* 517DC 80060FDC 10380000 */  mfhi       $a3
/* 517E0 80060FE0 2118E200 */  addu       $v1, $a3, $v0
/* 517E4 80060FE4 C31B0300 */  sra        $v1, $v1, 15
/* 517E8 80060FE8 C3170200 */  sra        $v0, $v0, 31
/* 517EC 80060FEC 23186200 */  subu       $v1, $v1, $v0
/* 517F0 80060FF0 11840108 */  j          .L80061044
/* 517F4 80060FF4 C8007024 */   addiu     $s0, $v1, 0xC8
.L80060FF8:
/* 517F8 80060FF8 04006230 */  andi       $v0, $v1, 0x4
/* 517FC 80060FFC 11004010 */  beqz       $v0, .L80061044
/* 51800 80061000 C8001024 */   addiu     $s0, $zero, 0xC8
/* 51804 80061004 8888043C */  lui        $a0, (0x88888889 >> 16)
/* 51808 80061008 20CF838F */  lw         $v1, %gp_rel(gHintSystem + 0x8)($gp)
/* 5180C 8006100C 89888434 */  ori        $a0, $a0, (0x88888889 & 0xFFFF)
/* 51810 80061010 40100300 */  sll        $v0, $v1, 1
/* 51814 80061014 21104300 */  addu       $v0, $v0, $v1
/* 51818 80061018 80100200 */  sll        $v0, $v0, 2
/* 5181C 8006101C 21104300 */  addu       $v0, $v0, $v1
/* 51820 80061020 80100200 */  sll        $v0, $v0, 2
/* 51824 80061024 18004400 */  mult       $v0, $a0
/* 51828 80061028 10380000 */  mfhi       $a3
/* 5182C 8006102C 2118E200 */  addu       $v1, $a3, $v0
/* 51830 80061030 C31B0300 */  sra        $v1, $v1, 15
/* 51834 80061034 C3170200 */  sra        $v0, $v0, 31
/* 51838 80061038 23186200 */  subu       $v1, $v1, $v0
/* 5183C 8006103C FC000224 */  addiu      $v0, $zero, 0xFC
/* 51840 80061040 23804300 */  subu       $s0, $v0, $v1
.L80061044:
/* 51844 80061044 1000A427 */  addiu      $a0, $sp, 0x10
/* 51848 80061048 A8B6000C */  jal        FONT_FontPrintCentered
/* 5184C 8006104C 21280002 */   addu      $a1, $s0, $zero
/* 51850 80061050 0D80043C */  lui        $a0, %hi(D_800D1A0C)
/* 51854 80061054 0C1A8424 */  addiu      $a0, $a0, %lo(D_800D1A0C)
/* 51858 80061058 A8B6000C */  jal        FONT_FontPrintCentered
/* 5185C 8006105C 21280002 */   addu      $a1, $s0, $zero
/* 51860 80061060 FBB5000C */  jal        FONT_GetStringWidth
/* 51864 80061064 1000A427 */   addiu     $a0, $sp, 0x10
/* 51868 80061068 21204000 */  addu       $a0, $v0, $zero
/* 5186C 8006106C 72DE020C */  jal        DisplayHintBox
/* 51870 80061070 21280002 */   addu      $a1, $s0, $zero
/* 51874 80061074 20CF838F */  lw         $v1, %gp_rel(gHintSystem + 0x8)($gp)
/* 51878 80061078 20CF8527 */  addiu      $a1, $gp, %gp_rel(gHintSystem + 0x8)
/* 5187C 8006107C 19006010 */  beqz       $v1, .L800610E4
/* 51880 80061080 00000000 */   nop
/* 51884 80061084 08C0848F */  lw         $a0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 51888 80061088 00000000 */  nop
/* 5188C 8006108C 2B108300 */  sltu       $v0, $a0, $v1
/* 51890 80061090 13004014 */  bnez       $v0, .L800610E0
/* 51894 80061094 23106400 */   subu      $v0, $v1, $a0
/* 51898 80061098 F8FFA394 */  lhu        $v1, -0x8($a1)
/* 5189C 8006109C 20CF80AF */  sw         $zero, %gp_rel(gHintSystem + 0x8)($gp)
/* 518A0 800610A0 02006230 */  andi       $v0, $v1, 0x2
/* 518A4 800610A4 07004010 */  beqz       $v0, .L800610C4
/* 518A8 800610A8 04006230 */   andi      $v0, $v1, 0x4
/* 518AC 800610AC 18CF8297 */  lhu        $v0, %gp_rel(gHintSystem)($gp)
/* 518B0 800610B0 00000000 */  nop
/* 518B4 800610B4 FDFF4230 */  andi       $v0, $v0, 0xFFFD
/* 518B8 800610B8 18CF82A7 */  sh         $v0, %gp_rel(gHintSystem)($gp)
/* 518BC 800610BC 39840108 */  j          .L800610E4
/* 518C0 800610C0 00000000 */   nop
.L800610C4:
/* 518C4 800610C4 07004010 */  beqz       $v0, .L800610E4
/* 518C8 800610C8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 518CC 800610CC F8FFA0A4 */  sh         $zero, -0x8($a1)
/* 518D0 800610D0 1ACF82A7 */  sh         $v0, %gp_rel(gHintSystem + 0x2)($gp)
/* 518D4 800610D4 1CCF82A7 */  sh         $v0, %gp_rel(gHintSystem + 0x4)($gp)
/* 518D8 800610D8 39840108 */  j          .L800610E4
/* 518DC 800610DC 00000000 */   nop
.L800610E0:
/* 518E0 800610E0 20CF82AF */  sw         $v0, %gp_rel(gHintSystem + 0x8)($gp)
.L800610E4:
/* 518E4 800610E4 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 518E8 800610E8 24CF838F */  lw         $v1, %gp_rel(gHintSystem + 0xC)($gp)
/* 518EC 800610EC 3800428C */  lw         $v0, 0x38($v0)
/* 518F0 800610F0 00000000 */  nop
/* 518F4 800610F4 03006210 */  beq        $v1, $v0, .L80061104
/* 518F8 800610F8 00000000 */   nop
/* 518FC 800610FC 6883010C */  jal        HINT_StopHint
/* 51900 80061100 00000000 */   nop
.L80061104:
/* 51904 80061104 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 51908 80061108 00000000 */  nop
/* 5190C 8006110C 10004230 */  andi       $v0, $v0, 0x10
/* 51910 80061110 03004010 */  beqz       $v0, .L80061120
/* 51914 80061114 00000000 */   nop
/* 51918 80061118 6883010C */  jal        HINT_StopHint
/* 5191C 8006111C 00000000 */   nop
.L80061120:
/* 51920 80061120 9400BF8F */  lw         $ra, 0x94($sp)
/* 51924 80061124 9000B08F */  lw         $s0, 0x90($sp)
/* 51928 80061128 0800E003 */  jr         $ra
/* 5192C 8006112C 9800BD27 */   addiu     $sp, $sp, 0x98
.size EVENT_ProcessHints, . - EVENT_ProcessHints
