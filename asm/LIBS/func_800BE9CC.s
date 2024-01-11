.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE9CC
/* AF1CC 800BE9CC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* AF1D0 800BE9D0 01000424 */  addiu      $a0, $zero, 0x1
/* AF1D4 800BE9D4 10000524 */  addiu      $a1, $zero, 0x10
/* AF1D8 800BE9D8 2000B0AF */  sw         $s0, 0x20($sp)
/* AF1DC 800BE9DC 0E80103C */  lui        $s0, %hi(GsOUT_PACKET_P_dup1 + 0x1E80)
/* AF1E0 800BE9E0 E8F41026 */  addiu      $s0, $s0, %lo(GsOUT_PACKET_P_dup1 + 0x1E80)
/* AF1E4 800BE9E4 21300002 */  addu       $a2, $s0, $zero
/* AF1E8 800BE9E8 3C00BFAF */  sw         $ra, 0x3C($sp)
/* AF1EC 800BE9EC 3800B6AF */  sw         $s6, 0x38($sp)
/* AF1F0 800BE9F0 3400B5AF */  sw         $s5, 0x34($sp)
/* AF1F4 800BE9F4 3000B4AF */  sw         $s4, 0x30($sp)
/* AF1F8 800BE9F8 2C00B3AF */  sw         $s3, 0x2C($sp)
/* AF1FC 800BE9FC 2800B2AF */  sw         $s2, 0x28($sp)
/* AF200 800BEA00 F4FB020C */  jal        func_800BEFD0
/* AF204 800BEA04 2400B1AF */   sw        $s1, 0x24($sp)
/* AF208 800BEA08 21884000 */  addu       $s1, $v0, $zero
/* AF20C 800BEA0C 01000224 */  addiu      $v0, $zero, 0x1
/* AF210 800BEA10 0B002212 */  beq        $s1, $v0, .L800BEA40
/* AF214 800BEA14 01000426 */   addiu     $a0, $s0, 0x1
/* AF218 800BEA18 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF21C 800BEA1C 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF220 800BEA20 00000000 */  nop
/* AF224 800BEA24 90004018 */  blez       $v0, .L800BEC68
/* AF228 800BEA28 21100000 */   addu      $v0, $zero, $zero
/* AF22C 800BEA2C 0180043C */  lui        $a0, %hi(D_80012850)
/* AF230 800BEA30 06D1010C */  jal        printf
/* AF234 800BEA34 50288424 */   addiu     $a0, $a0, %lo(D_80012850)
/* AF238 800BEA38 1AFB0208 */  j          .L800BEC68
/* AF23C 800BEA3C 21100000 */   addu      $v0, $zero, $zero
.L800BEA40:
/* AF240 800BEA40 0180053C */  lui        $a1, %hi(D_8001287C)
/* AF244 800BEA44 7C28A524 */  addiu      $a1, $a1, %lo(D_8001287C)
/* AF248 800BEA48 3DE8020C */  jal        strncmp
/* AF24C 800BEA4C 05000624 */   addiu     $a2, $zero, 0x5
/* AF250 800BEA50 0B004010 */  beqz       $v0, .L800BEA80
/* AF254 800BEA54 00000000 */   nop
/* AF258 800BEA58 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF25C 800BEA5C 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF260 800BEA60 00000000 */  nop
/* AF264 800BEA64 80004018 */  blez       $v0, .L800BEC68
/* AF268 800BEA68 21100000 */   addu      $v0, $zero, $zero
/* AF26C 800BEA6C 0180043C */  lui        $a0, %hi(D_80012884)
/* AF270 800BEA70 06D1010C */  jal        printf
/* AF274 800BEA74 84288424 */   addiu     $a0, $a0, %lo(D_80012884)
/* AF278 800BEA78 1AFB0208 */  j          .L800BEC68
/* AF27C 800BEA7C 21100000 */   addu      $v0, $zero, $zero
.L800BEA80:
/* AF280 800BEA80 8F00028A */  lwl        $v0, 0x8F($s0)
/* AF284 800BEA84 8C00029A */  lwr        $v0, 0x8C($s0)
/* AF288 800BEA88 00000000 */  nop
/* AF28C 800BEA8C 1B00A2AB */  swl        $v0, 0x1B($sp)
/* AF290 800BEA90 1800A2BB */  swr        $v0, 0x18($sp)
/* AF294 800BEA94 01000424 */  addiu      $a0, $zero, 0x1
/* AF298 800BEA98 1800A58F */  lw         $a1, 0x18($sp)
/* AF29C 800BEA9C F4FB020C */  jal        func_800BEFD0
/* AF2A0 800BEAA0 21300002 */   addu      $a2, $s0, $zero
/* AF2A4 800BEAA4 0C005110 */  beq        $v0, $s1, .L800BEAD8
/* AF2A8 800BEAA8 00000000 */   nop
/* AF2AC 800BEAAC 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF2B0 800BEAB0 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF2B4 800BEAB4 00000000 */  nop
/* AF2B8 800BEAB8 6B004018 */  blez       $v0, .L800BEC68
/* AF2BC 800BEABC 21100000 */   addu      $v0, $zero, $zero
/* AF2C0 800BEAC0 1800A58F */  lw         $a1, 0x18($sp)
/* AF2C4 800BEAC4 0180043C */  lui        $a0, %hi(D_800128B4)
/* AF2C8 800BEAC8 06D1010C */  jal        printf
/* AF2CC 800BEACC B4288424 */   addiu     $a0, $a0, %lo(D_800128B4)
/* AF2D0 800BEAD0 1AFB0208 */  j          .L800BEC68
/* AF2D4 800BEAD4 21100000 */   addu      $v0, $zero, $zero
.L800BEAD8:
/* AF2D8 800BEAD8 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF2DC 800BEADC 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF2E0 800BEAE0 00000000 */  nop
/* AF2E4 800BEAE4 02004228 */  slti       $v0, $v0, 0x2
/* AF2E8 800BEAE8 04004014 */  bnez       $v0, .L800BEAFC
/* AF2EC 800BEAEC 21880002 */   addu      $s1, $s0, $zero
/* AF2F0 800BEAF0 0180043C */  lui        $a0, %hi(D_800128D8)
/* AF2F4 800BEAF4 06D1010C */  jal        printf
/* AF2F8 800BEAF8 D8288424 */   addiu     $a0, $a0, %lo(D_800128D8)
.L800BEAFC:
/* AF2FC 800BEAFC 00082326 */  addiu      $v1, $s1, 0x800
/* AF300 800BEB00 2B102302 */  sltu       $v0, $s1, $v1
/* AF304 800BEB04 42004010 */  beqz       $v0, .L800BEC10
/* AF308 800BEB08 21380000 */   addu      $a3, $zero, $zero
/* AF30C 800BEB0C 0E80143C */  lui        $s4, %hi(GsOUT_PACKET_P_dup1 + 0x888)
/* AF310 800BEB10 F0DE9426 */  addiu      $s4, $s4, %lo(GsOUT_PACKET_P_dup1 + 0x888)
/* AF314 800BEB14 04009626 */  addiu      $s6, $s4, 0x4
/* AF318 800BEB18 21A86000 */  addu       $s5, $v1, $zero
.L800BEB1C:
/* AF31C 800BEB1C 00002292 */  lbu        $v0, 0x0($s1)
/* AF320 800BEB20 00000000 */  nop
/* AF324 800BEB24 3A004010 */  beqz       $v0, .L800BEC10
/* AF328 800BEB28 40100700 */   sll       $v0, $a3, 1
/* AF32C 800BEB2C 21104700 */  addu       $v0, $v0, $a3
/* AF330 800BEB30 80100200 */  sll        $v0, $v0, 2
/* AF334 800BEB34 23104700 */  subu       $v0, $v0, $a3
/* AF338 800BEB38 80800200 */  sll        $s0, $v0, 2
/* AF33C 800BEB3C 21101402 */  addu       $v0, $s0, $s4
/* AF340 800BEB40 0500238A */  lwl        $v1, 0x5($s1)
/* AF344 800BEB44 0200239A */  lwr        $v1, 0x2($s1)
/* AF348 800BEB48 00000000 */  nop
/* AF34C 800BEB4C 030043A8 */  swl        $v1, 0x3($v0)
/* AF350 800BEB50 000043B8 */  swr        $v1, 0x0($v0)
/* AF354 800BEB54 21901602 */  addu       $s2, $s0, $s6
/* AF358 800BEB58 21204002 */  addu       $a0, $s2, $zero
/* AF35C 800BEB5C 06002292 */  lbu        $v0, 0x6($s1)
/* AF360 800BEB60 0100F324 */  addiu      $s3, $a3, 0x1
/* AF364 800BEB64 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1 + 0x880)
/* AF368 800BEB68 21083000 */  addu       $at, $at, $s0
/* AF36C 800BEB6C E8DE33AC */  sw         $s3, %lo(GsOUT_PACKET_P_dup1 + 0x880)($at)
/* AF370 800BEB70 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1 + 0x884)
/* AF374 800BEB74 21083000 */  addu       $at, $at, $s0
/* AF378 800BEB78 ECDE22AC */  sw         $v0, %lo(GsOUT_PACKET_P_dup1 + 0x884)($at)
/* AF37C 800BEB7C 00002692 */  lbu        $a2, 0x0($s1)
/* AF380 800BEB80 02E5010C */  jal        memcpy
/* AF384 800BEB84 08002526 */   addiu     $a1, $s1, 0x8
/* AF388 800BEB88 00002292 */  lbu        $v0, 0x0($s1)
/* AF38C 800BEB8C 00000000 */  nop
/* AF390 800BEB90 21104202 */  addu       $v0, $s2, $v0
/* AF394 800BEB94 000040A0 */  sb         $zero, 0x0($v0)
/* AF398 800BEB98 00002392 */  lbu        $v1, 0x0($s1)
/* AF39C 800BEB9C 00000000 */  nop
/* AF3A0 800BEBA0 01006230 */  andi       $v0, $v1, 0x1
/* AF3A4 800BEBA4 08004224 */  addiu      $v0, $v0, 0x8
/* AF3A8 800BEBA8 21186200 */  addu       $v1, $v1, $v0
/* AF3AC 800BEBAC 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF3B0 800BEBB0 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF3B4 800BEBB4 00000000 */  nop
/* AF3B8 800BEBB8 02004228 */  slti       $v0, $v0, 0x2
/* AF3BC 800BEBBC 0E004014 */  bnez       $v0, .L800BEBF8
/* AF3C0 800BEBC0 21882302 */   addu      $s1, $s1, $v1
/* AF3C4 800BEBC4 0E80053C */  lui        $a1, %hi(GsOUT_PACKET_P_dup1 + 0x888)
/* AF3C8 800BEBC8 2128B000 */  addu       $a1, $a1, $s0
/* AF3CC 800BEBCC F0DEA58C */  lw         $a1, %lo(GsOUT_PACKET_P_dup1 + 0x888)($a1)
/* AF3D0 800BEBD0 0E80063C */  lui        $a2, %hi(GsOUT_PACKET_P_dup1 + 0x880)
/* AF3D4 800BEBD4 2130D000 */  addu       $a2, $a2, $s0
/* AF3D8 800BEBD8 E8DEC68C */  lw         $a2, %lo(GsOUT_PACKET_P_dup1 + 0x880)($a2)
/* AF3DC 800BEBDC 0E80073C */  lui        $a3, %hi(GsOUT_PACKET_P_dup1 + 0x884)
/* AF3E0 800BEBE0 2138F000 */  addu       $a3, $a3, $s0
/* AF3E4 800BEBE4 ECDEE78C */  lw         $a3, %lo(GsOUT_PACKET_P_dup1 + 0x884)($a3)
/* AF3E8 800BEBE8 0180043C */  lui        $a0, %hi(D_800128F8)
/* AF3EC 800BEBEC F8288424 */  addiu      $a0, $a0, %lo(D_800128F8)
/* AF3F0 800BEBF0 06D1010C */  jal        printf
/* AF3F4 800BEBF4 1000B2AF */   sw        $s2, 0x10($sp)
.L800BEBF8:
/* AF3F8 800BEBF8 21386002 */  addu       $a3, $s3, $zero
/* AF3FC 800BEBFC 8000E228 */  slti       $v0, $a3, 0x80
/* AF400 800BEC00 0D004010 */  beqz       $v0, .L800BEC38
/* AF404 800BEC04 2B103502 */   sltu      $v0, $s1, $s5
/* AF408 800BEC08 C4FF4014 */  bnez       $v0, .L800BEB1C
/* AF40C 800BEC0C 00000000 */   nop
.L800BEC10:
/* AF410 800BEC10 8000E228 */  slti       $v0, $a3, 0x80
/* AF414 800BEC14 08004010 */  beqz       $v0, .L800BEC38
/* AF418 800BEC18 40100700 */   sll       $v0, $a3, 1
/* AF41C 800BEC1C 21104700 */  addu       $v0, $v0, $a3
/* AF420 800BEC20 80100200 */  sll        $v0, $v0, 2
/* AF424 800BEC24 23104700 */  subu       $v0, $v0, $a3
/* AF428 800BEC28 80100200 */  sll        $v0, $v0, 2
/* AF42C 800BEC2C 0E80013C */  lui        $at, %hi(GsOUT_PACKET_P_dup1 + 0x884)
/* AF430 800BEC30 21082200 */  addu       $at, $at, $v0
/* AF434 800BEC34 ECDE20AC */  sw         $zero, %lo(GsOUT_PACKET_P_dup1 + 0x884)($at)
.L800BEC38:
/* AF438 800BEC38 0D80023C */  lui        $v0, %hi(CD_debug)
/* AF43C 800BEC3C 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* AF440 800BEC40 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0xC)
/* AF444 800BEC44 4CE420AC */  sw         $zero, %lo(CD_read_dma_mode + 0xC)($at)
/* AF448 800BEC48 02004228 */  slti       $v0, $v0, 0x2
/* AF44C 800BEC4C 06004014 */  bnez       $v0, .L800BEC68
/* AF450 800BEC50 01000224 */   addiu     $v0, $zero, 0x1
/* AF454 800BEC54 0180043C */  lui        $a0, %hi(D_8001290C)
/* AF458 800BEC58 0C298424 */  addiu      $a0, $a0, %lo(D_8001290C)
/* AF45C 800BEC5C 06D1010C */  jal        printf
/* AF460 800BEC60 2128E000 */   addu      $a1, $a3, $zero
/* AF464 800BEC64 01000224 */  addiu      $v0, $zero, 0x1
.L800BEC68:
/* AF468 800BEC68 3C00BF8F */  lw         $ra, 0x3C($sp)
/* AF46C 800BEC6C 3800B68F */  lw         $s6, 0x38($sp)
/* AF470 800BEC70 3400B58F */  lw         $s5, 0x34($sp)
/* AF474 800BEC74 3000B48F */  lw         $s4, 0x30($sp)
/* AF478 800BEC78 2C00B38F */  lw         $s3, 0x2C($sp)
/* AF47C 800BEC7C 2800B28F */  lw         $s2, 0x28($sp)
/* AF480 800BEC80 2400B18F */  lw         $s1, 0x24($sp)
/* AF484 800BEC84 2000B08F */  lw         $s0, 0x20($sp)
/* AF488 800BEC88 0800E003 */  jr         $ra
/* AF48C 800BEC8C 4000BD27 */   addiu     $sp, $sp, 0x40
.size func_800BE9CC, . - func_800BE9CC
