.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielPost
/* A1A90 800B1290 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A1A94 800B1294 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A1A98 800B1298 21888000 */  addu       $s1, $a0, $zero
/* A1A9C 800B129C 3000B2AF */  sw         $s2, 0x30($sp)
/* A1AA0 800B12A0 2190A000 */  addu       $s2, $a1, $zero
/* A1AA4 800B12A4 3400B3AF */  sw         $s3, 0x34($sp)
/* A1AA8 800B12A8 2198C000 */  addu       $s3, $a2, $zero
/* A1AAC 800B12AC 1000023C */  lui        $v0, (0x10000A >> 16)
/* A1AB0 800B12B0 0A004234 */  ori        $v0, $v0, (0x10000A & 0xFFFF)
/* A1AB4 800B12B4 3800BFAF */  sw         $ra, 0x38($sp)
/* A1AB8 800B12B8 40014212 */  beq        $s2, $v0, .L800B17BC
/* A1ABC 800B12BC 2800B0AF */   sw        $s0, 0x28($sp)
/* A1AC0 800B12C0 2B105200 */  sltu       $v0, $v0, $s2
/* A1AC4 800B12C4 41004014 */  bnez       $v0, .L800B13CC
/* A1AC8 800B12C8 2000023C */   lui       $v0, (0x200001 >> 16)
/* A1ACC 800B12CC 0400023C */  lui        $v0, (0x40012 >> 16)
/* A1AD0 800B12D0 12004234 */  ori        $v0, $v0, (0x40012 & 0xFFFF)
/* A1AD4 800B12D4 82014212 */  beq        $s2, $v0, .L800B18E0
/* A1AD8 800B12D8 2B105200 */   sltu      $v0, $v0, $s2
/* A1ADC 800B12DC 1D004014 */  bnez       $v0, .L800B1354
/* A1AE0 800B12E0 0400023C */   lui       $v0, (0x40006 >> 16)
/* A1AE4 800B12E4 06004234 */  ori        $v0, $v0, (0x40006 & 0xFFFF)
/* A1AE8 800B12E8 03014212 */  beq        $s2, $v0, .L800B16F8
/* A1AEC 800B12EC 2B105200 */   sltu      $v0, $v0, $s2
/* A1AF0 800B12F0 09004014 */  bnez       $v0, .L800B1318
/* A1AF4 800B12F4 0400023C */   lui       $v0, (0x40001 >> 16)
/* A1AF8 800B12F8 01004234 */  ori        $v0, $v0, (0x40001 & 0xFFFF)
/* A1AFC 800B12FC E9004212 */  beq        $s2, $v0, .L800B16A4
/* A1B00 800B1300 0400023C */   lui       $v0, (0x40004 >> 16)
/* A1B04 800B1304 04004234 */  ori        $v0, $v0, (0x40004 & 0xFFFF)
/* A1B08 800B1308 07014212 */  beq        $s2, $v0, .L800B1728
/* A1B0C 800B130C 21800000 */   addu      $s0, $zero, $zero
/* A1B10 800B1310 F4C60208 */  j          .L800B1BD0
/* A1B14 800B1314 00000000 */   nop
.L800B1318:
/* A1B18 800B1318 0E004234 */  ori        $v0, $v0, (0x4000E & 0xFFFF)
/* A1B1C 800B131C CA014212 */  beq        $s2, $v0, .L800B1A48
/* A1B20 800B1320 2B105200 */   sltu      $v0, $v0, $s2
/* A1B24 800B1324 06004014 */  bnez       $v0, .L800B1340
/* A1B28 800B1328 0400023C */   lui       $v0, (0x40008 >> 16)
/* A1B2C 800B132C 08004234 */  ori        $v0, $v0, (0x40008 & 0xFFFF)
/* A1B30 800B1330 F5004212 */  beq        $s2, $v0, .L800B1708
/* A1B34 800B1334 21800000 */   addu      $s0, $zero, $zero
/* A1B38 800B1338 F4C60208 */  j          .L800B1BD0
/* A1B3C 800B133C 00000000 */   nop
.L800B1340:
/* A1B40 800B1340 11004234 */  ori        $v0, $v0, (0x40011 & 0xFFFF)
/* A1B44 800B1344 62014212 */  beq        $s2, $v0, .L800B18D0
/* A1B48 800B1348 21800000 */   addu      $s0, $zero, $zero
/* A1B4C 800B134C F4C60208 */  j          .L800B1BD0
/* A1B50 800B1350 00000000 */   nop
.L800B1354:
/* A1B54 800B1354 22004234 */  ori        $v0, $v0, (0x40022 & 0xFFFF)
/* A1B58 800B1358 AB014212 */  beq        $s2, $v0, .L800B1A08
/* A1B5C 800B135C 2B105200 */   sltu      $v0, $v0, $s2
/* A1B60 800B1360 0A004014 */  bnez       $v0, .L800B138C
/* A1B64 800B1364 1000023C */   lui       $v0, (0x100007 >> 16)
/* A1B68 800B1368 0400023C */  lui        $v0, (0x40015 >> 16)
/* A1B6C 800B136C 15004234 */  ori        $v0, $v0, (0x40015 & 0xFFFF)
/* A1B70 800B1370 66014212 */  beq        $s2, $v0, .L800B190C
/* A1B74 800B1374 0400023C */   lui       $v0, (0x40019 >> 16)
/* A1B78 800B1378 19004234 */  ori        $v0, $v0, (0x40019 & 0xFFFF)
/* A1B7C 800B137C E6004212 */  beq        $s2, $v0, .L800B1718
/* A1B80 800B1380 21800000 */   addu      $s0, $zero, $zero
/* A1B84 800B1384 F4C60208 */  j          .L800B1BD0
/* A1B88 800B1388 00000000 */   nop
.L800B138C:
/* A1B8C 800B138C 07004234 */  ori        $v0, $v0, (0x100007 & 0xFFFF)
/* A1B90 800B1390 78004212 */  beq        $s2, $v0, .L800B1574
/* A1B94 800B1394 2B105200 */   sltu      $v0, $v0, $s2
/* A1B98 800B1398 07004014 */  bnez       $v0, .L800B13B8
/* A1B9C 800B139C 1000023C */   lui       $v0, (0x100008 >> 16)
/* A1BA0 800B13A0 0400023C */  lui        $v0, (0x40024 >> 16)
/* A1BA4 800B13A4 24004234 */  ori        $v0, $v0, (0x40024 & 0xFFFF)
/* A1BA8 800B13A8 9A014212 */  beq        $s2, $v0, .L800B1A14
/* A1BAC 800B13AC 21800000 */   addu      $s0, $zero, $zero
/* A1BB0 800B13B0 F4C60208 */  j          .L800B1BD0
/* A1BB4 800B13B4 00000000 */   nop
.L800B13B8:
/* A1BB8 800B13B8 08004234 */  ori        $v0, $v0, (0x100008 & 0xFFFF)
/* A1BBC 800B13BC E5004212 */  beq        $s2, $v0, .L800B1754
/* A1BC0 800B13C0 21800000 */   addu      $s0, $zero, $zero
/* A1BC4 800B13C4 F4C60208 */  j          .L800B1BD0
/* A1BC8 800B13C8 00000000 */   nop
.L800B13CC:
/* A1BCC 800B13CC 01004234 */  ori        $v0, $v0, (0x200001 & 0xFFFF)
/* A1BD0 800B13D0 3E004212 */  beq        $s2, $v0, .L800B14CC
/* A1BD4 800B13D4 2B105200 */   sltu      $v0, $v0, $s2
/* A1BD8 800B13D8 1E004014 */  bnez       $v0, .L800B1454
/* A1BDC 800B13DC 0004023C */   lui       $v0, (0x4000001 >> 16)
/* A1BE0 800B13E0 1000023C */  lui        $v0, (0x100012 >> 16)
/* A1BE4 800B13E4 12004234 */  ori        $v0, $v0, (0x100012 & 0xFFFF)
/* A1BE8 800B13E8 67014212 */  beq        $s2, $v0, .L800B1988
/* A1BEC 800B13EC 2B105200 */   sltu      $v0, $v0, $s2
/* A1BF0 800B13F0 09004014 */  bnez       $v0, .L800B1418
/* A1BF4 800B13F4 1000023C */   lui       $v0, (0x100010 >> 16)
/* A1BF8 800B13F8 10004234 */  ori        $v0, $v0, (0x100010 & 0xFFFF)
/* A1BFC 800B13FC 0F014212 */  beq        $s2, $v0, .L800B183C
/* A1C00 800B1400 1000023C */   lui       $v0, (0x100011 >> 16)
/* A1C04 800B1404 11004234 */  ori        $v0, $v0, (0x100011 & 0xFFFF)
/* A1C08 800B1408 58014212 */  beq        $s2, $v0, .L800B196C
/* A1C0C 800B140C 21800000 */   addu      $s0, $zero, $zero
/* A1C10 800B1410 F4C60208 */  j          .L800B1BD0
/* A1C14 800B1414 00000000 */   nop
.L800B1418:
/* A1C18 800B1418 16004234 */  ori        $v0, $v0, (0x100016 & 0xFFFF)
/* A1C1C 800B141C DA014212 */  beq        $s2, $v0, .L800B1B88
/* A1C20 800B1420 2B105200 */   sltu      $v0, $v0, $s2
/* A1C24 800B1424 07004014 */  bnez       $v0, .L800B1444
/* A1C28 800B1428 2000023C */   lui       $v0, (0x200000 >> 16)
/* A1C2C 800B142C 1000023C */  lui        $v0, (0x100013 >> 16)
/* A1C30 800B1430 13004234 */  ori        $v0, $v0, (0x100013 & 0xFFFF)
/* A1C34 800B1434 63014212 */  beq        $s2, $v0, .L800B19C4
/* A1C38 800B1438 21800000 */   addu      $s0, $zero, $zero
/* A1C3C 800B143C F4C60208 */  j          .L800B1BD0
/* A1C40 800B1440 00000000 */   nop
.L800B1444:
/* A1C44 800B1444 2F004212 */  beq        $s2, $v0, .L800B1504
/* A1C48 800B1448 21800000 */   addu      $s0, $zero, $zero
/* A1C4C 800B144C F4C60208 */  j          .L800B1BD0
/* A1C50 800B1450 00000000 */   nop
.L800B1454:
/* A1C54 800B1454 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* A1C58 800B1458 7D004212 */  beq        $s2, $v0, .L800B1650
/* A1C5C 800B145C 2B105200 */   sltu      $v0, $v0, $s2
/* A1C60 800B1460 0A004014 */  bnez       $v0, .L800B148C
/* A1C64 800B1464 0004023C */   lui       $v0, (0x4000006 >> 16)
/* A1C68 800B1468 2000023C */  lui        $v0, (0x200004 >> 16)
/* A1C6C 800B146C 04004234 */  ori        $v0, $v0, (0x200004 & 0xFFFF)
/* A1C70 800B1470 2F004212 */  beq        $s2, $v0, .L800B1530
/* A1C74 800B1474 8000023C */   lui       $v0, (0x800024 >> 16)
/* A1C78 800B1478 24004234 */  ori        $v0, $v0, (0x800024 & 0xFFFF)
/* A1C7C 800B147C 99004212 */  beq        $s2, $v0, .L800B16E4
/* A1C80 800B1480 21800000 */   addu      $s0, $zero, $zero
/* A1C84 800B1484 F4C60208 */  j          .L800B1BD0
/* A1C88 800B1488 00000000 */   nop
.L800B148C:
/* A1C8C 800B148C 06004234 */  ori        $v0, $v0, (0x4000006 & 0xFFFF)
/* A1C90 800B1490 6B004212 */  beq        $s2, $v0, .L800B1640
/* A1C94 800B1494 2B105200 */   sltu      $v0, $v0, $s2
/* A1C98 800B1498 07004014 */  bnez       $v0, .L800B14B8
/* A1C9C 800B149C 0010023C */   lui       $v0, (0x10002000 >> 16)
/* A1CA0 800B14A0 0004023C */  lui        $v0, (0x4000005 >> 16)
/* A1CA4 800B14A4 05004234 */  ori        $v0, $v0, (0x4000005 & 0xFFFF)
/* A1CA8 800B14A8 62004212 */  beq        $s2, $v0, .L800B1634
/* A1CAC 800B14AC 21800000 */   addu      $s0, $zero, $zero
/* A1CB0 800B14B0 F4C60208 */  j          .L800B1BD0
/* A1CB4 800B14B4 00000000 */   nop
.L800B14B8:
/* A1CB8 800B14B8 00204234 */  ori        $v0, $v0, (0x10002000 & 0xFFFF)
/* A1CBC 800B14BC 0F014212 */  beq        $s2, $v0, .L800B18FC
/* A1CC0 800B14C0 21800000 */   addu      $s0, $zero, $zero
/* A1CC4 800B14C4 F4C60208 */  j          .L800B1BD0
/* A1CC8 800B14C8 00000000 */   nop
.L800B14CC:
/* A1CCC 800B14CC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A1CD0 800B14D0 0400033C */  lui        $v1, (0x40000 >> 16)
/* A1CD4 800B14D4 24104300 */  and        $v0, $v0, $v1
/* A1CD8 800B14D8 C6014014 */  bnez       $v0, .L800B1BF4
/* A1CDC 800B14DC 00000000 */   nop
/* A1CE0 800B14E0 4393020C */  jal        HealthCheckForLowHealth
/* A1CE4 800B14E4 00000000 */   nop
/* A1CE8 800B14E8 C2014014 */  bnez       $v0, .L800B1BF4
/* A1CEC 800B14EC 00000000 */   nop
/* A1CF0 800B14F0 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* A1CF4 800B14F4 D78C020C */  jal        UpdateEngagementList
/* A1CF8 800B14F8 21206002 */   addu      $a0, $s3, $zero
/* A1CFC 800B14FC FDC60208 */  j          .L800B1BF4
/* A1D00 800B1500 00000000 */   nop
.L800B1504:
/* A1D04 800B1504 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A1D08 800B1508 0400033C */  lui        $v1, (0x40000 >> 16)
/* A1D0C 800B150C 24104300 */  and        $v0, $v0, $v1
/* A1D10 800B1510 02004014 */  bnez       $v0, .L800B151C
/* A1D14 800B1514 00000000 */   nop
/* A1D18 800B1518 0CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x3DC)($gp)
.L800B151C:
/* A1D1C 800B151C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A1D20 800B1520 DFFF0324 */  addiu      $v1, $zero, -0x21
/* A1D24 800B1524 24104300 */  and        $v0, $v0, $v1
/* A1D28 800B1528 7EC60208 */  j          .L800B19F8
/* A1D2C 800B152C BFFF0324 */   addiu     $v1, $zero, -0x41
.L800B1530:
/* A1D30 800B1530 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A1D34 800B1534 0040033C */  lui        $v1, (0x40000000 >> 16)
/* A1D38 800B1538 24104300 */  and        $v0, $v0, $v1
/* A1D3C 800B153C AD014010 */  beqz       $v0, .L800B1BF4
/* A1D40 800B1540 21202002 */   addu      $a0, $s1, $zero
/* A1D44 800B1544 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* A1D48 800B1548 C00033AE */  sw         $s3, 0xC0($s1)
/* A1D4C 800B154C B7CF020C */  jal        RazielCollide
/* A1D50 800B1550 2C0060A6 */   sh        $zero, 0x2C($s3)
/* A1D54 800B1554 2197020C */  jal        razGetHeldItem
/* A1D58 800B1558 00000000 */   nop
/* A1D5C 800B155C C000258E */  lw         $a1, 0xC0($s1)
/* A1D60 800B1560 21204000 */  addu       $a0, $v0, $zero
/* A1D64 800B1564 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* A1D68 800B1568 2800A524 */   addiu     $a1, $a1, 0x28
/* A1D6C 800B156C FDC60208 */  j          .L800B1BF4
/* A1D70 800B1570 00000000 */   nop
.L800B1574:
/* A1D74 800B1574 0D80043C */  lui        $a0, %hi(D_800D1D1C)
/* A1D78 800B1578 0400708E */  lw         $s0, 0x4($s3)
/* A1D7C 800B157C 1C1D8424 */  addiu      $a0, $a0, %lo(D_800D1D1C)
/* A1D80 800B1580 0000028E */  lw         $v0, 0x0($s0)
/* A1D84 800B1584 00000000 */  nop
/* A1D88 800B1588 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A1D8C 800B158C 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* A1D90 800B1590 AA9F020C */  jal        razInBaseArea
/* A1D94 800B1594 05000524 */   addiu     $a1, $zero, 0x5
/* A1D98 800B1598 02004014 */  bnez       $v0, .L800B15A4
/* A1D9C 800B159C 02000224 */   addiu     $v0, $zero, 0x2
/* A1DA0 800B15A0 0400028E */  lw         $v0, 0x4($s0)
.L800B15A4:
/* A1DA4 800B15A4 00000000 */  nop
/* A1DA8 800B15A8 68FA82AF */  sw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* A1DAC 800B15AC 08000296 */  lhu        $v0, 0x8($s0)
/* A1DB0 800B15B0 00000000 */  nop
/* A1DB4 800B15B4 28FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F8)($gp)
/* A1DB8 800B15B8 0C000296 */  lhu        $v0, 0xC($s0)
/* A1DBC 800B15BC 00000000 */  nop
/* A1DC0 800B15C0 2AFA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3FA)($gp)
/* A1DC4 800B15C4 0C00048E */  lw         $a0, 0xC($s0)
/* A1DC8 800B15C8 21F1010C */  jal        HUD_Setup_Chit_Count
/* A1DCC 800B15CC 00000000 */   nop
/* A1DD0 800B15D0 10000296 */  lhu        $v0, 0x10($s0)
/* A1DD4 800B15D4 00000000 */  nop
/* A1DD8 800B15D8 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* A1DDC 800B15DC 12000396 */  lhu        $v1, 0x12($s0)
/* A1DE0 800B15E0 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A1DE4 800B15E4 60FA80AF */  sw         $zero, %gp_rel(Raziel + 0x430)($gp)
/* A1DE8 800B15E8 08004230 */  andi       $v0, $v0, 0x8
/* A1DEC 800B15EC 42FA83A7 */  sh         $v1, %gp_rel(Raziel + 0x412)($gp)
/* A1DF0 800B15F0 02004010 */  beqz       $v0, .L800B15FC
/* A1DF4 800B15F4 00000000 */   nop
/* A1DF8 800B15F8 5CAB80AF */  sw         $zero, %gp_rel(debugRazielFlags2)($gp)
.L800B15FC:
/* A1DFC 800B15FC 1400028E */  lw         $v0, 0x14($s0)
/* A1E00 800B1600 00000000 */  nop
/* A1E04 800B1604 E0FB82AF */  sw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* A1E08 800B1608 00104230 */  andi       $v0, $v0, 0x1000
/* A1E0C 800B160C 04004014 */  bnez       $v0, .L800B1620
/* A1E10 800B1610 64000224 */   addiu     $v0, $zero, 0x64
/* A1E14 800B1614 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* A1E18 800B1618 FDC60208 */  j          .L800B1BF4
/* A1E1C 800B161C 00000000 */   nop
.L800B1620:
/* A1E20 800B1620 0492020C */  jal        GetMaxHealth
/* A1E24 800B1624 00000000 */   nop
/* A1E28 800B1628 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* A1E2C 800B162C FDC60208 */  j          .L800B1BF4
/* A1E30 800B1630 00000000 */   nop
.L800B1634:
/* A1E34 800B1634 6CFA93AF */  sw         $s3, %gp_rel(Raziel + 0x43C)($gp)
/* A1E38 800B1638 FDC60208 */  j          .L800B1BF4
/* A1E3C 800B163C 00000000 */   nop
.L800B1640:
/* A1E40 800B1640 500B0224 */  addiu      $v0, $zero, 0xB50
/* A1E44 800B1644 6CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x43C)($gp)
/* A1E48 800B1648 FDC60208 */  j          .L800B1BF4
/* A1E4C 800B164C 00000000 */   nop
.L800B1650:
/* A1E50 800B1650 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A1E54 800B1654 00000000 */  nop
/* A1E58 800B1658 08004230 */  andi       $v0, $v0, 0x8
/* A1E5C 800B165C 65014010 */  beqz       $v0, .L800B1BF4
/* A1E60 800B1660 00000000 */   nop
/* A1E64 800B1664 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A1E68 800B1668 00000000 */  nop
/* A1E6C 800B166C 02004230 */  andi       $v0, $v0, 0x2
/* A1E70 800B1670 60014014 */  bnez       $v0, .L800B1BF4
/* A1E74 800B1674 21800000 */   addu      $s0, $zero, $zero
/* A1E78 800B1678 C8F69127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x98)
.L800B167C:
/* A1E7C 800B167C 21202002 */  addu       $a0, $s1, $zero
/* A1E80 800B1680 21284002 */  addu       $a1, $s2, $zero
/* A1E84 800B1684 4EC3010C */  jal        EnMessageQueueData
/* A1E88 800B1688 21306002 */   addu      $a2, $s3, $zero
/* A1E8C 800B168C 01001026 */  addiu      $s0, $s0, 0x1
/* A1E90 800B1690 0300022A */  slti       $v0, $s0, 0x3
/* A1E94 800B1694 F9FF4014 */  bnez       $v0, .L800B167C
/* A1E98 800B1698 1C013126 */   addiu     $s1, $s1, 0x11C
/* A1E9C 800B169C FDC60208 */  j          .L800B1BF4
/* A1EA0 800B16A0 00000000 */   nop
.L800B16A4:
/* A1EA4 800B16A4 380033AE */  sw         $s3, 0x38($s1)
/* A1EA8 800B16A8 B40020AE */  sw         $zero, 0xB4($s1)
/* A1EAC 800B16AC 3CFA828F */  lw         $v0, %gp_rel(Raziel + 0x40C)($gp)
/* A1EB0 800B16B0 00000000 */  nop
/* A1EB4 800B16B4 380053AC */  sw         $s3, 0x38($v0)
/* A1EB8 800B16B8 3CFA828F */  lw         $v0, %gp_rel(Raziel + 0x40C)($gp)
/* A1EBC 800B16BC 00000000 */  nop
/* A1EC0 800B16C0 B40040AC */  sw         $zero, 0xB4($v0)
/* A1EC4 800B16C4 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A1EC8 800B16C8 00000000 */  nop
/* A1ECC 800B16CC 49014010 */  beqz       $v0, .L800B1BF4
/* A1ED0 800B16D0 00000000 */   nop
/* A1ED4 800B16D4 380053AC */  sw         $s3, 0x38($v0)
/* A1ED8 800B16D8 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A1EDC 800B16DC FDC60208 */  j          .L800B1BF4
/* A1EE0 800B16E0 B40040AC */   sw        $zero, 0xB4($v0)
.L800B16E4:
/* A1EE4 800B16E4 0400628E */  lw         $v0, 0x4($s3)
/* A1EE8 800B16E8 00000000 */  nop
/* A1EEC 800B16EC 74FA82AF */  sw         $v0, %gp_rel(Raziel + 0x444)($gp)
/* A1EF0 800B16F0 FDC60208 */  j          .L800B1BF4
/* A1EF4 800B16F4 00000000 */   nop
.L800B16F8:
/* A1EF8 800B16F8 B291020C */  jal        DrainHealth
/* A1EFC 800B16FC 21206002 */   addu      $a0, $s3, $zero
/* A1F00 800B1700 FDC60208 */  j          .L800B1BF4
/* A1F04 800B1704 00000000 */   nop
.L800B1708:
/* A1F08 800B1708 5E93020C */  jal        DrainMana
/* A1F0C 800B170C 21206002 */   addu      $a0, $s3, $zero
/* A1F10 800B1710 FDC60208 */  j          .L800B1BF4
/* A1F14 800B1714 00000000 */   nop
.L800B1718:
/* A1F18 800B1718 6F93020C */  jal        SetMana
/* A1F1C 800B171C 21206002 */   addu      $a0, $s3, $zero
/* A1F20 800B1720 FDC60208 */  j          .L800B1BF4
/* A1F24 800B1724 00000000 */   nop
.L800B1728:
/* A1F28 800B1728 01000224 */  addiu      $v0, $zero, 0x1
/* A1F2C 800B172C 1000A2AF */  sw         $v0, 0x10($sp)
/* A1F30 800B1730 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A1F34 800B1734 80000524 */  addiu      $a1, $zero, 0x80
/* A1F38 800B1738 21300000 */  addu       $a2, $zero, $zero
/* A1F3C 800B173C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* A1F40 800B1740 03000724 */   addiu     $a3, $zero, 0x3
/* A1F44 800B1744 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A1F48 800B1748 0A80053C */  lui        $a1, %hi(StateHandlerCannedReaction)
/* A1F4C 800B174C 3BC60208 */  j          .L800B18EC
/* A1F50 800B1750 B4CEA524 */   addiu     $a1, $a1, %lo(StateHandlerCannedReaction)
.L800B1754:
/* A1F54 800B1754 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A1F58 800B1758 2000033C */  lui        $v1, (0x200000 >> 16)
/* A1F5C 800B175C 24104300 */  and        $v0, $v0, $v1
/* A1F60 800B1760 03004010 */  beqz       $v0, .L800B1770
/* A1F64 800B1764 00000000 */   nop
/* A1F68 800B1768 5DC9020C */  jal        RelocateConstrict
/* A1F6C 800B176C 21206002 */   addu      $a0, $s3, $zero
.L800B1770:
/* A1F70 800B1770 7CFB8297 */  lhu        $v0, %gp_rel(Raziel + 0x54C)($gp)
/* A1F74 800B1774 00006396 */  lhu        $v1, 0x0($s3)
/* A1F78 800B1778 00000000 */  nop
/* A1F7C 800B177C 21104300 */  addu       $v0, $v0, $v1
/* A1F80 800B1780 7CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x54C)($gp)
/* A1F84 800B1784 7EFB8297 */  lhu        $v0, %gp_rel(Raziel + 0x54E)($gp)
/* A1F88 800B1788 02006396 */  lhu        $v1, 0x2($s3)
/* A1F8C 800B178C 00000000 */  nop
/* A1F90 800B1790 21104300 */  addu       $v0, $v0, $v1
/* A1F94 800B1794 7EFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x54E)($gp)
/* A1F98 800B1798 80FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x550)($gp)
/* A1F9C 800B179C 04006396 */  lhu        $v1, 0x4($s3)
/* A1FA0 800B17A0 00000000 */  nop
/* A1FA4 800B17A4 21104300 */  addu       $v0, $v0, $v1
/* A1FA8 800B17A8 80FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x550)($gp)
/* A1FAC 800B17AC 2679010C */  jal        STREAM_MORPH_Relocate
/* A1FB0 800B17B0 00000000 */   nop
/* A1FB4 800B17B4 FDC60208 */  j          .L800B1BF4
/* A1FB8 800B17B8 00000000 */   nop
.L800B17BC:
/* A1FBC 800B17BC 11006012 */  beqz       $s3, .L800B1804
/* A1FC0 800B17C0 21800000 */   addu      $s0, $zero, $zero
/* A1FC4 800B17C4 0B80023C */  lui        $v0, %hi(RazielAnimCallbackDuringPause)
/* A1FC8 800B17C8 800E4424 */  addiu      $a0, $v0, %lo(RazielAnimCallbackDuringPause)
/* A1FCC 800B17CC EC010324 */  addiu      $v1, $zero, 0x1EC
.L800B17D0:
/* A1FD0 800B17D0 21102302 */  addu       $v0, $s1, $v1
/* A1FD4 800B17D4 01001026 */  addiu      $s0, $s0, 0x1
/* A1FD8 800B17D8 1C0044AC */  sw         $a0, 0x1C($v0)
/* A1FDC 800B17DC 200040AC */  sw         $zero, 0x20($v0)
/* A1FE0 800B17E0 0300022A */  slti       $v0, $s0, 0x3
/* A1FE4 800B17E4 FAFF4014 */  bnez       $v0, .L800B17D0
/* A1FE8 800B17E8 30006324 */   addiu     $v1, $v1, 0x30
/* A1FEC 800B17EC 3B87020C */  jal        DeInitAlgorithmicWings
/* A1FF0 800B17F0 21202002 */   addu      $a0, $s1, $zero
/* A1FF4 800B17F4 FD98020C */  jal        razResetPauseTranslation
/* A1FF8 800B17F8 21202002 */   addu      $a0, $s1, $zero
/* A1FFC 800B17FC FDC60208 */  j          .L800B1BF4
/* A2000 800B1800 00000000 */   nop
.L800B1804:
/* A2004 800B1804 0B80023C */  lui        $v0, %hi(RazielAnimCallback)
/* A2008 800B1808 7C084424 */  addiu      $a0, $v0, %lo(RazielAnimCallback)
/* A200C 800B180C EC010324 */  addiu      $v1, $zero, 0x1EC
.L800B1810:
/* A2010 800B1810 21102302 */  addu       $v0, $s1, $v1
/* A2014 800B1814 01001026 */  addiu      $s0, $s0, 0x1
/* A2018 800B1818 1C0044AC */  sw         $a0, 0x1C($v0)
/* A201C 800B181C 200040AC */  sw         $zero, 0x20($v0)
/* A2020 800B1820 0300022A */  slti       $v0, $s0, 0x3
/* A2024 800B1824 FAFF4014 */  bnez       $v0, .L800B1810
/* A2028 800B1828 30006324 */   addiu     $v1, $v1, 0x30
/* A202C 800B182C D586020C */  jal        InitAlgorithmicWings
/* A2030 800B1830 21202002 */   addu      $a0, $s1, $zero
/* A2034 800B1834 FDC60208 */  j          .L800B1BF4
/* A2038 800B1838 00000000 */   nop
.L800B183C:
/* A203C 800B183C 1A006012 */  beqz       $s3, .L800B18A8
/* A2040 800B1840 0040033C */   lui       $v1, (0x40000000 >> 16)
/* A2044 800B1844 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A2048 800B1848 00000000 */  nop
/* A204C 800B184C 24104300 */  and        $v0, $v0, $v1
/* A2050 800B1850 E8004014 */  bnez       $v0, .L800B1BF4
/* A2054 800B1854 21202002 */   addu      $a0, $s1, $zero
/* A2058 800B1858 90F983AF */  sw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* A205C 800B185C 6B68020C */  jal        ResetPhysics
/* A2060 800B1860 F0FF0524 */   addiu     $a1, $zero, -0x10
/* A2064 800B1864 21800000 */  addu       $s0, $zero, $zero
/* A2068 800B1868 0B80113C */  lui        $s1, %hi(StateHandlerIdle)
/* A206C 800B186C 21200000 */  addu       $a0, $zero, $zero
.L800B1870:
/* A2070 800B1870 21288000 */  addu       $a1, $a0, $zero
/* A2074 800B1874 4FC6010C */  jal        SetControlInitIdleData
/* A2078 800B1878 03000624 */   addiu     $a2, $zero, 0x3
/* A207C 800B187C 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A2080 800B1880 21280002 */  addu       $a1, $s0, $zero
/* A2084 800B1884 E0842626 */  addiu      $a2, $s1, %lo(StateHandlerIdle)
/* A2088 800B1888 C1CA010C */  jal        StateSwitchStateData
/* A208C 800B188C 21384000 */   addu      $a3, $v0, $zero
/* A2090 800B1890 01001026 */  addiu      $s0, $s0, 0x1
/* A2094 800B1894 0300022A */  slti       $v0, $s0, 0x3
/* A2098 800B1898 F5FF4014 */  bnez       $v0, .L800B1870
/* A209C 800B189C 21200000 */   addu      $a0, $zero, $zero
/* A20A0 800B18A0 FDC60208 */  j          .L800B1BF4
/* A20A4 800B18A4 00000000 */   nop
.L800B18A8:
/* A20A8 800B18A8 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* A20AC 800B18AC 0040023C */  lui        $v0, (0x40000000 >> 16)
/* A20B0 800B18B0 24106200 */  and        $v0, $v1, $v0
/* A20B4 800B18B4 CF004010 */  beqz       $v0, .L800B1BF4
/* A20B8 800B18B8 FFBF023C */   lui       $v0, (0xBFFFFFFF >> 16)
/* A20BC 800B18BC FFFF4234 */  ori        $v0, $v0, (0xBFFFFFFF & 0xFFFF)
/* A20C0 800B18C0 24106200 */  and        $v0, $v1, $v0
/* A20C4 800B18C4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A20C8 800B18C8 FDC60208 */  j          .L800B1BF4
/* A20CC 800B18CC 00000000 */   nop
.L800B18D0:
/* A20D0 800B18D0 7993020C */  jal        HealthInstantDeath
/* A20D4 800B18D4 21202002 */   addu      $a0, $s1, $zero
/* A20D8 800B18D8 FDC60208 */  j          .L800B1BF4
/* A20DC 800B18DC 00000000 */   nop
.L800B18E0:
/* A20E0 800B18E0 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A20E4 800B18E4 0B80053C */  lui        $a1, %hi(StateHandlerDropAction)
/* A20E8 800B18E8 6098A524 */  addiu      $a1, $a1, %lo(StateHandlerDropAction)
.L800B18EC:
/* A20EC 800B18EC F4CA010C */  jal        StateSwitchStateCharacterData
/* A20F0 800B18F0 21300000 */   addu      $a2, $zero, $zero
/* A20F4 800B18F4 FDC60208 */  j          .L800B1BF4
/* A20F8 800B18F8 00000000 */   nop
.L800B18FC:
/* A20FC 800B18FC 8895020C */  jal        razPlaneShift
/* A2100 800B1900 21202002 */   addu      $a0, $s1, $zero
/* A2104 800B1904 FDC60208 */  j          .L800B1BF4
/* A2108 800B1908 00000000 */   nop
.L800B190C:
/* A210C 800B190C 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A2110 800B1910 00000000 */  nop
/* A2114 800B1914 25105300 */  or         $v0, $v0, $s3
/* A2118 800B1918 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A211C 800B191C 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* A2120 800B1920 B493020C */  jal        RAZIEL_DebugHealthFillUp
/* A2124 800B1924 00000000 */   nop
/* A2128 800B1928 0300023C */  lui        $v0, (0x3FC00 >> 16)
/* A212C 800B192C 00FC4234 */  ori        $v0, $v0, (0x3FC00 & 0xFFFF)
/* A2130 800B1930 24106202 */  and        $v0, $s3, $v0
/* A2134 800B1934 AF004010 */  beqz       $v0, .L800B1BF4
/* A2138 800B1938 00000000 */   nop
/* A213C 800B193C 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A2140 800B1940 00000000 */  nop
/* A2144 800B1944 AB004010 */  beqz       $v0, .L800B1BF4
/* A2148 800B1948 00000000 */   nop
/* A214C 800B194C 8597020C */  jal        razReaverOn
/* A2150 800B1950 00000000 */   nop
/* A2154 800B1954 FD97020C */  jal        razGetReaverFromMask
/* A2158 800B1958 21206002 */   addu      $a0, $s3, $zero
/* A215C 800B195C ED97020C */  jal        razReaverImbue
/* A2160 800B1960 21204000 */   addu      $a0, $v0, $zero
/* A2164 800B1964 FDC60208 */  j          .L800B1BF4
/* A2168 800B1968 00000000 */   nop
.L800B196C:
/* A216C 800B196C C8F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x98)
/* A2170 800B1970 1000053C */  lui        $a1, (0x100011 >> 16)
/* A2174 800B1974 1100A534 */  ori        $a1, $a1, (0x100011 & 0xFFFF)
/* A2178 800B1978 4EC3010C */  jal        EnMessageQueueData
/* A217C 800B197C 21306002 */   addu      $a2, $s3, $zero
/* A2180 800B1980 FDC60208 */  j          .L800B1BF4
/* A2184 800B1984 00000000 */   nop
.L800B1988:
/* A2188 800B1988 21206002 */  addu       $a0, $s3, $zero
/* A218C 800B198C 92D1000C */  jal        INSTANCE_Query
/* A2190 800B1990 04000524 */   addiu     $a1, $zero, 0x4
/* A2194 800B1994 1CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* A2198 800B1998 08000324 */  addiu      $v1, $zero, 0x8
/* A219C 800B199C 03004310 */  beq        $v0, $v1, .L800B19AC
/* A21A0 800B19A0 00000000 */   nop
/* A21A4 800B19A4 4797020C */  jal        razReaverBladeOff
/* A21A8 800B19A8 00000000 */   nop
.L800B19AC:
/* A21AC 800B19AC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A21B0 800B19B0 FFF70324 */  addiu      $v1, $zero, -0x801
/* A21B4 800B19B4 24104300 */  and        $v0, $v0, $v1
/* A21B8 800B19B8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A21BC 800B19BC 7CC60208 */  j          .L800B19F0
/* A21C0 800B19C0 00000000 */   nop
.L800B19C4:
/* A21C4 800B19C4 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A21C8 800B19C8 00000000 */  nop
/* A21CC 800B19CC 08006212 */  beq        $s3, $v0, .L800B19F0
/* A21D0 800B19D0 00000000 */   nop
/* A21D4 800B19D4 8597020C */  jal        razReaverOn
/* A21D8 800B19D8 00000000 */   nop
/* A21DC 800B19DC 02004014 */  bnez       $v0, .L800B19E8
/* A21E0 800B19E0 00000000 */   nop
/* A21E4 800B19E4 1CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x3EC)($gp)
.L800B19E8:
/* A21E8 800B19E8 5397020C */  jal        razReaverBladeOn
/* A21EC 800B19EC 00000000 */   nop
.L800B19F0:
/* A21F0 800B19F0 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A21F4 800B19F4 7FFF0324 */  addiu      $v1, $zero, -0x81
.L800B19F8:
/* A21F8 800B19F8 24104300 */  and        $v0, $v0, $v1
/* A21FC 800B19FC CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A2200 800B1A00 FDC60208 */  j          .L800B1BF4
/* A2204 800B1A04 00000000 */   nop
.L800B1A08:
/* A2208 800B1A08 CCFB93AF */  sw         $s3, %gp_rel(Raziel + 0x59C)($gp)
/* A220C 800B1A0C FDC60208 */  j          .L800B1BF4
/* A2210 800B1A10 00000000 */   nop
.L800B1A14:
/* A2214 800B1A14 0602010C */  jal        SndTypeIsPlayingOrRequested
/* A2218 800B1A18 01000424 */   addiu     $a0, $zero, 0x1
/* A221C 800B1A1C 75004014 */  bnez       $v0, .L800B1BF4
/* A2220 800B1A20 01000524 */   addiu     $a1, $zero, 0x1
/* A2224 800B1A24 21300000 */  addu       $a2, $zero, $zero
/* A2228 800B1A28 4B000724 */  addiu      $a3, $zero, 0x4B
/* A222C 800B1A2C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* A2230 800B1A30 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A2234 800B1A34 1000A2AF */  sw         $v0, 0x10($sp)
/* A2238 800B1A38 1300010C */  jal        SOUND_Play3dSound
/* A223C 800B1A3C 5C008424 */   addiu     $a0, $a0, 0x5C
/* A2240 800B1A40 FDC60208 */  j          .L800B1BF4
/* A2244 800B1A44 00000000 */   nop
.L800B1A48:
/* A2248 800B1A48 21006012 */  beqz       $s3, .L800B1AD0
/* A224C 800B1A4C 0A80053C */   lui       $a1, %hi(StateHandlerPuppetShow)
/* A2250 800B1A50 0CA9A524 */  addiu      $a1, $a1, %lo(StateHandlerPuppetShow)
/* A2254 800B1A54 38FB85AF */  sw         $a1, %gp_rel(Raziel + 0x508)($gp)
/* A2258 800B1A58 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A225C 800B1A5C A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A2260 800B1A60 21300000 */   addu      $a2, $zero, $zero
/* A2264 800B1A64 D586020C */  jal        InitAlgorithmicWings
/* A2268 800B1A68 21202002 */   addu      $a0, $s1, $zero
/* A226C 800B1A6C 21900000 */  addu       $s2, $zero, $zero
/* A2270 800B1A70 C8F69127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x98)
/* A2274 800B1A74 40F69027 */  addiu      $s0, $gp, %gp_rel(Raziel + 0x10)
.L800B1A78:
/* A2278 800B1A78 36C3010C */  jal        PurgeMessageQueue
/* A227C 800B1A7C 21200002 */   addu      $a0, $s0, $zero
/* A2280 800B1A80 36C3010C */  jal        PurgeMessageQueue
/* A2284 800B1A84 21202002 */   addu      $a0, $s1, $zero
/* A2288 800B1A88 1C013126 */  addiu      $s1, $s1, 0x11C
/* A228C 800B1A8C 01005226 */  addiu      $s2, $s2, 0x1
/* A2290 800B1A90 0300422A */  slti       $v0, $s2, 0x3
/* A2294 800B1A94 F8FF4014 */  bnez       $v0, .L800B1A78
/* A2298 800B1A98 1C011026 */   addiu     $s0, $s0, 0x11C
/* A229C 800B1A9C EEC0000C */  jal        GAMELOOP_Reset24FPS
/* A22A0 800B1AA0 00000000 */   nop
/* A22A4 800B1AA4 2F97020C */  jal        razGetHeldWeapon
/* A22A8 800B1AA8 00000000 */   nop
/* A22AC 800B1AAC 21184000 */  addu       $v1, $v0, $zero
/* A22B0 800B1AB0 50006010 */  beqz       $v1, .L800B1BF4
/* A22B4 800B1AB4 00000000 */   nop
/* A22B8 800B1AB8 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A22BC 800B1ABC 00000000 */  nop
/* A22C0 800B1AC0 4C006210 */  beq        $v1, $v0, .L800B1BF4
/* A22C4 800B1AC4 21200000 */   addu      $a0, $zero, $zero
/* A22C8 800B1AC8 DEC60208 */  j          .L800B1B78
/* A22CC 800B1ACC 00100524 */   addiu     $a1, $zero, 0x1000
.L800B1AD0:
/* A22D0 800B1AD0 FDFF083C */  lui        $t0, (0xFFFDFFFF >> 16)
/* A22D4 800B1AD4 FFFF0835 */  ori        $t0, $t0, (0xFFFDFFFF & 0xFFFF)
/* A22D8 800B1AD8 21200000 */  addu       $a0, $zero, $zero
/* A22DC 800B1ADC 21288000 */  addu       $a1, $a0, $zero
/* A22E0 800B1AE0 03000624 */  addiu      $a2, $zero, 0x3
/* A22E4 800B1AE4 C8F69227 */  addiu      $s2, $gp, %gp_rel(Raziel + 0x98)
/* A22E8 800B1AE8 40F69127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x10)
/* A22EC 800B1AEC EFFF0724 */  addiu      $a3, $zero, -0x11
/* A22F0 800B1AF0 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A22F4 800B1AF4 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* A22F8 800B1AF8 24104700 */  and        $v0, $v0, $a3
/* A22FC 800B1AFC 24186800 */  and        $v1, $v1, $t0
/* A2300 800B1B00 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A2304 800B1B04 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* A2308 800B1B08 4FC6010C */  jal        SetControlInitIdleData
/* A230C 800B1B0C 21808000 */   addu      $s0, $a0, $zero
/* A2310 800B1B10 34F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x4)
/* A2314 800B1B14 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* A2318 800B1B18 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* A231C 800B1B1C A3CA010C */  jal        StateSwitchStateCharacterDataDefault
/* A2320 800B1B20 21304000 */   addu      $a2, $v0, $zero
.L800B1B24:
/* A2324 800B1B24 36C3010C */  jal        PurgeMessageQueue
/* A2328 800B1B28 21202002 */   addu      $a0, $s1, $zero
/* A232C 800B1B2C 36C3010C */  jal        PurgeMessageQueue
/* A2330 800B1B30 21204002 */   addu      $a0, $s2, $zero
/* A2334 800B1B34 1C015226 */  addiu      $s2, $s2, 0x11C
/* A2338 800B1B38 01001026 */  addiu      $s0, $s0, 0x1
/* A233C 800B1B3C 0300022A */  slti       $v0, $s0, 0x3
/* A2340 800B1B40 F8FF4014 */  bnez       $v0, .L800B1B24
/* A2344 800B1B44 1C013126 */   addiu     $s1, $s1, 0x11C
/* A2348 800B1B48 EAC0000C */  jal        GAMELOOP_Set24FPS
/* A234C 800B1B4C 00000000 */   nop
/* A2350 800B1B50 2F97020C */  jal        razGetHeldWeapon
/* A2354 800B1B54 00000000 */   nop
/* A2358 800B1B58 21184000 */  addu       $v1, $v0, $zero
/* A235C 800B1B5C 25006010 */  beqz       $v1, .L800B1BF4
/* A2360 800B1B60 00000000 */   nop
/* A2364 800B1B64 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* A2368 800B1B68 00000000 */  nop
/* A236C 800B1B6C 21006210 */  beq        $v1, $v0, .L800B1BF4
/* A2370 800B1B70 00100424 */   addiu     $a0, $zero, 0x1000
/* A2374 800B1B74 21280000 */  addu       $a1, $zero, $zero
.L800B1B78:
/* A2378 800B1B78 7F95020C */  jal        razSetFadeEffect
/* A237C 800B1B7C 0A000624 */   addiu     $a2, $zero, 0xA
/* A2380 800B1B80 FDC60208 */  j          .L800B1BF4
/* A2384 800B1B84 00000000 */   nop
.L800B1B88:
/* A2388 800B1B88 21202002 */  addu       $a0, $s1, $zero
/* A238C 800B1B8C 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A2390 800B1B90 33000624 */  addiu      $a2, $zero, 0x33
/* A2394 800B1B94 38FF0724 */  addiu      $a3, $zero, -0xC8
/* A2398 800B1B98 2110E000 */  addu       $v0, $a3, $zero
/* A239C 800B1B9C 1000A2AF */  sw         $v0, 0x10($sp)
/* A23A0 800B1BA0 78000224 */  addiu      $v0, $zero, 0x78
/* A23A4 800B1BA4 00831300 */  sll        $s0, $s3, 12
/* A23A8 800B1BA8 1400A2AF */  sw         $v0, 0x14($sp)
/* A23AC 800B1BAC 1800A2AF */  sw         $v0, 0x18($sp)
/* A23B0 800B1BB0 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A23B4 800B1BB4 1C00B0AF */  sw         $s0, 0x1C($sp)
/* A23B8 800B1BB8 509F020C */  jal        razSetupSoundRamp
/* A23BC 800B1BBC 2000A2AF */   sw        $v0, 0x20($sp)
/* A23C0 800B1BC0 C4FB90AF */  sw         $s0, %gp_rel(Raziel + 0x594)($gp)
/* A23C4 800B1BC4 C8FB80AF */  sw         $zero, %gp_rel(Raziel + 0x598)($gp)
/* A23C8 800B1BC8 FDC60208 */  j          .L800B1BF4
/* A23CC 800B1BCC 00000000 */   nop
.L800B1BD0:
/* A23D0 800B1BD0 C8F69127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x98)
.L800B1BD4:
/* A23D4 800B1BD4 21202002 */  addu       $a0, $s1, $zero
/* A23D8 800B1BD8 21284002 */  addu       $a1, $s2, $zero
/* A23DC 800B1BDC 4EC3010C */  jal        EnMessageQueueData
/* A23E0 800B1BE0 21306002 */   addu      $a2, $s3, $zero
/* A23E4 800B1BE4 01001026 */  addiu      $s0, $s0, 0x1
/* A23E8 800B1BE8 0300022A */  slti       $v0, $s0, 0x3
/* A23EC 800B1BEC F9FF4014 */  bnez       $v0, .L800B1BD4
/* A23F0 800B1BF0 1C013126 */   addiu     $s1, $s1, 0x11C
.L800B1BF4:
/* A23F4 800B1BF4 3800BF8F */  lw         $ra, 0x38($sp)
/* A23F8 800B1BF8 3400B38F */  lw         $s3, 0x34($sp)
/* A23FC 800B1BFC 3000B28F */  lw         $s2, 0x30($sp)
/* A2400 800B1C00 2C00B18F */  lw         $s1, 0x2C($sp)
/* A2404 800B1C04 2800B08F */  lw         $s0, 0x28($sp)
/* A2408 800B1C08 0800E003 */  jr         $ra
/* A240C 800B1C0C 4000BD27 */   addiu     $sp, $sp, 0x40
.size RazielPost, . - RazielPost
