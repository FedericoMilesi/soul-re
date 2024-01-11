.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessPhysicalObject
/* 5C024 8006B824 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 5C028 8006B828 5800B0AF */  sw         $s0, 0x58($sp)
/* 5C02C 8006B82C 21808000 */  addu       $s0, $a0, $zero
/* 5C030 8006B830 6C00B5AF */  sw         $s5, 0x6C($sp)
/* 5C034 8006B834 21A8A000 */  addu       $s5, $a1, $zero
/* 5C038 8006B838 7000BFAF */  sw         $ra, 0x70($sp)
/* 5C03C 8006B83C 6800B4AF */  sw         $s4, 0x68($sp)
/* 5C040 8006B840 6400B3AF */  sw         $s3, 0x64($sp)
/* 5C044 8006B844 6000B2AF */  sw         $s2, 0x60($sp)
/* 5C048 8006B848 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 5C04C 8006B84C 0C00A28E */  lw         $v0, 0xC($s5)
/* 5C050 8006B850 6C01118E */  lw         $s1, 0x16C($s0)
/* 5C054 8006B854 18000216 */  bne        $s0, $v0, .L8006B8B8
/* 5C058 8006B858 00000000 */   nop
/* 5C05C 8006B85C A7B7010C */  jal        PhysObGetLight
/* 5C060 8006B860 00000000 */   nop
/* 5C064 8006B864 21204000 */  addu       $a0, $v0, $zero
/* 5C068 8006B868 13008010 */  beqz       $a0, .L8006B8B8
/* 5C06C 8006B86C 00000000 */   nop
/* 5C070 8006B870 0C00A28E */  lw         $v0, 0xC($s5)
/* 5C074 8006B874 00000000 */  nop
/* 5C078 8006B878 0F005014 */  bne        $v0, $s0, .L8006B8B8
/* 5C07C 8006B87C 0C00A526 */   addiu     $a1, $s5, 0xC
/* 5C080 8006B880 0000228E */  lw         $v0, 0x0($s1)
/* 5C084 8006B884 00000000 */  nop
/* 5C088 8006B888 00804230 */  andi       $v0, $v0, 0x8000
/* 5C08C 8006B88C 08004010 */  beqz       $v0, .L8006B8B0
/* 5C090 8006B890 00100624 */   addiu     $a2, $zero, 0x1000
/* 5C094 8006B894 34002286 */  lh         $v0, 0x34($s1)
/* 5C098 8006B898 00000000 */  nop
/* 5C09C 8006B89C 02004104 */  bgez       $v0, .L8006B8A8
/* 5C0A0 8006B8A0 00000000 */   nop
/* 5C0A4 8006B8A4 23100200 */  negu       $v0, $v0
.L8006B8A8:
/* 5C0A8 8006B8A8 00140200 */  sll        $v0, $v0, 16
/* 5C0AC 8006B8AC 03340200 */  sra        $a2, $v0, 16
.L8006B8B0:
/* 5C0B0 8006B8B0 02AB010C */  jal        PHYSOB_SetLightTable
/* 5C0B4 8006B8B4 00000000 */   nop
.L8006B8B8:
/* 5C0B8 8006B8B8 21200002 */  addu       $a0, $s0, $zero
/* 5C0BC 8006B8BC B0A3010C */  jal        CheckPhysObAbility
/* 5C0C0 8006B8C0 02000524 */   addiu     $a1, $zero, 0x2
/* 5C0C4 8006B8C4 0C004010 */  beqz       $v0, .L8006B8F8
/* 5C0C8 8006B8C8 00000000 */   nop
/* 5C0CC 8006B8CC 93A3010C */  jal        PHYSOBS_IsAnythingAttached
/* 5C0D0 8006B8D0 21200002 */   addu      $a0, $s0, $zero
/* 5C0D4 8006B8D4 04004010 */  beqz       $v0, .L8006B8E8
/* 5C0D8 8006B8D8 7FFF0324 */   addiu     $v1, $zero, -0x81
/* 5C0DC 8006B8DC 1800028E */  lw         $v0, 0x18($s0)
/* 5C0E0 8006B8E0 3DAE0108 */  j          .L8006B8F4
/* 5C0E4 8006B8E4 80004234 */   ori       $v0, $v0, 0x80
.L8006B8E8:
/* 5C0E8 8006B8E8 1800028E */  lw         $v0, 0x18($s0)
/* 5C0EC 8006B8EC 00000000 */  nop
/* 5C0F0 8006B8F0 24104300 */  and        $v0, $v0, $v1
.L8006B8F4:
/* 5C0F4 8006B8F4 180002AE */  sw         $v0, 0x18($s0)
.L8006B8F8:
/* 5C0F8 8006B8F8 0000228E */  lw         $v0, 0x0($s1)
/* 5C0FC 8006B8FC 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 5C100 8006B900 24104300 */  and        $v0, $v0, $v1
/* 5C104 8006B904 0F004010 */  beqz       $v0, .L8006B944
/* 5C108 8006B908 00000000 */   nop
/* 5C10C 8006B90C 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 5C110 8006B910 04010296 */  lhu        $v0, 0x104($s0)
/* 5C114 8006B914 42190300 */  srl        $v1, $v1, 5
/* 5C118 8006B918 21104300 */  addu       $v0, $v0, $v1
/* 5C11C 8006B91C 040102A6 */  sh         $v0, 0x104($s0)
/* 5C120 8006B920 00140200 */  sll        $v0, $v0, 16
/* 5C124 8006B924 03140200 */  sra        $v0, $v0, 16
/* 5C128 8006B928 00104228 */  slti       $v0, $v0, 0x1000
/* 5C12C 8006B92C 05004014 */  bnez       $v0, .L8006B944
/* 5C130 8006B930 00000000 */   nop
/* 5C134 8006B934 1400028E */  lw         $v0, 0x14($s0)
/* 5C138 8006B938 00000000 */  nop
/* 5C13C 8006B93C 20004234 */  ori        $v0, $v0, 0x20
/* 5C140 8006B940 140002AE */  sw         $v0, 0x14($s0)
.L8006B944:
/* 5C144 8006B944 0000228E */  lw         $v0, 0x0($s1)
/* 5C148 8006B948 00000000 */  nop
/* 5C14C 8006B94C 00804230 */  andi       $v0, $v0, 0x8000
/* 5C150 8006B950 37004010 */  beqz       $v0, .L8006BA30
/* 5C154 8006B954 21200002 */   addu      $a0, $s0, $zero
/* 5C158 8006B958 34002286 */  lh         $v0, 0x34($s1)
/* 5C15C 8006B95C 34002396 */  lhu        $v1, 0x34($s1)
/* 5C160 8006B960 25004104 */  bgez       $v0, .L8006B9F8
/* 5C164 8006B964 88006224 */   addiu     $v0, $v1, 0x88
/* 5C168 8006B968 340022A6 */  sh         $v0, 0x34($s1)
/* 5C16C 8006B96C 00140200 */  sll        $v0, $v0, 16
/* 5C170 8006B970 2F004004 */  bltz       $v0, .L8006BA30
/* 5C174 8006B974 FFFF033C */   lui       $v1, (0xFFFF7FFF >> 16)
/* 5C178 8006B978 0000228E */  lw         $v0, 0x0($s1)
/* 5C17C 8006B97C FF7F6334 */  ori        $v1, $v1, (0xFFFF7FFF & 0xFFFF)
/* 5C180 8006B980 340020A6 */  sh         $zero, 0x34($s1)
/* 5C184 8006B984 24104300 */  and        $v0, $v0, $v1
/* 5C188 8006B988 000022AE */  sw         $v0, 0x0($s1)
/* 5C18C 8006B98C 2400028E */  lw         $v0, 0x24($s0)
/* 5C190 8006B990 00000000 */  nop
/* 5C194 8006B994 06004294 */  lhu        $v0, 0x6($v0)
/* 5C198 8006B998 00000000 */  nop
/* 5C19C 8006B99C 20004230 */  andi       $v0, $v0, 0x20
/* 5C1A0 8006B9A0 23004010 */  beqz       $v0, .L8006BA30
/* 5C1A4 8006B9A4 00000000 */   nop
/* 5C1A8 8006B9A8 A7B7010C */  jal        PhysObGetLight
/* 5C1AC 8006B9AC 21200002 */   addu      $a0, $s0, $zero
/* 5C1B0 8006B9B0 21284000 */  addu       $a1, $v0, $zero
/* 5C1B4 8006B9B4 0000228E */  lw         $v0, 0x0($s1)
/* 5C1B8 8006B9B8 0400033C */  lui        $v1, (0x40000 >> 16)
/* 5C1BC 8006B9BC 24104300 */  and        $v0, $v0, $v1
/* 5C1C0 8006B9C0 05004010 */  beqz       $v0, .L8006B9D8
/* 5C1C4 8006B9C4 00000000 */   nop
/* 5C1C8 8006B9C8 C3AB010C */  jal        PHYSOB_EndBurning
/* 5C1CC 8006B9CC 21200002 */   addu      $a0, $s0, $zero
/* 5C1D0 8006B9D0 79AE0108 */  j          .L8006B9E4
/* 5C1D4 8006B9D4 FBFF033C */   lui       $v1, (0xFFFBFFFF >> 16)
.L8006B9D8:
/* 5C1D8 8006B9D8 5CAB010C */  jal        PHYSOB_EndLighting
/* 5C1DC 8006B9DC 21200002 */   addu      $a0, $s0, $zero
/* 5C1E0 8006B9E0 FBFF033C */  lui        $v1, (0xFFFBFFFF >> 16)
.L8006B9E4:
/* 5C1E4 8006B9E4 0000228E */  lw         $v0, 0x0($s1)
/* 5C1E8 8006B9E8 FFFF6334 */  ori        $v1, $v1, (0xFFFBFFFF & 0xFFFF)
/* 5C1EC 8006B9EC 24104300 */  and        $v0, $v0, $v1
/* 5C1F0 8006B9F0 8BAE0108 */  j          .L8006BA2C
/* 5C1F4 8006B9F4 000022AE */   sw        $v0, 0x0($s1)
.L8006B9F8:
/* 5C1F8 8006B9F8 340022A6 */  sh         $v0, 0x34($s1)
/* 5C1FC 8006B9FC 00140200 */  sll        $v0, $v0, 16
/* 5C200 8006BA00 03140200 */  sra        $v0, $v0, 16
/* 5C204 8006BA04 00104228 */  slti       $v0, $v0, 0x1000
/* 5C208 8006BA08 09004014 */  bnez       $v0, .L8006BA30
/* 5C20C 8006BA0C 21200002 */   addu      $a0, $s0, $zero
/* 5C210 8006BA10 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
/* 5C214 8006BA14 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
/* 5C218 8006BA18 0000238E */  lw         $v1, 0x0($s1)
/* 5C21C 8006BA1C 00100424 */  addiu      $a0, $zero, 0x1000
/* 5C220 8006BA20 340024A6 */  sh         $a0, 0x34($s1)
/* 5C224 8006BA24 24186200 */  and        $v1, $v1, $v0
/* 5C228 8006BA28 000023AE */  sw         $v1, 0x0($s1)
.L8006BA2C:
/* 5C22C 8006BA2C 21200002 */  addu       $a0, $s0, $zero
.L8006BA30:
/* 5C230 8006BA30 CFA3010C */  jal        CheckPhysObFamily
/* 5C234 8006BA34 05000524 */   addiu     $a1, $zero, 0x5
/* 5C238 8006BA38 2B004010 */  beqz       $v0, .L8006BAE8
/* 5C23C 8006BA3C 21200002 */   addu      $a0, $s0, $zero
/* 5C240 8006BA40 6C01038E */  lw         $v1, 0x16C($s0)
/* 5C244 8006BA44 00000000 */  nop
/* 5C248 8006BA48 0400648C */  lw         $a0, 0x4($v1)
/* 5C24C 8006BA4C 00000000 */  nop
/* 5C250 8006BA50 24008018 */  blez       $a0, .L8006BAE4
/* 5C254 8006BA54 00000000 */   nop
/* 5C258 8006BA58 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 5C25C 8006BA5C 00000000 */  nop
/* 5C260 8006BA60 23208200 */  subu       $a0, $a0, $v0
/* 5C264 8006BA64 06008104 */  bgez       $a0, .L8006BA80
/* 5C268 8006BA68 040064AC */   sw        $a0, 0x4($v1)
/* 5C26C 8006BA6C 040060AC */  sw         $zero, 0x4($v1)
/* 5C270 8006BA70 85D1000C */  jal        INSTANCE_KillInstance
/* 5C274 8006BA74 21200002 */   addu      $a0, $s0, $zero
/* 5C278 8006BA78 BAAE0108 */  j          .L8006BAE8
/* 5C27C 8006BA7C 21200002 */   addu      $a0, $s0, $zero
.L8006BA80:
/* 5C280 8006BA80 0100023C */  lui        $v0, (0x1DFFF >> 16)
/* 5C284 8006BA84 FFDF4234 */  ori        $v0, $v0, (0x1DFFF & 0xFFFF)
/* 5C288 8006BA88 2A104400 */  slt        $v0, $v0, $a0
/* 5C28C 8006BA8C 0C004014 */  bnez       $v0, .L8006BAC0
/* 5C290 8006BA90 8888023C */   lui       $v0, (0x88888889 >> 16)
/* 5C294 8006BA94 89884234 */  ori        $v0, $v0, (0x88888889 & 0xFFFF)
/* 5C298 8006BA98 18008200 */  mult       $a0, $v0
/* 5C29C 8006BA9C C3170400 */  sra        $v0, $a0, 31
/* 5C2A0 8006BAA0 10400000 */  mfhi       $t0
/* 5C2A4 8006BAA4 21180401 */  addu       $v1, $t0, $a0
/* 5C2A8 8006BAA8 03190300 */  sra        $v1, $v1, 4
/* 5C2AC 8006BAAC 23186200 */  subu       $v1, $v1, $v0
/* 5C2B0 8006BAB0 00100224 */  addiu      $v0, $zero, 0x1000
/* 5C2B4 8006BAB4 23104300 */  subu       $v0, $v0, $v1
/* 5C2B8 8006BAB8 B9AE0108 */  j          .L8006BAE4
/* 5C2BC 8006BABC 040102A6 */   sh        $v0, 0x104($s0)
.L8006BAC0:
/* 5C2C0 8006BAC0 04010286 */  lh         $v0, 0x104($s0)
/* 5C2C4 8006BAC4 04010396 */  lhu        $v1, 0x104($s0)
/* 5C2C8 8006BAC8 06004010 */  beqz       $v0, .L8006BAE4
/* 5C2CC 8006BACC C0FF6224 */   addiu     $v0, $v1, -0x40
/* 5C2D0 8006BAD0 040102A6 */  sh         $v0, 0x104($s0)
/* 5C2D4 8006BAD4 00140200 */  sll        $v0, $v0, 16
/* 5C2D8 8006BAD8 03004104 */  bgez       $v0, .L8006BAE8
/* 5C2DC 8006BADC 21200002 */   addu      $a0, $s0, $zero
/* 5C2E0 8006BAE0 040100A6 */  sh         $zero, 0x104($s0)
.L8006BAE4:
/* 5C2E4 8006BAE4 21200002 */  addu       $a0, $s0, $zero
.L8006BAE8:
/* 5C2E8 8006BAE8 CFA3010C */  jal        CheckPhysObFamily
/* 5C2EC 8006BAEC 06000524 */   addiu     $a1, $zero, 0x6
/* 5C2F0 8006BAF0 16004010 */  beqz       $v0, .L8006BB4C
/* 5C2F4 8006BAF4 21200002 */   addu      $a0, $s0, $zero
/* 5C2F8 8006BAF8 2400028E */  lw         $v0, 0x24($s0)
/* 5C2FC 8006BAFC 00000000 */  nop
/* 5C300 8006BB00 08004294 */  lhu        $v0, 0x8($v0)
/* 5C304 8006BB04 00000000 */  nop
/* 5C308 8006BB08 01004230 */  andi       $v0, $v0, 0x1
/* 5C30C 8006BB0C 0F004010 */  beqz       $v0, .L8006BB4C
/* 5C310 8006BB10 00000000 */   nop
/* 5C314 8006BB14 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5C318 8006BB18 92D1000C */  jal        INSTANCE_Query
/* 5C31C 8006BB1C 24000524 */   addiu     $a1, $zero, 0x24
/* 5C320 8006BB20 10004230 */  andi       $v0, $v0, 0x10
/* 5C324 8006BB24 04004010 */  beqz       $v0, .L8006BB38
/* 5C328 8006BB28 FFF70324 */   addiu     $v1, $zero, -0x801
/* 5C32C 8006BB2C 1400028E */  lw         $v0, 0x14($s0)
/* 5C330 8006BB30 D1AE0108 */  j          .L8006BB44
/* 5C334 8006BB34 24104300 */   and       $v0, $v0, $v1
.L8006BB38:
/* 5C338 8006BB38 1400028E */  lw         $v0, 0x14($s0)
/* 5C33C 8006BB3C 00000000 */  nop
/* 5C340 8006BB40 00084234 */  ori        $v0, $v0, 0x800
.L8006BB44:
/* 5C344 8006BB44 140002AE */  sw         $v0, 0x14($s0)
/* 5C348 8006BB48 21200002 */  addu       $a0, $s0, $zero
.L8006BB4C:
/* 5C34C 8006BB4C B0A3010C */  jal        CheckPhysObAbility
/* 5C350 8006BB50 40000524 */   addiu     $a1, $zero, 0x40
/* 5C354 8006BB54 17004010 */  beqz       $v0, .L8006BBB4
/* 5C358 8006BB58 1000033C */   lui       $v1, (0x100000 >> 16)
/* 5C35C 8006BB5C 0000228E */  lw         $v0, 0x0($s1)
/* 5C360 8006BB60 6C01048E */  lw         $a0, 0x16C($s0)
/* 5C364 8006BB64 24104300 */  and        $v0, $v0, $v1
/* 5C368 8006BB68 09004010 */  beqz       $v0, .L8006BB90
/* 5C36C 8006BB6C EFFF033C */   lui       $v1, (0xFFEFF7FF >> 16)
/* 5C370 8006BB70 04008294 */  lhu        $v0, 0x4($a0)
/* 5C374 8006BB74 00000000 */  nop
/* 5C378 8006BB78 F3FF4230 */  andi       $v0, $v0, 0xFFF3
/* 5C37C 8006BB7C 040082A4 */  sh         $v0, 0x4($a0)
/* 5C380 8006BB80 0000228E */  lw         $v0, 0x0($s1)
/* 5C384 8006BB84 FFF76334 */  ori        $v1, $v1, (0xFFEFF7FF & 0xFFFF)
/* 5C388 8006BB88 24104300 */  and        $v0, $v0, $v1
/* 5C38C 8006BB8C 000022AE */  sw         $v0, 0x0($s1)
.L8006BB90:
/* 5C390 8006BB90 0000228E */  lw         $v0, 0x0($s1)
/* 5C394 8006BB94 00000000 */  nop
/* 5C398 8006BB98 00084230 */  andi       $v0, $v0, 0x800
/* 5C39C 8006BB9C 25024010 */  beqz       $v0, .L8006C434
/* 5C3A0 8006BBA0 00000000 */   nop
/* 5C3A4 8006BBA4 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5C3A8 8006BBA8 21200002 */   addu      $a0, $s0, $zero
/* 5C3AC 8006BBAC 0DB10108 */  j          .L8006C434
/* 5C3B0 8006BBB0 00000000 */   nop
.L8006BBB4:
/* 5C3B4 8006BBB4 21200002 */  addu       $a0, $s0, $zero
/* 5C3B8 8006BBB8 B0A3010C */  jal        CheckPhysObAbility
/* 5C3BC 8006BBBC 00800534 */   ori       $a1, $zero, 0x8000
/* 5C3C0 8006BBC0 03004010 */  beqz       $v0, .L8006BBD0
/* 5C3C4 8006BBC4 00000000 */   nop
/* 5C3C8 8006BBC8 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5C3CC 8006BBCC 21200002 */   addu      $a0, $s0, $zero
.L8006BBD0:
/* 5C3D0 8006BBD0 0000238E */  lw         $v1, 0x0($s1)
/* 5C3D4 8006BBD4 00000000 */  nop
/* 5C3D8 8006BBD8 01006230 */  andi       $v0, $v1, 0x1
/* 5C3DC 8006BBDC 0E004014 */  bnez       $v0, .L8006BC18
/* 5C3E0 8006BBE0 08006230 */   andi      $v0, $v1, 0x8
/* 5C3E4 8006BBE4 06004010 */  beqz       $v0, .L8006BC00
/* 5C3E8 8006BBE8 01006230 */   andi      $v0, $v1, 0x1
/* 5C3EC 8006BBEC 7AB9010C */  jal        ExecuteFlip
/* 5C3F0 8006BBF0 21200002 */   addu      $a0, $s0, $zero
/* 5C3F4 8006BBF4 0000238E */  lw         $v1, 0x0($s1)
/* 5C3F8 8006BBF8 00000000 */  nop
/* 5C3FC 8006BBFC 01006230 */  andi       $v0, $v1, 0x1
.L8006BC00:
/* 5C400 8006BC00 05004014 */  bnez       $v0, .L8006BC18
/* 5C404 8006BC04 40006230 */   andi      $v0, $v1, 0x40
/* 5C408 8006BC08 03004010 */  beqz       $v0, .L8006BC18
/* 5C40C 8006BC0C 00000000 */   nop
/* 5C410 8006BC10 20B9010C */  jal        ExecuteDrag
/* 5C414 8006BC14 21200002 */   addu      $a0, $s0, $zero
.L8006BC18:
/* 5C418 8006BC18 0000228E */  lw         $v0, 0x0($s1)
/* 5C41C 8006BC1C 00000000 */  nop
/* 5C420 8006BC20 02004230 */  andi       $v0, $v0, 0x2
/* 5C424 8006BC24 03004010 */  beqz       $v0, .L8006BC34
/* 5C428 8006BC28 00000000 */   nop
/* 5C42C 8006BC2C 4AB9010C */  jal        ExecuteSlideToStop
/* 5C430 8006BC30 21200002 */   addu      $a0, $s0, $zero
.L8006BC34:
/* 5C434 8006BC34 0000228E */  lw         $v0, 0x0($s1)
/* 5C438 8006BC38 00000000 */  nop
/* 5C43C 8006BC3C 00404230 */  andi       $v0, $v0, 0x4000
/* 5C440 8006BC40 03004010 */  beqz       $v0, .L8006BC50
/* 5C444 8006BC44 00000000 */   nop
/* 5C448 8006BC48 75BE010C */  jal        ExecuteGravitate
/* 5C44C 8006BC4C 21200002 */   addu      $a0, $s0, $zero
.L8006BC50:
/* 5C450 8006BC50 0000228E */  lw         $v0, 0x0($s1)
/* 5C454 8006BC54 00000000 */  nop
/* 5C458 8006BC58 10004230 */  andi       $v0, $v0, 0x10
/* 5C45C 8006BC5C 03004010 */  beqz       $v0, .L8006BC6C
/* 5C460 8006BC60 00000000 */   nop
/* 5C464 8006BC64 DCB8010C */  jal        ExecuteThrow
/* 5C468 8006BC68 21200002 */   addu      $a0, $s0, $zero
.L8006BC6C:
/* 5C46C 8006BC6C 0000228E */  lw         $v0, 0x0($s1)
/* 5C470 8006BC70 00000000 */  nop
/* 5C474 8006BC74 20004230 */  andi       $v0, $v0, 0x20
/* 5C478 8006BC78 03004010 */  beqz       $v0, .L8006BC88
/* 5C47C 8006BC7C 00000000 */   nop
/* 5C480 8006BC80 52BF010C */  jal        ExecuteFollow
/* 5C484 8006BC84 21200002 */   addu      $a0, $s0, $zero
.L8006BC88:
/* 5C488 8006BC88 0000228E */  lw         $v0, 0x0($s1)
/* 5C48C 8006BC8C 1000033C */  lui        $v1, (0x100000 >> 16)
/* 5C490 8006BC90 24104300 */  and        $v0, $v0, $v1
/* 5C494 8006BC94 19004010 */  beqz       $v0, .L8006BCFC
/* 5C498 8006BC98 21200002 */   addu      $a0, $s0, $zero
/* 5C49C 8006BC9C CFA3010C */  jal        CheckPhysObFamily
/* 5C4A0 8006BCA0 05000524 */   addiu     $a1, $zero, 0x5
/* 5C4A4 8006BCA4 15004010 */  beqz       $v0, .L8006BCFC
/* 5C4A8 8006BCA8 FF000224 */   addiu     $v0, $zero, 0xFF
/* 5C4AC 8006BCAC 2400068E */  lw         $a2, 0x24($s0)
/* 5C4B0 8006BCB0 00000000 */  nop
/* 5C4B4 8006BCB4 1000C390 */  lbu        $v1, 0x10($a2)
/* 5C4B8 8006BCB8 00000000 */  nop
/* 5C4BC 8006BCBC 0A006210 */  beq        $v1, $v0, .L8006BCE8
/* 5C4C0 8006BCC0 21200002 */   addu      $a0, $s0, $zero
/* 5C4C4 8006BCC4 21280000 */  addu       $a1, $zero, $zero
/* 5C4C8 8006BCC8 21306000 */  addu       $a2, $v1, $zero
/* 5C4CC 8006BCCC 2138A000 */  addu       $a3, $a1, $zero
/* 5C4D0 8006BCD0 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5C4D4 8006BCD4 1000A0AF */   sw        $zero, 0x10($sp)
/* 5C4D8 8006BCD8 21200002 */  addu       $a0, $s0, $zero
/* 5C4DC 8006BCDC 21280000 */  addu       $a1, $zero, $zero
/* 5C4E0 8006BCE0 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5C4E4 8006BCE4 02000624 */   addiu     $a2, $zero, 0x2
.L8006BCE8:
/* 5C4E8 8006BCE8 EFFF033C */  lui        $v1, (0xFFEFFFFF >> 16)
/* 5C4EC 8006BCEC 0000228E */  lw         $v0, 0x0($s1)
/* 5C4F0 8006BCF0 FFFF6334 */  ori        $v1, $v1, (0xFFEFFFFF & 0xFFFF)
/* 5C4F4 8006BCF4 24104300 */  and        $v0, $v0, $v1
/* 5C4F8 8006BCF8 000022AE */  sw         $v0, 0x0($s1)
.L8006BCFC:
/* 5C4FC 8006BCFC 0000228E */  lw         $v0, 0x0($s1)
/* 5C500 8006BD00 0100033C */  lui        $v1, (0x10000 >> 16)
/* 5C504 8006BD04 24104300 */  and        $v0, $v0, $v1
/* 5C508 8006BD08 1B004010 */  beqz       $v0, .L8006BD78
/* 5C50C 8006BD0C 21200002 */   addu      $a0, $s0, $zero
/* 5C510 8006BD10 3800048E */  lw         $a0, 0x38($s0)
/* 5C514 8006BD14 1C66010C */  jal        STREAM_GetLevelWithID
/* 5C518 8006BD18 00000000 */   nop
/* 5C51C 8006BD1C 21904000 */  addu       $s2, $v0, $zero
/* 5C520 8006BD20 15004012 */  beqz       $s2, .L8006BD78
/* 5C524 8006BD24 21200002 */   addu      $a0, $s0, $zero
/* 5C528 8006BD28 4000028E */  lw         $v0, 0x40($s0)
/* 5C52C 8006BD2C 00000000 */  nop
/* 5C530 8006BD30 11004010 */  beqz       $v0, .L8006BD78
/* 5C534 8006BD34 00000000 */   nop
/* 5C538 8006BD38 A7B7010C */  jal        PhysObGetLight
/* 5C53C 8006BD3C 21200002 */   addu      $a0, $s0, $zero
/* 5C540 8006BD40 21284000 */  addu       $a1, $v0, $zero
/* 5C544 8006BD44 0100A290 */  lbu        $v0, 0x1($a1)
/* 5C548 8006BD48 4000038E */  lw         $v1, 0x40($s0)
/* 5C54C 8006BD4C 40110200 */  sll        $v0, $v0, 5
/* 5C550 8006BD50 21104300 */  addu       $v0, $v0, $v1
/* 5C554 8006BD54 3800438E */  lw         $v1, 0x38($s2)
/* 5C558 8006BD58 1C00428C */  lw         $v0, 0x1C($v0)
/* 5C55C 8006BD5C 00000000 */  nop
/* 5C560 8006BD60 2A104300 */  slt        $v0, $v0, $v1
/* 5C564 8006BD64 04004010 */  beqz       $v0, .L8006BD78
/* 5C568 8006BD68 21200002 */   addu      $a0, $s0, $zero
/* 5C56C 8006BD6C C3AB010C */  jal        PHYSOB_EndBurning
/* 5C570 8006BD70 21200002 */   addu      $a0, $s0, $zero
/* 5C574 8006BD74 21200002 */  addu       $a0, $s0, $zero
.L8006BD78:
/* 5C578 8006BD78 CFA3010C */  jal        CheckPhysObFamily
/* 5C57C 8006BD7C 07000524 */   addiu     $a1, $zero, 0x7
/* 5C580 8006BD80 39004010 */  beqz       $v0, .L8006BE68
/* 5C584 8006BD84 08000224 */   addiu     $v0, $zero, 0x8
/* 5C588 8006BD88 6C01138E */  lw         $s3, 0x16C($s0)
/* 5C58C 8006BD8C 00000000 */  nop
/* 5C590 8006BD90 0400638E */  lw         $v1, 0x4($s3)
/* 5C594 8006BD94 00000000 */  nop
/* 5C598 8006BD98 33006214 */  bne        $v1, $v0, .L8006BE68
/* 5C59C 8006BD9C 00000000 */   nop
/* 5C5A0 8006BDA0 3800048E */  lw         $a0, 0x38($s0)
/* 5C5A4 8006BDA4 1C66010C */  jal        STREAM_GetLevelWithID
/* 5C5A8 8006BDA8 00000000 */   nop
/* 5C5AC 8006BDAC 21184000 */  addu       $v1, $v0, $zero
/* 5C5B0 8006BDB0 2D006010 */  beqz       $v1, .L8006BE68
/* 5C5B4 8006BDB4 00000000 */   nop
/* 5C5B8 8006BDB8 60000286 */  lh         $v0, 0x60($s0)
/* 5C5BC 8006BDBC 3800638C */  lw         $v1, 0x38($v1)
/* 5C5C0 8006BDC0 00000000 */  nop
/* 5C5C4 8006BDC4 2A104300 */  slt        $v0, $v0, $v1
/* 5C5C8 8006BDC8 27004010 */  beqz       $v0, .L8006BE68
/* 5C5CC 8006BDCC 00000000 */   nop
/* 5C5D0 8006BDD0 26010286 */  lh         $v0, 0x126($s0)
/* 5C5D4 8006BDD4 2400128E */  lw         $s2, 0x24($s0)
/* 5C5D8 8006BDD8 03004014 */  bnez       $v0, .L8006BDE8
/* 5C5DC 8006BDDC 00000000 */   nop
/* 5C5E0 8006BDE0 9635010C */  jal        FX_EndInstanceEffects
/* 5C5E4 8006BDE4 21200002 */   addu      $a0, $s0, $zero
.L8006BDE8:
/* 5C5E8 8006BDE8 0400638E */  lw         $v1, 0x4($s3)
/* 5C5EC 8006BDEC 00000000 */  nop
/* 5C5F0 8006BDF0 40100300 */  sll        $v0, $v1, 1
/* 5C5F4 8006BDF4 21104300 */  addu       $v0, $v0, $v1
/* 5C5F8 8006BDF8 0C00438E */  lw         $v1, 0xC($s2)
/* 5C5FC 8006BDFC 80100200 */  sll        $v0, $v0, 2
/* 5C600 8006BE00 21186200 */  addu       $v1, $v1, $v0
/* 5C604 8006BE04 03006680 */  lb         $a2, 0x3($v1)
/* 5C608 8006BE08 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5C60C 8006BE0C 1400C210 */  beq        $a2, $v0, .L8006BE60
/* 5C610 8006BE10 0800033C */   lui       $v1, (0x80000 >> 16)
/* 5C614 8006BE14 0000228E */  lw         $v0, 0x0($s1)
/* 5C618 8006BE18 00000000 */  nop
/* 5C61C 8006BE1C 24104300 */  and        $v0, $v0, $v1
/* 5C620 8006BE20 11004014 */  bnez       $v0, .L8006BE68
/* 5C624 8006BE24 21200002 */   addu      $a0, $s0, $zero
/* 5C628 8006BE28 21280000 */  addu       $a1, $zero, $zero
/* 5C62C 8006BE2C 2138A000 */  addu       $a3, $a1, $zero
/* 5C630 8006BE30 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5C634 8006BE34 1000A0AF */   sw        $zero, 0x10($sp)
/* 5C638 8006BE38 21200002 */  addu       $a0, $s0, $zero
/* 5C63C 8006BE3C 21280000 */  addu       $a1, $zero, $zero
/* 5C640 8006BE40 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5C644 8006BE44 01000624 */   addiu     $a2, $zero, 0x1
/* 5C648 8006BE48 0800033C */  lui        $v1, (0x81001 >> 16)
/* 5C64C 8006BE4C 0000228E */  lw         $v0, 0x0($s1)
/* 5C650 8006BE50 01106334 */  ori        $v1, $v1, (0x81001 & 0xFFFF)
/* 5C654 8006BE54 25104300 */  or         $v0, $v0, $v1
/* 5C658 8006BE58 9AAF0108 */  j          .L8006BE68
/* 5C65C 8006BE5C 000022AE */   sw        $v0, 0x0($s1)
.L8006BE60:
/* 5C660 8006BE60 85D1000C */  jal        INSTANCE_KillInstance
/* 5C664 8006BE64 21200002 */   addu      $a0, $s0, $zero
.L8006BE68:
/* 5C668 8006BE68 0000248E */  lw         $a0, 0x0($s1)
/* 5C66C 8006BE6C 00000000 */  nop
/* 5C670 8006BE70 00108230 */  andi       $v0, $a0, 0x1000
/* 5C674 8006BE74 43014014 */  bnez       $v0, .L8006C384
/* 5C678 8006BE78 00000000 */   nop
/* 5C67C 8006BE7C 4000028E */  lw         $v0, 0x40($s0)
/* 5C680 8006BE80 00000000 */  nop
/* 5C684 8006BE84 3F014010 */  beqz       $v0, .L8006C384
/* 5C688 8006BE88 04009430 */   andi      $s4, $a0, 0x4
/* 5C68C 8006BE8C 68000386 */  lh         $v1, 0x68($s0)
/* 5C690 8006BE90 60000286 */  lh         $v0, 0x60($s0)
/* 5C694 8006BE94 00000000 */  nop
/* 5C698 8006BE98 23206200 */  subu       $a0, $v1, $v0
/* 5C69C 8006BE9C A0008228 */  slti       $v0, $a0, 0xA0
/* 5C6A0 8006BEA0 02004010 */  beqz       $v0, .L8006BEAC
/* 5C6A4 8006BEA4 00000000 */   nop
/* 5C6A8 8006BEA8 A0000424 */  addiu      $a0, $zero, 0xA0
.L8006BEAC:
/* 5C6AC 8006BEAC 8801028E */  lw         $v0, 0x188($s0)
/* 5C6B0 8006BEB0 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 5C6B4 8006BEB4 00000000 */  nop
/* 5C6B8 8006BEB8 18004500 */  mult       $v0, $a1
/* 5C6BC 8006BEBC 12100000 */  mflo       $v0
/* 5C6C0 8006BEC0 02004104 */  bgez       $v0, .L8006BECC
/* 5C6C4 8006BEC4 00000000 */   nop
/* 5C6C8 8006BEC8 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8006BECC:
/* 5C6CC 8006BECC 00110200 */  sll        $v0, $v0, 4
/* 5C6D0 8006BED0 7C01038E */  lw         $v1, 0x17C($s0)
/* 5C6D4 8006BED4 03140200 */  sra        $v0, $v0, 16
/* 5C6D8 8006BED8 21186200 */  addu       $v1, $v1, $v0
/* 5C6DC 8006BEDC 18006500 */  mult       $v1, $a1
/* 5C6E0 8006BEE0 12100000 */  mflo       $v0
/* 5C6E4 8006BEE4 02004104 */  bgez       $v0, .L8006BEF0
/* 5C6E8 8006BEE8 00000000 */   nop
/* 5C6EC 8006BEEC FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8006BEF0:
/* 5C6F0 8006BEF0 03130200 */  sra        $v0, $v0, 12
/* 5C6F4 8006BEF4 23100200 */  negu       $v0, $v0
/* 5C6F8 8006BEF8 40004224 */  addiu      $v0, $v0, 0x40
/* 5C6FC 8006BEFC 21284000 */  addu       $a1, $v0, $zero
/* 5C700 8006BF00 00140200 */  sll        $v0, $v0, 16
/* 5C704 8006BF04 03140200 */  sra        $v0, $v0, 16
/* 5C708 8006BF08 A0004228 */  slti       $v0, $v0, 0xA0
/* 5C70C 8006BF0C 03004010 */  beqz       $v0, .L8006BF1C
/* 5C710 8006BF10 00140500 */   sll       $v0, $a1, 16
/* 5C714 8006BF14 A0000524 */  addiu      $a1, $zero, 0xA0
/* 5C718 8006BF18 00140500 */  sll        $v0, $a1, 16
.L8006BF1C:
/* 5C71C 8006BF1C 031C0200 */  sra        $v1, $v0, 16
/* 5C720 8006BF20 2A106400 */  slt        $v0, $v1, $a0
/* 5C724 8006BF24 03004010 */  beqz       $v0, .L8006BF34
/* 5C728 8006BF28 00000000 */   nop
/* 5C72C 8006BF2C CEAF0108 */  j          .L8006BF38
/* 5C730 8006BF30 21288000 */   addu      $a1, $a0, $zero
.L8006BF34:
/* 5C734 8006BF34 21206000 */  addu       $a0, $v1, $zero
.L8006BF38:
/* 5C738 8006BF38 00240400 */  sll        $a0, $a0, 16
/* 5C73C 8006BF3C 03240400 */  sra        $a0, $a0, 16
/* 5C740 8006BF40 002C0500 */  sll        $a1, $a1, 16
/* 5C744 8006BF44 032C0500 */  sra        $a1, $a1, 16
/* 5C748 8006BF48 21300000 */  addu       $a2, $zero, $zero
/* 5C74C 8006BF4C 2138C000 */  addu       $a3, $a2, $zero
/* 5C750 8006BF50 500B0224 */  addiu      $v0, $zero, 0xB50
/* 5C754 8006BF54 1000A0AF */  sw         $zero, 0x10($sp)
/* 5C758 8006BF58 4FC4010C */  jal        SetPhysicsGravityData
/* 5C75C 8006BF5C 1400A2AF */   sw        $v0, 0x14($sp)
/* 5C760 8006BF60 21200002 */  addu       $a0, $s0, $zero
/* 5C764 8006BF64 21904000 */  addu       $s2, $v0, $zero
/* 5C768 8006BF68 21284002 */  addu       $a1, $s2, $zero
/* 5C76C 8006BF6C B8D3010C */  jal        PhysicsCheckGravity
/* 5C770 8006BF70 0D000624 */   addiu     $a2, $zero, 0xD
/* 5C774 8006BF74 21984000 */  addu       $s3, $v0, $zero
/* 5C778 8006BF78 01006232 */  andi       $v0, $s3, 0x1
/* 5C77C 8006BF7C 73004010 */  beqz       $v0, .L8006C14C
/* 5C780 8006BF80 00000000 */   nop
/* 5C784 8006BF84 8C00028E */  lw         $v0, 0x8C($s0)
/* 5C788 8006BF88 00000000 */  nop
/* 5C78C 8006BF8C 03004010 */  beqz       $v0, .L8006BF9C
/* 5C790 8006BF90 00000000 */   nop
/* 5C794 8006BF94 6E008012 */  beqz       $s4, .L8006C150
/* 5C798 8006BF98 00000000 */   nop
.L8006BF9C:
/* 5C79C 8006BF9C DC000286 */  lh         $v0, 0xDC($s0)
/* 5C7A0 8006BFA0 00000000 */  nop
/* 5C7A4 8006BFA4 510B4228 */  slti       $v0, $v0, 0xB51
/* 5C7A8 8006BFA8 68004014 */  bnez       $v0, .L8006C14C
/* 5C7AC 8006BFAC 00000000 */   nop
/* 5C7B0 8006BFB0 7C01038E */  lw         $v1, 0x17C($s0)
/* 5C7B4 8006BFB4 0000228E */  lw         $v0, 0x0($s1)
/* 5C7B8 8006BFB8 00000000 */  nop
/* 5C7BC 8006BFBC 14004230 */  andi       $v0, $v0, 0x14
/* 5C7C0 8006BFC0 03004010 */  beqz       $v0, .L8006BFD0
/* 5C7C4 8006BFC4 CEFF7428 */   slti      $s4, $v1, -0x32
/* 5C7C8 8006BFC8 29A3010C */  jal        PHYSOB_PlayDropSound
/* 5C7CC 8006BFCC 21200002 */   addu      $a0, $s0, $zero
.L8006BFD0:
/* 5C7D0 8006BFD0 0000238E */  lw         $v1, 0x0($s1)
/* 5C7D4 8006BFD4 FBFF0224 */  addiu      $v0, $zero, -0x5
/* 5C7D8 8006BFD8 24186200 */  and        $v1, $v1, $v0
/* 5C7DC 8006BFDC 4000023C */  lui        $v0, (0x400000 >> 16)
/* 5C7E0 8006BFE0 24106200 */  and        $v0, $v1, $v0
/* 5C7E4 8006BFE4 0E004010 */  beqz       $v0, .L8006C020
/* 5C7E8 8006BFE8 000023AE */   sw        $v1, 0x0($s1)
/* 5C7EC 8006BFEC BFFF023C */  lui        $v0, (0xFFBFFFEF >> 16)
/* 5C7F0 8006BFF0 EFFF4234 */  ori        $v0, $v0, (0xFFBFFFEF & 0xFFFF)
/* 5C7F4 8006BFF4 21200002 */  addu       $a0, $s0, $zero
/* 5C7F8 8006BFF8 07000524 */  addiu      $a1, $zero, 0x7
/* 5C7FC 8006BFFC 24106200 */  and        $v0, $v1, $v0
/* 5C800 8006C000 2000033C */  lui        $v1, (0x200000 >> 16)
/* 5C804 8006C004 25104300 */  or         $v0, $v0, $v1
/* 5C808 8006C008 000022AE */  sw         $v0, 0x0($s1)
/* 5C80C 8006C00C 0A000224 */  addiu      $v0, $zero, 0xA
/* 5C810 8006C010 C2B7010C */  jal        TurnOnCollisionPhysOb
/* 5C814 8006C014 440022AE */   sw        $v0, 0x44($s1)
/* 5C818 8006C018 11B00108 */  j          .L8006C044
/* 5C81C 8006C01C 00000000 */   nop
.L8006C020:
/* 5C820 8006C020 7FFF023C */  lui        $v0, (0xFF7FFFFF >> 16)
/* 5C824 8006C024 FFFF4234 */  ori        $v0, $v0, (0xFF7FFFFF & 0xFFFF)
/* 5C828 8006C028 24186200 */  and        $v1, $v1, $v0
/* 5C82C 8006C02C 0004023C */  lui        $v0, (0x4000000 >> 16)
/* 5C830 8006C030 24106200 */  and        $v0, $v1, $v0
/* 5C834 8006C034 03004014 */  bnez       $v0, .L8006C044
/* 5C838 8006C038 000023AE */   sw        $v1, 0x0($s1)
/* 5C83C 8006C03C 01006234 */  ori        $v0, $v1, 0x1
/* 5C840 8006C040 000022AE */  sw         $v0, 0x0($s1)
.L8006C044:
/* 5C844 8006C044 0000228E */  lw         $v0, 0x0($s1)
/* 5C848 8006C048 00000000 */  nop
/* 5C84C 8006C04C 10004230 */  andi       $v0, $v0, 0x10
/* 5C850 8006C050 05004010 */  beqz       $v0, .L8006C068
/* 5C854 8006C054 7FFF0324 */   addiu     $v1, $zero, -0x81
/* 5C858 8006C058 1800028E */  lw         $v0, 0x18($s0)
/* 5C85C 8006C05C 00000000 */  nop
/* 5C860 8006C060 24104300 */  and        $v0, $v0, $v1
/* 5C864 8006C064 180002AE */  sw         $v0, 0x18($s0)
.L8006C068:
/* 5C868 8006C068 0000228E */  lw         $v0, 0x0($s1)
/* 5C86C 8006C06C EFFF0324 */  addiu      $v1, $zero, -0x11
/* 5C870 8006C070 24104300 */  and        $v0, $v0, $v1
/* 5C874 8006C074 2000033C */  lui        $v1, (0x200000 >> 16)
/* 5C878 8006C078 000022AE */  sw         $v0, 0x0($s1)
/* 5C87C 8006C07C 24104300 */  and        $v0, $v0, $v1
/* 5C880 8006C080 05004014 */  bnez       $v0, .L8006C098
/* 5C884 8006C084 0800023C */   lui       $v0, (0x80000 >> 16)
/* 5C888 8006C088 21200002 */  addu       $a0, $s0, $zero
/* 5C88C 8006C08C EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5C890 8006C090 04000524 */   addiu     $a1, $zero, 0x4
/* 5C894 8006C094 0800023C */  lui        $v0, (0x80000 >> 16)
.L8006C098:
/* 5C898 8006C098 24106202 */  and        $v0, $s3, $v0
/* 5C89C 8006C09C 08004010 */  beqz       $v0, .L8006C0C0
/* 5C8A0 8006C0A0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 5C8A4 8006C0A4 0000228E */  lw         $v0, 0x0($s1)
/* 5C8A8 8006C0A8 00000000 */  nop
/* 5C8AC 8006C0AC 00104234 */  ori        $v0, $v0, 0x1000
/* 5C8B0 8006C0B0 000022AE */  sw         $v0, 0x0($s1)
/* 5C8B4 8006C0B4 880100AE */  sw         $zero, 0x188($s0)
/* 5C8B8 8006C0B8 32B00108 */  j          .L8006C0C8
/* 5C8BC 8006C0BC 7C0100AE */   sw        $zero, 0x17C($s0)
.L8006C0C0:
/* 5C8C0 8006C0C0 880102AE */  sw         $v0, 0x188($s0)
/* 5C8C4 8006C0C4 7C0102AE */  sw         $v0, 0x17C($s0)
.L8006C0C8:
/* 5C8C8 8006C0C8 4400028E */  lw         $v0, 0x44($s0)
/* 5C8CC 8006C0CC 00000000 */  nop
/* 5C8D0 8006C0D0 0C004010 */  beqz       $v0, .L8006C104
/* 5C8D4 8006C0D4 0100023C */   lui       $v0, (0x18000 >> 16)
/* 5C8D8 8006C0D8 0000238E */  lw         $v1, 0x0($s1)
/* 5C8DC 8006C0DC 00804234 */  ori        $v0, $v0, (0x18000 & 0xFFFF)
/* 5C8E0 8006C0E0 24186200 */  and        $v1, $v1, $v0
/* 5C8E4 8006C0E4 0100023C */  lui        $v0, (0x10000 >> 16)
/* 5C8E8 8006C0E8 07006214 */  bne        $v1, $v0, .L8006C108
/* 5C8EC 8006C0EC 21200002 */   addu      $a0, $s0, $zero
/* 5C8F0 8006C0F0 A7B7010C */  jal        PhysObGetLight
/* 5C8F4 8006C0F4 21200002 */   addu      $a0, $s0, $zero
/* 5C8F8 8006C0F8 21200002 */  addu       $a0, $s0, $zero
/* 5C8FC 8006C0FC B2AB010C */  jal        PHYSOB_StopLighting
/* 5C900 8006C100 21284000 */   addu      $a1, $v0, $zero
.L8006C104:
/* 5C904 8006C104 21200002 */  addu       $a0, $s0, $zero
.L8006C108:
/* 5C908 8006C108 B0A3010C */  jal        CheckPhysObAbility
/* 5C90C 8006C10C 08000524 */   addiu     $a1, $zero, 0x8
/* 5C910 8006C110 37004010 */  beqz       $v0, .L8006C1F0
/* 5C914 8006C114 00000000 */   nop
/* 5C918 8006C118 0000228E */  lw         $v0, 0x0($s1)
/* 5C91C 8006C11C 00000000 */  nop
/* 5C920 8006C120 00014230 */  andi       $v0, $v0, 0x100
/* 5C924 8006C124 32004014 */  bnez       $v0, .L8006C1F0
/* 5C928 8006C128 00000000 */   nop
/* 5C92C 8006C12C 04008012 */  beqz       $s4, .L8006C140
/* 5C930 8006C130 00000000 */   nop
/* 5C934 8006C134 880100AE */  sw         $zero, 0x188($s0)
/* 5C938 8006C138 A9A7010C */  jal        ResetOrientation
/* 5C93C 8006C13C 21200002 */   addu      $a0, $s0, $zero
.L8006C140:
/* 5C940 8006C140 60000296 */  lhu        $v0, 0x60($s0)
/* 5C944 8006C144 7CB00108 */  j          .L8006C1F0
/* 5C948 8006C148 120022A6 */   sh        $v0, 0x12($s1)
.L8006C14C:
/* 5C94C 8006C14C 8C00028E */  lw         $v0, 0x8C($s0)
.L8006C150:
/* 5C950 8006C150 00000000 */  nop
/* 5C954 8006C154 24004014 */  bnez       $v0, .L8006C1E8
/* 5C958 8006C158 00000000 */   nop
/* 5C95C 8006C15C 4400028E */  lw         $v0, 0x44($s0)
/* 5C960 8006C160 00000000 */  nop
/* 5C964 8006C164 20004010 */  beqz       $v0, .L8006C1E8
/* 5C968 8006C168 01006232 */   andi      $v0, $s3, 0x1
/* 5C96C 8006C16C 0B004010 */  beqz       $v0, .L8006C19C
/* 5C970 8006C170 00000000 */   nop
/* 5C974 8006C174 5C000296 */  lhu        $v0, 0x5C($s0)
/* 5C978 8006C178 04004396 */  lhu        $v1, 0x4($s2)
/* 5C97C 8006C17C 00000000 */  nop
/* 5C980 8006C180 21104300 */  addu       $v0, $v0, $v1
/* 5C984 8006C184 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 5C988 8006C188 5E000296 */  lhu        $v0, 0x5E($s0)
/* 5C98C 8006C18C 06004396 */  lhu        $v1, 0x6($s2)
/* 5C990 8006C190 00000000 */  nop
/* 5C994 8006C194 21104300 */  addu       $v0, $v0, $v1
/* 5C998 8006C198 5E0002A6 */  sh         $v0, 0x5E($s0)
.L8006C19C:
/* 5C99C 8006C19C 7C01028E */  lw         $v0, 0x17C($s0)
/* 5C9A0 8006C1A0 00000000 */  nop
/* 5C9A4 8006C1A4 0A004014 */  bnez       $v0, .L8006C1D0
/* 5C9A8 8006C1A8 F6FF0224 */   addiu     $v0, $zero, -0xA
/* 5C9AC 8006C1AC 1C00028E */  lw         $v0, 0x1C($s0)
/* 5C9B0 8006C1B0 00000000 */  nop
/* 5C9B4 8006C1B4 0000428C */  lw         $v0, 0x0($v0)
/* 5C9B8 8006C1B8 00000000 */  nop
/* 5C9BC 8006C1BC 00044230 */  andi       $v0, $v0, 0x400
/* 5C9C0 8006C1C0 02004010 */  beqz       $v0, .L8006C1CC
/* 5C9C4 8006C1C4 CEFF0224 */   addiu     $v0, $zero, -0x32
/* 5C9C8 8006C1C8 7C0102AE */  sw         $v0, 0x17C($s0)
.L8006C1CC:
/* 5C9CC 8006C1CC F6FF0224 */  addiu      $v0, $zero, -0xA
.L8006C1D0:
/* 5C9D0 8006C1D0 880102AE */  sw         $v0, 0x188($s0)
/* 5C9D4 8006C1D4 0000228E */  lw         $v0, 0x0($s1)
/* 5C9D8 8006C1D8 00000000 */  nop
/* 5C9DC 8006C1DC 04004234 */  ori        $v0, $v0, 0x4
/* 5C9E0 8006C1E0 7CB00108 */  j          .L8006C1F0
/* 5C9E4 8006C1E4 000022AE */   sw        $v0, 0x0($s1)
.L8006C1E8:
/* 5C9E8 8006C1E8 880100AE */  sw         $zero, 0x188($s0)
/* 5C9EC 8006C1EC 7C0100AE */  sw         $zero, 0x17C($s0)
.L8006C1F0:
/* 5C9F0 8006C1F0 1C00028E */  lw         $v0, 0x1C($s0)
/* 5C9F4 8006C1F4 00000000 */  nop
/* 5C9F8 8006C1F8 0000428C */  lw         $v0, 0x0($v0)
/* 5C9FC 8006C1FC 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5CA00 8006C200 24104300 */  and        $v0, $v0, $v1
/* 5CA04 8006C204 61004014 */  bnez       $v0, .L8006C38C
/* 5CA08 8006C208 21200002 */   addu      $a0, $s0, $zero
/* 5CA0C 8006C20C B0A3010C */  jal        CheckPhysObAbility
/* 5CA10 8006C210 08000524 */   addiu     $a1, $zero, 0x8
/* 5CA14 8006C214 5D004010 */  beqz       $v0, .L8006C38C
/* 5CA18 8006C218 00000000 */   nop
/* 5CA1C 8006C21C D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 5CA20 8006C220 00000000 */  nop
/* 5CA24 8006C224 59004014 */  bnez       $v0, .L8006C38C
/* 5CA28 8006C228 E8031224 */   addiu     $s2, $zero, 0x3E8
/* 5CA2C 8006C22C D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 5CA30 8006C230 00000000 */  nop
/* 5CA34 8006C234 55005210 */  beq        $v0, $s2, .L8006C38C
/* 5CA38 8006C238 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 5CA3C 8006C23C 1800028E */  lw         $v0, 0x18($s0)
/* 5CA40 8006C240 00000000 */  nop
/* 5CA44 8006C244 24104300 */  and        $v0, $v0, $v1
/* 5CA48 8006C248 50004014 */  bnez       $v0, .L8006C38C
/* 5CA4C 8006C24C 4800A227 */   addiu     $v0, $sp, 0x48
/* 5CA50 8006C250 3000A2AF */  sw         $v0, 0x30($sp)
/* 5CA54 8006C254 5000A227 */  addiu      $v0, $sp, 0x50
/* 5CA58 8006C258 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 5CA5C 8006C25C 5C000296 */  lhu        $v0, 0x5C($s0)
/* 5CA60 8006C260 00000000 */  nop
/* 5CA64 8006C264 5000A2A7 */  sh         $v0, 0x50($sp)
/* 5CA68 8006C268 4800A2A7 */  sh         $v0, 0x48($sp)
/* 5CA6C 8006C26C 5E000296 */  lhu        $v0, 0x5E($s0)
/* 5CA70 8006C270 21200002 */  addu       $a0, $s0, $zero
/* 5CA74 8006C274 5200A2A7 */  sh         $v0, 0x52($sp)
/* 5CA78 8006C278 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 5CA7C 8006C27C 60000296 */  lhu        $v0, 0x60($s0)
/* 5CA80 8006C280 1800A527 */  addiu      $a1, $sp, 0x18
/* 5CA84 8006C284 00FB4324 */  addiu      $v1, $v0, -0x500
/* 5CA88 8006C288 5400A2A7 */  sh         $v0, 0x54($sp)
/* 5CA8C 8006C28C 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 5CA90 8006C290 40014224 */  addiu      $v0, $v0, 0x140
/* 5CA94 8006C294 5400A3A7 */  sh         $v1, 0x54($sp)
/* 5CA98 8006C298 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5CA9C 8006C29C 4C00A2A7 */   sh        $v0, 0x4C($sp)
/* 5CAA0 8006C2A0 4C00A397 */  lhu        $v1, 0x4C($sp)
/* 5CAA4 8006C2A4 5400A297 */  lhu        $v0, 0x54($sp)
/* 5CAA8 8006C2A8 880100AE */  sw         $zero, 0x188($s0)
/* 5CAAC 8006C2AC 23186200 */  subu       $v1, $v1, $v0
/* 5CAB0 8006C2B0 C0FE6324 */  addiu      $v1, $v1, -0x140
/* 5CAB4 8006C2B4 21306000 */  addu       $a2, $v1, $zero
/* 5CAB8 8006C2B8 001C0300 */  sll        $v1, $v1, 16
/* 5CABC 8006C2BC 031C0300 */  sra        $v1, $v1, 16
/* 5CAC0 8006C2C0 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 5CAC4 8006C2C4 C0036328 */  slti       $v1, $v1, 0x3C0
/* 5CAC8 8006C2C8 23384202 */  subu       $a3, $s2, $v0
/* 5CACC 8006C2CC 40100700 */  sll        $v0, $a3, 1
/* 5CAD0 8006C2D0 21104700 */  addu       $v0, $v0, $a3
/* 5CAD4 8006C2D4 C0100200 */  sll        $v0, $v0, 3
/* 5CAD8 8006C2D8 21104700 */  addu       $v0, $v0, $a3
/* 5CADC 8006C2DC 15006014 */  bnez       $v1, .L8006C334
/* 5CAE0 8006C2E0 40380200 */   sll       $a3, $v0, 1
/* 5CAE4 8006C2E4 6666053C */  lui        $a1, (0x66666667 >> 16)
/* 5CAE8 8006C2E8 12002496 */  lhu        $a0, 0x12($s1)
/* 5CAEC 8006C2EC 60000696 */  lhu        $a2, 0x60($s0)
/* 5CAF0 8006C2F0 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
/* 5CAF4 8006C2F4 23188600 */  subu       $v1, $a0, $a2
/* 5CAF8 8006C2F8 001C0300 */  sll        $v1, $v1, 16
/* 5CAFC 8006C2FC 03140300 */  sra        $v0, $v1, 16
/* 5CB00 8006C300 18004500 */  mult       $v0, $a1
/* 5CB04 8006C304 C31F0300 */  sra        $v1, $v1, 31
/* 5CB08 8006C308 10400000 */  mfhi       $t0
/* 5CB0C 8006C30C 03120800 */  sra        $v0, $t0, 8
/* 5CB10 8006C310 23104300 */  subu       $v0, $v0, $v1
/* 5CB14 8006C314 00140200 */  sll        $v0, $v0, 16
/* 5CB18 8006C318 03140200 */  sra        $v0, $v0, 16
/* 5CB1C 8006C31C 01004224 */  addiu      $v0, $v0, 0x1
/* 5CB20 8006C320 80180200 */  sll        $v1, $v0, 2
/* 5CB24 8006C324 21186200 */  addu       $v1, $v1, $v0
/* 5CB28 8006C328 C0190300 */  sll        $v1, $v1, 7
/* 5CB2C 8006C32C 23208300 */  subu       $a0, $a0, $v1
/* 5CB30 8006C330 2330C400 */  subu       $a2, $a2, $a0
.L8006C334:
/* 5CB34 8006C334 001C0600 */  sll        $v1, $a2, 16
/* 5CB38 8006C338 031C0300 */  sra        $v1, $v1, 16
/* 5CB3C 8006C33C 40110300 */  sll        $v0, $v1, 5
/* 5CB40 8006C340 23104300 */  subu       $v0, $v0, $v1
/* 5CB44 8006C344 80100200 */  sll        $v0, $v0, 2
/* 5CB48 8006C348 21104300 */  addu       $v0, $v0, $v1
/* 5CB4C 8006C34C C0100200 */  sll        $v0, $v0, 3
/* 5CB50 8006C350 1A004700 */  div        $zero, $v0, $a3
/* 5CB54 8006C354 12100000 */  mflo       $v0
/* 5CB58 8006C358 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 5CB5C 8006C35C 00140200 */  sll        $v0, $v0, 16
/* 5CB60 8006C360 03110200 */  sra        $v0, $v0, 4
/* 5CB64 8006C364 1B004300 */  divu       $zero, $v0, $v1
/* 5CB68 8006C368 12100000 */  mflo       $v0
/* 5CB6C 8006C36C 00000000 */  nop
/* 5CB70 8006C370 00140200 */  sll        $v0, $v0, 16
/* 5CB74 8006C374 03140200 */  sra        $v0, $v0, 16
/* 5CB78 8006C378 23100200 */  negu       $v0, $v0
/* 5CB7C 8006C37C E3B00108 */  j          .L8006C38C
/* 5CB80 8006C380 7C0102AE */   sw        $v0, 0x17C($s0)
.L8006C384:
/* 5CB84 8006C384 B40000AE */  sw         $zero, 0xB4($s0)
/* 5CB88 8006C388 BC0000AE */  sw         $zero, 0xBC($s0)
.L8006C38C:
/* 5CB8C 8006C38C 0000228E */  lw         $v0, 0x0($s1)
/* 5CB90 8006C390 2000033C */  lui        $v1, (0x200000 >> 16)
/* 5CB94 8006C394 24104300 */  and        $v0, $v0, $v1
/* 5CB98 8006C398 14004010 */  beqz       $v0, .L8006C3EC
/* 5CB9C 8006C39C 21200002 */   addu      $a0, $s0, $zero
/* 5CBA0 8006C3A0 4400228E */  lw         $v0, 0x44($s1)
/* 5CBA4 8006C3A4 7CFC0524 */  addiu      $a1, $zero, -0x384
/* 5CBA8 8006C3A8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 5CBAC 8006C3AC 45C0010C */  jal        PHYSOB_ReAlignFalling
/* 5CBB0 8006C3B0 440022AE */   sw        $v0, 0x44($s1)
/* 5CBB4 8006C3B4 05004014 */  bnez       $v0, .L8006C3CC
/* 5CBB8 8006C3B8 5FFF033C */   lui       $v1, (0xFF5FFFFF >> 16)
/* 5CBBC 8006C3BC 4400228E */  lw         $v0, 0x44($s1)
/* 5CBC0 8006C3C0 00000000 */  nop
/* 5CBC4 8006C3C4 0900401C */  bgtz       $v0, .L8006C3EC
/* 5CBC8 8006C3C8 00000000 */   nop
.L8006C3CC:
/* 5CBCC 8006C3CC FFFF6334 */  ori        $v1, $v1, (0xFF5FFFFF & 0xFFFF)
/* 5CBD0 8006C3D0 21200002 */  addu       $a0, $s0, $zero
/* 5CBD4 8006C3D4 0000228E */  lw         $v0, 0x0($s1)
/* 5CBD8 8006C3D8 07000524 */  addiu      $a1, $zero, 0x7
/* 5CBDC 8006C3DC 24104300 */  and        $v0, $v0, $v1
/* 5CBE0 8006C3E0 01004234 */  ori        $v0, $v0, 0x1
/* 5CBE4 8006C3E4 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5CBE8 8006C3E8 000022AE */   sw        $v0, 0x0($s1)
.L8006C3EC:
/* 5CBEC 8006C3EC 1C00028E */  lw         $v0, 0x1C($s0)
/* 5CBF0 8006C3F0 00000000 */  nop
/* 5CBF4 8006C3F4 0000428C */  lw         $v0, 0x0($v0)
/* 5CBF8 8006C3F8 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5CBFC 8006C3FC 24104300 */  and        $v0, $v0, $v1
/* 5CC00 8006C400 09004014 */  bnez       $v0, .L8006C428
/* 5CC04 8006C404 21200002 */   addu      $a0, $s0, $zero
/* 5CC08 8006C408 B0A3010C */  jal        CheckPhysObAbility
/* 5CC0C 8006C40C 08000524 */   addiu     $a1, $zero, 0x8
/* 5CC10 8006C410 05004014 */  bnez       $v0, .L8006C428
/* 5CC14 8006C414 21200002 */   addu      $a0, $s0, $zero
/* 5CC18 8006C418 D0BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 5CC1C 8006C41C E8030224 */  addiu      $v0, $zero, 0x3E8
/* 5CC20 8006C420 04006214 */  bne        $v1, $v0, .L8006C434
/* 5CC24 8006C424 00000000 */   nop
.L8006C428:
/* 5CC28 8006C428 4002A68E */  lw         $a2, 0x240($s5)
/* 5CC2C 8006C42C 4FDE010C */  jal        PhysicsMove
/* 5CC30 8006C430 5C008524 */   addiu     $a1, $a0, 0x5C
.L8006C434:
/* 5CC34 8006C434 7000BF8F */  lw         $ra, 0x70($sp)
/* 5CC38 8006C438 6C00B58F */  lw         $s5, 0x6C($sp)
/* 5CC3C 8006C43C 6800B48F */  lw         $s4, 0x68($sp)
/* 5CC40 8006C440 6400B38F */  lw         $s3, 0x64($sp)
/* 5CC44 8006C444 6000B28F */  lw         $s2, 0x60($sp)
/* 5CC48 8006C448 5C00B18F */  lw         $s1, 0x5C($sp)
/* 5CC4C 8006C44C 5800B08F */  lw         $s0, 0x58($sp)
/* 5CC50 8006C450 0800E003 */  jr         $ra
/* 5CC54 8006C454 7800BD27 */   addiu     $sp, $sp, 0x78
.size ProcessPhysicalObject, . - ProcessPhysicalObject
