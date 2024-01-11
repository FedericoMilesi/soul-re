.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_FinishLoad
/* 4A84C 8005A04C 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 4A850 8005A050 6400B1AF */  sw         $s1, 0x64($sp)
/* 4A854 8005A054 21888000 */  addu       $s1, $a0, $zero
/* 4A858 8005A058 6800B2AF */  sw         $s2, 0x68($sp)
/* 4A85C 8005A05C 0C003226 */  addiu      $s2, $s1, 0xC
/* 4A860 8005A060 21204002 */  addu       $a0, $s2, $zero
/* 4A864 8005A064 21280000 */  addu       $a1, $zero, $zero
/* 4A868 8005A068 2130A000 */  addu       $a2, $a1, $zero
/* 4A86C 8005A06C 1000A727 */  addiu      $a3, $sp, 0x10
/* 4A870 8005A070 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 4A874 8005A074 8062010C */  jal        STREAM_FillOutFileNames
/* 4A878 8005A078 6000B0AF */   sw        $s0, 0x60($sp)
/* 4A87C 8005A07C 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A880 8005A080 0800308E */  lw         $s0, 0x8($s1)
/* 4A884 8005A084 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4A888 8005A088 940002AE */  sw         $v0, 0x94($s0)
/* 4A88C 8005A08C 1FE0000C */  jal        LOAD_DoesFileExist
/* 4A890 8005A090 3C0020A6 */   sh        $zero, 0x3C($s1)
/* 4A894 8005A094 06004010 */  beqz       $v0, .L8005A0B0
/* 4A898 8005A098 00000000 */   nop
/* 4A89C 8005A09C 21204002 */  addu       $a0, $s2, $zero
/* 4A8A0 8005A0A0 0000258E */  lw         $a1, 0x0($s1)
/* 4A8A4 8005A0A4 BF4A010C */  jal        aadLoadDynamicSfx
/* 4A8A8 8005A0A8 01000624 */   addiu     $a2, $zero, 0x1
/* 4A8AC 8005A0AC 3C0022A6 */  sh         $v0, 0x3C($s1)
.L8005A0B0:
/* 4A8B0 8005A0B0 6F64010C */  jal        LoadLevelObjects
/* 4A8B4 8005A0B4 21202002 */   addu      $a0, $s1, $zero
/* 4A8B8 8005A0B8 3C00028E */  lw         $v0, 0x3C($s0)
/* 4A8BC 8005A0BC 38002396 */  lhu        $v1, 0x38($s1)
/* 4A8C0 8005A0C0 300022AE */  sw         $v0, 0x30($s1)
/* 4A8C4 8005A0C4 440003A6 */  sh         $v1, 0x44($s0)
/* 4A8C8 8005A0C8 3A002296 */  lhu        $v0, 0x3A($s1)
/* 4A8CC 8005A0CC 21200002 */  addu       $a0, $s0, $zero
/* 4A8D0 8005A0D0 6DDC000C */  jal        LIGHT_CalcDQPTable
/* 4A8D4 8005A0D4 460002A6 */   sh        $v0, 0x46($s0)
/* 4A8D8 8005A0D8 4666010C */  jal        STREAM_CalculateWaterLevel
/* 4A8DC 8005A0DC 21200002 */   addu      $a0, $s0, $zero
/* 4A8E0 8005A0E0 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4A8E4 8005A0E4 01000224 */  addiu      $v0, $zero, 0x1
/* 4A8E8 8005A0E8 03006214 */  bne        $v1, $v0, .L8005A0F8
/* 4A8EC 8005A0EC 00000000 */   nop
/* 4A8F0 8005A0F0 8472010C */  jal        MORPH_UpdateNormals
/* 4A8F4 8005A0F4 21200002 */   addu      $a0, $s0, $zero
.L8005A0F8:
/* 4A8F8 8005A0F8 F066010C */  jal        STREAM_ConnectStream
/* 4A8FC 8005A0FC 21202002 */   addu      $a0, $s1, $zero
/* 4A900 8005A100 21202002 */  addu       $a0, $s1, $zero
/* 4A904 8005A104 02000224 */  addiu      $v0, $zero, 0x2
/* 4A908 8005A108 0168010C */  jal        STREAM_DoObjectLoadAndDump
/* 4A90C 8005A10C 040022A6 */   sh        $v0, 0x4($s1)
/* 4A910 8005A110 0000248E */  lw         $a0, 0x0($s1)
/* 4A914 8005A114 5B9E010C */  jal        EVENT_LoadEventsForLevel
/* 4A918 8005A118 21280002 */   addu      $a1, $s0, $zero
/* 4A91C 8005A11C CB61020C */  jal        PLANAPI_InitPlanMkrList
/* 4A920 8005A120 21202002 */   addu      $a0, $s1, $zero
/* 4A924 8005A124 BC00038E */  lw         $v1, 0xBC($s0)
/* 4A928 8005A128 00000000 */  nop
/* 4A92C 8005A12C 0C006010 */  beqz       $v1, .L8005A160
/* 4A930 8005A130 21300000 */   addu      $a2, $zero, $zero
/* 4A934 8005A134 06006294 */  lhu        $v0, 0x6($v1)
/* 4A938 8005A138 00000000 */  nop
/* 4A93C 8005A13C 01004234 */  ori        $v0, $v0, 0x1
/* 4A940 8005A140 060062A4 */  sh         $v0, 0x6($v1)
/* 4A944 8005A144 BC00058E */  lw         $a1, 0xBC($s0)
/* 4A948 8005A148 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4A94C 8005A14C 7279000C */  jal        SIGNAL_HandleSignal
/* 4A950 8005A150 0800A524 */   addiu     $a1, $a1, 0x8
/* 4A954 8005A154 BC00048E */  lw         $a0, 0xBC($s0)
/* 4A958 8005A158 3483010C */  jal        EVENT_AddSignalToReset
/* 4A95C 8005A15C 00000000 */   nop
.L8005A160:
/* 4A960 8005A160 D2D6020C */  jal        SAVE_IntroForStreamID
/* 4A964 8005A164 21202002 */   addu      $a0, $s1, $zero
/* 4A968 8005A168 46D7020C */  jal        SAVE_UpdateLevelWithSave
/* 4A96C 8005A16C 21202002 */   addu      $a0, $s1, $zero
/* 4A970 8005A170 44A0010C */  jal        EVENT_AddStreamToInstanceList
/* 4A974 8005A174 21202002 */   addu      $a0, $s1, $zero
/* 4A978 8005A178 976D010C */  jal        WARPGATE_FixUnit
/* 4A97C 8005A17C 21202002 */   addu      $a0, $s1, $zero
/* 4A980 8005A180 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 4A984 8005A184 6800B28F */  lw         $s2, 0x68($sp)
/* 4A988 8005A188 6400B18F */  lw         $s1, 0x64($sp)
/* 4A98C 8005A18C 6000B08F */  lw         $s0, 0x60($sp)
/* 4A990 8005A190 0800E003 */  jr         $ra
/* 4A994 8005A194 7000BD27 */   addiu     $sp, $sp, 0x70
.size STREAM_FinishLoad, . - STREAM_FinishLoad
