.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitPhysicalObject
/* 5B7A8 8006AFA8 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 5B7AC 8006AFAC 5000B2AF */  sw         $s2, 0x50($sp)
/* 5B7B0 8006AFB0 21908000 */  addu       $s2, $a0, $zero
/* 5B7B4 8006AFB4 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 5B7B8 8006AFB8 6000BFAF */  sw         $ra, 0x60($sp)
/* 5B7BC 8006AFBC 5800B4AF */  sw         $s4, 0x58($sp)
/* 5B7C0 8006AFC0 5400B3AF */  sw         $s3, 0x54($sp)
/* 5B7C4 8006AFC4 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 5B7C8 8006AFC8 4800B0AF */  sw         $s0, 0x48($sp)
/* 5B7CC 8006AFCC 1400428E */  lw         $v0, 0x14($s2)
/* 5B7D0 8006AFD0 0200033C */  lui        $v1, (0x20000 >> 16)
/* 5B7D4 8006AFD4 24104300 */  and        $v0, $v0, $v1
/* 5B7D8 8006AFD8 21004010 */  beqz       $v0, .L8006B060
/* 5B7DC 8006AFDC 21A8A000 */   addu      $s5, $a1, $zero
/* 5B7E0 8006AFE0 2400428E */  lw         $v0, 0x24($s2)
/* 5B7E4 8006AFE4 00000000 */  nop
/* 5B7E8 8006AFE8 1C004394 */  lhu        $v1, 0x1C($v0)
/* 5B7EC 8006AFEC 02000224 */  addiu      $v0, $zero, 0x2
/* 5B7F0 8006AFF0 0A006214 */  bne        $v1, $v0, .L8006B01C
/* 5B7F4 8006AFF4 21204002 */   addu      $a0, $s2, $zero
/* 5B7F8 8006AFF8 21200000 */  addu       $a0, $zero, $zero
/* 5B7FC 8006AFFC 9FC6010C */  jal        SetObjectIdleData
/* 5B800 8006B000 21288000 */   addu      $a1, $a0, $zero
/* 5B804 8006B004 2C00A48E */  lw         $a0, 0x2C($s5)
/* 5B808 8006B008 8000053C */  lui        $a1, (0x800024 >> 16)
/* 5B80C 8006B00C 2400A534 */  ori        $a1, $a1, (0x800024 & 0xFFFF)
/* 5B810 8006B010 A1D1000C */  jal        INSTANCE_Post
/* 5B814 8006B014 21304000 */   addu      $a2, $v0, $zero
/* 5B818 8006B018 21204002 */  addu       $a0, $s2, $zero
.L8006B01C:
/* 5B81C 8006B01C B0A3010C */  jal        CheckPhysObAbility
/* 5B820 8006B020 08000524 */   addiu     $a1, $zero, 0x8
/* 5B824 8006B024 09004010 */  beqz       $v0, .L8006B04C
/* 5B828 8006B028 C8015026 */   addiu     $s0, $s2, 0x1C8
/* 5B82C 8006B02C 21200002 */  addu       $a0, $s0, $zero
/* 5B830 8006B030 21280000 */  addu       $a1, $zero, $zero
/* 5B834 8006B034 2441020C */  jal        G2Anim_DetachControllerFromSeg
/* 5B838 8006B038 4C000624 */   addiu     $a2, $zero, 0x4C
/* 5B83C 8006B03C 21200002 */  addu       $a0, $s0, $zero
/* 5B840 8006B040 02000524 */  addiu      $a1, $zero, 0x2
/* 5B844 8006B044 2441020C */  jal        G2Anim_DetachControllerFromSeg
/* 5B848 8006B048 0E000624 */   addiu     $a2, $zero, 0xE
.L8006B04C:
/* 5B84C 8006B04C 6C01448E */  lw         $a0, 0x16C($s2)
/* 5B850 8006B050 2641010C */  jal        MEMPACK_Free
/* 5B854 8006B054 00000000 */   nop
/* 5B858 8006B058 00AE0108 */  j          .L8006B800
/* 5B85C 8006B05C 00000000 */   nop
.L8006B060:
/* 5B860 8006B060 48000424 */  addiu      $a0, $zero, 0x48
/* 5B864 8006B064 2400548E */  lw         $s4, 0x24($s2)
/* 5B868 8006B068 8140010C */  jal        MEMPACK_Malloc
/* 5B86C 8006B06C 1A000524 */   addiu     $a1, $zero, 0x1A
/* 5B870 8006B070 21984000 */  addu       $s3, $v0, $zero
/* 5B874 8006B074 01000224 */  addiu      $v0, $zero, 0x1
/* 5B878 8006B078 6C0153AE */  sw         $s3, 0x16C($s2)
/* 5B87C 8006B07C 000062AE */  sw         $v0, 0x0($s3)
/* 5B880 8006B080 01100224 */  addiu      $v0, $zero, 0x1001
/* 5B884 8006B084 1A0062A6 */  sh         $v0, 0x1A($s3)
/* 5B888 8006B088 02100224 */  addiu      $v0, $zero, 0x1002
/* 5B88C 8006B08C 220062A6 */  sh         $v0, 0x22($s3)
/* 5B890 8006B090 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5B894 8006B094 2A0062A6 */  sh         $v0, 0x2A($s3)
/* 5B898 8006B098 00100224 */  addiu      $v0, $zero, 0x1000
/* 5B89C 8006B09C 340062A6 */  sh         $v0, 0x34($s3)
/* 5B8A0 8006B0A0 80020224 */  addiu      $v0, $zero, 0x280
/* 5B8A4 8006B0A4 040060A6 */  sh         $zero, 0x4($s3)
/* 5B8A8 8006B0A8 060060A6 */  sh         $zero, 0x6($s3)
/* 5B8AC 8006B0AC 080060AE */  sw         $zero, 0x8($s3)
/* 5B8B0 8006B0B0 0E0060A6 */  sh         $zero, 0xE($s3)
/* 5B8B4 8006B0B4 100060A6 */  sh         $zero, 0x10($s3)
/* 5B8B8 8006B0B8 120060A6 */  sh         $zero, 0x12($s3)
/* 5B8BC 8006B0BC 140060A6 */  sh         $zero, 0x14($s3)
/* 5B8C0 8006B0C0 160060A6 */  sh         $zero, 0x16($s3)
/* 5B8C4 8006B0C4 180060A6 */  sh         $zero, 0x18($s3)
/* 5B8C8 8006B0C8 1C0060A6 */  sh         $zero, 0x1C($s3)
/* 5B8CC 8006B0CC 1E0060A6 */  sh         $zero, 0x1E($s3)
/* 5B8D0 8006B0D0 200060A6 */  sh         $zero, 0x20($s3)
/* 5B8D4 8006B0D4 240060A6 */  sh         $zero, 0x24($s3)
/* 5B8D8 8006B0D8 260060A6 */  sh         $zero, 0x26($s3)
/* 5B8DC 8006B0DC 2C0060AE */  sw         $zero, 0x2C($s3)
/* 5B8E0 8006B0E0 300060AE */  sw         $zero, 0x30($s3)
/* 5B8E4 8006B0E4 8C0142AE */  sw         $v0, 0x18C($s2)
/* 5B8E8 8006B0E8 900142AE */  sw         $v0, 0x190($s2)
/* 5B8EC 8006B0EC 940142AE */  sw         $v0, 0x194($s2)
/* 5B8F0 8006B0F0 3A0060A6 */  sh         $zero, 0x3A($s3)
/* 5B8F4 8006B0F4 3C0060A6 */  sh         $zero, 0x3C($s3)
/* 5B8F8 8006B0F8 3E0060A6 */  sh         $zero, 0x3E($s3)
/* 5B8FC 8006B0FC 1C00428E */  lw         $v0, 0x1C($s2)
/* 5B900 8006B100 00000000 */  nop
/* 5B904 8006B104 0A004010 */  beqz       $v0, .L8006B130
/* 5B908 8006B108 00000000 */   nop
/* 5B90C 8006B10C 0000428C */  lw         $v0, 0x0($v0)
/* 5B910 8006B110 00000000 */  nop
/* 5B914 8006B114 01004230 */  andi       $v0, $v0, 0x1
/* 5B918 8006B118 05004014 */  bnez       $v0, .L8006B130
/* 5B91C 8006B11C 00000000 */   nop
/* 5B920 8006B120 0000628E */  lw         $v0, 0x0($s3)
/* 5B924 8006B124 00000000 */  nop
/* 5B928 8006B128 00104234 */  ori        $v0, $v0, 0x1000
/* 5B92C 8006B12C 000062AE */  sw         $v0, 0x0($s3)
.L8006B130:
/* 5B930 8006B130 06008396 */  lhu        $v1, 0x6($s4)
/* 5B934 8006B134 00000000 */  nop
/* 5B938 8006B138 40006230 */  andi       $v0, $v1, 0x40
/* 5B93C 8006B13C 06004010 */  beqz       $v0, .L8006B158
/* 5B940 8006B140 00806234 */   ori       $v0, $v1, 0x8000
/* 5B944 8006B144 060082A6 */  sh         $v0, 0x6($s4)
/* 5B948 8006B148 1800428E */  lw         $v0, 0x18($s2)
/* 5B94C 8006B14C 00000000 */  nop
/* 5B950 8006B150 04004234 */  ori        $v0, $v0, 0x4
/* 5B954 8006B154 180042AE */  sw         $v0, 0x18($s2)
.L8006B158:
/* 5B958 8006B158 06008296 */  lhu        $v0, 0x6($s4)
/* 5B95C 8006B15C 00000000 */  nop
/* 5B960 8006B160 00804230 */  andi       $v0, $v0, 0x8000
/* 5B964 8006B164 1B004010 */  beqz       $v0, .L8006B1D4
/* 5B968 8006B168 21204002 */   addu      $a0, $s2, $zero
/* 5B96C 8006B16C 31CA010C */  jal        G2EmulationInstanceSetTotalSections
/* 5B970 8006B170 01000524 */   addiu     $a1, $zero, 0x1
/* 5B974 8006B174 21204002 */  addu       $a0, $s2, $zero
/* 5B978 8006B178 1C00438E */  lw         $v1, 0x1C($s2)
/* 5B97C 8006B17C 26014286 */  lh         $v0, 0x126($s2)
/* 5B980 8006B180 0C00638C */  lw         $v1, 0xC($v1)
/* 5B984 8006B184 80100200 */  sll        $v0, $v0, 2
/* 5B988 8006B188 21104300 */  addu       $v0, $v0, $v1
/* 5B98C 8006B18C 0000428C */  lw         $v0, 0x0($v0)
/* 5B990 8006B190 21280000 */  addu       $a1, $zero, $zero
/* 5B994 8006B194 18004794 */  lhu        $a3, 0x18($v0)
/* 5B998 8006B198 2130A000 */  addu       $a2, $a1, $zero
/* 5B99C 8006B19C FFFFE724 */  addiu      $a3, $a3, -0x1
/* 5B9A0 8006B1A0 003C0700 */  sll        $a3, $a3, 16
/* 5B9A4 8006B1A4 1ACA010C */  jal        G2EmulationInstanceSetStartAndEndSegment
/* 5B9A8 8006B1A8 033C0700 */   sra       $a3, $a3, 16
/* 5B9AC 8006B1AC 21204002 */  addu       $a0, $s2, $zero
/* 5B9B0 8006B1B0 21280000 */  addu       $a1, $zero, $zero
/* 5B9B4 8006B1B4 2130A000 */  addu       $a2, $a1, $zero
/* 5B9B8 8006B1B8 2138A000 */  addu       $a3, $a1, $zero
/* 5B9BC 8006B1BC 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5B9C0 8006B1C0 1000A0AF */   sw        $zero, 0x10($sp)
/* 5B9C4 8006B1C4 21204002 */  addu       $a0, $s2, $zero
/* 5B9C8 8006B1C8 21280000 */  addu       $a1, $zero, $zero
/* 5B9CC 8006B1CC 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5B9D0 8006B1D0 02000624 */   addiu     $a2, $zero, 0x2
.L8006B1D4:
/* 5B9D4 8006B1D4 02008396 */  lhu        $v1, 0x2($s4)
/* 5B9D8 8006B1D8 05000224 */  addiu      $v0, $zero, 0x5
/* 5B9DC 8006B1DC 2E006214 */  bne        $v1, $v0, .L8006B298
/* 5B9E0 8006B1E0 21204002 */   addu      $a0, $s2, $zero
/* 5B9E4 8006B1E4 21280000 */  addu       $a1, $zero, $zero
/* 5B9E8 8006B1E8 0780063C */  lui        $a2, %hi(PhysobAnimCallback)
/* 5B9EC 8006B1EC 38D2C624 */  addiu      $a2, $a2, %lo(PhysobAnimCallback)
/* 5B9F0 8006B1F0 2400508E */  lw         $s0, 0x24($s2)
/* 5B9F4 8006B1F4 5ECA010C */  jal        G2EmulationInstanceInitSection
/* 5B9F8 8006B1F8 21384002 */   addu      $a3, $s2, $zero
/* 5B9FC 8006B1FC 10000392 */  lbu        $v1, 0x10($s0)
/* 5BA00 8006B200 FF000224 */  addiu      $v0, $zero, 0xFF
/* 5BA04 8006B204 0A006210 */  beq        $v1, $v0, .L8006B230
/* 5BA08 8006B208 21204002 */   addu      $a0, $s2, $zero
/* 5BA0C 8006B20C 21280000 */  addu       $a1, $zero, $zero
/* 5BA10 8006B210 21306000 */  addu       $a2, $v1, $zero
/* 5BA14 8006B214 2138A000 */  addu       $a3, $a1, $zero
/* 5BA18 8006B218 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5BA1C 8006B21C 1000A0AF */   sw        $zero, 0x10($sp)
/* 5BA20 8006B220 21204002 */  addu       $a0, $s2, $zero
/* 5BA24 8006B224 21280000 */  addu       $a1, $zero, $zero
/* 5BA28 8006B228 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5BA2C 8006B22C 02000624 */   addiu     $a2, $zero, 0x2
.L8006B230:
/* 5BA30 8006B230 08000386 */  lh         $v1, 0x8($s0)
/* 5BA34 8006B234 02000224 */  addiu      $v0, $zero, 0x2
/* 5BA38 8006B238 11006214 */  bne        $v1, $v0, .L8006B280
/* 5BA3C 8006B23C 03000224 */   addiu     $v0, $zero, 0x3
/* 5BA40 8006B240 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5BA44 8006B244 00000000 */  nop
/* 5BA48 8006B248 0D008010 */  beqz       $a0, .L8006B280
/* 5BA4C 8006B24C 00000000 */   nop
/* 5BA50 8006B250 92D1000C */  jal        INSTANCE_Query
/* 5BA54 8006B254 24000524 */   addiu     $a1, $zero, 0x24
/* 5BA58 8006B258 FC00033C */  lui        $v1, (0xFC0000 >> 16)
/* 5BA5C 8006B25C 24104300 */  and        $v0, $v0, $v1
/* 5BA60 8006B260 05004014 */  bnez       $v0, .L8006B278
/* 5BA64 8006B264 00000000 */   nop
/* 5BA68 8006B268 1400428E */  lw         $v0, 0x14($s2)
/* 5BA6C 8006B26C 00000000 */  nop
/* 5BA70 8006B270 20004234 */  ori        $v0, $v0, 0x20
/* 5BA74 8006B274 140042AE */  sw         $v0, 0x14($s2)
.L8006B278:
/* 5BA78 8006B278 08000386 */  lh         $v1, 0x8($s0)
/* 5BA7C 8006B27C 03000224 */  addiu      $v0, $zero, 0x3
.L8006B280:
/* 5BA80 8006B280 05006210 */  beq        $v1, $v0, .L8006B298
/* 5BA84 8006B284 0200033C */   lui       $v1, (0x20000 >> 16)
/* 5BA88 8006B288 1800428E */  lw         $v0, 0x18($s2)
/* 5BA8C 8006B28C 00000000 */  nop
/* 5BA90 8006B290 25104300 */  or         $v0, $v0, $v1
/* 5BA94 8006B294 180042AE */  sw         $v0, 0x18($s2)
.L8006B298:
/* 5BA98 8006B298 06008296 */  lhu        $v0, 0x6($s4)
/* 5BA9C 8006B29C 00000000 */  nop
/* 5BAA0 8006B2A0 008D4230 */  andi       $v0, $v0, 0x8D00
/* 5BAA4 8006B2A4 05004010 */  beqz       $v0, .L8006B2BC
/* 5BAA8 8006B2A8 00000000 */   nop
/* 5BAAC 8006B2AC 0000628E */  lw         $v0, 0x0($s3)
/* 5BAB0 8006B2B0 00000000 */  nop
/* 5BAB4 8006B2B4 00104234 */  ori        $v0, $v0, 0x1000
/* 5BAB8 8006B2B8 000062AE */  sw         $v0, 0x0($s3)
.L8006B2BC:
/* 5BABC 8006B2BC 02008396 */  lhu        $v1, 0x2($s4)
/* 5BAC0 8006B2C0 03000224 */  addiu      $v0, $zero, 0x3
/* 5BAC4 8006B2C4 8C006214 */  bne        $v1, $v0, .L8006B4F8
/* 5BAC8 8006B2C8 21204002 */   addu      $a0, $s2, $zero
/* 5BACC 8006B2CC 06008296 */  lhu        $v0, 0x6($s4)
/* 5BAD0 8006B2D0 6C01438E */  lw         $v1, 0x16C($s2)
/* 5BAD4 8006B2D4 80004234 */  ori        $v0, $v0, 0x80
/* 5BAD8 8006B2D8 040062A4 */  sh         $v0, 0x4($v1)
/* 5BADC 8006B2DC 060060A4 */  sh         $zero, 0x6($v1)
/* 5BAE0 8006B2E0 2400518E */  lw         $s1, 0x24($s2)
/* 5BAE4 8006B2E4 00000000 */  nop
/* 5BAE8 8006B2E8 18002396 */  lhu        $v1, 0x18($s1)
/* 5BAEC 8006B2EC 00000000 */  nop
/* 5BAF0 8006B2F0 80006230 */  andi       $v0, $v1, 0x80
/* 5BAF4 8006B2F4 05004010 */  beqz       $v0, .L8006B30C
/* 5BAF8 8006B2F8 00000000 */   nop
/* 5BAFC 8006B2FC 1800428E */  lw         $v0, 0x18($s2)
/* 5BB00 8006B300 0200033C */  lui        $v1, (0x20000 >> 16)
/* 5BB04 8006B304 C9AC0108 */  j          .L8006B324
/* 5BB08 8006B308 25104300 */   or        $v0, $v0, $v1
.L8006B30C:
/* 5BB0C 8006B30C 01006230 */  andi       $v0, $v1, 0x1
/* 5BB10 8006B310 05004014 */  bnez       $v0, .L8006B328
/* 5BB14 8006B314 00000000 */   nop
/* 5BB18 8006B318 1800428E */  lw         $v0, 0x18($s2)
/* 5BB1C 8006B31C 00000000 */  nop
/* 5BB20 8006B320 04004234 */  ori        $v0, $v0, 0x4
.L8006B324:
/* 5BB24 8006B324 180042AE */  sw         $v0, 0x18($s2)
.L8006B328:
/* 5BB28 8006B328 1C00428E */  lw         $v0, 0x1C($s2)
/* 5BB2C 8006B32C 00000000 */  nop
/* 5BB30 8006B330 0C00438C */  lw         $v1, 0xC($v0)
/* 5BB34 8006B334 00000000 */  nop
/* 5BB38 8006B338 31006010 */  beqz       $v1, .L8006B400
/* 5BB3C 8006B33C 21204002 */   addu      $a0, $s2, $zero
/* 5BB40 8006B340 15002292 */  lbu        $v0, 0x15($s1)
/* 5BB44 8006B344 00000000 */  nop
/* 5BB48 8006B348 08004230 */  andi       $v0, $v0, 0x8
/* 5BB4C 8006B34C 17004010 */  beqz       $v0, .L8006B3AC
/* 5BB50 8006B350 00000000 */   nop
/* 5BB54 8006B354 0000628C */  lw         $v0, 0x0($v1)
/* 5BB58 8006B358 00000000 */  nop
/* 5BB5C 8006B35C 1800428C */  lw         $v0, 0x18($v0)
/* 5BB60 8006B360 00000000 */  nop
/* 5BB64 8006B364 26004018 */  blez       $v0, .L8006B400
/* 5BB68 8006B368 21800000 */   addu      $s0, $zero, $zero
/* 5BB6C 8006B36C 21204002 */  addu       $a0, $s2, $zero
.L8006B370:
/* 5BB70 8006B370 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5BB74 8006B374 21280002 */   addu      $a1, $s0, $zero
/* 5BB78 8006B378 1C00428E */  lw         $v0, 0x1C($s2)
/* 5BB7C 8006B37C 00000000 */  nop
/* 5BB80 8006B380 0C00428C */  lw         $v0, 0xC($v0)
/* 5BB84 8006B384 00000000 */  nop
/* 5BB88 8006B388 0000428C */  lw         $v0, 0x0($v0)
/* 5BB8C 8006B38C 00000000 */  nop
/* 5BB90 8006B390 1800428C */  lw         $v0, 0x18($v0)
/* 5BB94 8006B394 01001026 */  addiu      $s0, $s0, 0x1
/* 5BB98 8006B398 2A100202 */  slt        $v0, $s0, $v0
/* 5BB9C 8006B39C F4FF4014 */  bnez       $v0, .L8006B370
/* 5BBA0 8006B3A0 21204002 */   addu      $a0, $s2, $zero
/* 5BBA4 8006B3A4 00AD0108 */  j          .L8006B400
/* 5BBA8 8006B3A8 00000000 */   nop
.L8006B3AC:
/* 5BBAC 8006B3AC 0000628C */  lw         $v0, 0x0($v1)
/* 5BBB0 8006B3B0 00000000 */  nop
/* 5BBB4 8006B3B4 1800428C */  lw         $v0, 0x18($v0)
/* 5BBB8 8006B3B8 00000000 */  nop
/* 5BBBC 8006B3BC 0F004018 */  blez       $v0, .L8006B3FC
/* 5BBC0 8006B3C0 21800000 */   addu      $s0, $zero, $zero
/* 5BBC4 8006B3C4 21204002 */  addu       $a0, $s2, $zero
.L8006B3C8:
/* 5BBC8 8006B3C8 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 5BBCC 8006B3CC 21280002 */   addu      $a1, $s0, $zero
/* 5BBD0 8006B3D0 1C00428E */  lw         $v0, 0x1C($s2)
/* 5BBD4 8006B3D4 00000000 */  nop
/* 5BBD8 8006B3D8 0C00428C */  lw         $v0, 0xC($v0)
/* 5BBDC 8006B3DC 00000000 */  nop
/* 5BBE0 8006B3E0 0000428C */  lw         $v0, 0x0($v0)
/* 5BBE4 8006B3E4 00000000 */  nop
/* 5BBE8 8006B3E8 1800428C */  lw         $v0, 0x18($v0)
/* 5BBEC 8006B3EC 01001026 */  addiu      $s0, $s0, 0x1
/* 5BBF0 8006B3F0 2A100202 */  slt        $v0, $s0, $v0
/* 5BBF4 8006B3F4 F4FF4014 */  bnez       $v0, .L8006B3C8
/* 5BBF8 8006B3F8 21204002 */   addu      $a0, $s2, $zero
.L8006B3FC:
/* 5BBFC 8006B3FC 21204002 */  addu       $a0, $s2, $zero
.L8006B400:
/* 5BC00 8006B400 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5BC04 8006B404 07000524 */   addiu     $a1, $zero, 0x7
/* 5BC08 8006B408 06008296 */  lhu        $v0, 0x6($s4)
/* 5BC0C 8006B40C 00000000 */  nop
/* 5BC10 8006B410 00804230 */  andi       $v0, $v0, 0x8000
/* 5BC14 8006B414 1C004010 */  beqz       $v0, .L8006B488
/* 5BC18 8006B418 00000000 */   nop
/* 5BC1C 8006B41C 15002292 */  lbu        $v0, 0x15($s1)
/* 5BC20 8006B420 00000000 */  nop
/* 5BC24 8006B424 03004330 */  andi       $v1, $v0, 0x3
/* 5BC28 8006B428 01000224 */  addiu      $v0, $zero, 0x1
/* 5BC2C 8006B42C 0E006210 */  beq        $v1, $v0, .L8006B468
/* 5BC30 8006B430 02006228 */   slti      $v0, $v1, 0x2
/* 5BC34 8006B434 05004010 */  beqz       $v0, .L8006B44C
/* 5BC38 8006B438 02000224 */   addiu     $v0, $zero, 0x2
/* 5BC3C 8006B43C 07006010 */  beqz       $v1, .L8006B45C
/* 5BC40 8006B440 21204002 */   addu      $a0, $s2, $zero
/* 5BC44 8006B444 22AD0108 */  j          .L8006B488
/* 5BC48 8006B448 00000000 */   nop
.L8006B44C:
/* 5BC4C 8006B44C 0A006210 */  beq        $v1, $v0, .L8006B478
/* 5BC50 8006B450 21204002 */   addu      $a0, $s2, $zero
/* 5BC54 8006B454 22AD0108 */  j          .L8006B488
/* 5BC58 8006B458 00000000 */   nop
.L8006B45C:
/* 5BC5C 8006B45C 21280000 */  addu       $a1, $zero, $zero
/* 5BC60 8006B460 20AD0108 */  j          .L8006B480
/* 5BC64 8006B464 02000624 */   addiu     $a2, $zero, 0x2
.L8006B468:
/* 5BC68 8006B468 21204002 */  addu       $a0, $s2, $zero
/* 5BC6C 8006B46C 21280000 */  addu       $a1, $zero, $zero
/* 5BC70 8006B470 20AD0108 */  j          .L8006B480
/* 5BC74 8006B474 01000624 */   addiu     $a2, $zero, 0x1
.L8006B478:
/* 5BC78 8006B478 21280000 */  addu       $a1, $zero, $zero
/* 5BC7C 8006B47C 2130A000 */  addu       $a2, $a1, $zero
.L8006B480:
/* 5BC80 8006B480 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5BC84 8006B484 00000000 */   nop
.L8006B488:
/* 5BC88 8006B488 10002392 */  lbu        $v1, 0x10($s1)
/* 5BC8C 8006B48C FF000224 */  addiu      $v0, $zero, 0xFF
/* 5BC90 8006B490 0B006210 */  beq        $v1, $v0, .L8006B4C0
/* 5BC94 8006B494 00000000 */   nop
/* 5BC98 8006B498 06008296 */  lhu        $v0, 0x6($s4)
/* 5BC9C 8006B49C 00000000 */  nop
/* 5BCA0 8006B4A0 00804230 */  andi       $v0, $v0, 0x8000
/* 5BCA4 8006B4A4 06004010 */  beqz       $v0, .L8006B4C0
/* 5BCA8 8006B4A8 21204002 */   addu      $a0, $s2, $zero
/* 5BCAC 8006B4AC 21280000 */  addu       $a1, $zero, $zero
/* 5BCB0 8006B4B0 21306000 */  addu       $a2, $v1, $zero
/* 5BCB4 8006B4B4 2138A000 */  addu       $a3, $a1, $zero
/* 5BCB8 8006B4B8 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5BCBC 8006B4BC 1000A0AF */   sw        $zero, 0x10($sp)
.L8006B4C0:
/* 5BCC0 8006B4C0 1C002396 */  lhu        $v1, 0x1C($s1)
/* 5BCC4 8006B4C4 02000224 */  addiu      $v0, $zero, 0x2
/* 5BCC8 8006B4C8 9B006214 */  bne        $v1, $v0, .L8006B738
/* 5BCCC 8006B4CC 21204002 */   addu      $a0, $s2, $zero
/* 5BCD0 8006B4D0 01000424 */  addiu      $a0, $zero, 0x1
/* 5BCD4 8006B4D4 9FC6010C */  jal        SetObjectIdleData
/* 5BCD8 8006B4D8 21284002 */   addu      $a1, $s2, $zero
/* 5BCDC 8006B4DC 2C00A48E */  lw         $a0, 0x2C($s5)
/* 5BCE0 8006B4E0 8000053C */  lui        $a1, (0x800024 >> 16)
/* 5BCE4 8006B4E4 2400A534 */  ori        $a1, $a1, (0x800024 & 0xFFFF)
/* 5BCE8 8006B4E8 A1D1000C */  jal        INSTANCE_Post
/* 5BCEC 8006B4EC 21304000 */   addu      $a2, $v0, $zero
/* 5BCF0 8006B4F0 CEAD0108 */  j          .L8006B738
/* 5BCF4 8006B4F4 21204002 */   addu      $a0, $s2, $zero
.L8006B4F8:
/* 5BCF8 8006B4F8 B0A3010C */  jal        CheckPhysObAbility
/* 5BCFC 8006B4FC 01000524 */   addiu     $a1, $zero, 0x1
/* 5BD00 8006B500 05004010 */  beqz       $v0, .L8006B518
/* 5BD04 8006B504 21204002 */   addu      $a0, $s2, $zero
/* 5BD08 8006B508 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5BD0C 8006B50C 07000524 */   addiu     $a1, $zero, 0x7
/* 5BD10 8006B510 CEAD0108 */  j          .L8006B738
/* 5BD14 8006B514 21204002 */   addu      $a0, $s2, $zero
.L8006B518:
/* 5BD18 8006B518 B0A3010C */  jal        CheckPhysObAbility
/* 5BD1C 8006B51C 08000524 */   addiu     $a1, $zero, 0x8
/* 5BD20 8006B520 47004010 */  beqz       $v0, .L8006B640
/* 5BD24 8006B524 0400033C */   lui       $v1, (0x40000 >> 16)
/* 5BD28 8006B528 1C00448E */  lw         $a0, 0x1C($s2)
/* 5BD2C 8006B52C 00000000 */  nop
/* 5BD30 8006B530 0000828C */  lw         $v0, 0x0($a0)
/* 5BD34 8006B534 21280000 */  addu       $a1, $zero, $zero
/* 5BD38 8006B538 25104300 */  or         $v0, $v0, $v1
/* 5BD3C 8006B53C 000082AC */  sw         $v0, 0x0($a0)
/* 5BD40 8006B540 5C004296 */  lhu        $v0, 0x5C($s2)
/* 5BD44 8006B544 0780063C */  lui        $a2, %hi(PhysobAnimCallback)
/* 5BD48 8006B548 0E0062A6 */  sh         $v0, 0xE($s3)
/* 5BD4C 8006B54C 5E004296 */  lhu        $v0, 0x5E($s2)
/* 5BD50 8006B550 38D2C624 */  addiu      $a2, $a2, %lo(PhysobAnimCallback)
/* 5BD54 8006B554 100062A6 */  sh         $v0, 0x10($s3)
/* 5BD58 8006B558 60004296 */  lhu        $v0, 0x60($s2)
/* 5BD5C 8006B55C 21384002 */  addu       $a3, $s2, $zero
/* 5BD60 8006B560 120062A6 */  sh         $v0, 0x12($s3)
/* 5BD64 8006B564 1C00438E */  lw         $v1, 0x1C($s2)
/* 5BD68 8006B568 02000224 */  addiu      $v0, $zero, 0x2
/* 5BD6C 8006B56C 060142A6 */  sh         $v0, 0x106($s2)
/* 5BD70 8006B570 0000628C */  lw         $v0, 0x0($v1)
/* 5BD74 8006B574 21204002 */  addu       $a0, $s2, $zero
/* 5BD78 8006B578 00044234 */  ori        $v0, $v0, 0x400
/* 5BD7C 8006B57C 5ECA010C */  jal        G2EmulationInstanceInitSection
/* 5BD80 8006B580 000062AC */   sw        $v0, 0x0($v1)
/* 5BD84 8006B584 C8015126 */  addiu      $s1, $s2, 0x1C8
/* 5BD88 8006B588 21202002 */  addu       $a0, $s1, $zero
/* 5BD8C 8006B58C 21280000 */  addu       $a1, $zero, $zero
/* 5BD90 8006B590 1641020C */  jal        G2Anim_AttachControllerToSeg
/* 5BD94 8006B594 4C000624 */   addiu     $a2, $zero, 0x4C
/* 5BD98 8006B598 21202002 */  addu       $a0, $s1, $zero
/* 5BD9C 8006B59C 02000524 */  addiu      $a1, $zero, 0x2
/* 5BDA0 8006B5A0 1641020C */  jal        G2Anim_AttachControllerToSeg
/* 5BDA4 8006B5A4 0E000624 */   addiu     $a2, $zero, 0xE
/* 5BDA8 8006B5A8 21202002 */  addu       $a0, $s1, $zero
/* 5BDAC 8006B5AC 21280000 */  addu       $a1, $zero, $zero
/* 5BDB0 8006B5B0 8D41020C */  jal        G2Anim_DisableController
/* 5BDB4 8006B5B4 4C000624 */   addiu     $a2, $zero, 0x4C
/* 5BDB8 8006B5B8 21202002 */  addu       $a0, $s1, $zero
/* 5BDBC 8006B5BC 02000524 */  addiu      $a1, $zero, 0x2
/* 5BDC0 8006B5C0 5641020C */  jal        G2Anim_EnableController
/* 5BDC4 8006B5C4 0E000624 */   addiu     $a2, $zero, 0xE
/* 5BDC8 8006B5C8 74004296 */  lhu        $v0, 0x74($s2)
/* 5BDCC 8006B5CC 1800A427 */  addiu      $a0, $sp, 0x18
/* 5BDD0 8006B5D0 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5BDD4 8006B5D4 76004296 */  lhu        $v0, 0x76($s2)
/* 5BDD8 8006B5D8 2000B027 */  addiu      $s0, $sp, 0x20
/* 5BDDC 8006B5DC 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 5BDE0 8006B5E0 78004296 */  lhu        $v0, 0x78($s2)
/* 5BDE4 8006B5E4 21280002 */  addu       $a1, $s0, $zero
/* 5BDE8 8006B5E8 D8E2010C */  jal        RotMatrixZYX
/* 5BDEC 8006B5EC 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 5BDF0 8006B5F0 4000A427 */  addiu      $a0, $sp, 0x40
/* 5BDF4 8006B5F4 21280002 */  addu       $a1, $s0, $zero
/* 5BDF8 8006B5F8 1758020C */  jal        G2EulerAngles_FromMatrix
/* 5BDFC 8006B5FC 15000624 */   addiu     $a2, $zero, 0x15
/* 5BE00 8006B600 21202002 */  addu       $a0, $s1, $zero
/* 5BE04 8006B604 02000524 */  addiu      $a1, $zero, 0x2
/* 5BE08 8006B608 0E000624 */  addiu      $a2, $zero, 0xE
/* 5BE0C 8006B60C 4000A297 */  lhu        $v0, 0x40($sp)
/* 5BE10 8006B610 4200A397 */  lhu        $v1, 0x42($sp)
/* 5BE14 8006B614 4400A897 */  lhu        $t0, 0x44($sp)
/* 5BE18 8006B618 1800A727 */  addiu      $a3, $sp, 0x18
/* 5BE1C 8006B61C 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5BE20 8006B620 1A00A3A7 */  sh         $v1, 0x1A($sp)
/* 5BE24 8006B624 1C00A8A7 */  sh         $t0, 0x1C($sp)
/* 5BE28 8006B628 740040A6 */  sh         $zero, 0x74($s2)
/* 5BE2C 8006B62C 760040A6 */  sh         $zero, 0x76($s2)
/* 5BE30 8006B630 7D42020C */  jal        G2Anim_SetController_Vector
/* 5BE34 8006B634 780040A6 */   sh        $zero, 0x78($s2)
/* 5BE38 8006B638 CEAD0108 */  j          .L8006B738
/* 5BE3C 8006B63C 21204002 */   addu      $a0, $s2, $zero
.L8006B640:
/* 5BE40 8006B640 21204002 */  addu       $a0, $s2, $zero
/* 5BE44 8006B644 B0A3010C */  jal        CheckPhysObAbility
/* 5BE48 8006B648 40000524 */   addiu     $a1, $zero, 0x40
/* 5BE4C 8006B64C 2C004010 */  beqz       $v0, .L8006B700
/* 5BE50 8006B650 21204002 */   addu      $a0, $s2, $zero
/* 5BE54 8006B654 1800428E */  lw         $v0, 0x18($s2)
/* 5BE58 8006B658 2400508E */  lw         $s0, 0x24($s2)
/* 5BE5C 8006B65C 6C01438E */  lw         $v1, 0x16C($s2)
/* 5BE60 8006B660 04004234 */  ori        $v0, $v0, 0x4
/* 5BE64 8006B664 180042AE */  sw         $v0, 0x18($s2)
/* 5BE68 8006B668 18000292 */  lbu        $v0, 0x18($s0)
/* 5BE6C 8006B66C 04007124 */  addiu      $s1, $v1, 0x4
/* 5BE70 8006B670 040062A4 */  sh         $v0, 0x4($v1)
/* 5BE74 8006B674 020020A6 */  sh         $zero, 0x2($s1)
/* 5BE78 8006B678 19000392 */  lbu        $v1, 0x19($s0)
/* 5BE7C 8006B67C FF000224 */  addiu      $v0, $zero, 0xFF
/* 5BE80 8006B680 03006214 */  bne        $v1, $v0, .L8006B690
/* 5BE84 8006B684 21280000 */   addu      $a1, $zero, $zero
/* 5BE88 8006B688 190000A2 */  sb         $zero, 0x19($s0)
/* 5BE8C 8006B68C 21204002 */  addu       $a0, $s2, $zero
.L8006B690:
/* 5BE90 8006B690 19000692 */  lbu        $a2, 0x19($s0)
/* 5BE94 8006B694 2138A000 */  addu       $a3, $a1, $zero
/* 5BE98 8006B698 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5BE9C 8006B69C 1000A0AF */   sw        $zero, 0x10($sp)
/* 5BEA0 8006B6A0 21204002 */  addu       $a0, $s2, $zero
/* 5BEA4 8006B6A4 21280000 */  addu       $a1, $zero, $zero
/* 5BEA8 8006B6A8 0780063C */  lui        $a2, %hi(PhysobAnimCallback)
/* 5BEAC 8006B6AC 38D2C624 */  addiu      $a2, $a2, %lo(PhysobAnimCallback)
/* 5BEB0 8006B6B0 5ECA010C */  jal        G2EmulationInstanceInitSection
/* 5BEB4 8006B6B4 21384002 */   addu      $a3, $s2, $zero
/* 5BEB8 8006B6B8 0A000386 */  lh         $v1, 0xA($s0)
/* 5BEBC 8006B6BC 07000224 */  addiu      $v0, $zero, 0x7
/* 5BEC0 8006B6C0 0E006214 */  bne        $v1, $v0, .L8006B6FC
/* 5BEC4 8006B6C4 21204002 */   addu      $a0, $s2, $zero
/* 5BEC8 8006B6C8 21280000 */  addu       $a1, $zero, $zero
/* 5BECC 8006B6CC 00040224 */  addiu      $v0, $zero, 0x400
/* 5BED0 8006B6D0 020022A6 */  sh         $v0, 0x2($s1)
/* 5BED4 8006B6D4 19000692 */  lbu        $a2, 0x19($s0)
/* 5BED8 8006B6D8 5A000724 */  addiu      $a3, $zero, 0x5A
/* 5BEDC 8006B6DC 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5BEE0 8006B6E0 1000A0AF */   sw        $zero, 0x10($sp)
/* 5BEE4 8006B6E4 21204002 */  addu       $a0, $s2, $zero
/* 5BEE8 8006B6E8 21280000 */  addu       $a1, $zero, $zero
/* 5BEEC 8006B6EC 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5BEF0 8006B6F0 01000624 */   addiu     $a2, $zero, 0x1
/* 5BEF4 8006B6F4 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5BEF8 8006B6F8 21204002 */   addu      $a0, $s2, $zero
.L8006B6FC:
/* 5BEFC 8006B6FC 21204002 */  addu       $a0, $s2, $zero
.L8006B700:
/* 5BF00 8006B700 CFA3010C */  jal        CheckPhysObFamily
/* 5BF04 8006B704 07000524 */   addiu     $a1, $zero, 0x7
/* 5BF08 8006B708 0A004010 */  beqz       $v0, .L8006B734
/* 5BF0C 8006B70C 21204002 */   addu      $a0, $s2, $zero
/* 5BF10 8006B710 21280000 */  addu       $a1, $zero, $zero
/* 5BF14 8006B714 0780063C */  lui        $a2, %hi(PhysobAnimCallback)
/* 5BF18 8006B718 38D2C624 */  addiu      $a2, $a2, %lo(PhysobAnimCallback)
/* 5BF1C 8006B71C 5ECA010C */  jal        G2EmulationInstanceInitSection
/* 5BF20 8006B720 21384002 */   addu      $a3, $s2, $zero
/* 5BF24 8006B724 1800428E */  lw         $v0, 0x18($s2)
/* 5BF28 8006B728 0200033C */  lui        $v1, (0x20000 >> 16)
/* 5BF2C 8006B72C 25104300 */  or         $v0, $v0, $v1
/* 5BF30 8006B730 180042AE */  sw         $v0, 0x18($s2)
.L8006B734:
/* 5BF34 8006B734 21204002 */  addu       $a0, $s2, $zero
.L8006B738:
/* 5BF38 8006B738 B0A3010C */  jal        CheckPhysObAbility
/* 5BF3C 8006B73C 20000524 */   addiu     $a1, $zero, 0x20
/* 5BF40 8006B740 19004010 */  beqz       $v0, .L8006B7A8
/* 5BF44 8006B744 21204002 */   addu      $a0, $s2, $zero
/* 5BF48 8006B748 20CB000C */  jal        INSTANCE_FindIntroCommand
/* 5BF4C 8006B74C 15000524 */   addiu     $a1, $zero, 0x15
/* 5BF50 8006B750 21204002 */  addu       $a0, $s2, $zero
/* 5BF54 8006B754 A7B7010C */  jal        PhysObGetLight
/* 5BF58 8006B758 21804000 */   addu      $s0, $v0, $zero
/* 5BF5C 8006B75C 21284000 */  addu       $a1, $v0, $zero
/* 5BF60 8006B760 0F00A010 */  beqz       $a1, .L8006B7A0
/* 5BF64 8006B764 00000000 */   nop
/* 5BF68 8006B768 06000012 */  beqz       $s0, .L8006B784
/* 5BF6C 8006B76C 21204002 */   addu      $a0, $s2, $zero
/* 5BF70 8006B770 0400028E */  lw         $v0, 0x4($s0)
/* 5BF74 8006B774 00000000 */  nop
/* 5BF78 8006B778 01004230 */  andi       $v0, $v0, 0x1
/* 5BF7C 8006B77C 08004014 */  bnez       $v0, .L8006B7A0
/* 5BF80 8006B780 00000000 */   nop
.L8006B784:
/* 5BF84 8006B784 80AB010C */  jal        PHYSOB_StartBurnFX
/* 5BF88 8006B788 340060A6 */   sh        $zero, 0x34($s3)
/* 5BF8C 8006B78C 0000628E */  lw         $v0, 0x0($s3)
/* 5BF90 8006B790 0100033C */  lui        $v1, (0x10000 >> 16)
/* 5BF94 8006B794 25104300 */  or         $v0, $v0, $v1
/* 5BF98 8006B798 EAAD0108 */  j          .L8006B7A8
/* 5BF9C 8006B79C 000062AE */   sw        $v0, 0x0($s3)
.L8006B7A0:
/* 5BFA0 8006B7A0 C3AB010C */  jal        PHYSOB_EndBurning
/* 5BFA4 8006B7A4 21204002 */   addu      $a0, $s2, $zero
.L8006B7A8:
/* 5BFA8 8006B7A8 21204002 */  addu       $a0, $s2, $zero
/* 5BFAC 8006B7AC 06000524 */  addiu      $a1, $zero, 0x6
/* 5BFB0 8006B7B0 1400428E */  lw         $v0, 0x14($s2)
/* 5BFB4 8006B7B4 0100033C */  lui        $v1, (0x10000 >> 16)
/* 5BFB8 8006B7B8 25104300 */  or         $v0, $v0, $v1
/* 5BFBC 8006B7BC CFA3010C */  jal        CheckPhysObFamily
/* 5BFC0 8006B7C0 140042AE */   sw        $v0, 0x14($s2)
/* 5BFC4 8006B7C4 05004010 */  beqz       $v0, .L8006B7DC
/* 5BFC8 8006B7C8 0200033C */   lui       $v1, (0x20000 >> 16)
/* 5BFCC 8006B7CC 1800428E */  lw         $v0, 0x18($s2)
/* 5BFD0 8006B7D0 00000000 */  nop
/* 5BFD4 8006B7D4 25104300 */  or         $v0, $v0, $v1
/* 5BFD8 8006B7D8 180042AE */  sw         $v0, 0x18($s2)
.L8006B7DC:
/* 5BFDC 8006B7DC 21204002 */  addu       $a0, $s2, $zero
/* 5BFE0 8006B7E0 CFA3010C */  jal        CheckPhysObFamily
/* 5BFE4 8006B7E4 21280000 */   addu      $a1, $zero, $zero
/* 5BFE8 8006B7E8 05004010 */  beqz       $v0, .L8006B800
/* 5BFEC 8006B7EC 00000000 */   nop
/* 5BFF0 8006B7F0 1800428E */  lw         $v0, 0x18($s2)
/* 5BFF4 8006B7F4 00000000 */  nop
/* 5BFF8 8006B7F8 00014234 */  ori        $v0, $v0, 0x100
/* 5BFFC 8006B7FC 180042AE */  sw         $v0, 0x18($s2)
.L8006B800:
/* 5C000 8006B800 6000BF8F */  lw         $ra, 0x60($sp)
/* 5C004 8006B804 5C00B58F */  lw         $s5, 0x5C($sp)
/* 5C008 8006B808 5800B48F */  lw         $s4, 0x58($sp)
/* 5C00C 8006B80C 5400B38F */  lw         $s3, 0x54($sp)
/* 5C010 8006B810 5000B28F */  lw         $s2, 0x50($sp)
/* 5C014 8006B814 4C00B18F */  lw         $s1, 0x4C($sp)
/* 5C018 8006B818 4800B08F */  lw         $s0, 0x48($sp)
/* 5C01C 8006B81C 0800E003 */  jr         $ra
/* 5C020 8006B820 6800BD27 */   addiu     $sp, $sp, 0x68
.size InitPhysicalObject, . - InitPhysicalObject
