.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel STREAM_GetClipRect
/* 4F1F0 8005E9F0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 4F1F4 8005E9F4 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 4F1F8 8005E9F8 21A88000 */  addu       $s5, $a0, $zero
/* 4F1FC 8005E9FC 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 4F200 8005EA00 4800BEAF */  sw         $fp, 0x48($sp)
/* 4F204 8005EA04 4400B7AF */  sw         $s7, 0x44($sp)
/* 4F208 8005EA08 4000B6AF */  sw         $s6, 0x40($sp)
/* 4F20C 8005EA0C 3800B4AF */  sw         $s4, 0x38($sp)
/* 4F210 8005EA10 3400B3AF */  sw         $s3, 0x34($sp)
/* 4F214 8005EA14 3000B2AF */  sw         $s2, 0x30($sp)
/* 4F218 8005EA18 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 4F21C 8005EA1C 2800B0AF */  sw         $s0, 0x28($sp)
/* 4F220 8005EA20 2400A0AF */  sw         $zero, 0x24($sp)
/* 4F224 8005EA24 3000AB86 */  lh         $t3, 0x30($s5)
/* 4F228 8005EA28 3800A686 */  lh         $a2, 0x38($s5)
/* 4F22C 8005EA2C 2198A000 */  addu       $s3, $a1, $zero
/* 4F230 8005EA30 06006615 */  bne        $t3, $a2, .L8005EA4C
/* 4F234 8005EA34 2000A0AF */   sw        $zero, 0x20($sp)
/* 4F238 8005EA38 4000A286 */  lh         $v0, 0x40($s5)
/* 4F23C 8005EA3C 00000000 */  nop
/* 4F240 8005EA40 26106201 */  xor        $v0, $t3, $v0
/* 4F244 8005EA44 0100422C */  sltiu      $v0, $v0, 0x1
/* 4F248 8005EA48 2000A2AF */  sw         $v0, 0x20($sp)
.L8005EA4C:
/* 4F24C 8005EA4C 2E00A586 */  lh         $a1, 0x2E($s5)
/* 4F250 8005EA50 3600A286 */  lh         $v0, 0x36($s5)
/* 4F254 8005EA54 4000A386 */  lh         $v1, 0x40($s5)
/* 4F258 8005EA58 2350A200 */  subu       $t2, $a1, $v0
/* 4F25C 8005EA5C 23486301 */  subu       $t1, $t3, $v1
/* 4F260 8005EA60 18004901 */  mult       $t2, $t1
/* 4F264 8005EA64 3E00A286 */  lh         $v0, 0x3E($s5)
/* 4F268 8005EA68 12600000 */  mflo       $t4
/* 4F26C 8005EA6C 23386601 */  subu       $a3, $t3, $a2
/* 4F270 8005EA70 2318A200 */  subu       $v1, $a1, $v0
/* 4F274 8005EA74 18006700 */  mult       $v1, $a3
/* 4F278 8005EA78 2C00A486 */  lh         $a0, 0x2C($s5)
/* 4F27C 8005EA7C 3C00A286 */  lh         $v0, 0x3C($s5)
/* 4F280 8005EA80 12300000 */  mflo       $a2
/* 4F284 8005EA84 23408200 */  subu       $t0, $a0, $v0
/* 4F288 8005EA88 00000000 */  nop
/* 4F28C 8005EA8C 18000701 */  mult       $t0, $a3
/* 4F290 8005EA90 3400A286 */  lh         $v0, 0x34($s5)
/* 4F294 8005EA94 12380000 */  mflo       $a3
/* 4F298 8005EA98 23108200 */  subu       $v0, $a0, $v0
/* 4F29C 8005EA9C 00000000 */  nop
/* 4F2A0 8005EAA0 18004900 */  mult       $v0, $t1
/* 4F2A4 8005EAA4 12800000 */  mflo       $s0
/* 4F2A8 8005EAA8 00000000 */  nop
/* 4F2AC 8005EAAC 00000000 */  nop
/* 4F2B0 8005EAB0 18004300 */  mult       $v0, $v1
/* 4F2B4 8005EAB4 12480000 */  mflo       $t1
/* 4F2B8 8005EAB8 00000000 */  nop
/* 4F2BC 8005EABC 00000000 */  nop
/* 4F2C0 8005EAC0 18000A01 */  mult       $t0, $t2
/* 4F2C4 8005EAC4 23108601 */  subu       $v0, $t4, $a2
/* 4F2C8 8005EAC8 90AC8387 */  lh         $v1, %gp_rel(theCamera)($gp)
/* 4F2CC 8005EACC 12400000 */  mflo       $t0
/* 4F2D0 8005EAD0 03BB0200 */  sra        $s7, $v0, 12
/* 4F2D4 8005EAD4 23208300 */  subu       $a0, $a0, $v1
/* 4F2D8 8005EAD8 18009700 */  mult       $a0, $s7
/* 4F2DC 8005EADC 2310F000 */  subu       $v0, $a3, $s0
/* 4F2E0 8005EAE0 92AC8387 */  lh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 4F2E4 8005EAE4 12500000 */  mflo       $t2
/* 4F2E8 8005EAE8 03B30200 */  sra        $s6, $v0, 12
/* 4F2EC 8005EAEC 2328A300 */  subu       $a1, $a1, $v1
/* 4F2F0 8005EAF0 1800B600 */  mult       $a1, $s6
/* 4F2F4 8005EAF4 94AC8287 */  lh         $v0, %gp_rel(theCamera + 0x4)($gp)
/* 4F2F8 8005EAF8 00000000 */  nop
/* 4F2FC 8005EAFC 23106201 */  subu       $v0, $t3, $v0
/* 4F300 8005EB00 12300000 */  mflo       $a2
/* 4F304 8005EB04 23182801 */  subu       $v1, $t1, $t0
/* 4F308 8005EB08 031B0300 */  sra        $v1, $v1, 12
/* 4F30C 8005EB0C 18004300 */  mult       $v0, $v1
/* 4F310 8005EB10 12380000 */  mflo       $a3
/* 4F314 8005EB14 00000000 */  nop
/* 4F318 8005EB18 00000000 */  nop
/* 4F31C 8005EB1C 1800F702 */  mult       $s7, $s7
/* 4F320 8005EB20 12200000 */  mflo       $a0
/* 4F324 8005EB24 00000000 */  nop
/* 4F328 8005EB28 00000000 */  nop
/* 4F32C 8005EB2C 1800D602 */  mult       $s6, $s6
/* 4F330 8005EB30 1800A3AF */  sw         $v1, 0x18($sp)
/* 4F334 8005EB34 1800AF8F */  lw         $t7, 0x18($sp)
/* 4F338 8005EB38 12180000 */  mflo       $v1
/* 4F33C 8005EB3C 21C0E001 */  addu       $t8, $t7, $zero
/* 4F340 8005EB40 00000000 */  nop
/* 4F344 8005EB44 1800F801 */  mult       $t7, $t8
/* 4F348 8005EB48 21104601 */  addu       $v0, $t2, $a2
/* 4F34C 8005EB4C 21104700 */  addu       $v0, $v0, $a3
/* 4F350 8005EB50 23F00200 */  negu       $fp, $v0
/* 4F354 8005EB54 21208300 */  addu       $a0, $a0, $v1
/* 4F358 8005EB58 12280000 */  mflo       $a1
/* 4F35C 8005EB5C 6EE7000C */  jal        MATH3D_FastSqrt
/* 4F360 8005EB60 21208500 */   addu      $a0, $a0, $a1
/* 4F364 8005EB64 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 4F368 8005EB68 1C00AF8F */  lw         $t7, 0x1C($sp)
/* 4F36C 8005EB6C 0200C107 */  bgez       $fp, .L8005EB78
/* 4F370 8005EB70 2110C003 */   addu      $v0, $fp, $zero
/* 4F374 8005EB74 23100200 */  negu       $v0, $v0
.L8005EB78:
/* 4F378 8005EB78 2A104F00 */  slt        $v0, $v0, $t7
/* 4F37C 8005EB7C 4C004010 */  beqz       $v0, .L8005ECB0
/* 4F380 8005EB80 2120A002 */   addu      $a0, $s5, $zero
/* 4F384 8005EB84 4600A586 */  lh         $a1, 0x46($s5)
/* 4F388 8005EB88 4E00A386 */  lh         $v1, 0x4E($s5)
/* 4F38C 8005EB8C 4800A686 */  lh         $a2, 0x48($s5)
/* 4F390 8005EB90 5800A286 */  lh         $v0, 0x58($s5)
/* 4F394 8005EB94 2350A300 */  subu       $t2, $a1, $v1
/* 4F398 8005EB98 2348C200 */  subu       $t1, $a2, $v0
/* 4F39C 8005EB9C 18004901 */  mult       $t2, $t1
/* 4F3A0 8005EBA0 5000A286 */  lh         $v0, 0x50($s5)
/* 4F3A4 8005EBA4 5600A386 */  lh         $v1, 0x56($s5)
/* 4F3A8 8005EBA8 12600000 */  mflo       $t4
/* 4F3AC 8005EBAC 2338C200 */  subu       $a3, $a2, $v0
/* 4F3B0 8005EBB0 2318A300 */  subu       $v1, $a1, $v1
/* 4F3B4 8005EBB4 18006700 */  mult       $v1, $a3
/* 4F3B8 8005EBB8 4400A486 */  lh         $a0, 0x44($s5)
/* 4F3BC 8005EBBC 5400A286 */  lh         $v0, 0x54($s5)
/* 4F3C0 8005EBC0 12580000 */  mflo       $t3
/* 4F3C4 8005EBC4 23408200 */  subu       $t0, $a0, $v0
/* 4F3C8 8005EBC8 00000000 */  nop
/* 4F3CC 8005EBCC 18000701 */  mult       $t0, $a3
/* 4F3D0 8005EBD0 4C00A286 */  lh         $v0, 0x4C($s5)
/* 4F3D4 8005EBD4 12380000 */  mflo       $a3
/* 4F3D8 8005EBD8 23108200 */  subu       $v0, $a0, $v0
/* 4F3DC 8005EBDC 00000000 */  nop
/* 4F3E0 8005EBE0 18004900 */  mult       $v0, $t1
/* 4F3E4 8005EBE4 12800000 */  mflo       $s0
/* 4F3E8 8005EBE8 00000000 */  nop
/* 4F3EC 8005EBEC 00000000 */  nop
/* 4F3F0 8005EBF0 18004300 */  mult       $v0, $v1
/* 4F3F4 8005EBF4 12480000 */  mflo       $t1
/* 4F3F8 8005EBF8 00000000 */  nop
/* 4F3FC 8005EBFC 00000000 */  nop
/* 4F400 8005EC00 18000A01 */  mult       $t0, $t2
/* 4F404 8005EC04 23108B01 */  subu       $v0, $t4, $t3
/* 4F408 8005EC08 90AC8387 */  lh         $v1, %gp_rel(theCamera)($gp)
/* 4F40C 8005EC0C 12400000 */  mflo       $t0
/* 4F410 8005EC10 03A30200 */  sra        $s4, $v0, 12
/* 4F414 8005EC14 23208300 */  subu       $a0, $a0, $v1
/* 4F418 8005EC18 18009400 */  mult       $a0, $s4
/* 4F41C 8005EC1C 2310F000 */  subu       $v0, $a3, $s0
/* 4F420 8005EC20 92AC8387 */  lh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 4F424 8005EC24 12500000 */  mflo       $t2
/* 4F428 8005EC28 03930200 */  sra        $s2, $v0, 12
/* 4F42C 8005EC2C 2328A300 */  subu       $a1, $a1, $v1
/* 4F430 8005EC30 1800B200 */  mult       $a1, $s2
/* 4F434 8005EC34 12380000 */  mflo       $a3
/* 4F438 8005EC38 00000000 */  nop
/* 4F43C 8005EC3C 00000000 */  nop
/* 4F440 8005EC40 18009402 */  mult       $s4, $s4
/* 4F444 8005EC44 12280000 */  mflo       $a1
/* 4F448 8005EC48 00000000 */  nop
/* 4F44C 8005EC4C 00000000 */  nop
/* 4F450 8005EC50 18005202 */  mult       $s2, $s2
/* 4F454 8005EC54 12200000 */  mflo       $a0
/* 4F458 8005EC58 23102801 */  subu       $v0, $t1, $t0
/* 4F45C 8005EC5C 038B0200 */  sra        $s1, $v0, 12
/* 4F460 8005EC60 18003102 */  mult       $s1, $s1
/* 4F464 8005EC64 94AC8287 */  lh         $v0, %gp_rel(theCamera + 0x4)($gp)
/* 4F468 8005EC68 12180000 */  mflo       $v1
/* 4F46C 8005EC6C 2330C200 */  subu       $a2, $a2, $v0
/* 4F470 8005EC70 00000000 */  nop
/* 4F474 8005EC74 1800D100 */  mult       $a2, $s1
/* 4F478 8005EC78 21104701 */  addu       $v0, $t2, $a3
/* 4F47C 8005EC7C 2120A400 */  addu       $a0, $a1, $a0
/* 4F480 8005EC80 21208300 */  addu       $a0, $a0, $v1
/* 4F484 8005EC84 12400000 */  mflo       $t0
/* 4F488 8005EC88 21104800 */  addu       $v0, $v0, $t0
/* 4F48C 8005EC8C 6EE7000C */  jal        MATH3D_FastSqrt
/* 4F490 8005EC90 23800200 */   negu      $s0, $v0
/* 4F494 8005EC94 2A10D003 */  slt        $v0, $fp, $s0
/* 4F498 8005EC98 05004010 */  beqz       $v0, .L8005ECB0
/* 4F49C 8005EC9C 2120A002 */   addu      $a0, $s5, $zero
/* 4F4A0 8005ECA0 21F00002 */  addu       $fp, $s0, $zero
/* 4F4A4 8005ECA4 21B88002 */  addu       $s7, $s4, $zero
/* 4F4A8 8005ECA8 21B04002 */  addu       $s6, $s2, $zero
/* 4F4AC 8005ECAC 1800B1AF */  sw         $s1, 0x18($sp)
.L8005ECB0:
/* 4F4B0 8005ECB0 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x2A8)
/* 4F4B4 8005ECB4 4019A524 */  addiu      $a1, $a1, %lo(WarpRoomArray + 0x2A8)
/* 4F4B8 8005ECB8 6001030C */  jal        func_800C0580
/* 4F4BC 8005ECBC 08000624 */   addiu     $a2, $zero, 0x8
/* 4F4C0 8005ECC0 28004010 */  beqz       $v0, .L8005ED64
/* 4F4C4 8005ECC4 00FCC22B */   slti      $v0, $fp, -0x400
/* 4F4C8 8005ECC8 1C00AF8F */  lw         $t7, 0x1C($sp)
/* 4F4CC 8005ECCC 0200C107 */  bgez       $fp, .L8005ECD8
/* 4F4D0 8005ECD0 2110C003 */   addu      $v0, $fp, $zero
/* 4F4D4 8005ECD4 23100200 */  negu       $v0, $v0
.L8005ECD8:
/* 4F4D8 8005ECD8 2A104F00 */  slt        $v0, $v0, $t7
/* 4F4DC 8005ECDC 21004010 */  beqz       $v0, .L8005ED64
/* 4F4E0 8005ECE0 00FCC22B */   slti      $v0, $fp, -0x400
/* 4F4E4 8005ECE4 98AD828F */  lw         $v0, %gp_rel(theCamera + 0x108)($gp)
/* 4F4E8 8005ECE8 00000000 */  nop
/* 4F4EC 8005ECEC 4000448C */  lw         $a0, 0x40($v0)
/* 4F4F0 8005ECF0 90AC8387 */  lh         $v1, %gp_rel(theCamera)($gp)
/* 4F4F4 8005ECF4 3400828C */  lw         $v0, 0x34($a0)
/* 4F4F8 8005ECF8 00000000 */  nop
/* 4F4FC 8005ECFC 23104300 */  subu       $v0, $v0, $v1
/* 4F500 8005ED00 18005700 */  mult       $v0, $s7
/* 4F504 8005ED04 92AC8387 */  lh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 4F508 8005ED08 3800828C */  lw         $v0, 0x38($a0)
/* 4F50C 8005ED0C 12300000 */  mflo       $a2
/* 4F510 8005ED10 23104300 */  subu       $v0, $v0, $v1
/* 4F514 8005ED14 00000000 */  nop
/* 4F518 8005ED18 18005600 */  mult       $v0, $s6
/* 4F51C 8005ED1C 94AC8387 */  lh         $v1, %gp_rel(theCamera + 0x4)($gp)
/* 4F520 8005ED20 3C00828C */  lw         $v0, 0x3C($a0)
/* 4F524 8005ED24 12280000 */  mflo       $a1
/* 4F528 8005ED28 1800AF8F */  lw         $t7, 0x18($sp)
/* 4F52C 8005ED2C 23104300 */  subu       $v0, $v0, $v1
/* 4F530 8005ED30 18004F00 */  mult       $v0, $t7
/* 4F534 8005ED34 2110C500 */  addu       $v0, $a2, $a1
/* 4F538 8005ED38 12180000 */  mflo       $v1
/* 4F53C 8005ED3C 21104300 */  addu       $v0, $v0, $v1
/* 4F540 8005ED40 23100200 */  negu       $v0, $v0
/* 4F544 8005ED44 07004018 */  blez       $v0, .L8005ED64
/* 4F548 8005ED48 00FCC22B */   slti      $v0, $fp, -0x400
/* 4F54C 8005ED4C 2000B88F */  lw         $t8, 0x20($sp)
/* 4F550 8005ED50 00000000 */  nop
/* 4F554 8005ED54 03000017 */  bnez       $t8, .L8005ED64
/* 4F558 8005ED58 00000000 */   nop
/* 4F55C 8005ED5C 01000F24 */  addiu      $t7, $zero, 0x1
/* 4F560 8005ED60 2400AFAF */  sw         $t7, 0x24($sp)
.L8005ED64:
/* 4F564 8005ED64 05004010 */  beqz       $v0, .L8005ED7C
/* 4F568 8005ED68 00000000 */   nop
/* 4F56C 8005ED6C 2400B88F */  lw         $t8, 0x24($sp)
/* 4F570 8005ED70 00000000 */  nop
/* 4F574 8005ED74 84000013 */  beqz       $t8, .L8005EF88
/* 4F578 8005ED78 21100000 */   addu      $v0, $zero, $zero
.L8005ED7C:
/* 4F57C 8005ED7C 04006296 */  lhu        $v0, 0x4($s3)
/* 4F580 8005ED80 00006496 */  lhu        $a0, 0x0($s3)
/* 4F584 8005ED84 06006396 */  lhu        $v1, 0x6($s3)
/* 4F588 8005ED88 02006596 */  lhu        $a1, 0x2($s3)
/* 4F58C 8005ED8C 21104400 */  addu       $v0, $v0, $a0
/* 4F590 8005ED90 21186500 */  addu       $v1, $v1, $a1
/* 4F594 8005ED94 040062A6 */  sh         $v0, 0x4($s3)
/* 4F598 8005ED98 F0AC8227 */  addiu      $v0, $gp, %gp_rel(theCamera + 0x60)
/* 4F59C 8005ED9C 060063A6 */  sh         $v1, 0x6($s3)
/* 4F5A0 8005EDA0 00004F8C */  lw         $t7, 0x0($v0)
/* 4F5A4 8005EDA4 00000000 */  nop
/* 4F5A8 8005EDA8 0000EC8D */  lw         $t4, 0x0($t7)
/* 4F5AC 8005EDAC 0400ED8D */  lw         $t5, 0x4($t7)
/* 4F5B0 8005EDB0 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 4F5B4 8005EDB4 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 4F5B8 8005EDB8 0800EC8D */  lw         $t4, 0x8($t7)
/* 4F5BC 8005EDBC 0C00ED8D */  lw         $t5, 0xC($t7)
/* 4F5C0 8005EDC0 1000EE8D */  lw         $t6, 0x10($t7)
/* 4F5C4 8005EDC4 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 4F5C8 8005EDC8 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 4F5CC 8005EDCC 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 4F5D0 8005EDD0 1400EC8D */  lw         $t4, 0x14($t7)
/* 4F5D4 8005EDD4 1800ED8D */  lw         $t5, 0x18($t7)
/* 4F5D8 8005EDD8 0028CC48 */  ctc2       $t4, $5 # handwritten instruction
/* 4F5DC 8005EDDC 1C00EE8D */  lw         $t6, 0x1C($t7)
/* 4F5E0 8005EDE0 0030CD48 */  ctc2       $t5, $6 # handwritten instruction
/* 4F5E4 8005EDE4 0038CE48 */  ctc2       $t6, $7 # handwritten instruction
/* 4F5E8 8005EDE8 2C00A426 */  addiu      $a0, $s5, 0x2C
/* 4F5EC 8005EDEC 21286002 */  addu       $a1, $s3, $zero
/* 4F5F0 8005EDF0 D279010C */  jal        AddClippedTri
/* 4F5F4 8005EDF4 1000A627 */   addiu     $a2, $sp, 0x10
/* 4F5F8 8005EDF8 21804000 */  addu       $s0, $v0, $zero
/* 4F5FC 8005EDFC 4400A426 */  addiu      $a0, $s5, 0x44
/* 4F600 8005EE00 21286002 */  addu       $a1, $s3, $zero
/* 4F604 8005EE04 D279010C */  jal        AddClippedTri
/* 4F608 8005EE08 1400A627 */   addiu     $a2, $sp, 0x14
/* 4F60C 8005EE0C 25800202 */  or         $s0, $s0, $v0
/* 4F610 8005EE10 0A000016 */  bnez       $s0, .L8005EE3C
/* 4F614 8005EE14 21100000 */   addu      $v0, $zero, $zero
/* 4F618 8005EE18 04006396 */  lhu        $v1, 0x4($s3)
/* 4F61C 8005EE1C 00006596 */  lhu        $a1, 0x0($s3)
/* 4F620 8005EE20 06006496 */  lhu        $a0, 0x6($s3)
/* 4F624 8005EE24 02006696 */  lhu        $a2, 0x2($s3)
/* 4F628 8005EE28 23186500 */  subu       $v1, $v1, $a1
/* 4F62C 8005EE2C 23208600 */  subu       $a0, $a0, $a2
/* 4F630 8005EE30 040063A6 */  sh         $v1, 0x4($s3)
/* 4F634 8005EE34 E27B0108 */  j          .L8005EF88
/* 4F638 8005EE38 060064A6 */   sh        $a0, 0x6($s3)
.L8005EE3C:
/* 4F63C 8005EE3C 1400A38F */  lw         $v1, 0x14($sp)
/* 4F640 8005EE40 1000A28F */  lw         $v0, 0x10($sp)
/* 4F644 8005EE44 00000000 */  nop
/* 4F648 8005EE48 2A106200 */  slt        $v0, $v1, $v0
/* 4F64C 8005EE4C 02004010 */  beqz       $v0, .L8005EE58
/* 4F650 8005EE50 00000000 */   nop
/* 4F654 8005EE54 1000A3AF */  sw         $v1, 0x10($sp)
.L8005EE58:
/* 4F658 8005EE58 2400B88F */  lw         $t8, 0x24($sp)
/* 4F65C 8005EE5C 00000000 */  nop
/* 4F660 8005EE60 0D000013 */  beqz       $t8, .L8005EE98
/* 4F664 8005EE64 00000000 */   nop
/* 4F668 8005EE68 1000A28F */  lw         $v0, 0x10($sp)
/* 4F66C 8005EE6C 00000000 */  nop
/* 4F670 8005EE70 40004228 */  slti       $v0, $v0, 0x40
/* 4F674 8005EE74 08004010 */  beqz       $v0, .L8005EE98
/* 4F678 8005EE78 01000224 */   addiu     $v0, $zero, 0x1
/* 4F67C 8005EE7C 00020324 */  addiu      $v1, $zero, 0x200
/* 4F680 8005EE80 040063A6 */  sh         $v1, 0x4($s3)
/* 4F684 8005EE84 F0000324 */  addiu      $v1, $zero, 0xF0
/* 4F688 8005EE88 000060A6 */  sh         $zero, 0x0($s3)
/* 4F68C 8005EE8C 020060A6 */  sh         $zero, 0x2($s3)
/* 4F690 8005EE90 E27B0108 */  j          .L8005EF88
/* 4F694 8005EE94 060063A6 */   sh        $v1, 0x6($s3)
.L8005EE98:
/* 4F698 8005EE98 00006286 */  lh         $v0, 0x0($s3)
/* 4F69C 8005EE9C 00000000 */  nop
/* 4F6A0 8005EEA0 02004104 */  bgez       $v0, .L8005EEAC
/* 4F6A4 8005EEA4 00000000 */   nop
/* 4F6A8 8005EEA8 000060A6 */  sh         $zero, 0x0($s3)
.L8005EEAC:
/* 4F6AC 8005EEAC 02006286 */  lh         $v0, 0x2($s3)
/* 4F6B0 8005EEB0 00000000 */  nop
/* 4F6B4 8005EEB4 02004104 */  bgez       $v0, .L8005EEC0
/* 4F6B8 8005EEB8 00000000 */   nop
/* 4F6BC 8005EEBC 020060A6 */  sh         $zero, 0x2($s3)
.L8005EEC0:
/* 4F6C0 8005EEC0 04006286 */  lh         $v0, 0x4($s3)
/* 4F6C4 8005EEC4 00000000 */  nop
/* 4F6C8 8005EEC8 01024228 */  slti       $v0, $v0, 0x201
/* 4F6CC 8005EECC 02004014 */  bnez       $v0, .L8005EED8
/* 4F6D0 8005EED0 00020224 */   addiu     $v0, $zero, 0x200
/* 4F6D4 8005EED4 040062A6 */  sh         $v0, 0x4($s3)
.L8005EED8:
/* 4F6D8 8005EED8 06006286 */  lh         $v0, 0x6($s3)
/* 4F6DC 8005EEDC 00000000 */  nop
/* 4F6E0 8005EEE0 F1004228 */  slti       $v0, $v0, 0xF1
/* 4F6E4 8005EEE4 02004014 */  bnez       $v0, .L8005EEF0
/* 4F6E8 8005EEE8 F0000224 */   addiu     $v0, $zero, 0xF0
/* 4F6EC 8005EEEC 060062A6 */  sh         $v0, 0x6($s3)
.L8005EEF0:
/* 4F6F0 8005EEF0 04006296 */  lhu        $v0, 0x4($s3)
/* 4F6F4 8005EEF4 00006396 */  lhu        $v1, 0x0($s3)
/* 4F6F8 8005EEF8 06006596 */  lhu        $a1, 0x6($s3)
/* 4F6FC 8005EEFC 02006496 */  lhu        $a0, 0x2($s3)
/* 4F700 8005EF00 23104300 */  subu       $v0, $v0, $v1
/* 4F704 8005EF04 2328A400 */  subu       $a1, $a1, $a0
/* 4F708 8005EF08 040062A6 */  sh         $v0, 0x4($s3)
/* 4F70C 8005EF0C 060065A6 */  sh         $a1, 0x6($s3)
/* 4F710 8005EF10 2000AF8F */  lw         $t7, 0x20($sp)
/* 4F714 8005EF14 00000000 */  nop
/* 4F718 8005EF18 1300E011 */  beqz       $t7, .L8005EF68
/* 4F71C 8005EF1C 00000000 */   nop
/* 4F720 8005EF20 1C00B88F */  lw         $t8, 0x1C($sp)
/* 4F724 8005EF24 0200C107 */  bgez       $fp, .L8005EF30
/* 4F728 8005EF28 2110C003 */   addu      $v0, $fp, $zero
/* 4F72C 8005EF2C 23100200 */  negu       $v0, $v0
.L8005EF30:
/* 4F730 8005EF30 2A105800 */  slt        $v0, $v0, $t8
/* 4F734 8005EF34 0C004010 */  beqz       $v0, .L8005EF68
/* 4F738 8005EF38 00000000 */   nop
/* 4F73C 8005EF3C 1800AF8F */  lw         $t7, 0x18($sp)
/* 4F740 8005EF40 00000000 */  nop
/* 4F744 8005EF44 0400E019 */  blez       $t7, .L8005EF58
/* 4F748 8005EF48 21188000 */   addu      $v1, $a0, $zero
/* 4F74C 8005EF4C F0000224 */  addiu      $v0, $zero, 0xF0
/* 4F750 8005EF50 D97B0108 */  j          .L8005EF64
/* 4F754 8005EF54 23104300 */   subu      $v0, $v0, $v1
.L8005EF58:
/* 4F758 8005EF58 02006296 */  lhu        $v0, 0x2($s3)
/* 4F75C 8005EF5C 020060A6 */  sh         $zero, 0x2($s3)
/* 4F760 8005EF60 21104500 */  addu       $v0, $v0, $a1
.L8005EF64:
/* 4F764 8005EF64 060062A6 */  sh         $v0, 0x6($s3)
.L8005EF68:
/* 4F768 8005EF68 04006286 */  lh         $v0, 0x4($s3)
/* 4F76C 8005EF6C 00000000 */  nop
/* 4F770 8005EF70 04004018 */  blez       $v0, .L8005EF84
/* 4F774 8005EF74 00000000 */   nop
/* 4F778 8005EF78 06006286 */  lh         $v0, 0x6($s3)
/* 4F77C 8005EF7C E27B0108 */  j          .L8005EF88
/* 4F780 8005EF80 2A100200 */   slt       $v0, $zero, $v0
.L8005EF84:
/* 4F784 8005EF84 21100000 */  addu       $v0, $zero, $zero
.L8005EF88:
/* 4F788 8005EF88 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 4F78C 8005EF8C 4800BE8F */  lw         $fp, 0x48($sp)
/* 4F790 8005EF90 4400B78F */  lw         $s7, 0x44($sp)
/* 4F794 8005EF94 4000B68F */  lw         $s6, 0x40($sp)
/* 4F798 8005EF98 3C00B58F */  lw         $s5, 0x3C($sp)
/* 4F79C 8005EF9C 3800B48F */  lw         $s4, 0x38($sp)
/* 4F7A0 8005EFA0 3400B38F */  lw         $s3, 0x34($sp)
/* 4F7A4 8005EFA4 3000B28F */  lw         $s2, 0x30($sp)
/* 4F7A8 8005EFA8 2C00B18F */  lw         $s1, 0x2C($sp)
/* 4F7AC 8005EFAC 2800B08F */  lw         $s0, 0x28($sp)
/* 4F7B0 8005EFB0 0800E003 */  jr         $ra
/* 4F7B4 8005EFB4 5000BD27 */   addiu     $sp, $sp, 0x50
.size STREAM_GetClipRect, . - STREAM_GetClipRect
