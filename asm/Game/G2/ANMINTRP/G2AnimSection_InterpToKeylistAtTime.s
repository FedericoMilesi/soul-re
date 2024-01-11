.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_InterpToKeylistAtTime
/* 82A1C 8009221C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 82A20 80092220 5000A28F */  lw         $v0, 0x50($sp)
/* 82A24 80092224 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 82A28 80092228 21888000 */  addu       $s1, $a0, $zero
/* 82A2C 8009222C 3400B7AF */  sw         $s7, 0x34($sp)
/* 82A30 80092230 21B8A000 */  addu       $s7, $a1, $zero
/* 82A34 80092234 3800BEAF */  sw         $fp, 0x38($sp)
/* 82A38 80092238 21F0C000 */  addu       $fp, $a2, $zero
/* 82A3C 8009223C 1800B0AF */  sw         $s0, 0x18($sp)
/* 82A40 80092240 2180E000 */  addu       $s0, $a3, $zero
/* 82A44 80092244 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 82A48 80092248 3000B6AF */  sw         $s6, 0x30($sp)
/* 82A4C 8009224C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 82A50 80092250 2800B4AF */  sw         $s4, 0x28($sp)
/* 82A54 80092254 2400B3AF */  sw         $s3, 0x24($sp)
/* 82A58 80092258 2000B2AF */  sw         $s2, 0x20($sp)
/* 82A5C 8009225C 21B04000 */  addu       $s6, $v0, $zero
/* 82A60 80092260 00140200 */  sll        $v0, $v0, 16
/* 82A64 80092264 13004010 */  beqz       $v0, .L800922B4
/* 82A68 80092268 1000B0A7 */   sh        $s0, 0x10($sp)
/* 82A6C 8009226C 3853020C */  jal        _G2AnimSection_GetAnim
/* 82A70 80092270 21202002 */   addu      $a0, $s1, $zero
/* 82A74 80092274 2C00338E */  lw         $s3, 0x2C($s1)
/* 82A78 80092278 00000000 */  nop
/* 82A7C 8009227C 0800638E */  lw         $v1, 0x8($s3)
/* 82A80 80092280 03003292 */  lbu        $s2, 0x3($s1)
/* 82A84 80092284 05006010 */  beqz       $v1, .L8009229C
/* 82A88 80092288 21A84000 */   addu      $s5, $v0, $zero
/* 82A8C 8009228C BC49020C */  jal        _G2AnimSection_InterpStateToQuat
/* 82A90 80092290 21202002 */   addu      $a0, $s1, $zero
/* 82A94 80092294 BA480208 */  j          .L800922E8
/* 82A98 80092298 21202002 */   addu      $a0, $s1, $zero
.L8009229C:
/* 82A9C 8009229C 834A020C */  jal        _G2Anim_AllocateInterpStateBlockList
/* 82AA0 800922A0 21202002 */   addu      $a0, $s1, $zero
/* 82AA4 800922A4 08004014 */  bnez       $v0, .L800922C8
/* 82AA8 800922A8 21202002 */   addu      $a0, $s1, $zero
/* 82AAC 800922AC 2128E002 */  addu       $a1, $s7, $zero
/* 82AB0 800922B0 2130C003 */  addu       $a2, $fp, $zero
.L800922B4:
/* 82AB4 800922B4 003C1000 */  sll        $a3, $s0, 16
/* 82AB8 800922B8 624D020C */  jal        G2AnimSection_SwitchToKeylistAtTime
/* 82ABC 800922BC 033C0700 */   sra       $a3, $a3, 16
/* 82AC0 800922C0 34490208 */  j          .L800924D0
/* 82AC4 800922C4 00000000 */   nop
.L800922C8:
/* 82AC8 800922C8 2128A002 */  addu       $a1, $s5, $zero
/* 82ACC 800922CC 0453020C */  jal        _G2AnimSection_UpdateStoredFrameFromData
/* 82AD0 800922D0 2C0020AE */   sw        $zero, 0x2C($s1)
/* 82AD4 800922D4 21202002 */  addu       $a0, $s1, $zero
/* 82AD8 800922D8 21280000 */  addu       $a1, $zero, $zero
/* 82ADC 800922DC 204A020C */  jal        _G2AnimSection_SegValueToQuat
/* 82AE0 800922E0 2C0033AE */   sw        $s3, 0x2C($s1)
/* 82AE4 800922E4 21202002 */  addu       $a0, $s1, $zero
.L800922E8:
/* 82AE8 800922E8 2128E002 */  addu       $a1, $s7, $zero
/* 82AEC 800922EC 04003496 */  lhu        $s4, 0x4($s1)
/* 82AF0 800922F0 1000A997 */  lhu        $t1, 0x10($sp)
/* 82AF4 800922F4 1800308E */  lw         $s0, 0x18($s1)
/* 82AF8 800922F8 2130C003 */  addu       $a2, $fp, $zero
/* 82AFC 800922FC 2C0020AE */  sw         $zero, 0x2C($s1)
/* 82B00 80092300 003C0900 */  sll        $a3, $t1, 16
/* 82B04 80092304 624D020C */  jal        G2AnimSection_SwitchToKeylistAtTime
/* 82B08 80092308 033C0700 */   sra       $a3, $a3, 16
/* 82B0C 8009230C 21202002 */  addu       $a0, $s1, $zero
/* 82B10 80092310 0453020C */  jal        _G2AnimSection_UpdateStoredFrameFromData
/* 82B14 80092314 2128A002 */   addu      $a1, $s5, $zero
/* 82B18 80092318 21202002 */  addu       $a0, $s1, $zero
/* 82B1C 8009231C 01000524 */  addiu      $a1, $zero, 0x1
/* 82B20 80092320 2C0033AE */  sw         $s3, 0x2C($s1)
/* 82B24 80092324 180030AE */  sw         $s0, 0x18($s1)
/* 82B28 80092328 204A020C */  jal        _G2AnimSection_SegValueToQuat
/* 82B2C 8009232C 040034A6 */   sh        $s4, 0x4($s1)
/* 82B30 80092330 0800688E */  lw         $t0, 0x8($s3)
/* 82B34 80092334 04000724 */  addiu      $a3, $zero, 0x4
/* 82B38 80092338 21300701 */  addu       $a2, $t0, $a3
/* 82B3C 8009233C 2200C394 */  lhu        $v1, 0x22($a2)
/* 82B40 80092340 2400C494 */  lhu        $a0, 0x24($a2)
/* 82B44 80092344 2600C294 */  lhu        $v0, 0x26($a2)
/* 82B48 80092348 25186400 */  or         $v1, $v1, $a0
/* 82B4C 8009234C 25104300 */  or         $v0, $v0, $v1
/* 82B50 80092350 04004014 */  bnez       $v0, .L80092364
/* 82B54 80092354 00000000 */   nop
/* 82B58 80092358 1C00C0A4 */  sh         $zero, 0x1C($a2)
/* 82B5C 8009235C 1E00C0A4 */  sh         $zero, 0x1E($a2)
/* 82B60 80092360 2000C0A4 */  sh         $zero, 0x20($a2)
.L80092364:
/* 82B64 80092364 2300401A */  blez       $s2, .L800923F4
/* 82B68 80092368 00000000 */   nop
/* 82B6C 8009236C FFFF5226 */  addiu      $s2, $s2, -0x1
.L80092370:
/* 82B70 80092370 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 82B74 80092374 1600C294 */  lhu        $v0, 0x16($a2)
/* 82B78 80092378 1000C494 */  lhu        $a0, 0x10($a2)
/* 82B7C 8009237C 1800C394 */  lhu        $v1, 0x18($a2)
/* 82B80 80092380 1200C594 */  lhu        $a1, 0x12($a2)
/* 82B84 80092384 23104400 */  subu       $v0, $v0, $a0
/* 82B88 80092388 1600C2A4 */  sh         $v0, 0x16($a2)
/* 82B8C 8009238C 1A00C294 */  lhu        $v0, 0x1A($a2)
/* 82B90 80092390 1400C494 */  lhu        $a0, 0x14($a2)
/* 82B94 80092394 23186500 */  subu       $v1, $v1, $a1
/* 82B98 80092398 1800C3A4 */  sh         $v1, 0x18($a2)
/* 82B9C 8009239C 2200C394 */  lhu        $v1, 0x22($a2)
/* 82BA0 800923A0 1C00C594 */  lhu        $a1, 0x1C($a2)
/* 82BA4 800923A4 23104400 */  subu       $v0, $v0, $a0
/* 82BA8 800923A8 1A00C2A4 */  sh         $v0, 0x1A($a2)
/* 82BAC 800923AC 2400C294 */  lhu        $v0, 0x24($a2)
/* 82BB0 800923B0 1E00C494 */  lhu        $a0, 0x1E($a2)
/* 82BB4 800923B4 23186500 */  subu       $v1, $v1, $a1
/* 82BB8 800923B8 2200C3A4 */  sh         $v1, 0x22($a2)
/* 82BBC 800923BC 2600C394 */  lhu        $v1, 0x26($a2)
/* 82BC0 800923C0 2000C594 */  lhu        $a1, 0x20($a2)
/* 82BC4 800923C4 23104400 */  subu       $v0, $v0, $a0
/* 82BC8 800923C8 23186500 */  subu       $v1, $v1, $a1
/* 82BCC 800923CC 2400C2A4 */  sh         $v0, 0x24($a2)
/* 82BD0 800923D0 2600C3A4 */  sh         $v1, 0x26($a2)
/* 82BD4 800923D4 0400E014 */  bnez       $a3, .L800923E8
/* 82BD8 800923D8 2800C624 */   addiu     $a2, $a2, 0x28
/* 82BDC 800923DC 0000088D */  lw         $t0, 0x0($t0)
/* 82BE0 800923E0 04000724 */  addiu      $a3, $zero, 0x4
/* 82BE4 800923E4 21300701 */  addu       $a2, $t0, $a3
.L800923E8:
/* 82BE8 800923E8 E1FF401E */  bgtz       $s2, .L80092370
/* 82BEC 800923EC FFFF5226 */   addiu     $s2, $s2, -0x1
/* 82BF0 800923F0 01005226 */  addiu      $s2, $s2, 0x1
.L800923F4:
/* 82BF4 800923F4 1000A997 */  lhu        $t1, 0x10($sp)
/* 82BF8 800923F8 00000000 */  nop
/* 82BFC 800923FC 020069A6 */  sh         $t1, 0x2($s3)
/* 82C00 80092400 000076A6 */  sh         $s6, 0x0($s3)
/* 82C04 80092404 00002292 */  lbu        $v0, 0x0($s1)
/* 82C08 80092408 00000000 */  nop
/* 82C0C 8009240C 02004230 */  andi       $v0, $v0, 0x2
/* 82C10 80092410 15004014 */  bnez       $v0, .L80092468
/* 82C14 80092414 00000000 */   nop
/* 82C18 80092418 1800228E */  lw         $v0, 0x18($s1)
/* 82C1C 8009241C 00000000 */  nop
/* 82C20 80092420 03004230 */  andi       $v0, $v0, 0x3
/* 82C24 80092424 10004010 */  beqz       $v0, .L80092468
/* 82C28 80092428 00141400 */   sll       $v0, $s4, 16
/* 82C2C 8009242C 2400238E */  lw         $v1, 0x24($s1)
/* 82C30 80092430 00000000 */  nop
/* 82C34 80092434 01006390 */  lbu        $v1, 0x1($v1)
/* 82C38 80092438 03140200 */  sra        $v0, $v0, 16
/* 82C3C 8009243C 1A004300 */  div        $zero, $v0, $v1
/* 82C40 80092440 10180000 */  mfhi       $v1
/* 82C44 80092444 00141600 */  sll        $v0, $s6, 16
/* 82C48 80092448 03140200 */  sra        $v0, $v0, 16
/* 82C4C 8009244C 01006324 */  addiu      $v1, $v1, 0x1
/* 82C50 80092450 2A104300 */  slt        $v0, $v0, $v1
/* 82C54 80092454 02004010 */  beqz       $v0, .L80092460
/* 82C58 80092458 21A06000 */   addu      $s4, $v1, $zero
/* 82C5C 8009245C 21A0C002 */  addu       $s4, $s6, $zero
.L80092460:
/* 82C60 80092460 1B490208 */  j          .L8009246C
/* 82C64 80092464 040034A6 */   sh        $s4, 0x4($s1)
.L80092468:
/* 82C68 80092468 040020A6 */  sh         $zero, 0x4($s1)
.L8009246C:
/* 82C6C 8009246C 240037AE */  sw         $s7, 0x24($s1)
/* 82C70 80092470 2110E002 */  addu       $v0, $s7, $zero
/* 82C74 80092474 14003EA6 */  sh         $fp, 0x14($s1)
/* 82C78 80092478 06004294 */  lhu        $v0, 0x6($v0)
/* 82C7C 8009247C 00002392 */  lbu        $v1, 0x0($s1)
/* 82C80 80092480 23100200 */  negu       $v0, $v0
/* 82C84 80092484 02006330 */  andi       $v1, $v1, 0x2
/* 82C88 80092488 03006010 */  beqz       $v1, .L80092498
/* 82C8C 8009248C 060022A6 */   sh        $v0, 0x6($s1)
/* 82C90 80092490 6540020C */  jal        G2AnimSection_SetLoopRangeAll
/* 82C94 80092494 21202002 */   addu      $a0, $s1, $zero
.L80092498:
/* 82C98 80092498 21202002 */  addu       $a0, $s1, $zero
/* 82C9C 8009249C EB3F020C */  jal        G2AnimSection_ClearAlarm
/* 82CA0 800924A0 03000524 */   addiu     $a1, $zero, 0x3
/* 82CA4 800924A4 00002292 */  lbu        $v0, 0x0($s1)
/* 82CA8 800924A8 21202002 */  addu       $a0, $s1, $zero
/* 82CAC 800924AC 7F004230 */  andi       $v0, $v0, 0x7F
/* 82CB0 800924B0 8040020C */  jal        G2AnimSection_SetUnpaused
/* 82CB4 800924B4 000022A2 */   sb        $v0, 0x0($s1)
/* 82CB8 800924B8 0C0020AE */  sw         $zero, 0xC($s1)
/* 82CBC 800924BC 2C0033AE */  sw         $s3, 0x2C($s1)
/* 82CC0 800924C0 0E00A296 */  lhu        $v0, 0xE($s5)
/* 82CC4 800924C4 00000000 */  nop
/* 82CC8 800924C8 01004234 */  ori        $v0, $v0, 0x1
/* 82CCC 800924CC 0E00A2A6 */  sh         $v0, 0xE($s5)
.L800924D0:
/* 82CD0 800924D0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 82CD4 800924D4 3800BE8F */  lw         $fp, 0x38($sp)
/* 82CD8 800924D8 3400B78F */  lw         $s7, 0x34($sp)
/* 82CDC 800924DC 3000B68F */  lw         $s6, 0x30($sp)
/* 82CE0 800924E0 2C00B58F */  lw         $s5, 0x2C($sp)
/* 82CE4 800924E4 2800B48F */  lw         $s4, 0x28($sp)
/* 82CE8 800924E8 2400B38F */  lw         $s3, 0x24($sp)
/* 82CEC 800924EC 2000B28F */  lw         $s2, 0x20($sp)
/* 82CF0 800924F0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 82CF4 800924F4 1800B08F */  lw         $s0, 0x18($sp)
/* 82CF8 800924F8 0800E003 */  jr         $ra
/* 82CFC 800924FC 4000BD27 */   addiu     $sp, $sp, 0x40
.size G2AnimSection_InterpToKeylistAtTime, . - G2AnimSection_InterpToKeylistAtTime
