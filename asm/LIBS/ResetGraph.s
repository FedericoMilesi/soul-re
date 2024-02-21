.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetGraph
/* AA974 800BA174 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AA978 800BA178 1400B1AF */  sw         $s1, 0x14($sp)
/* AA97C 800BA17C 21888000 */  addu       $s1, $a0, $zero
/* AA980 800BA180 07002332 */  andi       $v1, $s1, 0x7
/* AA984 800BA184 03000224 */  addiu      $v0, $zero, 0x3
/* AA988 800BA188 1800BFAF */  sw         $ra, 0x18($sp)
/* AA98C 800BA18C 0C006210 */  beq        $v1, $v0, .L800BA1C0
/* AA990 800BA190 1000B0AF */   sw        $s0, 0x10($sp)
/* AA994 800BA194 04006228 */  slti       $v0, $v1, 0x4
/* AA998 800BA198 05004010 */  beqz       $v0, .L800BA1B0
/* AA99C 800BA19C 05000224 */   addiu     $v0, $zero, 0x5
/* AA9A0 800BA1A0 07006010 */  beqz       $v1, .L800BA1C0
/* AA9A4 800BA1A4 00000000 */   nop
/* AA9A8 800BA1A8 A1E80208 */  j          .L800BA284
/* AA9AC 800BA1AC 00000000 */   nop
.L800BA1B0:
/* AA9B0 800BA1B0 0A006210 */  beq        $v1, $v0, .L800BA1DC
/* AA9B4 800BA1B4 00000000 */   nop
/* AA9B8 800BA1B8 A1E80208 */  j          .L800BA284
/* AA9BC 800BA1BC 00000000 */   nop
.L800BA1C0:
/* AA9C0 800BA1C0 0180043C */  lui        $a0, %hi(D_8001257C)
/* AA9C4 800BA1C4 7C258424 */  addiu      $a0, $a0, %lo(D_8001257C)
/* AA9C8 800BA1C8 0D80053C */  lui        $a1, %hi(D_800CD9C4)
/* AA9CC 800BA1CC C4D9A524 */  addiu      $a1, $a1, %lo(D_800CD9C4)
/* AA9D0 800BA1D0 0D80063C */  lui        $a2, %hi(GEnv)
/* AA9D4 800BA1D4 06D1010C */  jal        printf
/* AA9D8 800BA1D8 0CDAC624 */   addiu     $a2, $a2, %lo(GEnv)
.L800BA1DC:
/* AA9DC 800BA1DC 0D80103C */  lui        $s0, %hi(GEnv)
/* AA9E0 800BA1E0 0CDA1026 */  addiu      $s0, $s0, %lo(GEnv)
/* AA9E4 800BA1E4 21200002 */  addu       $a0, $s0, $zero
/* AA9E8 800BA1E8 21280000 */  addu       $a1, $zero, $zero
/* AA9EC 800BA1EC 10F2020C */  jal        func_800BC840
/* AA9F0 800BA1F0 80000624 */   addiu     $a2, $zero, 0x80
/* AA9F4 800BA1F4 9FE6020C */  jal        ResetCallback
/* AA9F8 800BA1F8 00000000 */   nop
/* AA9FC 800BA1FC FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* AAA00 800BA200 0D80043C */  lui        $a0, %hi(D_800CDA04)
/* AAA04 800BA204 04DA848C */  lw         $a0, %lo(D_800CDA04)($a0)
/* AAA08 800BA208 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* AAA0C 800BA20C D408030C */  jal        GPU_cw
/* AAA10 800BA210 24208200 */   and       $a0, $a0, $v0
/* AAA14 800BA214 DDF0020C */  jal        func_800BC374
/* AAA18 800BA218 21202002 */   addu      $a0, $s1, $zero
/* AAA1C 800BA21C 10000426 */  addiu      $a0, $s0, 0x10
/* AAA20 800BA220 000002A2 */  sb         $v0, 0x0($s0)
/* AAA24 800BA224 00000292 */  lbu        $v0, 0x0($s0)
/* AAA28 800BA228 01000324 */  addiu      $v1, $zero, 0x1
/* AAA2C 800BA22C 010003A2 */  sb         $v1, 0x1($s0)
/* AAA30 800BA230 80100200 */  sll        $v0, $v0, 2
/* AAA34 800BA234 0D80033C */  lui        $v1, %hi(GEnv + 0x80)
/* AAA38 800BA238 21186200 */  addu       $v1, $v1, $v0
/* AAA3C 800BA23C 8CDA6394 */  lhu        $v1, %lo(GEnv + 0x80)($v1)
/* AAA40 800BA240 00000292 */  lbu        $v0, 0x0($s0)
/* AAA44 800BA244 FFFF0524 */  addiu      $a1, $zero, -0x1
/* AAA48 800BA248 80100200 */  sll        $v0, $v0, 2
/* AAA4C 800BA24C 040003A6 */  sh         $v1, 0x4($s0)
/* AAA50 800BA250 0D80013C */  lui        $at, %hi(GEnv + 0x8C)
/* AAA54 800BA254 21082200 */  addu       $at, $at, $v0
/* AAA58 800BA258 98DA2294 */  lhu        $v0, %lo(GEnv + 0x8C)($at)
/* AAA5C 800BA25C 5C000624 */  addiu      $a2, $zero, 0x5C
/* AAA60 800BA260 10F2020C */  jal        func_800BC840
/* AAA64 800BA264 060002A6 */   sh        $v0, 0x6($s0)
/* AAA68 800BA268 6C000426 */  addiu      $a0, $s0, 0x6C
/* AAA6C 800BA26C FFFF0524 */  addiu      $a1, $zero, -0x1
/* AAA70 800BA270 10F2020C */  jal        func_800BC840
/* AAA74 800BA274 14000624 */   addiu     $a2, $zero, 0x14
/* AAA78 800BA278 00000292 */  lbu        $v0, 0x0($s0)
/* AAA7C 800BA27C B5E80208 */  j          .L800BA2D4
/* AAA80 800BA280 00000000 */   nop
.L800BA284:
/* AAA84 800BA284 0D80023C */  lui        $v0, %hi(GEnv + 0x2)
/* AAA88 800BA288 0EDA4290 */  lbu        $v0, %lo(GEnv + 0x2)($v0)
/* AAA8C 800BA28C 00000000 */  nop
/* AAA90 800BA290 0200422C */  sltiu      $v0, $v0, 0x2
/* AAA94 800BA294 08004014 */  bnez       $v0, .L800BA2B8
/* AAA98 800BA298 00000000 */   nop
/* AAA9C 800BA29C 0180043C */  lui        $a0, %hi(D_8001259C)
/* AAAA0 800BA2A0 9C258424 */  addiu      $a0, $a0, %lo(D_8001259C)
/* AAAA4 800BA2A4 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAAA8 800BA2A8 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAAAC 800BA2AC 00000000 */  nop
/* AAAB0 800BA2B0 09F84000 */  jalr       $v0
/* AAAB4 800BA2B4 21282002 */   addu      $a1, $s1, $zero
.L800BA2B8:
/* AAAB8 800BA2B8 0D80023C */  lui        $v0, %hi(D_800CDA04)
/* AAABC 800BA2BC 04DA428C */  lw         $v0, %lo(D_800CDA04)($v0)
/* AAAC0 800BA2C0 00000000 */  nop
/* AAAC4 800BA2C4 3400428C */  lw         $v0, 0x34($v0)
/* AAAC8 800BA2C8 00000000 */  nop
/* AAACC 800BA2CC 09F84000 */  jalr       $v0
/* AAAD0 800BA2D0 01000424 */   addiu     $a0, $zero, 0x1
.L800BA2D4:
/* AAAD4 800BA2D4 1800BF8F */  lw         $ra, 0x18($sp)
/* AAAD8 800BA2D8 1400B18F */  lw         $s1, 0x14($sp)
/* AAADC 800BA2DC 1000B08F */  lw         $s0, 0x10($sp)
/* AAAE0 800BA2E0 0800E003 */  jr         $ra
/* AAAE4 800BA2E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size ResetGraph, . - ResetGraph
