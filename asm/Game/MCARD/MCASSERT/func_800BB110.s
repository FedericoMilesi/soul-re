.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB110
/* AB910 800BB110 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AB914 800BB114 1800B0AF */  sw         $s0, 0x18($sp)
/* AB918 800BB118 2180A000 */  addu       $s0, $a1, $zero
/* AB91C 800BB11C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* AB920 800BB120 21888000 */  addu       $s1, $a0, $zero
/* AB924 800BB124 2000BFAF */  sw         $ra, 0x20($sp)
/* AB928 800BB128 00000486 */  lh         $a0, 0x0($s0)
/* AB92C 800BB12C 02000586 */  lh         $a1, 0x2($s0)
/* AB930 800BB130 E8EC020C */  jal        func_800BB3A0
/* AB934 800BB134 00000000 */   nop
/* AB938 800BB138 040022AE */  sw         $v0, 0x4($s1)
/* AB93C 800BB13C 04000496 */  lhu        $a0, 0x4($s0)
/* AB940 800BB140 00000296 */  lhu        $v0, 0x0($s0)
/* AB944 800BB144 02000596 */  lhu        $a1, 0x2($s0)
/* AB948 800BB148 21208200 */  addu       $a0, $a0, $v0
/* AB94C 800BB14C FFFF8424 */  addiu      $a0, $a0, -0x1
/* AB950 800BB150 00240400 */  sll        $a0, $a0, 16
/* AB954 800BB154 06000296 */  lhu        $v0, 0x6($s0)
/* AB958 800BB158 03240400 */  sra        $a0, $a0, 16
/* AB95C 800BB15C 2128A200 */  addu       $a1, $a1, $v0
/* AB960 800BB160 FFFFA524 */  addiu      $a1, $a1, -0x1
/* AB964 800BB164 002C0500 */  sll        $a1, $a1, 16
/* AB968 800BB168 0EED020C */  jal        func_800BB438
/* AB96C 800BB16C 032C0500 */   sra       $a1, $a1, 16
/* AB970 800BB170 080022AE */  sw         $v0, 0x8($s1)
/* AB974 800BB174 08000486 */  lh         $a0, 0x8($s0)
/* AB978 800BB178 0A000586 */  lh         $a1, 0xA($s0)
/* AB97C 800BB17C 34ED020C */  jal        func_800BB4D0
/* AB980 800BB180 00000000 */   nop
/* AB984 800BB184 0C0022AE */  sw         $v0, 0xC($s1)
/* AB988 800BB188 17000492 */  lbu        $a0, 0x17($s0)
/* AB98C 800BB18C 16000592 */  lbu        $a1, 0x16($s0)
/* AB990 800BB190 14000696 */  lhu        $a2, 0x14($s0)
/* AB994 800BB194 E0EC020C */  jal        func_800BB380
/* AB998 800BB198 00000000 */   nop
/* AB99C 800BB19C 0C000426 */  addiu      $a0, $s0, 0xC
/* AB9A0 800BB1A0 3BED020C */  jal        func_800BB4EC
/* AB9A4 800BB1A4 100022AE */   sw        $v0, 0x10($s1)
/* AB9A8 800BB1A8 140022AE */  sw         $v0, 0x14($s1)
/* AB9AC 800BB1AC 00E6023C */  lui        $v0, (0xE6000000 >> 16)
/* AB9B0 800BB1B0 180022AE */  sw         $v0, 0x18($s1)
/* AB9B4 800BB1B4 18000292 */  lbu        $v0, 0x18($s0)
/* AB9B8 800BB1B8 00000000 */  nop
/* AB9BC 800BB1BC 69004010 */  beqz       $v0, .L800BB364
/* AB9C0 800BB1C0 07000824 */   addiu     $t0, $zero, 0x7
/* AB9C4 800BB1C4 00000296 */  lhu        $v0, 0x0($s0)
/* AB9C8 800BB1C8 00000000 */  nop
/* AB9CC 800BB1CC 1000A2A7 */  sh         $v0, 0x10($sp)
/* AB9D0 800BB1D0 02000296 */  lhu        $v0, 0x2($s0)
/* AB9D4 800BB1D4 00000000 */  nop
/* AB9D8 800BB1D8 1200A2A7 */  sh         $v0, 0x12($sp)
/* AB9DC 800BB1DC 04000496 */  lhu        $a0, 0x4($s0)
/* AB9E0 800BB1E0 00000000 */  nop
/* AB9E4 800BB1E4 1400A4A7 */  sh         $a0, 0x14($sp)
/* AB9E8 800BB1E8 06000296 */  lhu        $v0, 0x6($s0)
/* AB9EC 800BB1EC 00000000 */  nop
/* AB9F0 800BB1F0 1600A2A7 */  sh         $v0, 0x16($sp)
/* AB9F4 800BB1F4 00140400 */  sll        $v0, $a0, 16
/* AB9F8 800BB1F8 031C0200 */  sra        $v1, $v0, 16
/* AB9FC 800BB1FC 0B006004 */  bltz       $v1, .L800BB22C
/* ABA00 800BB200 21100000 */   addu      $v0, $zero, $zero
/* ABA04 800BB204 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* ABA08 800BB208 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* ABA0C 800BB20C 00000000 */  nop
/* ABA10 800BB210 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABA14 800BB214 2A104300 */  slt        $v0, $v0, $v1
/* ABA18 800BB218 0D80033C */  lui        $v1, %hi(GEnv + 0x4)
/* ABA1C 800BB21C 10DA6394 */  lhu        $v1, %lo(GEnv + 0x4)($v1)
/* ABA20 800BB220 02004014 */  bnez       $v0, .L800BB22C
/* ABA24 800BB224 FFFF6224 */   addiu     $v0, $v1, -0x1
/* ABA28 800BB228 21108000 */  addu       $v0, $a0, $zero
.L800BB22C:
/* ABA2C 800BB22C 1600A387 */  lh         $v1, 0x16($sp)
/* ABA30 800BB230 1600A497 */  lhu        $a0, 0x16($sp)
/* ABA34 800BB234 0C006004 */  bltz       $v1, .L800BB268
/* ABA38 800BB238 1400A2A7 */   sh        $v0, 0x14($sp)
/* ABA3C 800BB23C 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* ABA40 800BB240 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* ABA44 800BB244 00000000 */  nop
/* ABA48 800BB248 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABA4C 800BB24C 2A104300 */  slt        $v0, $v0, $v1
/* ABA50 800BB250 0D80033C */  lui        $v1, %hi(GEnv + 0x6)
/* ABA54 800BB254 12DA6394 */  lhu        $v1, %lo(GEnv + 0x6)($v1)
/* ABA58 800BB258 04004014 */  bnez       $v0, .L800BB26C
/* ABA5C 800BB25C FFFF6224 */   addiu     $v0, $v1, -0x1
/* ABA60 800BB260 9BEC0208 */  j          .L800BB26C
/* ABA64 800BB264 21108000 */   addu      $v0, $a0, $zero
.L800BB268:
/* ABA68 800BB268 21100000 */  addu       $v0, $zero, $zero
.L800BB26C:
/* ABA6C 800BB26C 1000A397 */  lhu        $v1, 0x10($sp)
/* ABA70 800BB270 1600A2A7 */  sh         $v0, 0x16($sp)
/* ABA74 800BB274 3F006230 */  andi       $v0, $v1, 0x3F
/* ABA78 800BB278 06004014 */  bnez       $v0, .L800BB294
/* ABA7C 800BB27C 80300800 */   sll       $a2, $t0, 2
/* ABA80 800BB280 1400A297 */  lhu        $v0, 0x14($sp)
/* ABA84 800BB284 00000000 */  nop
/* ABA88 800BB288 3F004230 */  andi       $v0, $v0, 0x3F
/* ABA8C 800BB28C 1F004010 */  beqz       $v0, .L800BB30C
/* ABA90 800BB290 80280800 */   sll       $a1, $t0, 2
.L800BB294:
/* ABA94 800BB294 01000825 */  addiu      $t0, $t0, 0x1
/* ABA98 800BB298 80380800 */  sll        $a3, $t0, 2
/* ABA9C 800BB29C 01000825 */  addiu      $t0, $t0, 0x1
/* ABAA0 800BB2A0 80280800 */  sll        $a1, $t0, 2
/* ABAA4 800BB2A4 01000825 */  addiu      $t0, $t0, 0x1
/* ABAA8 800BB2A8 08000296 */  lhu        $v0, 0x8($s0)
/* ABAAC 800BB2AC 2130D100 */  addu       $a2, $a2, $s1
/* ABAB0 800BB2B0 23106200 */  subu       $v0, $v1, $v0
/* ABAB4 800BB2B4 1000A2A7 */  sh         $v0, 0x10($sp)
/* ABAB8 800BB2B8 1200A297 */  lhu        $v0, 0x12($sp)
/* ABABC 800BB2BC 0A000396 */  lhu        $v1, 0xA($s0)
/* ABAC0 800BB2C0 0060043C */  lui        $a0, (0x60000000 >> 16)
/* ABAC4 800BB2C4 23104300 */  subu       $v0, $v0, $v1
/* ABAC8 800BB2C8 1200A2A7 */  sh         $v0, 0x12($sp)
/* ABACC 800BB2CC 1B000292 */  lbu        $v0, 0x1B($s0)
/* ABAD0 800BB2D0 1A000392 */  lbu        $v1, 0x1A($s0)
/* ABAD4 800BB2D4 00140200 */  sll        $v0, $v0, 16
/* ABAD8 800BB2D8 001A0300 */  sll        $v1, $v1, 8
/* ABADC 800BB2DC 25186400 */  or         $v1, $v1, $a0
/* ABAE0 800BB2E0 19000492 */  lbu        $a0, 0x19($s0)
/* ABAE4 800BB2E4 25104300 */  or         $v0, $v0, $v1
/* ABAE8 800BB2E8 25104400 */  or         $v0, $v0, $a0
/* ABAEC 800BB2EC 0000C2AC */  sw         $v0, 0x0($a2)
/* ABAF0 800BB2F0 1000A28F */  lw         $v0, 0x10($sp)
/* ABAF4 800BB2F4 2138F100 */  addu       $a3, $a3, $s1
/* ABAF8 800BB2F8 0000E2AC */  sw         $v0, 0x0($a3)
/* ABAFC 800BB2FC 1400A28F */  lw         $v0, 0x14($sp)
/* ABB00 800BB300 2128B100 */  addu       $a1, $a1, $s1
/* ABB04 800BB304 D9EC0208 */  j          .L800BB364
/* ABB08 800BB308 0000A2AC */   sw        $v0, 0x0($a1)
.L800BB30C:
/* ABB0C 800BB30C 01000825 */  addiu      $t0, $t0, 0x1
/* ABB10 800BB310 80300800 */  sll        $a2, $t0, 2
/* ABB14 800BB314 01000825 */  addiu      $t0, $t0, 0x1
/* ABB18 800BB318 80380800 */  sll        $a3, $t0, 2
/* ABB1C 800BB31C 01000825 */  addiu      $t0, $t0, 0x1
/* ABB20 800BB320 2128B100 */  addu       $a1, $a1, $s1
/* ABB24 800BB324 0002043C */  lui        $a0, (0x2000000 >> 16)
/* ABB28 800BB328 1B000292 */  lbu        $v0, 0x1B($s0)
/* ABB2C 800BB32C 1A000392 */  lbu        $v1, 0x1A($s0)
/* ABB30 800BB330 00140200 */  sll        $v0, $v0, 16
/* ABB34 800BB334 001A0300 */  sll        $v1, $v1, 8
/* ABB38 800BB338 25186400 */  or         $v1, $v1, $a0
/* ABB3C 800BB33C 19000492 */  lbu        $a0, 0x19($s0)
/* ABB40 800BB340 25104300 */  or         $v0, $v0, $v1
/* ABB44 800BB344 25104400 */  or         $v0, $v0, $a0
/* ABB48 800BB348 0000A2AC */  sw         $v0, 0x0($a1)
/* ABB4C 800BB34C 1000A28F */  lw         $v0, 0x10($sp)
/* ABB50 800BB350 2130D100 */  addu       $a2, $a2, $s1
/* ABB54 800BB354 0000C2AC */  sw         $v0, 0x0($a2)
/* ABB58 800BB358 1400A28F */  lw         $v0, 0x14($sp)
/* ABB5C 800BB35C 2138F100 */  addu       $a3, $a3, $s1
/* ABB60 800BB360 0000E2AC */  sw         $v0, 0x0($a3)
.L800BB364:
/* ABB64 800BB364 FFFF0225 */  addiu      $v0, $t0, -0x1
/* ABB68 800BB368 030022A2 */  sb         $v0, 0x3($s1)
/* ABB6C 800BB36C 2000BF8F */  lw         $ra, 0x20($sp)
/* ABB70 800BB370 1C00B18F */  lw         $s1, 0x1C($sp)
/* ABB74 800BB374 1800B08F */  lw         $s0, 0x18($sp)
/* ABB78 800BB378 0800E003 */  jr         $ra
/* ABB7C 800BB37C 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BB110, . - func_800BB110
