.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC114
/* AC914 800BC114 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC918 800BC118 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC91C 800BC11C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AC920 800BC120 1800BFAF */  sw         $ra, 0x18($sp)
/* AC924 800BC124 1400B1AF */  sw         $s1, 0x14($sp)
/* AC928 800BC128 1000B0AF */  sw         $s0, 0x10($sp)
/* AC92C 800BC12C 0000428C */  lw         $v0, 0x0($v0)
/* AC930 800BC130 0001103C */  lui        $s0, (0x1000000 >> 16)
/* AC934 800BC134 24105000 */  and        $v0, $v0, $s0
/* AC938 800BC138 89004014 */  bnez       $v0, .L800BC360
/* AC93C 800BC13C 01000224 */   addiu     $v0, $zero, 0x1
/* AC940 800BC140 ECE6020C */  jal        func_800B9BB0
/* AC944 800BC144 21200000 */   addu      $a0, $zero, $zero
/* AC948 800BC148 0D80043C */  lui        $a0, %hi(_qin)
/* AC94C 800BC14C 34DB848C */  lw         $a0, %lo(_qin)($a0)
/* AC950 800BC150 0D80033C */  lui        $v1, %hi(_qout)
/* AC954 800BC154 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* AC958 800BC158 0D80013C */  lui        $at, %hi(_qout + 0x8)
/* AC95C 800BC15C 59008310 */  beq        $a0, $v1, .L800BC2C4
/* AC960 800BC160 40DB22AC */   sw        $v0, %lo(_qout + 0x8)($at)
/* AC964 800BC164 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC968 800BC168 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC96C 800BC16C 00000000 */  nop
/* AC970 800BC170 0000428C */  lw         $v0, 0x0($v0)
/* AC974 800BC174 00000000 */  nop
/* AC978 800BC178 24105000 */  and        $v0, $v0, $s0
/* AC97C 800BC17C 51004014 */  bnez       $v0, .L800BC2C4
/* AC980 800BC180 00000000 */   nop
/* AC984 800BC184 0004113C */  lui        $s1, (0x4000000 >> 16)
/* AC988 800BC188 0001103C */  lui        $s0, (0x1000000 >> 16)
.L800BC18C:
/* AC98C 800BC18C 0D80023C */  lui        $v0, %hi(_qout)
/* AC990 800BC190 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* AC994 800BC194 0D80033C */  lui        $v1, %hi(_qin)
/* AC998 800BC198 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* AC99C 800BC19C 01004224 */  addiu      $v0, $v0, 0x1
/* AC9A0 800BC1A0 3F004230 */  andi       $v0, $v0, 0x3F
/* AC9A4 800BC1A4 08004314 */  bne        $v0, $v1, .L800BC1C8
/* AC9A8 800BC1A8 00000000 */   nop
/* AC9AC 800BC1AC 0D80023C */  lui        $v0, %hi(GEnv + 0xC)
/* AC9B0 800BC1B0 18DA428C */  lw         $v0, %lo(GEnv + 0xC)($v0)
/* AC9B4 800BC1B4 00000000 */  nop
/* AC9B8 800BC1B8 03004014 */  bnez       $v0, .L800BC1C8
/* AC9BC 800BC1BC 02000424 */   addiu     $a0, $zero, 0x2
/* AC9C0 800BC1C0 B7E6020C */  jal        func_800B9ADC
/* AC9C4 800BC1C4 21280000 */   addu      $a1, $zero, $zero
.L800BC1C8:
/* AC9C8 800BC1C8 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC9CC 800BC1CC 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC9D0 800BC1D0 00000000 */  nop
/* AC9D4 800BC1D4 0000628C */  lw         $v0, 0x0($v1)
/* AC9D8 800BC1D8 00000000 */  nop
/* AC9DC 800BC1DC 24105100 */  and        $v0, $v0, $s1
/* AC9E0 800BC1E0 06004014 */  bnez       $v0, .L800BC1FC
/* AC9E4 800BC1E4 0004043C */   lui       $a0, (0x4000000 >> 16)
.L800BC1E8:
/* AC9E8 800BC1E8 0000628C */  lw         $v0, 0x0($v1)
/* AC9EC 800BC1EC 00000000 */  nop
/* AC9F0 800BC1F0 24104400 */  and        $v0, $v0, $a0
/* AC9F4 800BC1F4 FCFF4010 */  beqz       $v0, .L800BC1E8
/* AC9F8 800BC1F8 00000000 */   nop
.L800BC1FC:
/* AC9FC 800BC1FC 0D80053C */  lui        $a1, %hi(_qout)
/* ACA00 800BC200 38DBA58C */  lw         $a1, %lo(_qout)($a1)
/* ACA04 800BC204 0D80033C */  lui        $v1, %hi(_qout)
/* ACA08 800BC208 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACA0C 800BC20C 00000000 */  nop
/* ACA10 800BC210 40100300 */  sll        $v0, $v1, 1
/* ACA14 800BC214 21104300 */  addu       $v0, $v0, $v1
/* ACA18 800BC218 40110200 */  sll        $v0, $v0, 5
/* ACA1C 800BC21C 40180500 */  sll        $v1, $a1, 1
/* ACA20 800BC220 21186500 */  addu       $v1, $v1, $a1
/* ACA24 800BC224 0E80043C */  lui        $a0, %hi(_que + 0x4)
/* ACA28 800BC228 21208200 */  addu       $a0, $a0, $v0
/* ACA2C 800BC22C 6CBE848C */  lw         $a0, %lo(_que + 0x4)($a0)
/* ACA30 800BC230 0D80053C */  lui        $a1, %hi(_qout)
/* ACA34 800BC234 38DBA58C */  lw         $a1, %lo(_qout)($a1)
/* ACA38 800BC238 40190300 */  sll        $v1, $v1, 5
/* ACA3C 800BC23C 40100500 */  sll        $v0, $a1, 1
/* ACA40 800BC240 21104500 */  addu       $v0, $v0, $a1
/* ACA44 800BC244 40110200 */  sll        $v0, $v0, 5
/* ACA48 800BC248 0E80053C */  lui        $a1, %hi(_que + 0x8)
/* ACA4C 800BC24C 2128A200 */  addu       $a1, $a1, $v0
/* ACA50 800BC250 70BEA58C */  lw         $a1, %lo(_que + 0x8)($a1)
/* ACA54 800BC254 0E80023C */  lui        $v0, %hi(_que)
/* ACA58 800BC258 21104300 */  addu       $v0, $v0, $v1
/* ACA5C 800BC25C 68BE428C */  lw         $v0, %lo(_que)($v0)
/* ACA60 800BC260 00000000 */  nop
/* ACA64 800BC264 09F84000 */  jalr       $v0
/* ACA68 800BC268 00000000 */   nop
/* ACA6C 800BC26C 0D80023C */  lui        $v0, %hi(_qout)
/* ACA70 800BC270 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* ACA74 800BC274 00000000 */  nop
/* ACA78 800BC278 01004224 */  addiu      $v0, $v0, 0x1
/* ACA7C 800BC27C 3F004230 */  andi       $v0, $v0, 0x3F
/* ACA80 800BC280 0D80013C */  lui        $at, %hi(_qout)
/* ACA84 800BC284 38DB22AC */  sw         $v0, %lo(_qout)($at)
/* ACA88 800BC288 0D80033C */  lui        $v1, %hi(_qin)
/* ACA8C 800BC28C 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* ACA90 800BC290 0D80023C */  lui        $v0, %hi(_qout)
/* ACA94 800BC294 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* ACA98 800BC298 00000000 */  nop
/* ACA9C 800BC29C 09006210 */  beq        $v1, $v0, .L800BC2C4
/* ACAA0 800BC2A0 00000000 */   nop
/* ACAA4 800BC2A4 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* ACAA8 800BC2A8 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* ACAAC 800BC2AC 00000000 */  nop
/* ACAB0 800BC2B0 0000428C */  lw         $v0, 0x0($v0)
/* ACAB4 800BC2B4 00000000 */  nop
/* ACAB8 800BC2B8 24105000 */  and        $v0, $v0, $s0
/* ACABC 800BC2BC B3FF4010 */  beqz       $v0, .L800BC18C
/* ACAC0 800BC2C0 00000000 */   nop
.L800BC2C4:
/* ACAC4 800BC2C4 0D80043C */  lui        $a0, %hi(_qout + 0x8)
/* ACAC8 800BC2C8 40DB848C */  lw         $a0, %lo(_qout + 0x8)($a0)
/* ACACC 800BC2CC ECE6020C */  jal        func_800B9BB0
/* ACAD0 800BC2D0 00000000 */   nop
/* ACAD4 800BC2D4 0D80033C */  lui        $v1, %hi(_qin)
/* ACAD8 800BC2D8 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* ACADC 800BC2DC 0D80023C */  lui        $v0, %hi(_qout)
/* ACAE0 800BC2E0 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* ACAE4 800BC2E4 00000000 */  nop
/* ACAE8 800BC2E8 16006214 */  bne        $v1, $v0, .L800BC344
/* ACAEC 800BC2EC 00000000 */   nop
/* ACAF0 800BC2F0 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* ACAF4 800BC2F4 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* ACAF8 800BC2F8 00000000 */  nop
/* ACAFC 800BC2FC 0000428C */  lw         $v0, 0x0($v0)
/* ACB00 800BC300 0001033C */  lui        $v1, (0x1000000 >> 16)
/* ACB04 800BC304 24104300 */  and        $v0, $v0, $v1
/* ACB08 800BC308 0E004014 */  bnez       $v0, .L800BC344
/* ACB0C 800BC30C 00000000 */   nop
/* ACB10 800BC310 0D80033C */  lui        $v1, %hi(GEnv + 0x8)
/* ACB14 800BC314 14DA6324 */  addiu      $v1, $v1, %lo(GEnv + 0x8)
/* ACB18 800BC318 0000628C */  lw         $v0, 0x0($v1)
/* ACB1C 800BC31C 00000000 */  nop
/* ACB20 800BC320 08004010 */  beqz       $v0, .L800BC344
/* ACB24 800BC324 00000000 */   nop
/* ACB28 800BC328 0400648C */  lw         $a0, 0x4($v1)
/* ACB2C 800BC32C 00000000 */  nop
/* ACB30 800BC330 04008010 */  beqz       $a0, .L800BC344
/* ACB34 800BC334 F8FF6224 */   addiu     $v0, $v1, -0x8
/* ACB38 800BC338 080040AC */  sw         $zero, 0x8($v0)
/* ACB3C 800BC33C 09F88000 */  jalr       $a0
/* ACB40 800BC340 00000000 */   nop
.L800BC344:
/* ACB44 800BC344 0D80023C */  lui        $v0, %hi(_qin)
/* ACB48 800BC348 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* ACB4C 800BC34C 0D80033C */  lui        $v1, %hi(_qout)
/* ACB50 800BC350 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACB54 800BC354 00000000 */  nop
/* ACB58 800BC358 23104300 */  subu       $v0, $v0, $v1
/* ACB5C 800BC35C 3F004230 */  andi       $v0, $v0, 0x3F
.L800BC360:
/* ACB60 800BC360 1800BF8F */  lw         $ra, 0x18($sp)
/* ACB64 800BC364 1400B18F */  lw         $s1, 0x14($sp)
/* ACB68 800BC368 1000B08F */  lw         $s0, 0x10($sp)
/* ACB6C 800BC36C 0800E003 */  jr         $ra
/* ACB70 800BC370 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BC114, . - func_800BC114
