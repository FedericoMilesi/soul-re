.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadInit
/* 422B4 80051AB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 422B8 80051AB8 1400B1AF */  sw         $s1, 0x14($sp)
/* 422BC 80051ABC 21888000 */  addu       $s1, $a0, $zero
/* 422C0 80051AC0 1000B0AF */  sw         $s0, 0x10($sp)
/* 422C4 80051AC4 1800BFAF */  sw         $ra, 0x18($sp)
/* 422C8 80051AC8 3800030C */  jal        func_800C00E0
/* 422CC 80051ACC 2180A000 */   addu      $s0, $a1, $zero
/* 422D0 80051AD0 0D80013C */  lui        $at, %hi(aadGp)
/* 422D4 80051AD4 F4C322AC */  sw         $v0, %lo(aadGp)($at)
/* 422D8 80051AD8 A5FC020C */  jal        func_800BF294
/* 422DC 80051ADC 00000000 */   nop
/* 422E0 80051AE0 A446010C */  jal        aadGetMemorySize
/* 422E4 80051AE4 21202002 */   addu      $a0, $s1, $zero
/* 422E8 80051AE8 D89B90AF */  sw         $s0, %gp_rel(aadMem)($gp)
/* 422EC 80051AEC 03000016 */  bnez       $s0, .L80051AFC
/* 422F0 80051AF0 21200002 */   addu      $a0, $s0, $zero
/* 422F4 80051AF4 52470108 */  j          .L80051D48
/* 422F8 80051AF8 09100224 */   addiu     $v0, $zero, 0x1009
.L80051AFC:
/* 422FC 80051AFC 21280000 */  addu       $a1, $zero, $zero
/* 42300 80051B00 2EF2020C */  jal        func_800BC8B8
/* 42304 80051B04 21304000 */   addu      $a2, $v0, $zero
/* 42308 80051B08 0800238E */  lw         $v1, 0x8($s1)
/* 4230C 80051B0C 00000000 */  nop
/* 42310 80051B10 8D006010 */  beqz       $v1, .L80051D48
/* 42314 80051B14 08100224 */   addiu     $v0, $zero, 0x1008
/* 42318 80051B18 0C00228E */  lw         $v0, 0xC($s1)
/* 4231C 80051B1C 00000000 */  nop
/* 42320 80051B20 89004010 */  beqz       $v0, .L80051D48
/* 42324 80051B24 08100224 */   addiu     $v0, $zero, 0x1008
/* 42328 80051B28 1000228E */  lw         $v0, 0x10($s1)
/* 4232C 80051B2C 00000000 */  nop
/* 42330 80051B30 03004014 */  bnez       $v0, .L80051B40
/* 42334 80051B34 FF000524 */   addiu     $a1, $zero, 0xFF
/* 42338 80051B38 52470108 */  j          .L80051D48
/* 4233C 80051B3C 08100224 */   addiu     $v0, $zero, 0x1008
.L80051B40:
/* 42340 80051B40 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42344 80051B44 00000000 */  nop
/* 42348 80051B48 300743AC */  sw         $v1, 0x730($v0)
/* 4234C 80051B4C 0C00238E */  lw         $v1, 0xC($s1)
/* 42350 80051B50 00000000 */  nop
/* 42354 80051B54 340743AC */  sw         $v1, 0x734($v0)
/* 42358 80051B58 1000238E */  lw         $v1, 0x10($s1)
/* 4235C 80051B5C 00020624 */  addiu      $a2, $zero, 0x200
/* 42360 80051B60 380743AC */  sw         $v1, 0x738($v0)
/* 42364 80051B64 1400238E */  lw         $v1, 0x14($s1)
/* 42368 80051B68 08084424 */  addiu      $a0, $v0, 0x808
/* 4236C 80051B6C 2EF2020C */  jal        func_800BC8B8
/* 42370 80051B70 3C0743AC */   sw        $v1, 0x73C($v0)
/* 42374 80051B74 FF000524 */  addiu      $a1, $zero, 0xFF
/* 42378 80051B78 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 4237C 80051B7C 00020624 */  addiu      $a2, $zero, 0x200
/* 42380 80051B80 2EF2020C */  jal        func_800BC8B8
/* 42384 80051B84 080A8424 */   addiu     $a0, $a0, 0xA08
/* 42388 80051B88 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 4238C 80051B8C FF000524 */  addiu      $a1, $zero, 0xFF
/* 42390 80051B90 F61765A0 */  sb         $a1, 0x17F6($v1)
/* 42394 80051B94 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 42398 80051B98 01000224 */  addiu      $v0, $zero, 0x1
/* 4239C 80051B9C F01B62AC */  sw         $v0, 0x1BF0($v1)
/* 423A0 80051BA0 00800234 */  ori        $v0, $zero, 0x8000
/* 423A4 80051BA4 F01762A4 */  sh         $v0, 0x17F0($v1)
/* 423A8 80051BA8 02020224 */  addiu      $v0, $zero, 0x202
/* 423AC 80051BAC F21762A4 */  sh         $v0, 0x17F2($v1)
/* 423B0 80051BB0 D8910234 */  ori        $v0, $zero, 0x91D8
/* 423B4 80051BB4 F41B60AC */  sw         $zero, 0x1BF4($v1)
/* 423B8 80051BB8 F41762A4 */  sh         $v0, 0x17F4($v1)
/* 423BC 80051BBC B44B010C */  jal        aadPurgeLoadQueue
/* 423C0 80051BC0 F71785A0 */   sb        $a1, 0x17F7($a0)
/* 423C4 80051BC4 3000030C */  jal        func_800C00C0
/* 423C8 80051BC8 00000000 */   nop
/* 423CC 80051BCC 21200000 */  addu       $a0, $zero, $zero
/* 423D0 80051BD0 C4FF020C */  jal        func_800BFF10
/* 423D4 80051BD4 21288000 */   addu      $a1, $a0, $zero
/* 423D8 80051BD8 0400228E */  lw         $v0, 0x4($s1)
/* 423DC 80051BDC 00000000 */  nop
/* 423E0 80051BE0 26004018 */  blez       $v0, .L80051C7C
/* 423E4 80051BE4 21300000 */   addu      $a2, $zero, $zero
/* 423E8 80051BE8 FF000A24 */  addiu      $t2, $zero, 0xFF
/* 423EC 80051BEC 7F000924 */  addiu      $t1, $zero, 0x7F
/* 423F0 80051BF0 3F000824 */  addiu      $t0, $zero, 0x3F
/* 423F4 80051BF4 00200B24 */  addiu      $t3, $zero, 0x2000
/* 423F8 80051BF8 881C0724 */  addiu      $a3, $zero, 0x1C88
.L80051BFC:
/* 423FC 80051BFC 21280000 */  addu       $a1, $zero, $zero
/* 42400 80051C00 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 42404 80051C04 80100600 */  sll        $v0, $a2, 2
/* 42408 80051C08 21106200 */  addu       $v0, $v1, $v0
/* 4240C 80051C0C 21186700 */  addu       $v1, $v1, $a3
/* 42410 80051C10 340043AC */  sw         $v1, 0x34($v0)
/* 42414 80051C14 00110600 */  sll        $v0, $a2, 4
/* 42418 80051C18 3F0566A0 */  sb         $a2, 0x53F($v1)
/* 4241C 80051C1C 3E056AA0 */  sb         $t2, 0x53E($v1)
/* 42420 80051C20 510562A0 */  sb         $v0, 0x551($v1)
/* 42424 80051C24 520569A0 */  sb         $t1, 0x552($v1)
/* 42428 80051C28 530568A0 */  sb         $t0, 0x553($v1)
/* 4242C 80051C2C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42430 80051C30 21206000 */  addu       $a0, $v1, $zero
/* 42434 80051C34 20004224 */  addiu      $v0, $v0, 0x20
/* 42438 80051C38 540562AC */  sw         $v0, 0x554($v1)
.L80051C3C:
/* 4243C 80051C3C 21106500 */  addu       $v0, $v1, $a1
/* 42440 80051C40 90054AA0 */  sb         $t2, 0x590($v0)
/* 42444 80051C44 A00549A0 */  sb         $t1, 0x5A0($v0)
/* 42448 80051C48 B00548A0 */  sb         $t0, 0x5B0($v0)
/* 4244C 80051C4C 70058BA4 */  sh         $t3, 0x570($a0)
/* 42450 80051C50 0100A524 */  addiu      $a1, $a1, 0x1
/* 42454 80051C54 1000A228 */  slti       $v0, $a1, 0x10
/* 42458 80051C58 F8FF4014 */  bnez       $v0, .L80051C3C
/* 4245C 80051C5C 02008424 */   addiu     $a0, $a0, 0x2
/* 42460 80051C60 380563AC */  sw         $v1, 0x538($v1)
/* 42464 80051C64 3C0566A0 */  sb         $a2, 0x53C($v1)
/* 42468 80051C68 0400228E */  lw         $v0, 0x4($s1)
/* 4246C 80051C6C 0100C624 */  addiu      $a2, $a2, 0x1
/* 42470 80051C70 2A10C200 */  slt        $v0, $a2, $v0
/* 42474 80051C74 E1FF4014 */  bnez       $v0, .L80051BFC
/* 42478 80051C78 D005E724 */   addiu     $a3, $a3, 0x5D0
.L80051C7C:
/* 4247C 80051C7C 21280000 */  addu       $a1, $zero, $zero
/* 42480 80051C80 01000824 */  addiu      $t0, $zero, 0x1
/* 42484 80051C84 FF000724 */  addiu      $a3, $zero, 0xFF
/* 42488 80051C88 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 4248C 80051C8C 39300224 */  addiu      $v0, $zero, 0x3039
/* 42490 80051C90 D80162A4 */  sh         $v0, 0x1D8($v1)
/* 42494 80051C94 7F000224 */  addiu      $v0, $zero, 0x7F
/* 42498 80051C98 DA0162A0 */  sb         $v0, 0x1DA($v1)
/* 4249C 80051C9C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 424A0 80051CA0 04002292 */  lbu        $v0, 0x4($s1)
/* 424A4 80051CA4 2130A000 */  addu       $a2, $a1, $zero
/* 424A8 80051CA8 040062AC */  sw         $v0, 0x4($v1)
/* 424AC 80051CAC 00002492 */  lbu        $a0, 0x0($s1)
/* 424B0 80051CB0 7F000224 */  addiu      $v0, $zero, 0x7F
/* 424B4 80051CB4 1C0062AC */  sw         $v0, 0x1C($v1)
/* 424B8 80051CB8 200062AC */  sw         $v0, 0x20($v1)
/* 424BC 80051CBC FC1B60AC */  sw         $zero, 0x1BFC($v1)
/* 424C0 80051CC0 F81B60AC */  sw         $zero, 0x1BF8($v1)
/* 424C4 80051CC4 080064AC */  sw         $a0, 0x8($v1)
.L80051CC8:
/* 424C8 80051CC8 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 424CC 80051CCC 00000000 */  nop
/* 424D0 80051CD0 21186600 */  addu       $v1, $v1, $a2
/* 424D4 80051CD4 E40167A0 */  sb         $a3, 0x1E4($v1)
/* 424D8 80051CD8 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 424DC 80051CDC 0410A800 */  sllv       $v0, $t0, $a1
/* 424E0 80051CE0 DC0162AC */  sw         $v0, 0x1DC($v1)
/* 424E4 80051CE4 21208600 */  addu       $a0, $a0, $a2
/* 424E8 80051CE8 ED0185A0 */  sb         $a1, 0x1ED($a0)
/* 424EC 80051CEC 0100A524 */  addiu      $a1, $a1, 0x1
/* 424F0 80051CF0 1800A228 */  slti       $v0, $a1, 0x18
/* 424F4 80051CF4 F4FF4014 */  bnez       $v0, .L80051CC8
/* 424F8 80051CF8 1C00C624 */   addiu     $a2, $a2, 0x1C
/* 424FC 80051CFC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42500 80051D00 00000000 */  nop
/* 42504 80051D04 0800438C */  lw         $v1, 0x8($v0)
/* 42508 80051D08 C40440AC */  sw         $zero, 0x4C4($v0)
/* 4250C 80051D0C C80440AC */  sw         $zero, 0x4C8($v0)
/* 42510 80051D10 CC0440AC */  sw         $zero, 0x4CC($v0)
/* 42514 80051D14 04006228 */  slti       $v0, $v1, 0x4
/* 42518 80051D18 07004010 */  beqz       $v0, .L80051D38
/* 4251C 80051D1C 40100300 */   sll       $v0, $v1, 1
/* 42520 80051D20 C09B8327 */  addiu      $v1, $gp, %gp_rel(aadHblanksPerUpdate)
/* 42524 80051D24 21104300 */  addu       $v0, $v0, $v1
/* 42528 80051D28 00004594 */  lhu        $a1, 0x0($v0)
/* 4252C 80051D2C 0580043C */  lui        $a0, %hi(aadSlotUpdateWrapper)
/* 42530 80051D30 5747010C */  jal        aadInstallUpdateFunc
/* 42534 80051D34 681F8424 */   addiu     $a0, $a0, %lo(aadSlotUpdateWrapper)
.L80051D38:
/* 42538 80051D38 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4253C 80051D3C 11FC020C */  jal        func_800BF044
/* 42540 80051D40 240040AC */   sw        $zero, 0x24($v0)
/* 42544 80051D44 21100000 */  addu       $v0, $zero, $zero
.L80051D48:
/* 42548 80051D48 1800BF8F */  lw         $ra, 0x18($sp)
/* 4254C 80051D4C 1400B18F */  lw         $s1, 0x14($sp)
/* 42550 80051D50 1000B08F */  lw         $s0, 0x10($sp)
/* 42554 80051D54 0800E003 */  jr         $ra
/* 42558 80051D58 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadInit, . - aadInit
