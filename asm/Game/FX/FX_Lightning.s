.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Lightning
/* 3F8EC 8004F0EC 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 3F8F0 8004F0F0 8800BEAF */  sw         $fp, 0x88($sp)
/* 3F8F4 8004F0F4 A800BE8F */  lw         $fp, 0xA8($sp)
/* 3F8F8 8004F0F8 8400B7AF */  sw         $s7, 0x84($sp)
/* 3F8FC 8004F0FC AC00B78F */  lw         $s7, 0xAC($sp)
/* 3F900 8004F100 7800B4AF */  sw         $s4, 0x78($sp)
/* 3F904 8004F104 B000B48F */  lw         $s4, 0xB0($sp)
/* 3F908 8004F108 8000B6AF */  sw         $s6, 0x80($sp)
/* 3F90C 8004F10C B800B68F */  lw         $s6, 0xB8($sp)
/* 3F910 8004F110 6800B0AF */  sw         $s0, 0x68($sp)
/* 3F914 8004F114 21808000 */  addu       $s0, $a0, $zero
/* 3F918 8004F118 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 3F91C 8004F11C FF0FF130 */  andi       $s1, $a3, 0xFFF
/* 3F920 8004F120 8C00BFAF */  sw         $ra, 0x8C($sp)
/* 3F924 8004F124 7C00B5AF */  sw         $s5, 0x7C($sp)
/* 3F928 8004F128 7400B3AF */  sw         $s3, 0x74($sp)
/* 3F92C 8004F12C 7000B2AF */  sw         $s2, 0x70($sp)
/* 3F930 8004F130 9400A5AF */  sw         $a1, 0x94($sp)
/* 3F934 8004F134 0600C010 */  beqz       $a2, .L8004F150
/* 3F938 8004F138 9800A6AF */   sw        $a2, 0x98($sp)
/* 3F93C 8004F13C 52F2020C */  jal        func_800BC948
/* 3F940 8004F140 2120C000 */   addu      $a0, $a2, $zero
/* 3F944 8004F144 9800A48F */  lw         $a0, 0x98($sp)
/* 3F948 8004F148 573C0108 */  j          .L8004F15C
/* 3F94C 8004F14C 00000000 */   nop
.L8004F150:
/* 3F950 8004F150 52F2020C */  jal        func_800BC948
/* 3F954 8004F154 21200002 */   addu      $a0, $s0, $zero
/* 3F958 8004F158 21200002 */  addu       $a0, $s0, $zero
.L8004F15C:
/* 3F95C 8004F15C 4AF2020C */  jal        func_800BC928
/* 3F960 8004F160 FF7F1524 */   addiu     $s5, $zero, 0x7FFF
/* 3F964 8004F164 80101E00 */  sll        $v0, $fp, 2
/* 3F968 8004F168 21105E00 */  addu       $v0, $v0, $fp
/* 3F96C 8004F16C 80F10200 */  sll        $fp, $v0, 6
/* 3F970 8004F170 80101700 */  sll        $v0, $s7, 2
/* 3F974 8004F174 21105700 */  addu       $v0, $v0, $s7
/* 3F978 8004F178 80B90200 */  sll        $s7, $v0, 6
/* 3F97C 8004F17C 00100224 */  addiu      $v0, $zero, 0x1000
/* 3F980 8004F180 1A005400 */  div        $zero, $v0, $s4
/* 3F984 8004F184 12400000 */  mflo       $t0
/* 3F988 8004F188 21980000 */  addu       $s3, $zero, $zero
/* 3F98C 8004F18C 3000A0AF */  sw         $zero, 0x30($sp)
/* 3F990 8004F190 4000A0AF */  sw         $zero, 0x40($sp)
/* 3F994 8004F194 05018006 */  bltz       $s4, .L8004F5AC
/* 3F998 8004F198 5C00A8AF */   sw        $t0, 0x5C($sp)
/* 3F99C 8004F19C 6000B1AF */  sw         $s1, 0x60($sp)
.L8004F1A0:
/* 3F9A0 8004F1A0 5000A227 */  addiu      $v0, $sp, 0x50
/* 3F9A4 8004F1A4 00100624 */  addiu      $a2, $zero, 0x1000
/* 3F9A8 8004F1A8 2330D300 */  subu       $a2, $a2, $s3
/* 3F9AC 8004F1AC A000A48F */  lw         $a0, 0xA0($sp)
/* 3F9B0 8004F1B0 A400A58F */  lw         $a1, 0xA4($sp)
/* 3F9B4 8004F1B4 21386002 */  addu       $a3, $s3, $zero
/* 3F9B8 8004F1B8 86F3020C */  jal        func_800BCE18
/* 3F9BC 8004F1BC 1000A2AF */   sw        $v0, 0x10($sp)
/* 3F9C0 8004F1C0 C2271300 */  srl        $a0, $s3, 31
/* 3F9C4 8004F1C4 21206402 */  addu       $a0, $s3, $a0
/* 3F9C8 8004F1C8 D0E4010C */  jal        func_80079340
/* 3F9CC 8004F1CC 43200400 */   sra       $a0, $a0, 1
/* 3F9D0 8004F1D0 4200C012 */  beqz       $s6, .L8004F2DC
/* 3F9D4 8004F1D4 21904000 */   addu      $s2, $v0, $zero
/* 3F9D8 8004F1D8 40008012 */  beqz       $s4, .L8004F2DC
/* 3F9DC 8004F1DC 00000000 */   nop
/* 3F9E0 8004F1E0 9800A88F */  lw         $t0, 0x98($sp)
/* 3F9E4 8004F1E4 00000000 */  nop
/* 3F9E8 8004F1E8 40000015 */  bnez       $t0, .L8004F2EC
/* 3F9EC 8004F1EC 00000000 */   nop
/* 3F9F0 8004F1F0 D0E4010C */  jal        func_80079340
/* 3F9F4 8004F1F4 80201300 */   sll       $a0, $s3, 2
/* 3F9F8 8004F1F8 3AF2020C */  jal        func_800BC8E8
/* 3F9FC 8004F1FC 21804000 */   addu      $s0, $v0, $zero
/* 3FA00 8004F200 1A005600 */  div        $zero, $v0, $s6
/* 3FA04 8004F204 10180000 */  mfhi       $v1
/* 3FA08 8004F208 C2171600 */  srl        $v0, $s6, 31
/* 3FA0C 8004F20C 2110C202 */  addu       $v0, $s6, $v0
/* 3FA10 8004F210 43880200 */  sra        $s1, $v0, 1
/* 3FA14 8004F214 23187100 */  subu       $v1, $v1, $s1
/* 3FA18 8004F218 18007000 */  mult       $v1, $s0
/* 3FA1C 8004F21C 12180000 */  mflo       $v1
/* 3FA20 8004F220 02006104 */  bgez       $v1, .L8004F22C
/* 3FA24 8004F224 00000000 */   nop
/* 3FA28 8004F228 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004F22C:
/* 3FA2C 8004F22C 5000A297 */  lhu        $v0, 0x50($sp)
/* 3FA30 8004F230 031B0300 */  sra        $v1, $v1, 12
/* 3FA34 8004F234 21104300 */  addu       $v0, $v0, $v1
/* 3FA38 8004F238 3AF2020C */  jal        func_800BC8E8
/* 3FA3C 8004F23C 5000A2A7 */   sh        $v0, 0x50($sp)
/* 3FA40 8004F240 1A005600 */  div        $zero, $v0, $s6
/* 3FA44 8004F244 10180000 */  mfhi       $v1
/* 3FA48 8004F248 00000000 */  nop
/* 3FA4C 8004F24C 23187100 */  subu       $v1, $v1, $s1
/* 3FA50 8004F250 18007000 */  mult       $v1, $s0
/* 3FA54 8004F254 12180000 */  mflo       $v1
/* 3FA58 8004F258 02006104 */  bgez       $v1, .L8004F264
/* 3FA5C 8004F25C 00000000 */   nop
/* 3FA60 8004F260 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004F264:
/* 3FA64 8004F264 031B0300 */  sra        $v1, $v1, 12
/* 3FA68 8004F268 6000A88F */  lw         $t0, 0x60($sp)
/* 3FA6C 8004F26C 5200A297 */  lhu        $v0, 0x52($sp)
/* 3FA70 8004F270 21206802 */  addu       $a0, $s3, $t0
/* 3FA74 8004F274 21104300 */  addu       $v0, $v0, $v1
/* 3FA78 8004F278 D0E4010C */  jal        func_80079340
/* 3FA7C 8004F27C 5200A2A7 */   sh        $v0, 0x52($sp)
/* 3FA80 8004F280 3AF2020C */  jal        func_800BC8E8
/* 3FA84 8004F284 21804000 */   addu      $s0, $v0, $zero
/* 3FA88 8004F288 B400A88F */  lw         $t0, 0xB4($sp)
/* 3FA8C 8004F28C 00000000 */  nop
/* 3FA90 8004F290 18000802 */  mult       $s0, $t0
/* 3FA94 8004F294 12800000 */  mflo       $s0
/* 3FA98 8004F298 02000106 */  bgez       $s0, .L8004F2A4
/* 3FA9C 8004F29C 21184000 */   addu      $v1, $v0, $zero
/* 3FAA0 8004F2A0 FF0F1026 */  addiu      $s0, $s0, 0xFFF
.L8004F2A4:
/* 3FAA4 8004F2A4 03131000 */  sra        $v0, $s0, 12
/* 3FAA8 8004F2A8 18005200 */  mult       $v0, $s2
/* 3FAAC 8004F2AC 12200000 */  mflo       $a0
/* 3FAB0 8004F2B0 02008104 */  bgez       $a0, .L8004F2BC
/* 3FAB4 8004F2B4 00000000 */   nop
/* 3FAB8 8004F2B8 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8004F2BC:
/* 3FABC 8004F2BC 1A007600 */  div        $zero, $v1, $s6
/* 3FAC0 8004F2C0 10180000 */  mfhi       $v1
/* 3FAC4 8004F2C4 03230400 */  sra        $a0, $a0, 12
/* 3FAC8 8004F2C8 5400A297 */  lhu        $v0, 0x54($sp)
/* 3FACC 8004F2CC 23187100 */  subu       $v1, $v1, $s1
/* 3FAD0 8004F2D0 21208300 */  addu       $a0, $a0, $v1
/* 3FAD4 8004F2D4 21104400 */  addu       $v0, $v0, $a0
/* 3FAD8 8004F2D8 5400A2A7 */  sh         $v0, 0x54($sp)
.L8004F2DC:
/* 3FADC 8004F2DC 9800A88F */  lw         $t0, 0x98($sp)
/* 3FAE0 8004F2E0 00000000 */  nop
/* 3FAE4 8004F2E4 34000011 */  beqz       $t0, .L8004F3B8
/* 3FAE8 8004F2E8 5000A227 */   addiu     $v0, $sp, 0x50
.L8004F2EC:
/* 3FAEC 8004F2EC 6000A88F */  lw         $t0, 0x60($sp)
/* 3FAF0 8004F2F0 40121400 */  sll        $v0, $s4, 9
/* 3FAF4 8004F2F4 21880201 */  addu       $s1, $t0, $v0
/* 3FAF8 8004F2F8 DCE4010C */  jal        func_80079370
/* 3FAFC 8004F2FC 21202002 */   addu      $a0, $s1, $zero
/* 3FB00 8004F300 3AF2020C */  jal        func_800BC8E8
/* 3FB04 8004F304 21804000 */   addu      $s0, $v0, $zero
/* 3FB08 8004F308 B400A88F */  lw         $t0, 0xB4($sp)
/* 3FB0C 8004F30C 00000000 */  nop
/* 3FB10 8004F310 18000802 */  mult       $s0, $t0
/* 3FB14 8004F314 12800000 */  mflo       $s0
/* 3FB18 8004F318 02000106 */  bgez       $s0, .L8004F324
/* 3FB1C 8004F31C 21184000 */   addu      $v1, $v0, $zero
/* 3FB20 8004F320 FF0F1026 */  addiu      $s0, $s0, 0xFFF
.L8004F324:
/* 3FB24 8004F324 03131000 */  sra        $v0, $s0, 12
/* 3FB28 8004F328 07006330 */  andi       $v1, $v1, 0x7
/* 3FB2C 8004F32C 21104300 */  addu       $v0, $v0, $v1
/* 3FB30 8004F330 18005200 */  mult       $v0, $s2
/* 3FB34 8004F334 12100000 */  mflo       $v0
/* 3FB38 8004F338 02004104 */  bgez       $v0, .L8004F344
/* 3FB3C 8004F33C 00000000 */   nop
/* 3FB40 8004F340 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004F344:
/* 3FB44 8004F344 03130200 */  sra        $v0, $v0, 12
/* 3FB48 8004F348 21202002 */  addu       $a0, $s1, $zero
/* 3FB4C 8004F34C D0E4010C */  jal        func_80079340
/* 3FB50 8004F350 5000A2A7 */   sh        $v0, 0x50($sp)
/* 3FB54 8004F354 3AF2020C */  jal        func_800BC8E8
/* 3FB58 8004F358 21804000 */   addu      $s0, $v0, $zero
/* 3FB5C 8004F35C B400A88F */  lw         $t0, 0xB4($sp)
/* 3FB60 8004F360 00000000 */  nop
/* 3FB64 8004F364 18000802 */  mult       $s0, $t0
/* 3FB68 8004F368 12800000 */  mflo       $s0
/* 3FB6C 8004F36C 02000106 */  bgez       $s0, .L8004F378
/* 3FB70 8004F370 21184000 */   addu      $v1, $v0, $zero
/* 3FB74 8004F374 FF0F1026 */  addiu      $s0, $s0, 0xFFF
.L8004F378:
/* 3FB78 8004F378 03131000 */  sra        $v0, $s0, 12
/* 3FB7C 8004F37C 07006330 */  andi       $v1, $v1, 0x7
/* 3FB80 8004F380 21104300 */  addu       $v0, $v0, $v1
/* 3FB84 8004F384 18005200 */  mult       $v0, $s2
/* 3FB88 8004F388 12100000 */  mflo       $v0
/* 3FB8C 8004F38C 02004104 */  bgez       $v0, .L8004F398
/* 3FB90 8004F390 00000000 */   nop
/* 3FB94 8004F394 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004F398:
/* 3FB98 8004F398 03130200 */  sra        $v0, $v0, 12
/* 3FB9C 8004F39C 3AF2020C */  jal        func_800BC8E8
/* 3FBA0 8004F3A0 5200A2A7 */   sh        $v0, 0x52($sp)
/* 3FBA4 8004F3A4 5400A397 */  lhu        $v1, 0x54($sp)
/* 3FBA8 8004F3A8 07004230 */  andi       $v0, $v0, 0x7
/* 3FBAC 8004F3AC 21186200 */  addu       $v1, $v1, $v0
/* 3FBB0 8004F3B0 5400A3A7 */  sh         $v1, 0x54($sp)
/* 3FBB4 8004F3B4 5000A227 */  addiu      $v0, $sp, 0x50
.L8004F3B8:
/* 3FBB8 8004F3B8 000040C8 */  lwc2       $0, 0x0($v0)
/* 3FBBC 8004F3BC 040041C8 */  lwc2       $1, 0x4($v0)
/* 3FBC0 8004F3C0 00000000 */  nop
/* 3FBC4 8004F3C4 00000000 */  nop
/* 3FBC8 8004F3C8 0100184A */  RTPS
/* 3FBCC 8004F3CC 2800A227 */  addiu      $v0, $sp, 0x28
/* 3FBD0 8004F3D0 00004EE8 */  swc2       $14, 0x0($v0)
/* 3FBD4 8004F3D4 5800A227 */  addiu      $v0, $sp, 0x58
/* 3FBD8 8004F3D8 000053E8 */  swc2       $19, 0x0($v0)
/* 3FBDC 8004F3DC 5800A38F */  lw         $v1, 0x58($sp)
/* 3FBE0 8004F3E0 00000000 */  nop
/* 3FBE4 8004F3E4 2A10A302 */  slt        $v0, $s5, $v1
/* 3FBE8 8004F3E8 05004010 */  beqz       $v0, .L8004F400
/* 3FBEC 8004F3EC 21106000 */   addu      $v0, $v1, $zero
/* 3FBF0 8004F3F0 0600A106 */  bgez       $s5, .L8004F40C
/* 3FBF4 8004F3F4 2110A002 */   addu      $v0, $s5, $zero
/* 3FBF8 8004F3F8 033D0108 */  j          .L8004F40C
/* 3FBFC 8004F3FC 0300A226 */   addiu     $v0, $s5, 0x3
.L8004F400:
/* 3FC00 8004F400 02004104 */  bgez       $v0, .L8004F40C
/* 3FC04 8004F404 00000000 */   nop
/* 3FC08 8004F408 03004224 */  addiu      $v0, $v0, 0x3
.L8004F40C:
/* 3FC0C 8004F40C 37008012 */  beqz       $s4, .L8004F4EC
/* 3FC10 8004F410 83880200 */   sra       $s1, $v0, 2
/* 3FC14 8004F414 35006012 */  beqz       $s3, .L8004F4EC
/* 3FC18 8004F418 00000000 */   nop
/* 3FC1C 8004F41C 2800A387 */  lh         $v1, 0x28($sp)
/* 3FC20 8004F420 2000A287 */  lh         $v0, 0x20($sp)
/* 3FC24 8004F424 00000000 */  nop
/* 3FC28 8004F428 23906200 */  subu       $s2, $v1, $v0
/* 3FC2C 8004F42C 2A00A387 */  lh         $v1, 0x2A($sp)
/* 3FC30 8004F430 2200A287 */  lh         $v0, 0x22($sp)
/* 3FC34 8004F434 21204002 */  addu       $a0, $s2, $zero
/* 3FC38 8004F438 23806200 */  subu       $s0, $v1, $v0
/* 3FC3C 8004F43C E2E8000C */  jal        MATH3D_veclen2
/* 3FC40 8004F440 21280002 */   addu      $a1, $s0, $zero
/* 3FC44 8004F444 5800A38F */  lw         $v1, 0x58($sp)
/* 3FC48 8004F448 00000000 */  nop
/* 3FC4C 8004F44C 18004300 */  mult       $v0, $v1
/* 3FC50 8004F450 12180000 */  mflo       $v1
/* 3FC54 8004F454 00000000 */  nop
/* 3FC58 8004F458 0200601C */  bgtz       $v1, .L8004F464
/* 3FC5C 8004F45C 18001E02 */   mult      $s0, $fp
/* 3FC60 8004F460 01000324 */  addiu      $v1, $zero, 0x1
.L8004F464:
/* 3FC64 8004F464 12480000 */  mflo       $t1
/* 3FC68 8004F468 00000000 */  nop
/* 3FC6C 8004F46C 00000000 */  nop
/* 3FC70 8004F470 1A002301 */  div        $zero, $t1, $v1
/* 3FC74 8004F474 12300000 */  mflo       $a2
/* 3FC78 8004F478 00000000 */  nop
/* 3FC7C 8004F47C 00000000 */  nop
/* 3FC80 8004F480 18005E02 */  mult       $s2, $fp
/* 3FC84 8004F484 12480000 */  mflo       $t1
/* 3FC88 8004F488 00000000 */  nop
/* 3FC8C 8004F48C 00000000 */  nop
/* 3FC90 8004F490 1A002301 */  div        $zero, $t1, $v1
/* 3FC94 8004F494 12280000 */  mflo       $a1
/* 3FC98 8004F498 00000000 */  nop
/* 3FC9C 8004F49C 00000000 */  nop
/* 3FCA0 8004F4A0 18001702 */  mult       $s0, $s7
/* 3FCA4 8004F4A4 12480000 */  mflo       $t1
/* 3FCA8 8004F4A8 00000000 */  nop
/* 3FCAC 8004F4AC 00000000 */  nop
/* 3FCB0 8004F4B0 1A002301 */  div        $zero, $t1, $v1
/* 3FCB4 8004F4B4 12200000 */  mflo       $a0
/* 3FCB8 8004F4B8 00000000 */  nop
/* 3FCBC 8004F4BC 00000000 */  nop
/* 3FCC0 8004F4C0 18005702 */  mult       $s2, $s7
/* 3FCC4 8004F4C4 12480000 */  mflo       $t1
/* 3FCC8 8004F4C8 00000000 */  nop
/* 3FCCC 8004F4CC 00000000 */  nop
/* 3FCD0 8004F4D0 1A002301 */  div        $zero, $t1, $v1
/* 3FCD4 8004F4D4 12180000 */  mflo       $v1
/* 3FCD8 8004F4D8 3800A6A7 */  sh         $a2, 0x38($sp)
/* 3FCDC 8004F4DC 3A00A5A7 */  sh         $a1, 0x3A($sp)
/* 3FCE0 8004F4E0 4800A4A7 */  sh         $a0, 0x48($sp)
/* 3FCE4 8004F4E4 3D3D0108 */  j          .L8004F4F4
/* 3FCE8 8004F4E8 4A00A3A7 */   sh        $v1, 0x4A($sp)
.L8004F4EC:
/* 3FCEC 8004F4EC 3800A0AF */  sw         $zero, 0x38($sp)
/* 3FCF0 8004F4F0 4800A0AF */  sw         $zero, 0x48($sp)
.L8004F4F4:
/* 3FCF4 8004F4F4 22006012 */  beqz       $s3, .L8004F580
/* 3FCF8 8004F4F8 00000000 */   nop
/* 3FCFC 8004F4FC 2000201A */  blez       $s1, .L8004F580
/* 3FD00 8004F500 000C222A */   slti      $v0, $s1, 0xC00
/* 3FD04 8004F504 1E004010 */  beqz       $v0, .L8004F580
/* 3FD08 8004F508 00000000 */   nop
/* 3FD0C 8004F50C 0C00C013 */  beqz       $fp, .L8004F540
/* 3FD10 8004F510 21282002 */   addu      $a1, $s1, $zero
/* 3FD14 8004F514 2000A627 */  addiu      $a2, $sp, 0x20
/* 3FD18 8004F518 2800A727 */  addiu      $a3, $sp, 0x28
/* 3FD1C 8004F51C 9400A48F */  lw         $a0, 0x94($sp)
/* 3FD20 8004F520 C000A88F */  lw         $t0, 0xC0($sp)
/* 3FD24 8004F524 3000A227 */  addiu      $v0, $sp, 0x30
/* 3FD28 8004F528 1000A2AF */  sw         $v0, 0x10($sp)
/* 3FD2C 8004F52C 3800A227 */  addiu      $v0, $sp, 0x38
/* 3FD30 8004F530 1400A2AF */  sw         $v0, 0x14($sp)
/* 3FD34 8004F534 1800A8AF */  sw         $t0, 0x18($sp)
/* 3FD38 8004F538 D43B010C */  jal        FX_Draw_Glowing_Line
/* 3FD3C 8004F53C 1C00A8AF */   sw        $t0, 0x1C($sp)
.L8004F540:
/* 3FD40 8004F540 FBFF3126 */  addiu      $s1, $s1, -0x5
/* 3FD44 8004F544 0E00201A */  blez       $s1, .L8004F580
/* 3FD48 8004F548 00000000 */   nop
/* 3FD4C 8004F54C 0C00E012 */  beqz       $s7, .L8004F580
/* 3FD50 8004F550 21282002 */   addu      $a1, $s1, $zero
/* 3FD54 8004F554 2000A627 */  addiu      $a2, $sp, 0x20
/* 3FD58 8004F558 2800A727 */  addiu      $a3, $sp, 0x28
/* 3FD5C 8004F55C 9400A48F */  lw         $a0, 0x94($sp)
/* 3FD60 8004F560 BC00A88F */  lw         $t0, 0xBC($sp)
/* 3FD64 8004F564 4000A227 */  addiu      $v0, $sp, 0x40
/* 3FD68 8004F568 1000A2AF */  sw         $v0, 0x10($sp)
/* 3FD6C 8004F56C 4800A227 */  addiu      $v0, $sp, 0x48
/* 3FD70 8004F570 1400A2AF */  sw         $v0, 0x14($sp)
/* 3FD74 8004F574 1800A8AF */  sw         $t0, 0x18($sp)
/* 3FD78 8004F578 D43B010C */  jal        FX_Draw_Glowing_Line
/* 3FD7C 8004F57C 1C00A8AF */   sw        $t0, 0x1C($sp)
.L8004F580:
/* 3FD80 8004F580 FFFF9426 */  addiu      $s4, $s4, -0x1
/* 3FD84 8004F584 5C00A88F */  lw         $t0, 0x5C($sp)
/* 3FD88 8004F588 5800B58F */  lw         $s5, 0x58($sp)
/* 3FD8C 8004F58C 2800A28F */  lw         $v0, 0x28($sp)
/* 3FD90 8004F590 3800A38F */  lw         $v1, 0x38($sp)
/* 3FD94 8004F594 4800A48F */  lw         $a0, 0x48($sp)
/* 3FD98 8004F598 21986802 */  addu       $s3, $s3, $t0
/* 3FD9C 8004F59C 2000A2AF */  sw         $v0, 0x20($sp)
/* 3FDA0 8004F5A0 3000A3AF */  sw         $v1, 0x30($sp)
/* 3FDA4 8004F5A4 FEFE8106 */  bgez       $s4, .L8004F1A0
/* 3FDA8 8004F5A8 4000A4AF */   sw        $a0, 0x40($sp)
.L8004F5AC:
/* 3FDAC 8004F5AC 8C00BF8F */  lw         $ra, 0x8C($sp)
/* 3FDB0 8004F5B0 8800BE8F */  lw         $fp, 0x88($sp)
/* 3FDB4 8004F5B4 8400B78F */  lw         $s7, 0x84($sp)
/* 3FDB8 8004F5B8 8000B68F */  lw         $s6, 0x80($sp)
/* 3FDBC 8004F5BC 7C00B58F */  lw         $s5, 0x7C($sp)
/* 3FDC0 8004F5C0 7800B48F */  lw         $s4, 0x78($sp)
/* 3FDC4 8004F5C4 7400B38F */  lw         $s3, 0x74($sp)
/* 3FDC8 8004F5C8 7000B28F */  lw         $s2, 0x70($sp)
/* 3FDCC 8004F5CC 6C00B18F */  lw         $s1, 0x6C($sp)
/* 3FDD0 8004F5D0 6800B08F */  lw         $s0, 0x68($sp)
/* 3FDD4 8004F5D4 0800E003 */  jr         $ra
/* 3FDD8 8004F5D8 9000BD27 */   addiu     $sp, $sp, 0x90
.size FX_Lightning, . - FX_Lightning
