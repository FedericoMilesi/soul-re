.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA9A0
/* AB1A0 800BA9A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AB1A4 800BA9A4 1400B1AF */  sw         $s1, 0x14($sp)
/* AB1A8 800BA9A8 21888000 */  addu       $s1, $a0, $zero
/* AB1AC 800BA9AC 1800B2AF */  sw         $s2, 0x18($sp)
/* AB1B0 800BA9B0 0D80123C */  lui        $s2, %hi(GEnv + 0x2)
/* AB1B4 800BA9B4 0EDA5226 */  addiu      $s2, $s2, %lo(GEnv + 0x2)
/* AB1B8 800BA9B8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* AB1BC 800BA9BC 1000B0AF */  sw         $s0, 0x10($sp)
/* AB1C0 800BA9C0 00004292 */  lbu        $v0, 0x0($s2)
/* AB1C4 800BA9C4 00000000 */  nop
/* AB1C8 800BA9C8 0200422C */  sltiu      $v0, $v0, 0x2
/* AB1CC 800BA9CC 08004014 */  bnez       $v0, .L800BA9F0
/* AB1D0 800BA9D0 0008103C */   lui       $s0, (0x8000008 >> 16)
/* AB1D4 800BA9D4 0180043C */  lui        $a0, %hi(D_8001270C)
/* AB1D8 800BA9D8 0C278424 */  addiu      $a0, $a0, %lo(D_8001270C)
/* AB1DC 800BA9DC 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AB1E0 800BA9E0 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AB1E4 800BA9E4 00000000 */  nop
/* AB1E8 800BA9E8 09F84000 */  jalr       $v0
/* AB1EC 800BA9EC 21282002 */   addu      $a1, $s1, $zero
.L800BA9F0:
/* AB1F0 800BA9F0 0005023C */  lui        $v0, (0x5000000 >> 16)
/* AB1F4 800BA9F4 02002396 */  lhu        $v1, 0x2($s1)
/* AB1F8 800BA9F8 00002496 */  lhu        $a0, 0x0($s1)
/* AB1FC 800BA9FC 0D80053C */  lui        $a1, %hi(the_attract_movies + 0x1158)
/* AB200 800BAA00 04DAA58C */  lw         $a1, %lo(the_attract_movies + 0x1158)($a1)
/* AB204 800BAA04 FF036330 */  andi       $v1, $v1, 0x3FF
/* AB208 800BAA08 801A0300 */  sll        $v1, $v1, 10
/* AB20C 800BAA0C FF038430 */  andi       $a0, $a0, 0x3FF
/* AB210 800BAA10 25208200 */  or         $a0, $a0, $v0
/* AB214 800BAA14 1000A28C */  lw         $v0, 0x10($a1)
/* AB218 800BAA18 00000000 */  nop
/* AB21C 800BAA1C 09F84000 */  jalr       $v0
/* AB220 800BAA20 25206400 */   or        $a0, $v1, $a0
/* AB224 800BAA24 7A00438E */  lw         $v1, 0x7A($s2)
/* AB228 800BAA28 1000228E */  lw         $v0, 0x10($s1)
/* AB22C 800BAA2C 00000000 */  nop
/* AB230 800BAA30 19006214 */  bne        $v1, $v0, .L800BAA98
/* AB234 800BAA34 6A004426 */   addiu     $a0, $s2, 0x6A
/* AB238 800BAA38 6A004296 */  lhu        $v0, 0x6A($s2)
/* AB23C 800BAA3C 00002386 */  lh         $v1, 0x0($s1)
/* AB240 800BAA40 00140200 */  sll        $v0, $v0, 16
/* AB244 800BAA44 03140200 */  sra        $v0, $v0, 16
/* AB248 800BAA48 13004314 */  bne        $v0, $v1, .L800BAA98
/* AB24C 800BAA4C 00000000 */   nop
/* AB250 800BAA50 02008294 */  lhu        $v0, 0x2($a0)
/* AB254 800BAA54 02002386 */  lh         $v1, 0x2($s1)
/* AB258 800BAA58 00140200 */  sll        $v0, $v0, 16
/* AB25C 800BAA5C 03140200 */  sra        $v0, $v0, 16
/* AB260 800BAA60 0D004314 */  bne        $v0, $v1, .L800BAA98
/* AB264 800BAA64 00000000 */   nop
/* AB268 800BAA68 04008294 */  lhu        $v0, 0x4($a0)
/* AB26C 800BAA6C 04002386 */  lh         $v1, 0x4($s1)
/* AB270 800BAA70 00140200 */  sll        $v0, $v0, 16
/* AB274 800BAA74 03140200 */  sra        $v0, $v0, 16
/* AB278 800BAA78 07004314 */  bne        $v0, $v1, .L800BAA98
/* AB27C 800BAA7C 00000000 */   nop
/* AB280 800BAA80 06008294 */  lhu        $v0, 0x6($a0)
/* AB284 800BAA84 06002386 */  lh         $v1, 0x6($s1)
/* AB288 800BAA88 00140200 */  sll        $v0, $v0, 16
/* AB28C 800BAA8C 03140200 */  sra        $v0, $v0, 16
/* AB290 800BAA90 3C004310 */  beq        $v0, $v1, .L800BAB84
/* AB294 800BAA94 00000000 */   nop
.L800BAA98:
/* AB298 800BAA98 D808030C */  jal        func_800C2360
/* AB29C 800BAA9C 00000000 */   nop
/* AB2A0 800BAAA0 120022A2 */  sb         $v0, 0x12($s1)
/* AB2A4 800BAAA4 FF004230 */  andi       $v0, $v0, 0xFF
/* AB2A8 800BAAA8 01000324 */  addiu      $v1, $zero, 0x1
/* AB2AC 800BAAAC 02004314 */  bne        $v0, $v1, .L800BAAB8
/* AB2B0 800BAAB0 00000000 */   nop
/* AB2B4 800BAAB4 08001036 */  ori        $s0, $s0, (0x8000008 & 0xFFFF)
.L800BAAB8:
/* AB2B8 800BAAB8 11002292 */  lbu        $v0, 0x11($s1)
/* AB2BC 800BAABC 00000000 */  nop
/* AB2C0 800BAAC0 02004010 */  beqz       $v0, .L800BAACC
/* AB2C4 800BAAC4 00000000 */   nop
/* AB2C8 800BAAC8 10001036 */  ori        $s0, $s0, (0x8000010 & 0xFFFF)
.L800BAACC:
/* AB2CC 800BAACC 10002292 */  lbu        $v0, 0x10($s1)
/* AB2D0 800BAAD0 00000000 */  nop
/* AB2D4 800BAAD4 02004010 */  beqz       $v0, .L800BAAE0
/* AB2D8 800BAAD8 00000000 */   nop
/* AB2DC 800BAADC 20001036 */  ori        $s0, $s0, 0x20
.L800BAAE0:
/* AB2E0 800BAAE0 0D80023C */  lui        $v0, %hi(GEnv + 0x3)
/* AB2E4 800BAAE4 0FDA4290 */  lbu        $v0, %lo(GEnv + 0x3)($v0)
/* AB2E8 800BAAE8 00000000 */  nop
/* AB2EC 800BAAEC 02004010 */  beqz       $v0, .L800BAAF8
/* AB2F0 800BAAF0 00000000 */   nop
/* AB2F4 800BAAF4 80001036 */  ori        $s0, $s0, 0x80
.L800BAAF8:
/* AB2F8 800BAAF8 04002386 */  lh         $v1, 0x4($s1)
/* AB2FC 800BAAFC 00000000 */  nop
/* AB300 800BAB00 19016228 */  slti       $v0, $v1, 0x119
/* AB304 800BAB04 0E004014 */  bnez       $v0, .L800BAB40
/* AB308 800BAB08 61016228 */   slti      $v0, $v1, 0x161
/* AB30C 800BAB0C 03004010 */  beqz       $v0, .L800BAB1C
/* AB310 800BAB10 91016228 */   slti      $v0, $v1, 0x191
/* AB314 800BAB14 D0EA0208 */  j          .L800BAB40
/* AB318 800BAB18 01001036 */   ori       $s0, $s0, 0x1
.L800BAB1C:
/* AB31C 800BAB1C 03004010 */  beqz       $v0, .L800BAB2C
/* AB320 800BAB20 31026228 */   slti      $v0, $v1, 0x231
/* AB324 800BAB24 D0EA0208 */  j          .L800BAB40
/* AB328 800BAB28 40001036 */   ori       $s0, $s0, 0x40
.L800BAB2C:
/* AB32C 800BAB2C 03004010 */  beqz       $v0, .L800BAB3C
/* AB330 800BAB30 00000000 */   nop
/* AB334 800BAB34 D0EA0208 */  j          .L800BAB40
/* AB338 800BAB38 02001036 */   ori       $s0, $s0, 0x2
.L800BAB3C:
/* AB33C 800BAB3C 03001036 */  ori        $s0, $s0, 0x3
.L800BAB40:
/* AB340 800BAB40 12002292 */  lbu        $v0, 0x12($s1)
/* AB344 800BAB44 06002386 */  lh         $v1, 0x6($s1)
/* AB348 800BAB48 02004014 */  bnez       $v0, .L800BAB54
/* AB34C 800BAB4C 21016228 */   slti      $v0, $v1, 0x121
/* AB350 800BAB50 01016228 */  slti       $v0, $v1, 0x101
.L800BAB54:
/* AB354 800BAB54 02004014 */  bnez       $v0, .L800BAB60
/* AB358 800BAB58 00000000 */   nop
/* AB35C 800BAB5C 24001036 */  ori        $s0, $s0, 0x24
.L800BAB60:
/* AB360 800BAB60 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AB364 800BAB64 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AB368 800BAB68 00000000 */  nop
/* AB36C 800BAB6C 1000428C */  lw         $v0, 0x10($v0)
/* AB370 800BAB70 00000000 */  nop
/* AB374 800BAB74 09F84000 */  jalr       $v0
/* AB378 800BAB78 21200002 */   addu      $a0, $s0, $zero
/* AB37C 800BAB7C 08000224 */  addiu      $v0, $zero, 0x8
/* AB380 800BAB80 120022A2 */  sb         $v0, 0x12($s1)
.L800BAB84:
/* AB384 800BAB84 0D80043C */  lui        $a0, %hi(GEnv + 0x74)
/* AB388 800BAB88 80DA8424 */  addiu      $a0, $a0, %lo(GEnv + 0x74)
/* AB38C 800BAB8C 00008294 */  lhu        $v0, 0x0($a0)
/* AB390 800BAB90 08002386 */  lh         $v1, 0x8($s1)
/* AB394 800BAB94 00140200 */  sll        $v0, $v0, 16
/* AB398 800BAB98 03140200 */  sra        $v0, $v0, 16
/* AB39C 800BAB9C 17004314 */  bne        $v0, $v1, .L800BABFC
/* AB3A0 800BABA0 00000000 */   nop
/* AB3A4 800BABA4 02008294 */  lhu        $v0, 0x2($a0)
/* AB3A8 800BABA8 0A002386 */  lh         $v1, 0xA($s1)
/* AB3AC 800BABAC 00140200 */  sll        $v0, $v0, 16
/* AB3B0 800BABB0 03140200 */  sra        $v0, $v0, 16
/* AB3B4 800BABB4 11004314 */  bne        $v0, $v1, .L800BABFC
/* AB3B8 800BABB8 00000000 */   nop
/* AB3BC 800BABBC 04008294 */  lhu        $v0, 0x4($a0)
/* AB3C0 800BABC0 0C002386 */  lh         $v1, 0xC($s1)
/* AB3C4 800BABC4 00140200 */  sll        $v0, $v0, 16
/* AB3C8 800BABC8 03140200 */  sra        $v0, $v0, 16
/* AB3CC 800BABCC 0B004314 */  bne        $v0, $v1, .L800BABFC
/* AB3D0 800BABD0 00000000 */   nop
/* AB3D4 800BABD4 06008294 */  lhu        $v0, 0x6($a0)
/* AB3D8 800BABD8 0E002386 */  lh         $v1, 0xE($s1)
/* AB3DC 800BABDC 00140200 */  sll        $v0, $v0, 16
/* AB3E0 800BABE0 03140200 */  sra        $v0, $v0, 16
/* AB3E4 800BABE4 05004314 */  bne        $v0, $v1, .L800BABFC
/* AB3E8 800BABE8 08000224 */   addiu     $v0, $zero, 0x8
/* AB3EC 800BABEC 12002392 */  lbu        $v1, 0x12($s1)
/* AB3F0 800BABF0 00000000 */  nop
/* AB3F4 800BABF4 9C006214 */  bne        $v1, $v0, .L800BAE68
/* AB3F8 800BABF8 00000000 */   nop
.L800BABFC:
/* AB3FC 800BABFC D808030C */  jal        func_800C2360
/* AB400 800BAC00 00000000 */   nop
/* AB404 800BAC04 120022A2 */  sb         $v0, 0x12($s1)
/* AB408 800BAC08 FF004230 */  andi       $v0, $v0, 0xFF
/* AB40C 800BAC0C 0A002486 */  lh         $a0, 0xA($s1)
/* AB410 800BAC10 02004014 */  bnez       $v0, .L800BAC1C
/* AB414 800BAC14 13009024 */   addiu     $s0, $a0, 0x13
/* AB418 800BAC18 10009024 */  addiu      $s0, $a0, 0x10
.L800BAC1C:
/* AB41C 800BAC1C 0E002286 */  lh         $v0, 0xE($s1)
/* AB420 800BAC20 00000000 */  nop
/* AB424 800BAC24 02004014 */  bnez       $v0, .L800BAC30
/* AB428 800BAC28 21900202 */   addu      $s2, $s0, $v0
/* AB42C 800BAC2C F0001226 */  addiu      $s2, $s0, 0xF0
.L800BAC30:
/* AB430 800BAC30 04002386 */  lh         $v1, 0x4($s1)
/* AB434 800BAC34 00000000 */  nop
/* AB438 800BAC38 19016228 */  slti       $v0, $v1, 0x119
/* AB43C 800BAC3C 0B004014 */  bnez       $v0, .L800BAC6C
/* AB440 800BAC40 21300000 */   addu      $a2, $zero, $zero
/* AB444 800BAC44 61016228 */  slti       $v0, $v1, 0x161
/* AB448 800BAC48 08004014 */  bnez       $v0, .L800BAC6C
/* AB44C 800BAC4C 01000624 */   addiu     $a2, $zero, 0x1
/* AB450 800BAC50 91016228 */  slti       $v0, $v1, 0x191
/* AB454 800BAC54 05004014 */  bnez       $v0, .L800BAC6C
/* AB458 800BAC58 02000624 */   addiu     $a2, $zero, 0x2
/* AB45C 800BAC5C 31026228 */  slti       $v0, $v1, 0x231
/* AB460 800BAC60 02004010 */  beqz       $v0, .L800BAC6C
/* AB464 800BAC64 04000624 */   addiu     $a2, $zero, 0x4
/* AB468 800BAC68 03000624 */  addiu      $a2, $zero, 0x3
.L800BAC6C:
/* AB46C 800BAC6C 08002386 */  lh         $v1, 0x8($s1)
/* AB470 800BAC70 0D80023C */  lui        $v0, %hi(GEnv + 0xFC)
/* AB474 800BAC74 21104600 */  addu       $v0, $v0, $a2
/* AB478 800BAC78 08DB4290 */  lbu        $v0, %lo(GEnv + 0xFC)($v0)
/* AB47C 800BAC7C 00000000 */  nop
/* AB480 800BAC80 18006200 */  mult       $v1, $v0
/* AB484 800BAC84 12002392 */  lbu        $v1, 0x12($s1)
/* AB488 800BAC88 00000000 */  nop
/* AB48C 800BAC8C 80100300 */  sll        $v0, $v1, 2
/* AB490 800BAC90 21104300 */  addu       $v0, $v0, $v1
/* AB494 800BAC94 21104600 */  addu       $v0, $v0, $a2
/* AB498 800BAC98 80100200 */  sll        $v0, $v0, 2
/* AB49C 800BAC9C 0D80033C */  lui        $v1, %hi(GEnv + 0xD4)
/* AB4A0 800BACA0 21186200 */  addu       $v1, $v1, $v0
/* AB4A4 800BACA4 E0DA6394 */  lhu        $v1, %lo(GEnv + 0xD4)($v1)
/* AB4A8 800BACA8 0D80013C */  lui        $at, %hi(GEnv + 0xD6)
/* AB4AC 800BACAC 21082200 */  addu       $at, $at, $v0
/* AB4B0 800BACB0 E2DA2294 */  lhu        $v0, %lo(GEnv + 0xD6)($at)
/* AB4B4 800BACB4 0C002586 */  lh         $a1, 0xC($s1)
/* AB4B8 800BACB8 23104300 */  subu       $v0, $v0, $v1
/* AB4BC 800BACBC 12380000 */  mflo       $a3
/* AB4C0 800BACC0 0400A010 */  beqz       $a1, .L800BACD4
/* AB4C4 800BACC4 21206700 */   addu      $a0, $v1, $a3
/* AB4C8 800BACC8 18004500 */  mult       $v0, $a1
/* AB4CC 800BACCC 12380000 */  mflo       $a3
/* AB4D0 800BACD0 03120700 */  sra        $v0, $a3, 8
.L800BACD4:
/* AB4D4 800BACD4 21188200 */  addu       $v1, $a0, $v0
/* AB4D8 800BACD8 12002292 */  lbu        $v0, 0x12($s1)
/* AB4DC 800BACDC 00000000 */  nop
/* AB4E0 800BACE0 24004010 */  beqz       $v0, .L800BAD74
/* AB4E4 800BACE4 1C028228 */   slti      $v0, $a0, 0x21C
/* AB4E8 800BACE8 05004014 */  bnez       $v0, .L800BAD00
/* AB4EC 800BACEC 1C020524 */   addiu     $a1, $zero, 0x21C
/* AB4F0 800BACF0 950C8228 */  slti       $v0, $a0, 0xC95
/* AB4F4 800BACF4 02004010 */  beqz       $v0, .L800BAD00
/* AB4F8 800BACF8 940C0524 */   addiu     $a1, $zero, 0xC94
/* AB4FC 800BACFC 21288000 */  addu       $a1, $a0, $zero
.L800BAD00:
/* AB500 800BAD00 0D80023C */  lui        $v0, %hi(GEnv + 0xFC)
/* AB504 800BAD04 21104600 */  addu       $v0, $v0, $a2
/* AB508 800BAD08 08DB4290 */  lbu        $v0, %lo(GEnv + 0xFC)($v0)
/* AB50C 800BAD0C 2120A000 */  addu       $a0, $a1, $zero
/* AB510 800BAD10 80100200 */  sll        $v0, $v0, 2
/* AB514 800BAD14 21288200 */  addu       $a1, $a0, $v0
/* AB518 800BAD18 2A106500 */  slt        $v0, $v1, $a1
/* AB51C 800BAD1C 06004014 */  bnez       $v0, .L800BAD38
/* AB520 800BAD20 1300022A */   slti      $v0, $s0, 0x13
/* AB524 800BAD24 BD0C6228 */  slti       $v0, $v1, 0xCBD
/* AB528 800BAD28 02004010 */  beqz       $v0, .L800BAD34
/* AB52C 800BAD2C BC0C0524 */   addiu     $a1, $zero, 0xCBC
/* AB530 800BAD30 21286000 */  addu       $a1, $v1, $zero
.L800BAD34:
/* AB534 800BAD34 1300022A */  slti       $v0, $s0, 0x13
.L800BAD38:
/* AB538 800BAD38 06004014 */  bnez       $v0, .L800BAD54
/* AB53C 800BAD3C 2118A000 */   addu      $v1, $a1, $zero
/* AB540 800BAD40 3001022A */  slti       $v0, $s0, 0x130
/* AB544 800BAD44 04004010 */  beqz       $v0, .L800BAD58
/* AB548 800BAD48 2F010524 */   addiu     $a1, $zero, 0x12F
/* AB54C 800BAD4C 56EB0208 */  j          .L800BAD58
/* AB550 800BAD50 21280002 */   addu      $a1, $s0, $zero
.L800BAD54:
/* AB554 800BAD54 13000524 */  addiu      $a1, $zero, 0x13
.L800BAD58:
/* AB558 800BAD58 2180A000 */  addu       $s0, $a1, $zero
/* AB55C 800BAD5C 02000526 */  addiu      $a1, $s0, 0x2
/* AB560 800BAD60 2A104502 */  slt        $v0, $s2, $a1
/* AB564 800BAD64 29004014 */  bnez       $v0, .L800BAE0C
/* AB568 800BAD68 3201422A */   slti      $v0, $s2, 0x132
/* AB56C 800BAD6C 80EB0208 */  j          .L800BAE00
/* AB570 800BAD70 31010524 */   addiu     $a1, $zero, 0x131
.L800BAD74:
/* AB574 800BAD74 F4018228 */  slti       $v0, $a0, 0x1F4
/* AB578 800BAD78 05004014 */  bnez       $v0, .L800BAD90
/* AB57C 800BAD7C F4010524 */   addiu     $a1, $zero, 0x1F4
/* AB580 800BAD80 B30C8228 */  slti       $v0, $a0, 0xCB3
/* AB584 800BAD84 02004010 */  beqz       $v0, .L800BAD90
/* AB588 800BAD88 B20C0524 */   addiu     $a1, $zero, 0xCB2
/* AB58C 800BAD8C 21288000 */  addu       $a1, $a0, $zero
.L800BAD90:
/* AB590 800BAD90 0D80023C */  lui        $v0, %hi(GEnv + 0xFC)
/* AB594 800BAD94 21104600 */  addu       $v0, $v0, $a2
/* AB598 800BAD98 08DB4290 */  lbu        $v0, %lo(GEnv + 0xFC)($v0)
/* AB59C 800BAD9C 2120A000 */  addu       $a0, $a1, $zero
/* AB5A0 800BADA0 80100200 */  sll        $v0, $v0, 2
/* AB5A4 800BADA4 21288200 */  addu       $a1, $a0, $v0
/* AB5A8 800BADA8 2A106500 */  slt        $v0, $v1, $a1
/* AB5AC 800BADAC 06004014 */  bnez       $v0, .L800BADC8
/* AB5B0 800BADB0 1000022A */   slti      $v0, $s0, 0x10
/* AB5B4 800BADB4 DB0C6228 */  slti       $v0, $v1, 0xCDB
/* AB5B8 800BADB8 02004010 */  beqz       $v0, .L800BADC4
/* AB5BC 800BADBC DA0C0524 */   addiu     $a1, $zero, 0xCDA
/* AB5C0 800BADC0 21286000 */  addu       $a1, $v1, $zero
.L800BADC4:
/* AB5C4 800BADC4 1000022A */  slti       $v0, $s0, 0x10
.L800BADC8:
/* AB5C8 800BADC8 06004014 */  bnez       $v0, .L800BADE4
/* AB5CC 800BADCC 2118A000 */   addu      $v1, $a1, $zero
/* AB5D0 800BADD0 0201022A */  slti       $v0, $s0, 0x102
/* AB5D4 800BADD4 04004010 */  beqz       $v0, .L800BADE8
/* AB5D8 800BADD8 01010524 */   addiu     $a1, $zero, 0x101
/* AB5DC 800BADDC 7AEB0208 */  j          .L800BADE8
/* AB5E0 800BADE0 21280002 */   addu      $a1, $s0, $zero
.L800BADE4:
/* AB5E4 800BADE4 10000524 */  addiu      $a1, $zero, 0x10
.L800BADE8:
/* AB5E8 800BADE8 2180A000 */  addu       $s0, $a1, $zero
/* AB5EC 800BADEC 02000526 */  addiu      $a1, $s0, 0x2
/* AB5F0 800BADF0 2A104502 */  slt        $v0, $s2, $a1
/* AB5F4 800BADF4 05004014 */  bnez       $v0, .L800BAE0C
/* AB5F8 800BADF8 0301422A */   slti      $v0, $s2, 0x103
/* AB5FC 800BADFC 02010524 */  addiu      $a1, $zero, 0x102
.L800BAE00:
/* AB600 800BAE00 02004010 */  beqz       $v0, .L800BAE0C
/* AB604 800BAE04 00000000 */   nop
/* AB608 800BAE08 21284002 */  addu       $a1, $s2, $zero
.L800BAE0C:
/* AB60C 800BAE0C 2190A000 */  addu       $s2, $a1, $zero
/* AB610 800BAE10 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* AB614 800BAE14 001B0300 */  sll        $v1, $v1, 12
/* AB618 800BAE18 FF0F8430 */  andi       $a0, $a0, 0xFFF
/* AB61C 800BAE1C 0006023C */  lui        $v0, (0x6000000 >> 16)
/* AB620 800BAE20 0D80053C */  lui        $a1, %hi(the_attract_movies + 0x1158)
/* AB624 800BAE24 04DAA58C */  lw         $a1, %lo(the_attract_movies + 0x1158)($a1)
/* AB628 800BAE28 25208200 */  or         $a0, $a0, $v0
/* AB62C 800BAE2C 1000A28C */  lw         $v0, 0x10($a1)
/* AB630 800BAE30 00000000 */  nop
/* AB634 800BAE34 09F84000 */  jalr       $v0
/* AB638 800BAE38 25206400 */   or        $a0, $v1, $a0
/* AB63C 800BAE3C FF034332 */  andi       $v1, $s2, 0x3FF
/* AB640 800BAE40 801A0300 */  sll        $v1, $v1, 10
/* AB644 800BAE44 FF030432 */  andi       $a0, $s0, 0x3FF
/* AB648 800BAE48 0007023C */  lui        $v0, (0x7000000 >> 16)
/* AB64C 800BAE4C 0D80053C */  lui        $a1, %hi(the_attract_movies + 0x1158)
/* AB650 800BAE50 04DAA58C */  lw         $a1, %lo(the_attract_movies + 0x1158)($a1)
/* AB654 800BAE54 25208200 */  or         $a0, $a0, $v0
/* AB658 800BAE58 1000A28C */  lw         $v0, 0x10($a1)
/* AB65C 800BAE5C 00000000 */  nop
/* AB660 800BAE60 09F84000 */  jalr       $v0
/* AB664 800BAE64 25206400 */   or        $a0, $v1, $a0
.L800BAE68:
/* AB668 800BAE68 0D80043C */  lui        $a0, %hi(GEnv + 0x6C)
/* AB66C 800BAE6C 78DA8424 */  addiu      $a0, $a0, %lo(GEnv + 0x6C)
/* AB670 800BAE70 21282002 */  addu       $a1, $s1, $zero
/* AB674 800BAE74 02E5010C */  jal        func_80079408
/* AB678 800BAE78 14000624 */   addiu     $a2, $zero, 0x14
/* AB67C 800BAE7C 21102002 */  addu       $v0, $s1, $zero
/* AB680 800BAE80 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AB684 800BAE84 1800B28F */  lw         $s2, 0x18($sp)
/* AB688 800BAE88 1400B18F */  lw         $s1, 0x14($sp)
/* AB68C 800BAE8C 1000B08F */  lw         $s0, 0x10($sp)
/* AB690 800BAE90 0800E003 */  jr         $ra
/* AB694 800BAE94 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BA9A0, . - func_800BA9A0
