.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel FX_UpdatePowerRing
/* 3B928 8004B128 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 3B92C 8004B12C 1800B2AF */  sw         $s2, 0x18($sp)
/* 3B930 8004B130 21908000 */  addu       $s2, $a0, $zero
/* 3B934 8004B134 3000BFAF */  sw         $ra, 0x30($sp)
/* 3B938 8004B138 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 3B93C 8004B13C 2800B6AF */  sw         $s6, 0x28($sp)
/* 3B940 8004B140 2400B5AF */  sw         $s5, 0x24($sp)
/* 3B944 8004B144 2000B4AF */  sw         $s4, 0x20($sp)
/* 3B948 8004B148 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3B94C 8004B14C 1400B1AF */  sw         $s1, 0x14($sp)
/* 3B950 8004B150 1000B0AF */  sw         $s0, 0x10($sp)
/* 3B954 8004B154 1000468E */  lw         $a2, 0x10($s2)
/* 3B958 8004B158 0E004886 */  lh         $t0, 0xE($s2)
/* 3B95C 8004B15C 402A0600 */  sll        $a1, $a2, 9
/* 3B960 8004B160 1A00A800 */  div        $zero, $a1, $t0
/* 3B964 8004B164 12280000 */  mflo       $a1
/* 3B968 8004B168 6210073C */  lui        $a3, (0x10624DD3 >> 16)
/* 3B96C 8004B16C F4BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 3B970 8004B170 D34DE734 */  ori        $a3, $a3, (0x10624DD3 & 0xFFFF)
/* 3B974 8004B174 19008700 */  multu      $a0, $a3
/* 3B978 8004B178 10180000 */  mfhi       $v1
/* 3B97C 8004B17C 82190300 */  srl        $v1, $v1, 6
/* 3B980 8004B180 40110300 */  sll        $v0, $v1, 5
/* 3B984 8004B184 23104300 */  subu       $v0, $v0, $v1
/* 3B988 8004B188 80100200 */  sll        $v0, $v0, 2
/* 3B98C 8004B18C 21104300 */  addu       $v0, $v0, $v1
/* 3B990 8004B190 C0100200 */  sll        $v0, $v0, 3
/* 3B994 8004B194 23208200 */  subu       $a0, $a0, $v0
/* 3B998 8004B198 00230400 */  sll        $a0, $a0, 12
/* 3B99C 8004B19C 19008700 */  multu      $a0, $a3
/* 3B9A0 8004B1A0 2A30C800 */  slt        $a2, $a2, $t0
/* 3B9A4 8004B1A4 0800438E */  lw         $v1, 0x8($s2)
/* 3B9A8 8004B1A8 00020224 */  addiu      $v0, $zero, 0x200
/* 3B9AC 8004B1AC 60007384 */  lh         $s3, 0x60($v1)
/* 3B9B0 8004B1B0 5C007684 */  lh         $s6, 0x5C($v1)
/* 3B9B4 8004B1B4 5E007784 */  lh         $s7, 0x5E($v1)
/* 3B9B8 8004B1B8 10380000 */  mfhi       $a3
/* 3B9BC 8004B1BC 82A10700 */  srl        $s4, $a3, 6
/* 3B9C0 8004B1C0 0400C014 */  bnez       $a2, .L8004B1D4
/* 3B9C4 8004B1C4 23A84500 */   subu      $s5, $v0, $a1
/* 3B9C8 8004B1C8 21A84000 */  addu       $s5, $v0, $zero
/* 3B9CC 8004B1CC 100048AE */  sw         $t0, 0x10($s2)
/* 3B9D0 8004B1D0 0E0040A6 */  sh         $zero, 0xE($s2)
.L8004B1D4:
/* 3B9D4 8004B1D4 C8000424 */  addiu      $a0, $zero, 0xC8
/* 3B9D8 8004B1D8 14005126 */  addiu      $s1, $s2, 0x14
/* 3B9DC 8004B1DC D0E4010C */  jal        func_80079340
/* 3B9E0 8004B1E0 060020A6 */   sh        $zero, 0x6($s1)
/* 3B9E4 8004B1E4 21208002 */  addu       $a0, $s4, $zero
/* 3B9E8 8004B1E8 D0E4010C */  jal        func_80079340
/* 3B9EC 8004B1EC 21804000 */   addu      $s0, $v0, $zero
/* 3B9F0 8004B1F0 18000202 */  mult       $s0, $v0
/* 3B9F4 8004B1F4 C8000424 */  addiu      $a0, $zero, 0xC8
/* 3B9F8 8004B1F8 12180000 */  mflo       $v1
/* 3B9FC 8004B1FC 03130300 */  sra        $v0, $v1, 12
/* 3BA00 8004B200 D0E4010C */  jal        func_80079340
/* 3BA04 8004B204 140042A6 */   sh        $v0, 0x14($s2)
/* 3BA08 8004B208 21208002 */  addu       $a0, $s4, $zero
/* 3BA0C 8004B20C DCE4010C */  jal        func_80079370
/* 3BA10 8004B210 21804000 */   addu      $s0, $v0, $zero
/* 3BA14 8004B214 23801000 */  negu       $s0, $s0
/* 3BA18 8004B218 18000202 */  mult       $s0, $v0
/* 3BA1C 8004B21C C8000424 */  addiu      $a0, $zero, 0xC8
/* 3BA20 8004B220 12180000 */  mflo       $v1
/* 3BA24 8004B224 03130300 */  sra        $v0, $v1, 12
/* 3BA28 8004B228 DCE4010C */  jal        func_80079370
/* 3BA2C 8004B22C 020022A6 */   sh        $v0, 0x2($s1)
/* 3BA30 8004B230 040022A6 */  sh         $v0, 0x4($s1)
/* 3BA34 8004B234 14004386 */  lh         $v1, 0x14($s2)
/* 3BA38 8004B238 00000000 */  nop
/* 3BA3C 8004B23C 18007600 */  mult       $v1, $s6
/* 3BA40 8004B240 12200000 */  mflo       $a0
/* 3BA44 8004B244 02002386 */  lh         $v1, 0x2($s1)
/* 3BA48 8004B248 00000000 */  nop
/* 3BA4C 8004B24C 18007700 */  mult       $v1, $s7
/* 3BA50 8004B250 21987502 */  addu       $s3, $s3, $s5
/* 3BA54 8004B254 12180000 */  mflo       $v1
/* 3BA58 8004B258 00140200 */  sll        $v0, $v0, 16
/* 3BA5C 8004B25C 03140200 */  sra        $v0, $v0, 16
/* 3BA60 8004B260 18005300 */  mult       $v0, $s3
/* 3BA64 8004B264 21108300 */  addu       $v0, $a0, $v1
/* 3BA68 8004B268 12280000 */  mflo       $a1
/* 3BA6C 8004B26C 21104500 */  addu       $v0, $v0, $a1
/* 3BA70 8004B270 03130200 */  sra        $v0, $v0, 12
/* 3BA74 8004B274 23100200 */  negu       $v0, $v0
/* 3BA78 8004B278 080022AE */  sw         $v0, 0x8($s1)
/* 3BA7C 8004B27C 2400428E */  lw         $v0, 0x24($s2)
/* 3BA80 8004B280 00000000 */  nop
/* 3BA84 8004B284 39004010 */  beqz       $v0, .L8004B36C
/* 3BA88 8004B288 00000000 */   nop
/* 3BA8C 8004B28C 1000438E */  lw         $v1, 0x10($s2)
/* 3BA90 8004B290 00000000 */  nop
/* 3BA94 8004B294 05006010 */  beqz       $v1, .L8004B2AC
/* 3BA98 8004B298 21300000 */   addu      $a2, $zero, $zero
/* 3BA9C 8004B29C 2A004286 */  lh         $v0, 0x2A($s2)
/* 3BAA0 8004B2A0 00000000 */  nop
/* 3BAA4 8004B2A4 1A006200 */  div        $zero, $v1, $v0
/* 3BAA8 8004B2A8 12300000 */  mflo       $a2
.L8004B2AC:
/* 3BAAC 8004B2AC 2A004486 */  lh         $a0, 0x2A($s2)
/* 3BAB0 8004B2B0 1000438E */  lw         $v1, 0x10($s2)
/* 3BAB4 8004B2B4 01008224 */  addiu      $v0, $a0, 0x1
/* 3BAB8 8004B2B8 1A006200 */  div        $zero, $v1, $v0
/* 3BABC 8004B2BC 10100000 */  mfhi       $v0
/* 3BAC0 8004B2C0 28004386 */  lh         $v1, 0x28($s2)
/* 3BAC4 8004B2C4 00130200 */  sll        $v0, $v0, 12
/* 3BAC8 8004B2C8 1A004400 */  div        $zero, $v0, $a0
/* 3BACC 8004B2CC 12280000 */  mflo       $a1
/* 3BAD0 8004B2D0 FFFF6224 */  addiu      $v0, $v1, -0x1
/* 3BAD4 8004B2D4 2A10C200 */  slt        $v0, $a2, $v0
/* 3BAD8 8004B2D8 03004014 */  bnez       $v0, .L8004B2E8
/* 3BADC 8004B2DC 00100224 */   addiu     $v0, $zero, 0x1000
/* 3BAE0 8004B2E0 FEFF6624 */  addiu      $a2, $v1, -0x2
/* 3BAE4 8004B2E4 00100524 */  addiu      $a1, $zero, 0x1000
.L8004B2E8:
/* 3BAE8 8004B2E8 23104500 */  subu       $v0, $v0, $a1
/* 3BAEC 8004B2EC 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 3BAF0 8004B2F0 2400448E */  lw         $a0, 0x24($s2)
/* 3BAF4 8004B2F4 80180600 */  sll        $v1, $a2, 2
/* 3BAF8 8004B2F8 21108300 */  addu       $v0, $a0, $v1
/* 3BAFC 8004B2FC 00004C90 */  lbu        $t4, 0x0($v0)
/* 3BB00 8004B300 01004D90 */  lbu        $t5, 0x1($v0)
/* 3BB04 8004B304 02004E90 */  lbu        $t6, 0x2($v0)
/* 3BB08 8004B308 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 3BB0C 8004B30C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 3BB10 8004B310 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 3BB14 8004B314 00000000 */  nop
/* 3BB18 8004B318 00000000 */  nop
/* 3BB1C 8004B31C 3D00984B */  GPF        1
/* 3BB20 8004B320 00408548 */  mtc2       $a1, $8 # handwritten instruction
/* 3BB24 8004B324 04006324 */  addiu      $v1, $v1, 0x4
/* 3BB28 8004B328 21208300 */  addu       $a0, $a0, $v1
/* 3BB2C 8004B32C 00008C90 */  lbu        $t4, 0x0($a0)
/* 3BB30 8004B330 01008D90 */  lbu        $t5, 0x1($a0)
/* 3BB34 8004B334 02008E90 */  lbu        $t6, 0x2($a0)
/* 3BB38 8004B338 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 3BB3C 8004B33C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 3BB40 8004B340 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 3BB44 8004B344 00000000 */  nop
/* 3BB48 8004B348 00000000 */  nop
/* 3BB4C 8004B34C 3E00A84B */  GPL        1
/* 3BB50 8004B350 20004226 */  addiu      $v0, $s2, 0x20
/* 3BB54 8004B354 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 3BB58 8004B358 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 3BB5C 8004B35C 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 3BB60 8004B360 00004CA0 */  sb         $t4, 0x0($v0)
/* 3BB64 8004B364 01004DA0 */  sb         $t5, 0x1($v0)
/* 3BB68 8004B368 02004EA0 */  sb         $t6, 0x2($v0)
.L8004B36C:
/* 3BB6C 8004B36C 1000428E */  lw         $v0, 0x10($s2)
/* 3BB70 8004B370 04C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 3BB74 8004B374 00000000 */  nop
/* 3BB78 8004B378 21104300 */  addu       $v0, $v0, $v1
/* 3BB7C 8004B37C 100042AE */  sw         $v0, 0x10($s2)
/* 3BB80 8004B380 3000BF8F */  lw         $ra, 0x30($sp)
/* 3BB84 8004B384 2C00B78F */  lw         $s7, 0x2C($sp)
/* 3BB88 8004B388 2800B68F */  lw         $s6, 0x28($sp)
/* 3BB8C 8004B38C 2400B58F */  lw         $s5, 0x24($sp)
/* 3BB90 8004B390 2000B48F */  lw         $s4, 0x20($sp)
/* 3BB94 8004B394 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3BB98 8004B398 1800B28F */  lw         $s2, 0x18($sp)
/* 3BB9C 8004B39C 1400B18F */  lw         $s1, 0x14($sp)
/* 3BBA0 8004B3A0 1000B08F */  lw         $s0, 0x10($sp)
/* 3BBA4 8004B3A4 0800E003 */  jr         $ra
/* 3BBA8 8004B3A8 3800BD27 */   addiu     $sp, $sp, 0x38
.size FX_UpdatePowerRing, . - FX_UpdatePowerRing
