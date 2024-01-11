.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_IntroduceSavedInstance
/* 251C8 800349C8 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 251CC 800349CC 2800B2AF */  sw         $s2, 0x28($sp)
/* 251D0 800349D0 21908000 */  addu       $s2, $a0, $zero
/* 251D4 800349D4 2000B0AF */  sw         $s0, 0x20($sp)
/* 251D8 800349D8 21800000 */  addu       $s0, $zero, $zero
/* 251DC 800349DC 4400BFAF */  sw         $ra, 0x44($sp)
/* 251E0 800349E0 4000BEAF */  sw         $fp, 0x40($sp)
/* 251E4 800349E4 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 251E8 800349E8 3800B6AF */  sw         $s6, 0x38($sp)
/* 251EC 800349EC 3400B5AF */  sw         $s5, 0x34($sp)
/* 251F0 800349F0 3000B4AF */  sw         $s4, 0x30($sp)
/* 251F4 800349F4 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 251F8 800349F8 2400B1AF */  sw         $s1, 0x24($sp)
/* 251FC 800349FC 0800A28C */  lw         $v0, 0x8($a1)
/* 25200 80034A00 21A00002 */  addu       $s4, $s0, $zero
/* 25204 80034A04 0000428C */  lw         $v0, 0x0($v0)
/* 25208 80034A08 21F0C000 */  addu       $fp, $a2, $zero
/* 2520C 80034A0C 4800428C */  lw         $v0, 0x48($v0)
/* 25210 80034A10 0C004486 */  lh         $a0, 0xC($s2)
/* 25214 80034A14 FCD1000C */  jal        INSTANCE_FindWithID
/* 25218 80034A18 0C005524 */   addiu     $s5, $v0, 0xC
/* 2521C 80034A1C F9004014 */  bnez       $v0, .L80034E04
/* 25220 80034A20 21100002 */   addu      $v0, $s0, $zero
/* 25224 80034A24 0400488E */  lw         $t0, 0x4($s2)
/* 25228 80034A28 0800498E */  lw         $t1, 0x8($s2)
/* 2522C 80034A2C 1000A8AF */  sw         $t0, 0x10($sp)
/* 25230 80034A30 1400A9AF */  sw         $t1, 0x14($sp)
/* 25234 80034A34 1800A0A3 */  sb         $zero, 0x18($sp)
/* 25238 80034A38 10004486 */  lh         $a0, 0x10($s2)
/* 2523C 80034A3C 1DE1000C */  jal        LOAD_SetSearchDirectory
/* 25240 80034A40 00000000 */   nop
/* 25244 80034A44 1000B627 */  addiu      $s6, $sp, 0x10
/* 25248 80034A48 5C64010C */  jal        STREAM_GetObjectTracker
/* 2524C 80034A4C 2120C002 */   addu      $a0, $s6, $zero
/* 25250 80034A50 21200002 */  addu       $a0, $s0, $zero
/* 25254 80034A54 1DE1000C */  jal        LOAD_SetSearchDirectory
/* 25258 80034A58 21884000 */   addu      $s1, $v0, $zero
/* 2525C 80034A5C E8002012 */  beqz       $s1, .L80034E00
/* 25260 80034A60 02000324 */   addiu     $v1, $zero, 0x2
/* 25264 80034A64 14002286 */  lh         $v0, 0x14($s1)
/* 25268 80034A68 1000378E */  lw         $s7, 0x10($s1)
/* 2526C 80034A6C E2004314 */  bne        $v0, $v1, .L80034DF8
/* 25270 80034A70 00000000 */   nop
/* 25274 80034A74 12004296 */  lhu        $v0, 0x12($s2)
/* 25278 80034A78 00000000 */  nop
/* 2527C 80034A7C 06004010 */  beqz       $v0, .L80034A98
/* 25280 80034A80 00000000 */   nop
/* 25284 80034A84 62D2000C */  jal        INSTANCE_Find
/* 25288 80034A88 21204000 */   addu      $a0, $v0, $zero
/* 2528C 80034A8C 21A04000 */  addu       $s4, $v0, $zero
/* 25290 80034A90 D9008012 */  beqz       $s4, .L80034DF8
/* 25294 80034A94 00000000 */   nop
.L80034A98:
/* 25298 80034A98 2C00E28E */  lw         $v0, 0x2C($s7)
/* 2529C 80034A9C 0010133C */  lui        $s3, (0x10000000 >> 16)
/* 252A0 80034AA0 24105300 */  and        $v0, $v0, $s3
/* 252A4 80034AA4 08004010 */  beqz       $v0, .L80034AC8
/* 252A8 80034AA8 00000000 */   nop
/* 252AC 80034AAC 81F9000C */  jal        OBTABLE_InitAnimPointers
/* 252B0 80034AB0 21202002 */   addu      $a0, $s1, $zero
/* 252B4 80034AB4 2C00E28E */  lw         $v0, 0x2C($s7)
/* 252B8 80034AB8 00000000 */  nop
/* 252BC 80034ABC 24105300 */  and        $v0, $v0, $s3
/* 252C0 80034AC0 D0004014 */  bnez       $v0, .L80034E04
/* 252C4 80034AC4 21100002 */   addu      $v0, $s0, $zero
.L80034AC8:
/* 252C8 80034AC8 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 252CC 80034ACC 98C9000C */  jal        INSTANCE_NewInstance
/* 252D0 80034AD0 00000000 */   nop
/* 252D4 80034AD4 21804000 */  addu       $s0, $v0, $zero
/* 252D8 80034AD8 C9000012 */  beqz       $s0, .L80034E00
/* 252DC 80034ADC 2128E002 */   addu      $a1, $s7, $zero
/* 252E0 80034AE0 21200002 */  addu       $a0, $s0, $zero
/* 252E4 80034AE4 16002296 */  lhu        $v0, 0x16($s1)
/* 252E8 80034AE8 21300000 */  addu       $a2, $zero, $zero
/* 252EC 80034AEC 01004224 */  addiu      $v0, $v0, 0x1
/* 252F0 80034AF0 4AD0000C */  jal        INSTANCE_DefaultInit
/* 252F4 80034AF4 160022A6 */   sh        $v0, 0x16($s1)
/* 252F8 80034AF8 5C010426 */  addiu      $a0, $s0, 0x15C
/* 252FC 80034AFC 1CF4020C */  jal        strcpy
/* 25300 80034B00 2128C002 */   addu      $a1, $s6, $zero
/* 25304 80034B04 0C004286 */  lh         $v0, 0xC($s2)
/* 25308 80034B08 00000000 */  nop
/* 2530C 80034B0C 3C0002AE */  sw         $v0, 0x3C($s0)
/* 25310 80034B10 0E004286 */  lh         $v0, 0xE($s2)
/* 25314 80034B14 94020426 */  addiu      $a0, $s0, 0x294
/* 25318 80034B18 380002AE */  sw         $v0, 0x38($s0)
/* 2531C 80034B1C 10004286 */  lh         $v0, 0x10($s2)
/* 25320 80034B20 21280002 */  addu       $a1, $s0, $zero
/* 25324 80034B24 14D8000C */  jal        LIGHT_GetAmbient
/* 25328 80034B28 340002AE */   sw        $v0, 0x34($s0)
/* 2532C 80034B2C 3400048E */  lw         $a0, 0x34($s0)
/* 25330 80034B30 1C66010C */  jal        STREAM_GetLevelWithID
/* 25334 80034B34 21880000 */   addu      $s1, $zero, $zero
/* 25338 80034B38 0E004010 */  beqz       $v0, .L80034B74
/* 2533C 80034B3C 00000000 */   nop
/* 25340 80034B40 0000428C */  lw         $v0, 0x0($v0)
/* 25344 80034B44 00000000 */  nop
/* 25348 80034B48 0800448C */  lw         $a0, 0x8($v0)
/* 2534C 80034B4C 0C00438C */  lw         $v1, 0xC($v0)
/* 25350 80034B50 08008010 */  beqz       $a0, .L80034B74
/* 25354 80034B54 00000000 */   nop
/* 25358 80034B58 3C00058E */  lw         $a1, 0x3C($s0)
.L80034B5C:
/* 2535C 80034B5C 1400628C */  lw         $v0, 0x14($v1)
/* 25360 80034B60 00000000 */  nop
/* 25364 80034B64 09004510 */  beq        $v0, $a1, .L80034B8C
/* 25368 80034B68 FFFF8424 */   addiu     $a0, $a0, -0x1
/* 2536C 80034B6C FBFF8014 */  bnez       $a0, .L80034B5C
/* 25370 80034B70 4C006324 */   addiu     $v1, $v1, 0x4C
.L80034B74:
/* 25374 80034B74 07002012 */  beqz       $s1, .L80034B94
/* 25378 80034B78 00000000 */   nop
/* 2537C 80034B7C 200011AE */  sw         $s1, 0x20($s0)
/* 25380 80034B80 3000228E */  lw         $v0, 0x30($s1)
/* 25384 80034B84 E7D20008 */  j          .L80034B9C
/* 25388 80034B88 280002AE */   sw        $v0, 0x28($s0)
.L80034B8C:
/* 2538C 80034B8C DDD20008 */  j          .L80034B74
/* 25390 80034B90 21886000 */   addu      $s1, $v1, $zero
.L80034B94:
/* 25394 80034B94 200000AE */  sw         $zero, 0x20($s0)
/* 25398 80034B98 280000AE */  sw         $zero, 0x28($s0)
.L80034B9C:
/* 2539C 80034B9C 1A004326 */  addiu      $v1, $s2, 0x1A
/* 253A0 80034BA0 1A004296 */  lhu        $v0, 0x1A($s2)
/* 253A4 80034BA4 02006494 */  lhu        $a0, 0x2($v1)
/* 253A8 80034BA8 04006394 */  lhu        $v1, 0x4($v1)
/* 253AC 80034BAC 0000A596 */  lhu        $a1, 0x0($s5)
/* 253B0 80034BB0 0200A696 */  lhu        $a2, 0x2($s5)
/* 253B4 80034BB4 0400A796 */  lhu        $a3, 0x4($s5)
/* 253B8 80034BB8 21104500 */  addu       $v0, $v0, $a1
/* 253BC 80034BBC 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 253C0 80034BC0 5C000226 */  addiu      $v0, $s0, 0x5C
/* 253C4 80034BC4 21208600 */  addu       $a0, $a0, $a2
/* 253C8 80034BC8 21186700 */  addu       $v1, $v1, $a3
/* 253CC 80034BCC 020044A4 */  sh         $a0, 0x2($v0)
/* 253D0 80034BD0 040043A4 */  sh         $v1, 0x4($v0)
/* 253D4 80034BD4 5F00088A */  lwl        $t0, 0x5F($s0)
/* 253D8 80034BD8 5C00089A */  lwr        $t0, 0x5C($s0)
/* 253DC 80034BDC 60000986 */  lh         $t1, 0x60($s0)
/* 253E0 80034BE0 710008AA */  swl        $t0, 0x71($s0)
/* 253E4 80034BE4 6E0008BA */  swr        $t0, 0x6E($s0)
/* 253E8 80034BE8 720009A6 */  sh         $t1, 0x72($s0)
/* 253EC 80034BEC 5F00088A */  lwl        $t0, 0x5F($s0)
/* 253F0 80034BF0 5C00089A */  lwr        $t0, 0x5C($s0)
/* 253F4 80034BF4 60000986 */  lh         $t1, 0x60($s0)
/* 253F8 80034BF8 670008AA */  swl        $t0, 0x67($s0)
/* 253FC 80034BFC 640008BA */  swr        $t0, 0x64($s0)
/* 25400 80034C00 680009A6 */  sh         $t1, 0x68($s0)
/* 25404 80034C04 14004296 */  lhu        $v0, 0x14($s2)
/* 25408 80034C08 1C00038E */  lw         $v1, 0x1C($s0)
/* 2540C 80034C0C 740002A6 */  sh         $v0, 0x74($s0)
/* 25410 80034C10 16004296 */  lhu        $v0, 0x16($s2)
/* 25414 80034C14 00000000 */  nop
/* 25418 80034C18 760002A6 */  sh         $v0, 0x76($s0)
/* 2541C 80034C1C 18004296 */  lhu        $v0, 0x18($s2)
/* 25420 80034C20 00000000 */  nop
/* 25424 80034C24 780002A6 */  sh         $v0, 0x78($s0)
/* 25428 80034C28 0000628C */  lw         $v0, 0x0($v1)
/* 2542C 80034C2C 00000000 */  nop
/* 25430 80034C30 00014230 */  andi       $v0, $v0, 0x100
/* 25434 80034C34 04004010 */  beqz       $v0, .L80034C48
/* 25438 80034C38 00100224 */   addiu     $v0, $zero, 0x1000
/* 2543C 80034C3C 48D0000C */  jal        INSTANCE_BuildStaticShadow
/* 25440 80034C40 21200002 */   addu      $a0, $s0, $zero
/* 25444 80034C44 00100224 */  addiu      $v0, $zero, 0x1000
.L80034C48:
/* 25448 80034C48 840002A6 */  sh         $v0, 0x84($s0)
/* 2544C 80034C4C 860002A6 */  sh         $v0, 0x86($s0)
/* 25450 80034C50 880002A6 */  sh         $v0, 0x88($s0)
/* 25454 80034C54 02004292 */  lbu        $v0, 0x2($s2)
/* 25458 80034C58 00000000 */  nop
/* 2545C 80034C5C 620002A2 */  sb         $v0, 0x62($s0)
/* 25460 80034C60 03004292 */  lbu        $v0, 0x3($s2)
/* 25464 80034C64 00000000 */  nop
/* 25468 80034C68 6A0002A2 */  sb         $v0, 0x6A($s0)
/* 2546C 80034C6C FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 25470 80034C70 02CA000C */  jal        INSTANCE_InsertInstanceGroup
/* 25474 80034C74 21280002 */   addu      $a1, $s0, $zero
/* 25478 80034C78 27F8000C */  jal        OBTABLE_GetInstanceCollideFunc
/* 2547C 80034C7C 21200002 */   addu      $a0, $s0, $zero
/* 25480 80034C80 49F8000C */  jal        OBTABLE_GetInstanceProcessFunc
/* 25484 80034C84 21200002 */   addu      $a0, $s0, $zero
/* 25488 80034C88 5BF8000C */  jal        OBTABLE_GetInstanceQueryFunc
/* 2548C 80034C8C 21200002 */   addu      $a0, $s0, $zero
/* 25490 80034C90 6DF8000C */  jal        OBTABLE_GetInstanceMessageFunc
/* 25494 80034C94 21200002 */   addu      $a0, $s0, $zero
/* 25498 80034C98 39F8000C */  jal        OBTABLE_GetInstanceAdditionalCollideFunc
/* 2549C 80034C9C 21200002 */   addu      $a0, $s0, $zero
/* 254A0 80034CA0 EEF7000C */  jal        OBTABLE_InstanceInit
/* 254A4 80034CA4 21200002 */   addu      $a0, $s0, $zero
/* 254A8 80034CA8 2000428E */  lw         $v0, 0x20($s2)
/* 254AC 80034CAC 1400058E */  lw         $a1, 0x14($s0)
/* 254B0 80034CB0 1800048E */  lw         $a0, 0x18($s0)
/* 254B4 80034CB4 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 254B8 80034CB8 140002AE */  sw         $v0, 0x14($s0)
/* 254BC 80034CBC 2400428E */  lw         $v0, 0x24($s2)
/* 254C0 80034CC0 2000B130 */  andi       $s1, $a1, 0x20
/* 254C4 80034CC4 24104300 */  and        $v0, $v0, $v1
/* 254C8 80034CC8 180002AE */  sw         $v0, 0x18($s0)
/* 254CC 80034CCC 0200023C */  lui        $v0, (0x20000 >> 16)
/* 254D0 80034CD0 07008012 */  beqz       $s4, .L80034CF0
/* 254D4 80034CD4 24988200 */   and       $s3, $a0, $v0
/* 254D8 80034CD8 C2C8000C */  jal        INSTANCE_ForceActive
/* 254DC 80034CDC 21208002 */   addu      $a0, $s4, $zero
/* 254E0 80034CE0 1800828E */  lw         $v0, 0x18($s4)
/* 254E4 80034CE4 00000000 */  nop
/* 254E8 80034CE8 80004234 */  ori        $v0, $v0, 0x80
/* 254EC 80034CEC 180082AE */  sw         $v0, 0x18($s4)
.L80034CF0:
/* 254F0 80034CF0 1400028E */  lw         $v0, 0x14($s0)
/* 254F4 80034CF4 0400033C */  lui        $v1, (0x40000 >> 16)
/* 254F8 80034CF8 24104300 */  and        $v0, $v0, $v1
/* 254FC 80034CFC 04004010 */  beqz       $v0, .L80034D10
/* 25500 80034D00 0020033C */   lui       $v1, (0x20000000 >> 16)
/* 25504 80034D04 1800028E */  lw         $v0, 0x18($s0)
/* 25508 80034D08 48D30008 */  j          .L80034D20
/* 2550C 80034D0C 25104300 */   or        $v0, $v0, $v1
.L80034D10:
/* 25510 80034D10 FFDF033C */  lui        $v1, (0xDFFFFFFF >> 16)
/* 25514 80034D14 1800028E */  lw         $v0, 0x18($s0)
/* 25518 80034D18 FFFF6334 */  ori        $v1, $v1, (0xDFFFFFFF & 0xFFFF)
/* 2551C 80034D1C 24104300 */  and        $v0, $v0, $v1
.L80034D20:
/* 25520 80034D20 180002AE */  sw         $v0, 0x18($s0)
/* 25524 80034D24 FBFF053C */  lui        $a1, (0xFFFBFFFF >> 16)
/* 25528 80034D28 FFFFA534 */  ori        $a1, $a1, (0xFFFBFFFF & 0xFFFF)
/* 2552C 80034D2C FFFD033C */  lui        $v1, (0xFDFFFFFF >> 16)
/* 25530 80034D30 FFFF6334 */  ori        $v1, $v1, (0xFDFFFFFF & 0xFFFF)
/* 25534 80034D34 1400028E */  lw         $v0, 0x14($s0)
/* 25538 80034D38 21200002 */  addu       $a0, $s0, $zero
/* 2553C 80034D3C 24104500 */  and        $v0, $v0, $a1
/* 25540 80034D40 24104300 */  and        $v0, $v0, $v1
/* 25544 80034D44 1000033C */  lui        $v1, (0x100000 >> 16)
/* 25548 80034D48 25104300 */  or         $v0, $v0, $v1
/* 2554C 80034D4C 9B71010C */  jal        MORPH_SetupInstanceFlags
/* 25550 80034D50 140002AE */   sw        $v0, 0x14($s0)
/* 25554 80034D54 2000028E */  lw         $v0, 0x20($s0)
/* 25558 80034D58 00000000 */  nop
/* 2555C 80034D5C 03004010 */  beqz       $v0, .L80034D6C
/* 25560 80034D60 00000000 */   nop
/* 25564 80034D64 29CB000C */  jal        INSTANCE_ProcessIntro
/* 25568 80034D68 21200002 */   addu      $a0, $s0, $zero
.L80034D6C:
/* 2556C 80034D6C 01004292 */  lbu        $v0, 0x1($s2)
/* 25570 80034D70 00000000 */  nop
/* 25574 80034D74 80200200 */  sll        $a0, $v0, 2
/* 25578 80034D78 2900822C */  sltiu      $v0, $a0, 0x29
/* 2557C 80034D7C 08004014 */  bnez       $v0, .L80034DA0
/* 25580 80034D80 D8FF8424 */   addiu     $a0, $a0, -0x28
/* 25584 80034D84 90C6010C */  jal        SetControlSaveDataData
/* 25588 80034D88 28004526 */   addiu     $a1, $s2, 0x28
/* 2558C 80034D8C 21200002 */  addu       $a0, $s0, $zero
/* 25590 80034D90 1000053C */  lui        $a1, (0x100007 >> 16)
/* 25594 80034D94 0700A534 */  ori        $a1, $a1, (0x100007 & 0xFFFF)
/* 25598 80034D98 A1D1000C */  jal        INSTANCE_Post
/* 2559C 80034D9C 21304000 */   addu      $a2, $v0, $zero
.L80034DA0:
/* 255A0 80034DA0 289F010C */  jal        EVENT_AddInstanceToInstanceList
/* 255A4 80034DA4 21200002 */   addu      $a0, $s0, $zero
/* 255A8 80034DA8 21200002 */  addu       $a0, $s0, $zero
/* 255AC 80034DAC 48CB000C */  jal        INSTANCE_InitEffects
/* 255B0 80034DB0 2128E002 */   addu      $a1, $s7, $zero
/* 255B4 80034DB4 05002012 */  beqz       $s1, .L80034DCC
/* 255B8 80034DB8 00000000 */   nop
/* 255BC 80034DBC 1400028E */  lw         $v0, 0x14($s0)
/* 255C0 80034DC0 00000000 */  nop
/* 255C4 80034DC4 20004234 */  ori        $v0, $v0, 0x20
/* 255C8 80034DC8 140002AE */  sw         $v0, 0x14($s0)
.L80034DCC:
/* 255CC 80034DCC 0C006012 */  beqz       $s3, .L80034E00
/* 255D0 80034DD0 0200033C */   lui       $v1, (0x20000 >> 16)
/* 255D4 80034DD4 21200002 */  addu       $a0, $s0, $zero
/* 255D8 80034DD8 1800028E */  lw         $v0, 0x18($s0)
/* 255DC 80034DDC 00000000 */  nop
/* 255E0 80034DE0 25104300 */  or         $v0, $v0, $v1
/* 255E4 80034DE4 B8D8020C */  jal        SAVE_DeleteInstance
/* 255E8 80034DE8 180002AE */   sw        $v0, 0x18($s0)
/* 255EC 80034DEC 01000224 */  addiu      $v0, $zero, 0x1
/* 255F0 80034DF0 80D30008 */  j          .L80034E00
/* 255F4 80034DF4 0000C2AF */   sw        $v0, 0x0($fp)
.L80034DF8:
/* 255F8 80034DF8 7BD6020C */  jal        SAVE_BufferIntro
/* 255FC 80034DFC 21204002 */   addu      $a0, $s2, $zero
.L80034E00:
/* 25600 80034E00 21100002 */  addu       $v0, $s0, $zero
.L80034E04:
/* 25604 80034E04 4400BF8F */  lw         $ra, 0x44($sp)
/* 25608 80034E08 4000BE8F */  lw         $fp, 0x40($sp)
/* 2560C 80034E0C 3C00B78F */  lw         $s7, 0x3C($sp)
/* 25610 80034E10 3800B68F */  lw         $s6, 0x38($sp)
/* 25614 80034E14 3400B58F */  lw         $s5, 0x34($sp)
/* 25618 80034E18 3000B48F */  lw         $s4, 0x30($sp)
/* 2561C 80034E1C 2C00B38F */  lw         $s3, 0x2C($sp)
/* 25620 80034E20 2800B28F */  lw         $s2, 0x28($sp)
/* 25624 80034E24 2400B18F */  lw         $s1, 0x24($sp)
/* 25628 80034E28 2000B08F */  lw         $s0, 0x20($sp)
/* 2562C 80034E2C 0800E003 */  jr         $ra
/* 25630 80034E30 4800BD27 */   addiu     $sp, $sp, 0x48
.size INSTANCE_IntroduceSavedInstance, . - INSTANCE_IntroduceSavedInstance
