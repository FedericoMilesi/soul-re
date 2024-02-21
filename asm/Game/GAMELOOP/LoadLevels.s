.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadLevels
/* 1E7C0 8002DFC0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 1E7C4 8002DFC4 2000B2AF */  sw         $s2, 0x20($sp)
/* 1E7C8 8002DFC8 21908000 */  addu       $s2, $a0, $zero
/* 1E7CC 8002DFCC 2400B3AF */  sw         $s3, 0x24($sp)
/* 1E7D0 8002DFD0 2198A000 */  addu       $s3, $a1, $zero
/* 1E7D4 8002DFD4 80918427 */  addiu      $a0, $gp, %gp_rel(D_800D0718)
/* 1E7D8 8002DFD8 2800BFAF */  sw         $ra, 0x28($sp)
/* 1E7DC 8002DFDC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 1E7E0 8002DFE0 ACF4020C */  jal        strlen
/* 1E7E4 8002DFE4 1800B0AF */   sw        $s0, 0x18($sp)
/* 1E7E8 8002DFE8 04004010 */  beqz       $v0, .L8002DFFC
/* 1E7EC 8002DFEC 00000000 */   nop
/* 1E7F0 8002DFF0 80918427 */  addiu      $a0, $gp, %gp_rel(D_800D0718)
/* 1E7F4 8002DFF4 B062010C */  jal        STREAM_AbortAreaLoad
/* 1E7F8 8002DFF8 00000000 */   nop
.L8002DFFC:
/* 1E7FC 8002DFFC 80918427 */  addiu      $a0, $gp, %gp_rel(D_800D0718)
/* 1E800 8002E000 1CF4020C */  jal        strcpy
/* 1E804 8002E004 21284002 */   addu      $a1, $s2, $zero
/* 1E808 8002E008 5182010C */  jal        LOAD_ChangeDirectory
/* 1E80C 8002E00C 21204002 */   addu      $a0, $s2, $zero
/* 1E810 8002E010 21204002 */  addu       $a0, $s2, $zero
/* 1E814 8002E014 21280000 */  addu       $a1, $zero, $zero
/* 1E818 8002E018 A76A010C */  jal        STREAM_LoadLevel
/* 1E81C 8002E01C 2130A000 */   addu      $a2, $a1, $zero
/* 1E820 8002E020 21804000 */  addu       $s0, $v0, $zero
/* 1E824 8002E024 04001186 */  lh         $s1, 0x4($s0)
/* 1E828 8002E028 01000224 */  addiu      $v0, $zero, 0x1
/* 1E82C 8002E02C 20002216 */  bne        $s1, $v0, .L8002E0B0
/* 1E830 8002E030 00000000 */   nop
/* 1E834 8002E034 6EB3000C */  jal        DRAW_LoadingMessage
/* 1E838 8002E038 00000000 */   nop
/* 1E83C 8002E03C 04000286 */  lh         $v0, 0x4($s0)
/* 1E840 8002E040 00000000 */  nop
/* 1E844 8002E044 07005114 */  bne        $v0, $s1, .L8002E064
/* 1E848 8002E048 01001124 */   addiu     $s1, $zero, 0x1
.L8002E04C:
/* 1E84C 8002E04C E2B7000C */  jal        GAMELOOP_WaitForLoad
/* 1E850 8002E050 00000000 */   nop
/* 1E854 8002E054 04000286 */  lh         $v0, 0x4($s0)
/* 1E858 8002E058 00000000 */  nop
/* 1E85C 8002E05C FBFF5110 */  beq        $v0, $s1, .L8002E04C
/* 1E860 8002E060 00000000 */   nop
.L8002E064:
/* 1E864 8002E064 E07F010C */  jal        STREAM_NextLoadFromHead
/* 1E868 8002E068 00000000 */   nop
/* 1E86C 8002E06C 21206002 */  addu       $a0, $s3, $zero
/* 1E870 8002E070 21284002 */  addu       $a1, $s2, $zero
/* 1E874 8002E074 586A010C */  jal        STREAM_LoadMainVram
/* 1E878 8002E078 21300002 */   addu      $a2, $s0, $zero
/* 1E87C 8002E07C E47F010C */  jal        STREAM_NextLoadAsNormal
/* 1E880 8002E080 00000000 */   nop
/* 1E884 8002E084 E2B7000C */  jal        GAMELOOP_WaitForLoad
/* 1E888 8002E088 00000000 */   nop
/* 1E88C 8002E08C FFFF5124 */  addiu      $s1, $v0, -0x1
.L8002E090:
/* 1E890 8002E090 E2B7000C */  jal        GAMELOOP_WaitForLoad
/* 1E894 8002E094 00000000 */   nop
/* 1E898 8002E098 0B004010 */  beqz       $v0, .L8002E0C8
/* 1E89C 8002E09C 2A105100 */   slt       $v0, $v0, $s1
/* 1E8A0 8002E0A0 FBFF4010 */  beqz       $v0, .L8002E090
/* 1E8A4 8002E0A4 00000000 */   nop
/* 1E8A8 8002E0A8 32B80008 */  j          .L8002E0C8
/* 1E8AC 8002E0AC 00000000 */   nop
.L8002E0B0:
/* 1E8B0 8002E0B0 D464010C */  jal        STREAM_DumpLoadingObjects
/* 1E8B4 8002E0B4 00000000 */   nop
/* 1E8B8 8002E0B8 21206002 */  addu       $a0, $s3, $zero
/* 1E8BC 8002E0BC 21284002 */  addu       $a1, $s2, $zero
/* 1E8C0 8002E0C0 586A010C */  jal        STREAM_LoadMainVram
/* 1E8C4 8002E0C4 21300002 */   addu      $a2, $s0, $zero
.L8002E0C8:
/* 1E8C8 8002E0C8 0800028E */  lw         $v0, 0x8($s0)
/* 1E8CC 8002E0CC 00000000 */  nop
/* 1E8D0 8002E0D0 C000438C */  lw         $v1, 0xC0($v0)
/* 1E8D4 8002E0D4 00000000 */  nop
/* 1E8D8 8002E0D8 15006010 */  beqz       $v1, .L8002E130
/* 1E8DC 8002E0DC 00000000 */   nop
/* 1E8E0 8002E0E0 2C00628E */  lw         $v0, 0x2C($s3)
/* 1E8E4 8002E0E4 00000000 */  nop
/* 1E8E8 8002E0E8 10004010 */  beqz       $v0, .L8002E12C
/* 1E8EC 8002E0EC 21300000 */   addu      $a2, $zero, $zero
/* 1E8F0 8002E0F0 06006294 */  lhu        $v0, 0x6($v1)
/* 1E8F4 8002E0F4 00000000 */  nop
/* 1E8F8 8002E0F8 01004234 */  ori        $v0, $v0, 0x1
/* 1E8FC 8002E0FC 060062A4 */  sh         $v0, 0x6($v1)
/* 1E900 8002E100 0800028E */  lw         $v0, 0x8($s0)
/* 1E904 8002E104 00000000 */  nop
/* 1E908 8002E108 C000458C */  lw         $a1, 0xC0($v0)
/* 1E90C 8002E10C 2C00648E */  lw         $a0, 0x2C($s3)
/* 1E910 8002E110 7279000C */  jal        SIGNAL_HandleSignal
/* 1E914 8002E114 0800A524 */   addiu     $a1, $a1, 0x8
/* 1E918 8002E118 0800028E */  lw         $v0, 0x8($s0)
/* 1E91C 8002E11C 00000000 */  nop
/* 1E920 8002E120 C000448C */  lw         $a0, 0xC0($v0)
/* 1E924 8002E124 3483010C */  jal        EVENT_AddSignalToReset
/* 1E928 8002E128 00000000 */   nop
.L8002E12C:
/* 1E92C 8002E12C 0800028E */  lw         $v0, 0x8($s0)
.L8002E130:
/* 1E930 8002E130 00000000 */  nop
/* 1E934 8002E134 0000428C */  lw         $v0, 0x0($v0)
/* 1E938 8002E138 21200002 */  addu       $a0, $s0, $zero
/* 1E93C 8002E13C 4800438C */  lw         $v1, 0x48($v0)
/* 1E940 8002E140 1000A527 */  addiu      $a1, $sp, 0x10
/* 1E944 8002E144 0C006824 */  addiu      $t0, $v1, 0xC
/* 1E948 8002E148 0000628C */  lw         $v0, 0x0($v1)
/* 1E94C 8002E14C 0C006394 */  lhu        $v1, 0xC($v1)
/* 1E950 8002E150 02000995 */  lhu        $t1, 0x2($t0)
/* 1E954 8002E154 04000895 */  lhu        $t0, 0x4($t0)
/* 1E958 8002E158 00004694 */  lhu        $a2, 0x0($v0)
/* 1E95C 8002E15C 02004794 */  lhu        $a3, 0x2($v0)
/* 1E960 8002E160 04004294 */  lhu        $v0, 0x4($v0)
/* 1E964 8002E164 2130C300 */  addu       $a2, $a2, $v1
/* 1E968 8002E168 2138E900 */  addu       $a3, $a3, $t1
/* 1E96C 8002E16C 21104800 */  addu       $v0, $v0, $t0
/* 1E970 8002E170 1000A6A7 */  sh         $a2, 0x10($sp)
/* 1E974 8002E174 0200A7A4 */  sh         $a3, 0x2($a1)
/* 1E978 8002E178 0400A2A4 */  sh         $v0, 0x4($a1)
/* 1E97C 8002E17C 1200A297 */  lhu        $v0, 0x12($sp)
/* 1E980 8002E180 1400A397 */  lhu        $v1, 0x14($sp)
/* 1E984 8002E184 23300600 */  negu       $a2, $a2
/* 1E988 8002E188 1000A6A7 */  sh         $a2, 0x10($sp)
/* 1E98C 8002E18C 23100200 */  negu       $v0, $v0
/* 1E990 8002E190 23180300 */  negu       $v1, $v1
/* 1E994 8002E194 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1E998 8002E198 4C6E010C */  jal        PreloadAllConnectedUnits
/* 1E99C 8002E19C 1400A3A7 */   sh        $v1, 0x14($sp)
/* 1E9A0 8002E1A0 21100002 */  addu       $v0, $s0, $zero
/* 1E9A4 8002E1A4 2800BF8F */  lw         $ra, 0x28($sp)
/* 1E9A8 8002E1A8 2400B38F */  lw         $s3, 0x24($sp)
/* 1E9AC 8002E1AC 2000B28F */  lw         $s2, 0x20($sp)
/* 1E9B0 8002E1B0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 1E9B4 8002E1B4 1800B08F */  lw         $s0, 0x18($sp)
/* 1E9B8 8002E1B8 0800E003 */  jr         $ra
/* 1E9BC 8002E1BC 3000BD27 */   addiu     $sp, $sp, 0x30
.size LoadLevels, . - LoadLevels
