.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBAD0
/* AC2D0 800BBAD0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AC2D4 800BBAD4 1400B1AF */  sw         $s1, 0x14($sp)
/* AC2D8 800BBAD8 21888000 */  addu       $s1, $a0, $zero
/* AC2DC 800BBADC 1800B2AF */  sw         $s2, 0x18($sp)
/* AC2E0 800BBAE0 2190A000 */  addu       $s2, $a1, $zero
/* AC2E4 800BBAE4 2400BFAF */  sw         $ra, 0x24($sp)
/* AC2E8 800BBAE8 2000B4AF */  sw         $s4, 0x20($sp)
/* AC2EC 800BBAEC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AC2F0 800BBAF0 80F1020C */  jal        func_800BC600
/* AC2F4 800BBAF4 1000B0AF */   sw        $s0, 0x10($sp)
/* AC2F8 800BBAF8 04002586 */  lh         $a1, 0x4($s1)
/* AC2FC 800BBAFC 04002396 */  lhu        $v1, 0x4($s1)
/* AC300 800BBB00 0A00A004 */  bltz       $a1, .L800BBB2C
/* AC304 800BBB04 21206000 */   addu      $a0, $v1, $zero
/* AC308 800BBB08 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* AC30C 800BBB0C 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* AC310 800BBB10 0D80033C */  lui        $v1, %hi(GEnv + 0x4)
/* AC314 800BBB14 10DA6394 */  lhu        $v1, %lo(GEnv + 0x4)($v1)
/* AC318 800BBB18 2A104500 */  slt        $v0, $v0, $a1
/* AC31C 800BBB1C 04004010 */  beqz       $v0, .L800BBB30
/* AC320 800BBB20 00000000 */   nop
/* AC324 800BBB24 CCEE0208 */  j          .L800BBB30
/* AC328 800BBB28 21206000 */   addu      $a0, $v1, $zero
.L800BBB2C:
/* AC32C 800BBB2C 21200000 */  addu       $a0, $zero, $zero
.L800BBB30:
/* AC330 800BBB30 06002586 */  lh         $a1, 0x6($s1)
/* AC334 800BBB34 06002396 */  lhu        $v1, 0x6($s1)
/* AC338 800BBB38 0B00A004 */  bltz       $a1, .L800BBB68
/* AC33C 800BBB3C 040024A6 */   sh        $a0, 0x4($s1)
/* AC340 800BBB40 21206000 */  addu       $a0, $v1, $zero
/* AC344 800BBB44 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* AC348 800BBB48 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* AC34C 800BBB4C 0D80033C */  lui        $v1, %hi(GEnv + 0x6)
/* AC350 800BBB50 12DA6394 */  lhu        $v1, %lo(GEnv + 0x6)($v1)
/* AC354 800BBB54 2A104500 */  slt        $v0, $v0, $a1
/* AC358 800BBB58 05004010 */  beqz       $v0, .L800BBB70
/* AC35C 800BBB5C 00140400 */   sll       $v0, $a0, 16
/* AC360 800BBB60 DBEE0208 */  j          .L800BBB6C
/* AC364 800BBB64 21206000 */   addu      $a0, $v1, $zero
.L800BBB68:
/* AC368 800BBB68 21200000 */  addu       $a0, $zero, $zero
.L800BBB6C:
/* AC36C 800BBB6C 00140400 */  sll        $v0, $a0, 16
.L800BBB70:
/* AC370 800BBB70 04002386 */  lh         $v1, 0x4($s1)
/* AC374 800BBB74 03140200 */  sra        $v0, $v0, 16
/* AC378 800BBB78 18006200 */  mult       $v1, $v0
/* AC37C 800BBB7C 060024A6 */  sh         $a0, 0x6($s1)
/* AC380 800BBB80 12300000 */  mflo       $a2
/* AC384 800BBB84 0100C324 */  addiu      $v1, $a2, 0x1
/* AC388 800BBB88 C2170300 */  srl        $v0, $v1, 31
/* AC38C 800BBB8C 21186200 */  addu       $v1, $v1, $v0
/* AC390 800BBB90 43200300 */  sra        $a0, $v1, 1
/* AC394 800BBB94 0300801C */  bgtz       $a0, .L800BBBA4
/* AC398 800BBB98 43810300 */   sra       $s0, $v1, 5
/* AC39C 800BBB9C 4CEF0208 */  j          .L800BBD30
/* AC3A0 800BBBA0 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BBBA4:
/* AC3A4 800BBBA4 21180002 */  addu       $v1, $s0, $zero
/* AC3A8 800BBBA8 00110300 */  sll        $v0, $v1, 4
/* AC3AC 800BBBAC 23808200 */  subu       $s0, $a0, $v0
/* AC3B0 800BBBB0 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC3B4 800BBBB4 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC3B8 800BBBB8 21A06000 */  addu       $s4, $v1, $zero
/* AC3BC 800BBBBC 0000428C */  lw         $v0, 0x0($v0)
/* AC3C0 800BBBC0 0004033C */  lui        $v1, (0x4000000 >> 16)
/* AC3C4 800BBBC4 24104300 */  and        $v0, $v0, $v1
/* AC3C8 800BBBC8 0E004014 */  bnez       $v0, .L800BBC04
/* AC3CC 800BBBCC 00000000 */   nop
/* AC3D0 800BBBD0 0004133C */  lui        $s3, (0x4000000 >> 16)
.L800BBBD4:
/* AC3D4 800BBBD4 8DF1020C */  jal        func_800BC634
/* AC3D8 800BBBD8 00000000 */   nop
/* AC3DC 800BBBDC 54004014 */  bnez       $v0, .L800BBD30
/* AC3E0 800BBBE0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AC3E4 800BBBE4 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC3E8 800BBBE8 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC3EC 800BBBEC 00000000 */  nop
/* AC3F0 800BBBF0 0000428C */  lw         $v0, 0x0($v0)
/* AC3F4 800BBBF4 00000000 */  nop
/* AC3F8 800BBBF8 24105300 */  and        $v0, $v0, $s3
/* AC3FC 800BBBFC F5FF4010 */  beqz       $v0, .L800BBBD4
/* AC400 800BBC00 00000000 */   nop
.L800BBC04:
/* AC404 800BBC04 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC408 800BBC08 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC40C 800BBC0C 0004023C */  lui        $v0, (0x4000000 >> 16)
/* AC410 800BBC10 000062AC */  sw         $v0, 0x0($v1)
/* AC414 800BBC14 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC418 800BBC18 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC41C 800BBC1C 0001023C */  lui        $v0, (0x1000000 >> 16)
/* AC420 800BBC20 000062AC */  sw         $v0, 0x0($v1)
/* AC424 800BBC24 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC428 800BBC28 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC42C 800BBC2C 00C0023C */  lui        $v0, (0xC0000000 >> 16)
/* AC430 800BBC30 000062AC */  sw         $v0, 0x0($v1)
/* AC434 800BBC34 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC438 800BBC38 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC43C 800BBC3C 0000228E */  lw         $v0, 0x0($s1)
/* AC440 800BBC40 00000000 */  nop
/* AC444 800BBC44 000062AC */  sw         $v0, 0x0($v1)
/* AC448 800BBC48 0D80033C */  lui        $v1, %hi(GEnv + 0x104)
/* AC44C 800BBC4C 10DB638C */  lw         $v1, %lo(GEnv + 0x104)($v1)
/* AC450 800BBC50 0400228E */  lw         $v0, 0x4($s1)
/* AC454 800BBC54 00000000 */  nop
/* AC458 800BBC58 000062AC */  sw         $v0, 0x0($v1)
/* AC45C 800BBC5C 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC460 800BBC60 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC464 800BBC64 00000000 */  nop
/* AC468 800BBC68 0000428C */  lw         $v0, 0x0($v0)
/* AC46C 800BBC6C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* AC470 800BBC70 24104300 */  and        $v0, $v0, $v1
/* AC474 800BBC74 0E004014 */  bnez       $v0, .L800BBCB0
/* AC478 800BBC78 00000000 */   nop
/* AC47C 800BBC7C 0008113C */  lui        $s1, (0x8000000 >> 16)
.L800BBC80:
/* AC480 800BBC80 8DF1020C */  jal        func_800BC634
/* AC484 800BBC84 00000000 */   nop
/* AC488 800BBC88 29004014 */  bnez       $v0, .L800BBD30
/* AC48C 800BBC8C FFFF0224 */   addiu     $v0, $zero, -0x1
/* AC490 800BBC90 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC494 800BBC94 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC498 800BBC98 00000000 */  nop
/* AC49C 800BBC9C 0000428C */  lw         $v0, 0x0($v0)
/* AC4A0 800BBCA0 00000000 */  nop
/* AC4A4 800BBCA4 24105100 */  and        $v0, $v0, $s1
/* AC4A8 800BBCA8 F5FF4010 */  beqz       $v0, .L800BBC80
/* AC4AC 800BBCAC 00000000 */   nop
.L800BBCB0:
/* AC4B0 800BBCB0 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AC4B4 800BBCB4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* AC4B8 800BBCB8 09000212 */  beq        $s0, $v0, .L800BBCE0
/* AC4BC 800BBCBC FFFF0324 */   addiu     $v1, $zero, -0x1
.L800BBCC0:
/* AC4C0 800BBCC0 0D80023C */  lui        $v0, %hi(GEnv + 0x104)
/* AC4C4 800BBCC4 10DB428C */  lw         $v0, %lo(GEnv + 0x104)($v0)
/* AC4C8 800BBCC8 00000000 */  nop
/* AC4CC 800BBCCC 0000428C */  lw         $v0, 0x0($v0)
/* AC4D0 800BBCD0 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AC4D4 800BBCD4 000042AE */  sw         $v0, 0x0($s2)
/* AC4D8 800BBCD8 F9FF0316 */  bne        $s0, $v1, .L800BBCC0
/* AC4DC 800BBCDC 04005226 */   addiu     $s2, $s2, 0x4
.L800BBCE0:
/* AC4E0 800BBCE0 12008012 */  beqz       $s4, .L800BBD2C
/* AC4E4 800BBCE4 0004033C */   lui       $v1, (0x4000003 >> 16)
/* AC4E8 800BBCE8 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC4EC 800BBCEC 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC4F0 800BBCF0 03006334 */  ori        $v1, $v1, (0x4000003 & 0xFFFF)
/* AC4F4 800BBCF4 000043AC */  sw         $v1, 0x0($v0)
/* AC4F8 800BBCF8 0D80023C */  lui        $v0, %hi(GEnv + 0x10C)
/* AC4FC 800BBCFC 18DB428C */  lw         $v0, %lo(GEnv + 0x10C)($v0)
/* AC500 800BBD00 0001043C */  lui        $a0, (0x1000200 >> 16)
/* AC504 800BBD04 000052AC */  sw         $s2, 0x0($v0)
/* AC508 800BBD08 00141400 */  sll        $v0, $s4, 16
/* AC50C 800BBD0C 0D80033C */  lui        $v1, %hi(GEnv + 0x110)
/* AC510 800BBD10 1CDB638C */  lw         $v1, %lo(GEnv + 0x110)($v1)
/* AC514 800BBD14 10004234 */  ori        $v0, $v0, 0x10
/* AC518 800BBD18 000062AC */  sw         $v0, 0x0($v1)
/* AC51C 800BBD1C 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC520 800BBD20 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC524 800BBD24 00028434 */  ori        $a0, $a0, (0x1000200 & 0xFFFF)
/* AC528 800BBD28 000044AC */  sw         $a0, 0x0($v0)
.L800BBD2C:
/* AC52C 800BBD2C 21100000 */  addu       $v0, $zero, $zero
.L800BBD30:
/* AC530 800BBD30 2400BF8F */  lw         $ra, 0x24($sp)
/* AC534 800BBD34 2000B48F */  lw         $s4, 0x20($sp)
/* AC538 800BBD38 1C00B38F */  lw         $s3, 0x1C($sp)
/* AC53C 800BBD3C 1800B28F */  lw         $s2, 0x18($sp)
/* AC540 800BBD40 1400B18F */  lw         $s1, 0x14($sp)
/* AC544 800BBD44 1000B08F */  lw         $s0, 0x10($sp)
/* AC548 800BBD48 0800E003 */  jr         $ra
/* AC54C 800BBD4C 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BBAD0, . - func_800BBAD0
