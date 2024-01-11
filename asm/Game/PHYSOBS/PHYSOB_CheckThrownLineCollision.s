.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckThrownLineCollision
/* 5F038 8006E838 38FFBD27 */  addiu      $sp, $sp, -0xC8
/* 5F03C 8006E83C BC00B3AF */  sw         $s3, 0xBC($sp)
/* 5F040 8006E840 21988000 */  addu       $s3, $a0, $zero
/* 5F044 8006E844 C000BFAF */  sw         $ra, 0xC0($sp)
/* 5F048 8006E848 B800B2AF */  sw         $s2, 0xB8($sp)
/* 5F04C 8006E84C B400B1AF */  sw         $s1, 0xB4($sp)
/* 5F050 8006E850 B000B0AF */  sw         $s0, 0xB0($sp)
/* 5F054 8006E854 4400638E */  lw         $v1, 0x44($s3)
/* 5F058 8006E858 00000000 */  nop
/* 5F05C 8006E85C 0E006010 */  beqz       $v1, .L8006E898
/* 5F060 8006E860 2188A000 */   addu      $s1, $a1, $zero
/* 5F064 8006E864 40006324 */  addiu      $v1, $v1, 0x40
/* 5F068 8006E868 14006294 */  lhu        $v0, 0x14($v1)
/* 5F06C 8006E86C 00000000 */  nop
/* 5F070 8006E870 6000A2A7 */  sh         $v0, 0x60($sp)
/* 5F074 8006E874 18006294 */  lhu        $v0, 0x18($v1)
/* 5F078 8006E878 00000000 */  nop
/* 5F07C 8006E87C 6200A2A7 */  sh         $v0, 0x62($sp)
/* 5F080 8006E880 1C006294 */  lhu        $v0, 0x1C($v1)
/* 5F084 8006E884 21206002 */  addu       $a0, $s3, $zero
/* 5F088 8006E888 7EB7010C */  jal        PhysObGetWeapon
/* 5F08C 8006E88C 6400A2A7 */   sh        $v0, 0x64($sp)
/* 5F090 8006E890 03004014 */  bnez       $v0, .L8006E8A0
/* 5F094 8006E894 00000000 */   nop
.L8006E898:
/* 5F098 8006E898 45BB0108 */  j          .L8006ED14
/* 5F09C 8006E89C 21100000 */   addu      $v0, $zero, $zero
.L8006E8A0:
/* 5F0A0 8006E8A0 0D004280 */  lb         $v0, 0xD($v0)
/* 5F0A4 8006E8A4 4000638E */  lw         $v1, 0x40($s3)
/* 5F0A8 8006E8A8 40110200 */  sll        $v0, $v0, 5
/* 5F0AC 8006E8AC 21186200 */  addu       $v1, $v1, $v0
/* 5F0B0 8006E8B0 14006294 */  lhu        $v0, 0x14($v1)
/* 5F0B4 8006E8B4 00000000 */  nop
/* 5F0B8 8006E8B8 5800A2A7 */  sh         $v0, 0x58($sp)
/* 5F0BC 8006E8BC 18006294 */  lhu        $v0, 0x18($v1)
/* 5F0C0 8006E8C0 00000000 */  nop
/* 5F0C4 8006E8C4 5A00A2A7 */  sh         $v0, 0x5A($sp)
/* 5F0C8 8006E8C8 1C006294 */  lhu        $v0, 0x1C($v1)
/* 5F0CC 8006E8CC 00000000 */  nop
/* 5F0D0 8006E8D0 5C00A2A7 */  sh         $v0, 0x5C($sp)
/* 5F0D4 8006E8D4 78002486 */  lh         $a0, 0x78($s1)
/* 5F0D8 8006E8D8 D0E4010C */  jal        func_80079340
/* 5F0DC 8006E8DC 00000000 */   nop
/* 5F0E0 8006E8E0 7000A2A7 */  sh         $v0, 0x70($sp)
/* 5F0E4 8006E8E4 78002486 */  lh         $a0, 0x78($s1)
/* 5F0E8 8006E8E8 DCE4010C */  jal        func_80079370
/* 5F0EC 8006E8EC 00000000 */   nop
/* 5F0F0 8006E8F0 23100200 */  negu       $v0, $v0
/* 5F0F4 8006E8F4 7200A2A7 */  sh         $v0, 0x72($sp)
/* 5F0F8 8006E8F8 7400A0A7 */  sh         $zero, 0x74($sp)
/* 5F0FC 8006E8FC 5C002496 */  lhu        $a0, 0x5C($s1)
/* 5F100 8006E900 6000A797 */  lhu        $a3, 0x60($sp)
/* 5F104 8006E904 7000A587 */  lh         $a1, 0x70($sp)
/* 5F108 8006E908 23208700 */  subu       $a0, $a0, $a3
/* 5F10C 8006E90C 001C0400 */  sll        $v1, $a0, 16
/* 5F110 8006E910 031C0300 */  sra        $v1, $v1, 16
/* 5F114 8006E914 18006500 */  mult       $v1, $a1
/* 5F118 8006E918 00140200 */  sll        $v0, $v0, 16
/* 5F11C 8006E91C 7800A4A7 */  sh         $a0, 0x78($sp)
/* 5F120 8006E920 5E002496 */  lhu        $a0, 0x5E($s1)
/* 5F124 8006E924 6200A397 */  lhu        $v1, 0x62($sp)
/* 5F128 8006E928 03140200 */  sra        $v0, $v0, 16
/* 5F12C 8006E92C 23208300 */  subu       $a0, $a0, $v1
/* 5F130 8006E930 12280000 */  mflo       $a1
/* 5F134 8006E934 001C0400 */  sll        $v1, $a0, 16
/* 5F138 8006E938 031C0300 */  sra        $v1, $v1, 16
/* 5F13C 8006E93C 18006200 */  mult       $v1, $v0
/* 5F140 8006E940 12180000 */  mflo       $v1
/* 5F144 8006E944 2180A300 */  addu       $s0, $a1, $v1
/* 5F148 8006E948 3A00001A */  blez       $s0, .L8006EA34
/* 5F14C 8006E94C 7A00A4A7 */   sh        $a0, 0x7A($sp)
/* 5F150 8006E950 5800A327 */  addiu      $v1, $sp, 0x58
/* 5F154 8006E954 6000B227 */  addiu      $s2, $sp, 0x60
/* 5F158 8006E958 7000B127 */  addiu      $s1, $sp, 0x70
/* 5F15C 8006E95C 5800A497 */  lhu        $a0, 0x58($sp)
/* 5F160 8006E960 02006294 */  lhu        $v0, 0x2($v1)
/* 5F164 8006E964 04006394 */  lhu        $v1, 0x4($v1)
/* 5F168 8006E968 02004596 */  lhu        $a1, 0x2($s2)
/* 5F16C 8006E96C 04004696 */  lhu        $a2, 0x4($s2)
/* 5F170 8006E970 23208700 */  subu       $a0, $a0, $a3
/* 5F174 8006E974 23104500 */  subu       $v0, $v0, $a1
/* 5F178 8006E978 23186600 */  subu       $v1, $v1, $a2
/* 5F17C 8006E97C 7000A4A7 */  sh         $a0, 0x70($sp)
/* 5F180 8006E980 00240400 */  sll        $a0, $a0, 16
/* 5F184 8006E984 020022A6 */  sh         $v0, 0x2($s1)
/* 5F188 8006E988 040023A6 */  sh         $v1, 0x4($s1)
/* 5F18C 8006E98C 7200A587 */  lh         $a1, 0x72($sp)
/* 5F190 8006E990 EBE6000C */  jal        MATH3D_LengthXY
/* 5F194 8006E994 03240400 */   sra       $a0, $a0, 16
/* 5F198 8006E998 1A000202 */  div        $zero, $s0, $v0
/* 5F19C 8006E99C 12180000 */  mflo       $v1
/* 5F1A0 8006E9A0 7000A287 */  lh         $v0, 0x70($sp)
/* 5F1A4 8006E9A4 00000000 */  nop
/* 5F1A8 8006E9A8 18004300 */  mult       $v0, $v1
/* 5F1AC 8006E9AC 12200000 */  mflo       $a0
/* 5F1B0 8006E9B0 02008104 */  bgez       $a0, .L8006E9BC
/* 5F1B4 8006E9B4 00000000 */   nop
/* 5F1B8 8006E9B8 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8006E9BC:
/* 5F1BC 8006E9BC 7200A287 */  lh         $v0, 0x72($sp)
/* 5F1C0 8006E9C0 00000000 */  nop
/* 5F1C4 8006E9C4 18004300 */  mult       $v0, $v1
/* 5F1C8 8006E9C8 033B0400 */  sra        $a3, $a0, 12
/* 5F1CC 8006E9CC 12280000 */  mflo       $a1
/* 5F1D0 8006E9D0 0200A104 */  bgez       $a1, .L8006E9DC
/* 5F1D4 8006E9D4 7000A7A7 */   sh        $a3, 0x70($sp)
/* 5F1D8 8006E9D8 FF0FA524 */  addiu      $a1, $a1, 0xFFF
.L8006E9DC:
/* 5F1DC 8006E9DC 7400A287 */  lh         $v0, 0x74($sp)
/* 5F1E0 8006E9E0 00000000 */  nop
/* 5F1E4 8006E9E4 18004300 */  mult       $v0, $v1
/* 5F1E8 8006E9E8 03130500 */  sra        $v0, $a1, 12
/* 5F1EC 8006E9EC 12180000 */  mflo       $v1
/* 5F1F0 8006E9F0 02006104 */  bgez       $v1, .L8006E9FC
/* 5F1F4 8006E9F4 7200A2A7 */   sh        $v0, 0x72($sp)
/* 5F1F8 8006E9F8 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8006E9FC:
/* 5F1FC 8006E9FC 03130300 */  sra        $v0, $v1, 12
/* 5F200 8006EA00 7400A2A7 */  sh         $v0, 0x74($sp)
/* 5F204 8006EA04 6000A297 */  lhu        $v0, 0x60($sp)
/* 5F208 8006EA08 02004396 */  lhu        $v1, 0x2($s2)
/* 5F20C 8006EA0C 04004496 */  lhu        $a0, 0x4($s2)
/* 5F210 8006EA10 02002596 */  lhu        $a1, 0x2($s1)
/* 5F214 8006EA14 04002696 */  lhu        $a2, 0x4($s1)
/* 5F218 8006EA18 21104700 */  addu       $v0, $v0, $a3
/* 5F21C 8006EA1C 21186500 */  addu       $v1, $v1, $a1
/* 5F220 8006EA20 21208600 */  addu       $a0, $a0, $a2
/* 5F224 8006EA24 6000A2A7 */  sh         $v0, 0x60($sp)
/* 5F228 8006EA28 020043A6 */  sh         $v1, 0x2($s2)
/* 5F22C 8006EA2C 93BA0108 */  j          .L8006EA4C
/* 5F230 8006EA30 040044A6 */   sh        $a0, 0x4($s2)
.L8006EA34:
/* 5F234 8006EA34 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5F238 8006EA38 00000000 */  nop
/* 5F23C 8006EA3C 6000A2A7 */  sh         $v0, 0x60($sp)
/* 5F240 8006EA40 5E002296 */  lhu        $v0, 0x5E($s1)
/* 5F244 8006EA44 00000000 */  nop
/* 5F248 8006EA48 6200A2A7 */  sh         $v0, 0x62($sp)
.L8006EA4C:
/* 5F24C 8006EA4C 21206002 */  addu       $a0, $s3, $zero
/* 5F250 8006EA50 5800A227 */  addiu      $v0, $sp, 0x58
/* 5F254 8006EA54 00020524 */  addiu      $a1, $zero, 0x200
/* 5F258 8006EA58 5800A697 */  lhu        $a2, 0x58($sp)
/* 5F25C 8006EA5C 02004394 */  lhu        $v1, 0x2($v0)
/* 5F260 8006EA60 04004794 */  lhu        $a3, 0x4($v0)
/* 5F264 8006EA64 6800A227 */  addiu      $v0, $sp, 0x68
/* 5F268 8006EA68 6800A6A7 */  sh         $a2, 0x68($sp)
/* 5F26C 8006EA6C 020043A4 */  sh         $v1, 0x2($v0)
/* 5F270 8006EA70 040047A4 */  sh         $a3, 0x4($v0)
/* 5F274 8006EA74 6000A797 */  lhu        $a3, 0x60($sp)
/* 5F278 8006EA78 5A00A297 */  lhu        $v0, 0x5A($sp)
/* 5F27C 8006EA7C 6200A897 */  lhu        $t0, 0x62($sp)
/* 5F280 8006EA80 2330C700 */  subu       $a2, $a2, $a3
/* 5F284 8006EA84 23104800 */  subu       $v0, $v0, $t0
/* 5F288 8006EA88 40180600 */  sll        $v1, $a2, 1
/* 5F28C 8006EA8C 7800A6A7 */  sh         $a2, 0x78($sp)
/* 5F290 8006EA90 2130C300 */  addu       $a2, $a2, $v1
/* 5F294 8006EA94 2138E600 */  addu       $a3, $a3, $a2
/* 5F298 8006EA98 40180200 */  sll        $v1, $v0, 1
/* 5F29C 8006EA9C 7A00A2A7 */  sh         $v0, 0x7A($sp)
/* 5F2A0 8006EAA0 21104300 */  addu       $v0, $v0, $v1
/* 5F2A4 8006EAA4 21400201 */  addu       $t0, $t0, $v0
/* 5F2A8 8006EAA8 5800A7A7 */  sh         $a3, 0x58($sp)
/* 5F2AC 8006EAAC B0A3010C */  jal        CheckPhysObAbility
/* 5F2B0 8006EAB0 5A00A8A7 */   sh        $t0, 0x5A($sp)
/* 5F2B4 8006EAB4 0F004014 */  bnez       $v0, .L8006EAF4
/* 5F2B8 8006EAB8 21206002 */   addu      $a0, $s3, $zero
/* 5F2BC 8006EABC CFA3010C */  jal        CheckPhysObFamily
/* 5F2C0 8006EAC0 07000524 */   addiu     $a1, $zero, 0x7
/* 5F2C4 8006EAC4 0B004014 */  bnez       $v0, .L8006EAF4
/* 5F2C8 8006EAC8 21206002 */   addu      $a0, $s3, $zero
/* 5F2CC 8006EACC 7800A297 */  lhu        $v0, 0x78($sp)
/* 5F2D0 8006EAD0 6000A397 */  lhu        $v1, 0x60($sp)
/* 5F2D4 8006EAD4 40100200 */  sll        $v0, $v0, 1
/* 5F2D8 8006EAD8 21186200 */  addu       $v1, $v1, $v0
/* 5F2DC 8006EADC 7A00A297 */  lhu        $v0, 0x7A($sp)
/* 5F2E0 8006EAE0 6800A3A7 */  sh         $v1, 0x68($sp)
/* 5F2E4 8006EAE4 6200A397 */  lhu        $v1, 0x62($sp)
/* 5F2E8 8006EAE8 40100200 */  sll        $v0, $v0, 1
/* 5F2EC 8006EAEC 21186200 */  addu       $v1, $v1, $v0
/* 5F2F0 8006EAF0 6A00A3A7 */  sh         $v1, 0x6A($sp)
.L8006EAF4:
/* 5F2F4 8006EAF4 2800A527 */  addiu      $a1, $sp, 0x28
/* 5F2F8 8006EAF8 5800A227 */  addiu      $v0, $sp, 0x58
/* 5F2FC 8006EAFC 3C00A2AF */  sw         $v0, 0x3C($sp)
/* 5F300 8006EB00 6000A227 */  addiu      $v0, $sp, 0x60
/* 5F304 8006EB04 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5F308 8006EB08 4000A2AF */   sw        $v0, 0x40($sp)
/* 5F30C 8006EB0C 2800A387 */  lh         $v1, 0x28($sp)
/* 5F310 8006EB10 00000000 */  nop
/* 5F314 8006EB14 7F006010 */  beqz       $v1, .L8006ED14
/* 5F318 8006EB18 21100000 */   addu      $v0, $zero, $zero
/* 5F31C 8006EB1C 03000224 */  addiu      $v0, $zero, 0x3
/* 5F320 8006EB20 16006214 */  bne        $v1, $v0, .L8006EB7C
/* 5F324 8006EB24 21206002 */   addu      $a0, $s3, $zero
/* 5F328 8006EB28 2C00A48F */  lw         $a0, 0x2C($sp)
/* 5F32C 8006EB2C 3000A58F */  lw         $a1, 0x30($sp)
/* 5F330 8006EB30 11008010 */  beqz       $a0, .L8006EB78
/* 5F334 8006EB34 00000000 */   nop
/* 5F338 8006EB38 0F00A010 */  beqz       $a1, .L8006EB78
/* 5F33C 8006EB3C FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 5F340 8006EB40 0A008394 */  lhu        $v1, 0xA($a0)
/* 5F344 8006EB44 00000000 */  nop
/* 5F348 8006EB48 0B006210 */  beq        $v1, $v0, .L8006EB78
/* 5F34C 8006EB4C 00000000 */   nop
/* 5F350 8006EB50 0000A28C */  lw         $v0, 0x0($a1)
/* 5F354 8006EB54 00000000 */  nop
/* 5F358 8006EB58 3400428C */  lw         $v0, 0x34($v0)
/* 5F35C 8006EB5C 00000000 */  nop
/* 5F360 8006EB60 21104300 */  addu       $v0, $v0, $v1
/* 5F364 8006EB64 0A004294 */  lhu        $v0, 0xA($v0)
/* 5F368 8006EB68 00000000 */  nop
/* 5F36C 8006EB6C 00104230 */  andi       $v0, $v0, 0x1000
/* 5F370 8006EB70 68004014 */  bnez       $v0, .L8006ED14
/* 5F374 8006EB74 21100000 */   addu      $v0, $zero, $zero
.L8006EB78:
/* 5F378 8006EB78 21206002 */  addu       $a0, $s3, $zero
.L8006EB7C:
/* 5F37C 8006EB7C 6800A527 */  addiu      $a1, $sp, 0x68
/* 5F380 8006EB80 5800A227 */  addiu      $v0, $sp, 0x58
/* 5F384 8006EB84 5C006726 */  addiu      $a3, $s3, 0x5C
/* 5F388 8006EB88 5800A897 */  lhu        $t0, 0x58($sp)
/* 5F38C 8006EB8C 02004994 */  lhu        $t1, 0x2($v0)
/* 5F390 8006EB90 04004A94 */  lhu        $t2, 0x4($v0)
/* 5F394 8006EB94 6800A297 */  lhu        $v0, 0x68($sp)
/* 5F398 8006EB98 0200A394 */  lhu        $v1, 0x2($a1)
/* 5F39C 8006EB9C 0400A694 */  lhu        $a2, 0x4($a1)
/* 5F3A0 8006EBA0 23400201 */  subu       $t0, $t0, $v0
/* 5F3A4 8006EBA4 23482301 */  subu       $t1, $t1, $v1
/* 5F3A8 8006EBA8 23504601 */  subu       $t2, $t2, $a2
/* 5F3AC 8006EBAC 6800A8A7 */  sh         $t0, 0x68($sp)
/* 5F3B0 8006EBB0 0200A9A4 */  sh         $t1, 0x2($a1)
/* 5F3B4 8006EBB4 0400AAA4 */  sh         $t2, 0x4($a1)
/* 5F3B8 8006EBB8 5C006296 */  lhu        $v0, 0x5C($s3)
/* 5F3BC 8006EBBC 0200E394 */  lhu        $v1, 0x2($a3)
/* 5F3C0 8006EBC0 0400E694 */  lhu        $a2, 0x4($a3)
/* 5F3C4 8006EBC4 21104800 */  addu       $v0, $v0, $t0
/* 5F3C8 8006EBC8 21186900 */  addu       $v1, $v1, $t1
/* 5F3CC 8006EBCC 2130CA00 */  addu       $a2, $a2, $t2
/* 5F3D0 8006EBD0 5C0062A6 */  sh         $v0, 0x5C($s3)
/* 5F3D4 8006EBD4 0200E3A4 */  sh         $v1, 0x2($a3)
/* 5F3D8 8006EBD8 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 5F3DC 8006EBDC 0400E6A4 */   sh        $a2, 0x4($a3)
/* 5F3E0 8006EBE0 21206002 */  addu       $a0, $s3, $zero
/* 5F3E4 8006EBE4 6C01708E */  lw         $s0, 0x16C($s3)
/* 5F3E8 8006EBE8 B0A3010C */  jal        CheckPhysObAbility
/* 5F3EC 8006EBEC 00100524 */   addiu     $a1, $zero, 0x1000
/* 5F3F0 8006EBF0 1C004010 */  beqz       $v0, .L8006EC64
/* 5F3F4 8006EBF4 8000033C */   lui       $v1, (0x800000 >> 16)
/* 5F3F8 8006EBF8 0000028E */  lw         $v0, 0x0($s0)
/* 5F3FC 8006EBFC 00000000 */  nop
/* 5F400 8006EC00 24104300 */  and        $v0, $v0, $v1
/* 5F404 8006EC04 18004014 */  bnez       $v0, .L8006EC68
/* 5F408 8006EC08 21880000 */   addu      $s1, $zero, $zero
/* 5F40C 8006EC0C D0BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 5F410 8006EC10 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 5F414 8006EC14 14006214 */  bne        $v1, $v0, .L8006EC68
/* 5F418 8006EC18 00000000 */   nop
/* 5F41C 8006EC1C B5B7010C */  jal        PhysObGetSplinter
/* 5F420 8006EC20 21206002 */   addu      $a0, $s3, $zero
/* 5F424 8006EC24 02004010 */  beqz       $v0, .L8006EC30
/* 5F428 8006EC28 21180000 */   addu      $v1, $zero, $zero
/* 5F42C 8006EC2C 0400438C */  lw         $v1, 0x4($v0)
.L8006EC30:
/* 5F430 8006EC30 21206002 */  addu       $a0, $s3, $zero
/* 5F434 8006EC34 21280000 */  addu       $a1, $zero, $zero
/* 5F438 8006EC38 2130A000 */  addu       $a2, $a1, $zero
/* 5F43C 8006EC3C 44BA828F */  lw         $v0, %gp_rel(gFXT)($gp)
/* 5F440 8006EC40 2138A000 */  addu       $a3, $a1, $zero
/* 5F444 8006EC44 1000A3AF */  sw         $v1, 0x10($sp)
/* 5F448 8006EC48 1800A0AF */  sw         $zero, 0x18($sp)
/* 5F44C 8006EC4C 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 5F450 8006EC50 2000A0AF */  sw         $zero, 0x20($sp)
/* 5F454 8006EC54 9211010C */  jal        _FX_BuildSplinters
/* 5F458 8006EC58 1400A2AF */   sw        $v0, 0x14($sp)
/* 5F45C 8006EC5C 39D1000C */  jal        INSTANCE_PlainDeath
/* 5F460 8006EC60 21206002 */   addu      $a0, $s3, $zero
.L8006EC64:
/* 5F464 8006EC64 21880000 */  addu       $s1, $zero, $zero
.L8006EC68:
/* 5F468 8006EC68 2800A387 */  lh         $v1, 0x28($sp)
/* 5F46C 8006EC6C 03000224 */  addiu      $v0, $zero, 0x3
/* 5F470 8006EC70 04006214 */  bne        $v1, $v0, .L8006EC84
/* 5F474 8006EC74 21902002 */   addu      $s2, $s1, $zero
/* 5F478 8006EC78 2C00B28F */  lw         $s2, 0x2C($sp)
/* 5F47C 8006EC7C 23BB0108 */  j          .L8006EC8C
/* 5F480 8006EC80 21206002 */   addu      $a0, $s3, $zero
.L8006EC84:
/* 5F484 8006EC84 3000B18F */  lw         $s1, 0x30($sp)
/* 5F488 8006EC88 21206002 */  addu       $a0, $s3, $zero
.L8006EC8C:
/* 5F48C 8006EC8C 7800B027 */  addiu      $s0, $sp, 0x78
/* 5F490 8006EC90 3000A28F */  lw         $v0, 0x30($sp)
/* 5F494 8006EC94 2A00A397 */  lhu        $v1, 0x2A($sp)
/* 5F498 8006EC98 21280002 */  addu       $a1, $s0, $zero
/* 5F49C 8006EC9C 8000A2AF */  sw         $v0, 0x80($sp)
/* 5F4A0 8006ECA0 52B5010C */  jal        GetObliqueDirection
/* 5F4A4 8006ECA4 AE00A3A7 */   sh        $v1, 0xAE($sp)
/* 5F4A8 8006ECA8 21206002 */  addu       $a0, $s3, $zero
/* 5F4AC 8006ECAC 21282002 */  addu       $a1, $s1, $zero
/* 5F4B0 8006ECB0 21304002 */  addu       $a2, $s2, $zero
/* 5F4B4 8006ECB4 8000A727 */  addiu      $a3, $sp, 0x80
/* 5F4B8 8006ECB8 1000B0AF */  sw         $s0, 0x10($sp)
/* 5F4BC 8006ECBC B7B4010C */  jal        CheckForceCollision
/* 5F4C0 8006ECC0 1400A2AF */   sw        $v0, 0x14($sp)
/* 5F4C4 8006ECC4 2800A387 */  lh         $v1, 0x28($sp)
/* 5F4C8 8006ECC8 03000224 */  addiu      $v0, $zero, 0x3
/* 5F4CC 8006ECCC 03006210 */  beq        $v1, $v0, .L8006ECDC
/* 5F4D0 8006ECD0 00000000 */   nop
/* 5F4D4 8006ECD4 45BB0108 */  j          .L8006ED14
/* 5F4D8 8006ECD8 02000224 */   addiu     $v0, $zero, 0x2
.L8006ECDC:
/* 5F4DC 8006ECDC 2A00A487 */  lh         $a0, 0x2A($sp)
/* 5F4E0 8006ECE0 3000A28F */  lw         $v0, 0x30($sp)
/* 5F4E4 8006ECE4 C0180400 */  sll        $v1, $a0, 3
/* 5F4E8 8006ECE8 0000428C */  lw         $v0, 0x0($v0)
/* 5F4EC 8006ECEC 21186400 */  addu       $v1, $v1, $a0
/* 5F4F0 8006ECF0 4800428C */  lw         $v0, 0x48($v0)
/* 5F4F4 8006ECF4 80180300 */  sll        $v1, $v1, 2
/* 5F4F8 8006ECF8 21104300 */  addu       $v0, $v0, $v1
/* 5F4FC 8006ECFC 12004394 */  lhu        $v1, 0x12($v0)
/* 5F500 8006ED00 00000000 */  nop
/* 5F504 8006ED04 01006330 */  andi       $v1, $v1, 0x1
/* 5F508 8006ED08 02006014 */  bnez       $v1, .L8006ED14
/* 5F50C 8006ED0C 03000224 */   addiu     $v0, $zero, 0x3
/* 5F510 8006ED10 01000224 */  addiu      $v0, $zero, 0x1
.L8006ED14:
/* 5F514 8006ED14 C000BF8F */  lw         $ra, 0xC0($sp)
/* 5F518 8006ED18 BC00B38F */  lw         $s3, 0xBC($sp)
/* 5F51C 8006ED1C B800B28F */  lw         $s2, 0xB8($sp)
/* 5F520 8006ED20 B400B18F */  lw         $s1, 0xB4($sp)
/* 5F524 8006ED24 B000B08F */  lw         $s0, 0xB0($sp)
/* 5F528 8006ED28 0800E003 */  jr         $ra
/* 5F52C 8006ED2C C800BD27 */   addiu     $sp, $sp, 0xC8
.size PHYSOB_CheckThrownLineCollision, . - PHYSOB_CheckThrownLineCollision
