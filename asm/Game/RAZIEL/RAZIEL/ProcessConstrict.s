.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessConstrict
/* A2AA0 800B22A0 54FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x424)($gp)
/* A2AA4 800B22A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A2AA8 800B22A8 1400BFAF */  sw         $ra, 0x14($sp)
/* A2AAC 800B22AC 01006230 */  andi       $v0, $v1, 0x1
/* A2AB0 800B22B0 0A004010 */  beqz       $v0, .L800B22DC
/* A2AB4 800B22B4 1000B0AF */   sw        $s0, 0x10($sp)
/* A2AB8 800B22B8 FEFF0224 */  addiu      $v0, $zero, -0x2
/* A2ABC 800B22BC 24106200 */  and        $v0, $v1, $v0
/* A2AC0 800B22C0 04004234 */  ori        $v0, $v0, 0x4
/* A2AC4 800B22C4 48FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x418)($gp)
/* A2AC8 800B22C8 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2ACC 800B22CC 4AFA80A7 */  sh         $zero, %gp_rel(Raziel + 0x41A)($gp)
/* A2AD0 800B22D0 58FA80AF */  sw         $zero, %gp_rel(Raziel + 0x428)($gp)
/* A2AD4 800B22D4 5CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x42C)($gp)
/* A2AD8 800B22D8 56FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x426)($gp)
.L800B22DC:
/* A2ADC 800B22DC 34F6848F */  lw         $a0, %gp_rel(Raziel + 0x4)($gp)
/* A2AE0 800B22E0 58FA828F */  lw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2AE4 800B22E4 5C008384 */  lh         $v1, 0x5C($a0)
/* A2AE8 800B22E8 00000000 */  nop
/* A2AEC 800B22EC 21104300 */  addu       $v0, $v0, $v1
/* A2AF0 800B22F0 58FA82AF */  sw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2AF4 800B22F4 5E008584 */  lh         $a1, 0x5E($a0)
/* A2AF8 800B22F8 5CFA828F */  lw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2AFC 800B22FC 48FA8387 */  lh         $v1, %gp_rel(Raziel + 0x418)($gp)
/* A2B00 800B2300 21104500 */  addu       $v0, $v0, $a1
/* A2B04 800B2304 80180300 */  sll        $v1, $v1, 2
/* A2B08 800B2308 5CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2B0C 800B230C 44FA828F */  lw         $v0, %gp_rel(Raziel + 0x414)($gp)
/* A2B10 800B2310 5C008494 */  lhu        $a0, 0x5C($a0)
/* A2B14 800B2314 21186200 */  addu       $v1, $v1, $v0
/* A2B18 800B2318 000064A4 */  sh         $a0, 0x0($v1)
/* A2B1C 800B231C 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2B20 800B2320 34F6838F */  lw         $v1, %gp_rel(Raziel + 0x4)($gp)
/* A2B24 800B2324 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2B28 800B2328 80100200 */  sll        $v0, $v0, 2
/* A2B2C 800B232C 5E006394 */  lhu        $v1, 0x5E($v1)
/* A2B30 800B2330 21104400 */  addu       $v0, $v0, $a0
/* A2B34 800B2334 020043A4 */  sh         $v1, 0x2($v0)
/* A2B38 800B2338 48FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2B3C 800B233C 00000000 */  nop
/* A2B40 800B2340 01004224 */  addiu      $v0, $v0, 0x1
/* A2B44 800B2344 48FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2B48 800B2348 00140200 */  sll        $v0, $v0, 16
/* A2B4C 800B234C 03140200 */  sra        $v0, $v0, 16
/* A2B50 800B2350 20004228 */  slti       $v0, $v0, 0x20
/* A2B54 800B2354 02004014 */  bnez       $v0, .L800B2360
/* A2B58 800B2358 00000000 */   nop
/* A2B5C 800B235C 48FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x418)($gp)
.L800B2360:
/* A2B60 800B2360 54FA8497 */  lhu        $a0, %gp_rel(Raziel + 0x424)($gp)
/* A2B64 800B2364 00000000 */  nop
/* A2B68 800B2368 04008230 */  andi       $v0, $a0, 0x4
/* A2B6C 800B236C 08004010 */  beqz       $v0, .L800B2390
/* A2B70 800B2370 00000000 */   nop
/* A2B74 800B2374 4AFA8387 */  lh         $v1, %gp_rel(Raziel + 0x41A)($gp)
/* A2B78 800B2378 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2B7C 800B237C 00000000 */  nop
/* A2B80 800B2380 02006214 */  bne        $v1, $v0, .L800B238C
/* A2B84 800B2384 DFFF8230 */   andi      $v0, $a0, 0xFFDF
/* A2B88 800B2388 22008234 */  ori        $v0, $a0, 0x22
.L800B238C:
/* A2B8C 800B238C 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
.L800B2390:
/* A2B90 800B2390 54FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2B94 800B2394 00000000 */  nop
/* A2B98 800B2398 02004230 */  andi       $v0, $v0, 0x2
/* A2B9C 800B239C 71004010 */  beqz       $v0, .L800B2564
/* A2BA0 800B23A0 21800000 */   addu      $s0, $zero, $zero
/* A2BA4 800B23A4 58FA848F */  lw         $a0, %gp_rel(Raziel + 0x428)($gp)
/* A2BA8 800B23A8 5CFA858F */  lw         $a1, %gp_rel(Raziel + 0x42C)($gp)
/* A2BAC 800B23AC 34F6838F */  lw         $v1, %gp_rel(Raziel + 0x4)($gp)
/* A2BB0 800B23B0 42110400 */  srl        $v0, $a0, 5
/* A2BB4 800B23B4 4CFA82A7 */  sh         $v0, %gp_rel(Raziel + 0x41C)($gp)
/* A2BB8 800B23B8 42110500 */  srl        $v0, $a1, 5
/* A2BBC 800B23BC 4EFA82A7 */  sh         $v0, %gp_rel(Raziel + 0x41E)($gp)
/* A2BC0 800B23C0 60006294 */  lhu        $v0, 0x60($v1)
/* A2BC4 800B23C4 00000000 */  nop
/* A2BC8 800B23C8 00014224 */  addiu      $v0, $v0, 0x100
/* A2BCC 800B23CC 50FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x420)($gp)
/* A2BD0 800B23D0 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2BD4 800B23D4 44FA838F */  lw         $v1, %gp_rel(Raziel + 0x414)($gp)
/* A2BD8 800B23D8 80100200 */  sll        $v0, $v0, 2
/* A2BDC 800B23DC 21104300 */  addu       $v0, $v0, $v1
/* A2BE0 800B23E0 00004384 */  lh         $v1, 0x0($v0)
/* A2BE4 800B23E4 00000000 */  nop
/* A2BE8 800B23E8 23208300 */  subu       $a0, $a0, $v1
/* A2BEC 800B23EC 58FA84AF */  sw         $a0, %gp_rel(Raziel + 0x428)($gp)
/* A2BF0 800B23F0 02004384 */  lh         $v1, 0x2($v0)
/* A2BF4 800B23F4 01000224 */  addiu      $v0, $zero, 0x1
/* A2BF8 800B23F8 56FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x426)($gp)
/* A2BFC 800B23FC 2328A300 */  subu       $a1, $a1, $v1
/* A2C00 800B2400 5CFA85AF */  sw         $a1, %gp_rel(Raziel + 0x42C)($gp)
/* A2C04 800B2404 21300000 */  addu       $a2, $zero, $zero
.L800B2408:
/* A2C08 800B2408 80101000 */  sll        $v0, $s0, 2
/* A2C0C 800B240C 44FA838F */  lw         $v1, %gp_rel(Raziel + 0x414)($gp)
/* A2C10 800B2410 4CFA8487 */  lh         $a0, %gp_rel(Raziel + 0x41C)($gp)
/* A2C14 800B2414 4EFA8587 */  lh         $a1, %gp_rel(Raziel + 0x41E)($gp)
/* A2C18 800B2418 21104300 */  addu       $v0, $v0, $v1
/* A2C1C 800B241C 00004384 */  lh         $v1, 0x0($v0)
/* A2C20 800B2420 02004284 */  lh         $v0, 0x2($v0)
/* A2C24 800B2424 23206400 */  subu       $a0, $v1, $a0
/* A2C28 800B2428 E7E9000C */  jal        MATH3D_SquareLength
/* A2C2C 800B242C 23284500 */   subu      $a1, $v0, $a1
/* A2C30 800B2430 0C00033C */  lui        $v1, (0xC7FFE >> 16)
/* A2C34 800B2434 FE7F6334 */  ori        $v1, $v1, (0xC7FFE & 0xFFFF)
/* A2C38 800B2438 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A2C3C 800B243C 2B186200 */  sltu       $v1, $v1, $v0
/* A2C40 800B2440 02006010 */  beqz       $v1, .L800B244C
/* A2C44 800B2444 00000000 */   nop
/* A2C48 800B2448 56FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x426)($gp)
.L800B244C:
/* A2C4C 800B244C 01001026 */  addiu      $s0, $s0, 0x1
/* A2C50 800B2450 2000022A */  slti       $v0, $s0, 0x20
/* A2C54 800B2454 ECFF4014 */  bnez       $v0, .L800B2408
/* A2C58 800B2458 21300000 */   addu      $a2, $zero, $zero
/* A2C5C 800B245C 56FA8287 */  lh         $v0, %gp_rel(Raziel + 0x426)($gp)
/* A2C60 800B2460 00000000 */  nop
/* A2C64 800B2464 38004010 */  beqz       $v0, .L800B2548
/* A2C68 800B2468 21200000 */   addu      $a0, $zero, $zero
/* A2C6C 800B246C 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2C70 800B2470 00000000 */  nop
/* A2C74 800B2474 FFFF4324 */  addiu      $v1, $v0, -0x1
/* A2C78 800B2478 04006104 */  bgez       $v1, .L800B248C
/* A2C7C 800B247C 80180300 */   sll       $v1, $v1, 2
/* A2C80 800B2480 1F000324 */  addiu      $v1, $zero, 0x1F
/* A2C84 800B2484 21300000 */  addu       $a2, $zero, $zero
/* A2C88 800B2488 80180300 */  sll        $v1, $v1, 2
.L800B248C:
/* A2C8C 800B248C 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2C90 800B2490 80100200 */  sll        $v0, $v0, 2
/* A2C94 800B2494 21186400 */  addu       $v1, $v1, $a0
/* A2C98 800B2498 21104400 */  addu       $v0, $v0, $a0
/* A2C9C 800B249C 00006784 */  lh         $a3, 0x0($v1)
/* A2CA0 800B24A0 00004484 */  lh         $a0, 0x0($v0)
/* A2CA4 800B24A4 02006384 */  lh         $v1, 0x2($v1)
/* A2CA8 800B24A8 02004584 */  lh         $a1, 0x2($v0)
/* A2CAC 800B24AC 2320E400 */  subu       $a0, $a3, $a0
/* A2CB0 800B24B0 E7E9000C */  jal        MATH3D_SquareLength
/* A2CB4 800B24B4 23286500 */   subu      $a1, $v1, $a1
/* A2CB8 800B24B8 1500033C */  lui        $v1, (0x15F900 >> 16)
/* A2CBC 800B24BC 00F96334 */  ori        $v1, $v1, (0x15F900 & 0xFFFF)
/* A2CC0 800B24C0 2B186200 */  sltu       $v1, $v1, $v0
/* A2CC4 800B24C4 02006010 */  beqz       $v1, .L800B24D0
/* A2CC8 800B24C8 00000000 */   nop
/* A2CCC 800B24CC 56FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x426)($gp)
.L800B24D0:
/* A2CD0 800B24D0 56FA8487 */  lh         $a0, %gp_rel(Raziel + 0x426)($gp)
/* A2CD4 800B24D4 00000000 */  nop
/* A2CD8 800B24D8 1A008010 */  beqz       $a0, .L800B2544
/* A2CDC 800B24DC 00000000 */   nop
/* A2CE0 800B24E0 54FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2CE4 800B24E4 48FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x418)($gp)
/* A2CE8 800B24E8 58FA80AF */  sw         $zero, %gp_rel(Raziel + 0x428)($gp)
/* A2CEC 800B24EC 5CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x42C)($gp)
/* A2CF0 800B24F0 FDFF4230 */  andi       $v0, $v0, 0xFFFD
/* A2CF4 800B24F4 1C004234 */  ori        $v0, $v0, 0x1C
/* A2CF8 800B24F8 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2CFC 800B24FC 02008228 */  slti       $v0, $a0, 0x2
/* A2D00 800B2500 4AFA83A7 */  sh         $v1, %gp_rel(Raziel + 0x41A)($gp)
/* A2D04 800B2504 09004014 */  bnez       $v0, .L800B252C
/* A2D08 800B2508 01000424 */   addiu     $a0, $zero, 0x1
/* A2D0C 800B250C 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A2D10 800B2510 00000000 */  nop
/* A2D14 800B2514 04004234 */  ori        $v0, $v0, 0x4
/* A2D18 800B2518 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A2D1C 800B251C 261F010C */  jal        FX_EndConstrict
/* A2D20 800B2520 21280000 */   addu      $a1, $zero, $zero
/* A2D24 800B2524 01000224 */  addiu      $v0, $zero, 0x1
/* A2D28 800B2528 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
.L800B252C:
/* A2D2C 800B252C 56FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x426)($gp)
/* A2D30 800B2530 00000000 */  nop
/* A2D34 800B2534 01004224 */  addiu      $v0, $v0, 0x1
/* A2D38 800B2538 56FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x426)($gp)
/* A2D3C 800B253C 59C90208 */  j          .L800B2564
/* A2D40 800B2540 00000000 */   nop
.L800B2544:
/* A2D44 800B2544 21200000 */  addu       $a0, $zero, $zero
.L800B2548:
/* A2D48 800B2548 54FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2D4C 800B254C 01000324 */  addiu      $v1, $zero, 0x1
/* A2D50 800B2550 56FA83A7 */  sh         $v1, %gp_rel(Raziel + 0x426)($gp)
/* A2D54 800B2554 EFFF4230 */  andi       $v0, $v0, 0xFFEF
/* A2D58 800B2558 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2D5C 800B255C 261F010C */  jal        FX_EndConstrict
/* A2D60 800B2560 21288000 */   addu      $a1, $a0, $zero
.L800B2564:
/* A2D64 800B2564 1400BF8F */  lw         $ra, 0x14($sp)
/* A2D68 800B2568 1000B08F */  lw         $s0, 0x10($sp)
/* A2D6C 800B256C 0800E003 */  jr         $ra
/* A2D70 800B2570 1800BD27 */   addiu     $sp, $sp, 0x18
.size ProcessConstrict, . - ProcessConstrict
