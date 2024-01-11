.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C4A78
/* B5278 800C4A78 0D80023C */  lui        $v0, %hi(CD_debug)
/* B527C 800C4A7C 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* B5280 800C4A80 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* B5284 800C4A84 1800B0AF */  sw         $s0, 0x18($sp)
/* B5288 800C4A88 2180A000 */  addu       $s0, $a1, $zero
/* B528C 800C4A8C 3000B6AF */  sw         $s6, 0x30($sp)
/* B5290 800C4A90 21B0C000 */  addu       $s6, $a2, $zero
/* B5294 800C4A94 2000B2AF */  sw         $s2, 0x20($sp)
/* B5298 800C4A98 2190E000 */  addu       $s2, $a3, $zero
/* B529C 800C4A9C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B52A0 800C4AA0 21888000 */  addu       $s1, $a0, $zero
/* B52A4 800C4AA4 3400BFAF */  sw         $ra, 0x34($sp)
/* B52A8 800C4AA8 2C00B5AF */  sw         $s5, 0x2C($sp)
/* B52AC 800C4AAC 2800B4AF */  sw         $s4, 0x28($sp)
/* B52B0 800C4AB0 02004228 */  slti       $v0, $v0, 0x2
/* B52B4 800C4AB4 09004014 */  bnez       $v0, .L800C4ADC
/* B52B8 800C4AB8 2400B3AF */   sw        $s3, 0x24($sp)
/* B52BC 800C4ABC FF002232 */  andi       $v0, $s1, 0xFF
/* B52C0 800C4AC0 80100200 */  sll        $v0, $v0, 2
/* B52C4 800C4AC4 0D80053C */  lui        $a1, %hi(CD_comstr)
/* B52C8 800C4AC8 2128A200 */  addu       $a1, $a1, $v0
/* B52CC 800C4ACC A8E9A58C */  lw         $a1, %lo(CD_comstr)($a1)
/* B52D0 800C4AD0 0180043C */  lui        $a0, %hi(D_80012C2C)
/* B52D4 800C4AD4 06D1010C */  jal        printf
/* B52D8 800C4AD8 2C2C8424 */   addiu     $a0, $a0, %lo(D_80012C2C)
.L800C4ADC:
/* B52DC 800C4ADC FF002232 */  andi       $v0, $s1, 0xFF
/* B52E0 800C4AE0 80180200 */  sll        $v1, $v0, 2
/* B52E4 800C4AE4 0D80023C */  lui        $v0, %hi(CD_intstr + 0x1A0)
/* B52E8 800C4AE8 21104300 */  addu       $v0, $v0, $v1
/* B52EC 800C4AEC C8EB428C */  lw         $v0, %lo(CD_intstr + 0x1A0)($v0)
/* B52F0 800C4AF0 00000000 */  nop
/* B52F4 800C4AF4 10004010 */  beqz       $v0, .L800C4B38
/* B52F8 800C4AF8 21200000 */   addu      $a0, $zero, $zero
/* B52FC 800C4AFC 0E000016 */  bnez       $s0, .L800C4B38
/* B5300 800C4B00 00000000 */   nop
/* B5304 800C4B04 0D80023C */  lui        $v0, %hi(CD_debug)
/* B5308 800C4B08 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* B530C 800C4B0C 00000000 */  nop
/* B5310 800C4B10 D2004018 */  blez       $v0, .L800C4E5C
/* B5314 800C4B14 FEFF0224 */   addiu     $v0, $zero, -0x2
/* B5318 800C4B18 0D80053C */  lui        $a1, %hi(CD_comstr)
/* B531C 800C4B1C 2128A300 */  addu       $a1, $a1, $v1
/* B5320 800C4B20 A8E9A58C */  lw         $a1, %lo(CD_comstr)($a1)
/* B5324 800C4B24 0180043C */  lui        $a0, %hi(D_80012C34)
/* B5328 800C4B28 06D1010C */  jal        printf
/* B532C 800C4B2C 342C8424 */   addiu     $a0, $a0, %lo(D_80012C34)
/* B5330 800C4B30 97130308 */  j          .L800C4E5C
/* B5334 800C4B34 FEFF0224 */   addiu     $v0, $zero, -0x2
.L800C4B38:
/* B5338 800C4B38 4C11030C */  jal        func_800C4530
/* B533C 800C4B3C 21280000 */   addu      $a1, $zero, $zero
/* B5340 800C4B40 FF002332 */  andi       $v1, $s1, 0xFF
/* B5344 800C4B44 02000224 */  addiu      $v0, $zero, 0x2
/* B5348 800C4B48 0D006214 */  bne        $v1, $v0, .L800C4B80
/* B534C 800C4B4C 0E000224 */   addiu     $v0, $zero, 0xE
/* B5350 800C4B50 21200000 */  addu       $a0, $zero, $zero
/* B5354 800C4B54 21100402 */  addu       $v0, $s0, $a0
.L800C4B58:
/* B5358 800C4B58 00004290 */  lbu        $v0, 0x0($v0)
/* B535C 800C4B5C 0D80013C */  lui        $at, %hi(CD_pos)
/* B5360 800C4B60 21082400 */  addu       $at, $at, $a0
/* B5364 800C4B64 9CE922A0 */  sb         $v0, %lo(CD_pos)($at)
/* B5368 800C4B68 01008424 */  addiu      $a0, $a0, 0x1
/* B536C 800C4B6C 04008228 */  slti       $v0, $a0, 0x4
/* B5370 800C4B70 F9FF4014 */  bnez       $v0, .L800C4B58
/* B5374 800C4B74 21100402 */   addu      $v0, $s0, $a0
/* B5378 800C4B78 FF002332 */  andi       $v1, $s1, 0xFF
/* B537C 800C4B7C 0E000224 */  addiu      $v0, $zero, 0xE
.L800C4B80:
/* B5380 800C4B80 04006214 */  bne        $v1, $v0, .L800C4B94
/* B5384 800C4B84 00000000 */   nop
/* B5388 800C4B88 00000292 */  lbu        $v0, 0x0($s0)
/* B538C 800C4B8C 0D80013C */  lui        $at, %hi(CD_mode)
/* B5390 800C4B90 A0E922A0 */  sb         $v0, %lo(CD_mode)($at)
.L800C4B94:
/* B5394 800C4B94 0D80053C */  lui        $a1, %hi(CD_intstr + 0x238)
/* B5398 800C4B98 60ECA524 */  addiu      $a1, $a1, %lo(CD_intstr + 0x238)
/* B539C 800C4B9C 80200300 */  sll        $a0, $v1, 2
/* B53A0 800C4BA0 0000A0A0 */  sb         $zero, 0x0($a1)
/* B53A4 800C4BA4 0D80023C */  lui        $v0, %hi(CD_intstr + 0xA0)
/* B53A8 800C4BA8 21104400 */  addu       $v0, $v0, $a0
/* B53AC 800C4BAC C8EA428C */  lw         $v0, %lo(CD_intstr + 0xA0)($v0)
/* B53B0 800C4BB0 0D80033C */  lui        $v1, %hi(CD_intstr + 0xA0)
/* B53B4 800C4BB4 02004010 */  beqz       $v0, .L800C4BC0
/* B53B8 800C4BB8 C8EA6324 */   addiu     $v1, $v1, %lo(CD_intstr + 0xA0)
/* B53BC 800C4BBC 0100A0A0 */  sb         $zero, 0x1($a1)
.L800C4BC0:
/* B53C0 800C4BC0 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B53C4 800C4BC4 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B53C8 800C4BC8 00000000 */  nop
/* B53CC 800C4BCC 000040A0 */  sb         $zero, 0x0($v0)
/* B53D0 800C4BD0 00016224 */  addiu      $v0, $v1, 0x100
/* B53D4 800C4BD4 21188200 */  addu       $v1, $a0, $v0
/* B53D8 800C4BD8 0000628C */  lw         $v0, 0x0($v1)
/* B53DC 800C4BDC 00000000 */  nop
/* B53E0 800C4BE0 0D004018 */  blez       $v0, .L800C4C18
/* B53E4 800C4BE4 21200000 */   addu      $a0, $zero, $zero
/* B53E8 800C4BE8 21286000 */  addu       $a1, $v1, $zero
/* B53EC 800C4BEC 21100402 */  addu       $v0, $s0, $a0
.L800C4BF0:
/* B53F0 800C4BF0 0D80033C */  lui        $v1, %hi(CD_intstr + 0x228)
/* B53F4 800C4BF4 50EC638C */  lw         $v1, %lo(CD_intstr + 0x228)($v1)
/* B53F8 800C4BF8 00004290 */  lbu        $v0, 0x0($v0)
/* B53FC 800C4BFC 00000000 */  nop
/* B5400 800C4C00 000062A0 */  sb         $v0, 0x0($v1)
/* B5404 800C4C04 0000A28C */  lw         $v0, 0x0($a1)
/* B5408 800C4C08 01008424 */  addiu      $a0, $a0, 0x1
/* B540C 800C4C0C 2A108200 */  slt        $v0, $a0, $v0
/* B5410 800C4C10 F7FF4014 */  bnez       $v0, .L800C4BF0
/* B5414 800C4C14 21100402 */   addu      $v0, $s0, $a0
.L800C4C18:
/* B5418 800C4C18 0D80023C */  lui        $v0, %hi(CD_intstr + 0x224)
/* B541C 800C4C1C 4CEC428C */  lw         $v0, %lo(CD_intstr + 0x224)($v0)
/* B5420 800C4C20 0D80013C */  lui        $at, %hi(CD_com)
/* B5424 800C4C24 A1E931A0 */  sb         $s1, %lo(CD_com)($at)
/* B5428 800C4C28 000051A0 */  sb         $s1, 0x0($v0)
/* B542C 800C4C2C 8B004016 */  bnez       $s2, .L800C4E5C
/* B5430 800C4C30 21100000 */   addu      $v0, $zero, $zero
/* B5434 800C4C34 5EF2020C */  jal        func_800BC978
/* B5438 800C4C38 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B543C 800C4C3C C0034224 */  addiu      $v0, $v0, 0x3C0
/* B5440 800C4C40 0D80043C */  lui        $a0, %hi(CD_intstr + 0x238)
/* B5444 800C4C44 60EC8424 */  addiu      $a0, $a0, %lo(CD_intstr + 0x238)
/* B5448 800C4C48 0E80013C */  lui        $at, %hi(StStartFrame + 0x5C)
/* B544C 800C4C4C A0FD22AC */  sw         $v0, %lo(StStartFrame + 0x5C)($at)
/* B5450 800C4C50 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B5454 800C4C54 A4FD20AC */  sw         $zero, %lo(StStartFrame + 0x60)($at)
/* B5458 800C4C58 00008390 */  lbu        $v1, 0x0($a0)
/* B545C 800C4C5C 0180023C */  lui        $v0, %hi(D_80012C44)
/* B5460 800C4C60 442C4224 */  addiu      $v0, $v0, %lo(D_80012C44)
/* B5464 800C4C64 0E80013C */  lui        $at, %hi(StStartFrame + 0x64)
/* B5468 800C4C68 A8FD22AC */  sw         $v0, %lo(StStartFrame + 0x64)($at)
/* B546C 800C4C6C 67006014 */  bnez       $v1, .L800C4E0C
/* B5470 800C4C70 2130C002 */   addu      $a2, $s6, $zero
/* B5474 800C4C74 0D80153C */  lui        $s5, %hi(CD_comstr)
/* B5478 800C4C78 A8E9B526 */  addiu      $s5, $s5, %lo(CD_comstr)
/* B547C 800C4C7C 0D80133C */  lui        $s3, %hi(CD_intstr)
/* B5480 800C4C80 28EA7326 */  addiu      $s3, $s3, %lo(CD_intstr)
/* B5484 800C4C84 21908000 */  addu       $s2, $a0, $zero
/* B5488 800C4C88 01005426 */  addiu      $s4, $s2, 0x1
.L800C4C8C:
/* B548C 800C4C8C 5EF2020C */  jal        func_800BC978
/* B5490 800C4C90 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B5494 800C4C94 0E80033C */  lui        $v1, %hi(StStartFrame + 0x5C)
/* B5498 800C4C98 A0FD638C */  lw         $v1, %lo(StStartFrame + 0x5C)($v1)
/* B549C 800C4C9C 00000000 */  nop
/* B54A0 800C4CA0 2A186200 */  slt        $v1, $v1, $v0
/* B54A4 800C4CA4 0C006014 */  bnez       $v1, .L800C4CD8
/* B54A8 800C4CA8 00000000 */   nop
/* B54AC 800C4CAC 0E80023C */  lui        $v0, %hi(StStartFrame + 0x60)
/* B54B0 800C4CB0 A4FD428C */  lw         $v0, %lo(StStartFrame + 0x60)($v0)
/* B54B4 800C4CB4 00000000 */  nop
/* B54B8 800C4CB8 21184000 */  addu       $v1, $v0, $zero
/* B54BC 800C4CBC 01004224 */  addiu      $v0, $v0, 0x1
/* B54C0 800C4CC0 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B54C4 800C4CC4 A4FD22AC */  sw         $v0, %lo(StStartFrame + 0x60)($at)
/* B54C8 800C4CC8 3C00023C */  lui        $v0, (0x3C0000 >> 16)
/* B54CC 800C4CCC 2A104300 */  slt        $v0, $v0, $v1
/* B54D0 800C4CD0 1B004010 */  beqz       $v0, .L800C4D40
/* B54D4 800C4CD4 00000000 */   nop
.L800C4CD8:
/* B54D8 800C4CD8 0180043C */  lui        $a0, %hi(D_80012B90)
/* B54DC 800C4CDC 9901030C */  jal        func_800C0664
/* B54E0 800C4CE0 902B8424 */   addiu     $a0, $a0, %lo(D_80012B90)
/* B54E4 800C4CE4 00004492 */  lbu        $a0, 0x0($s2)
/* B54E8 800C4CE8 01004292 */  lbu        $v0, 0x1($s2)
/* B54EC 800C4CEC 0E80053C */  lui        $a1, %hi(StStartFrame + 0x64)
/* B54F0 800C4CF0 A8FDA58C */  lw         $a1, %lo(StStartFrame + 0x64)($a1)
/* B54F4 800C4CF4 80100200 */  sll        $v0, $v0, 2
/* B54F8 800C4CF8 21105300 */  addu       $v0, $v0, $s3
/* B54FC 800C4CFC 80200400 */  sll        $a0, $a0, 2
/* B5500 800C4D00 0000438C */  lw         $v1, 0x0($v0)
/* B5504 800C4D04 0D80023C */  lui        $v0, %hi(CD_com)
/* B5508 800C4D08 A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B550C 800C4D0C 21209300 */  addu       $a0, $a0, $s3
/* B5510 800C4D10 80100200 */  sll        $v0, $v0, 2
/* B5514 800C4D14 21105500 */  addu       $v0, $v0, $s5
/* B5518 800C4D18 1000A3AF */  sw         $v1, 0x10($sp)
/* B551C 800C4D1C 0000468C */  lw         $a2, 0x0($v0)
/* B5520 800C4D20 0000878C */  lw         $a3, 0x0($a0)
/* B5524 800C4D24 0180043C */  lui        $a0, %hi(D_80012BA0)
/* B5528 800C4D28 06D1010C */  jal        printf
/* B552C 800C4D2C A02B8424 */   addiu     $a0, $a0, %lo(D_80012BA0)
/* B5530 800C4D30 A113030C */  jal        func_800C4E84
/* B5534 800C4D34 00000000 */   nop
/* B5538 800C4D38 51130308 */  j          .L800C4D44
/* B553C 800C4D3C FFFF0224 */   addiu     $v0, $zero, -0x1
.L800C4D40:
/* B5540 800C4D40 21100000 */  addu       $v0, $zero, $zero
.L800C4D44:
/* B5544 800C4D44 45004014 */  bnez       $v0, .L800C4E5C
/* B5548 800C4D48 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B554C 800C4D4C E8E6020C */  jal        func_800B9BA0
/* B5550 800C4D50 00000000 */   nop
/* B5554 800C4D54 29004010 */  beqz       $v0, .L800C4DFC
/* B5558 800C4D58 00000000 */   nop
/* B555C 800C4D5C 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5560 800C4D60 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5564 800C4D64 00000000 */  nop
/* B5568 800C4D68 00004290 */  lbu        $v0, 0x0($v0)
/* B556C 800C4D6C 00000000 */  nop
/* B5570 800C4D70 03005130 */  andi       $s1, $v0, 0x3
.L800C4D74:
/* B5574 800C4D74 F30F030C */  jal        func_800C3FCC
/* B5578 800C4D78 00000000 */   nop
/* B557C 800C4D7C 21804000 */  addu       $s0, $v0, $zero
/* B5580 800C4D80 1A000012 */  beqz       $s0, .L800C4DEC
/* B5584 800C4D84 04000232 */   andi      $v0, $s0, 0x4
/* B5588 800C4D88 0B004010 */  beqz       $v0, .L800C4DB8
/* B558C 800C4D8C 02000232 */   andi      $v0, $s0, 0x2
/* B5590 800C4D90 0D80023C */  lui        $v0, %hi(CD_cbready)
/* B5594 800C4D94 88E9428C */  lw         $v0, %lo(CD_cbready)($v0)
/* B5598 800C4D98 00000000 */  nop
/* B559C 800C4D9C 05004010 */  beqz       $v0, .L800C4DB4
/* B55A0 800C4DA0 00000000 */   nop
/* B55A4 800C4DA4 00008492 */  lbu        $a0, 0x0($s4)
/* B55A8 800C4DA8 0E80053C */  lui        $a1, %hi(StStartFrame + 0x4C)
/* B55AC 800C4DAC 09F84000 */  jalr       $v0
/* B55B0 800C4DB0 90FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x4C)
.L800C4DB4:
/* B55B4 800C4DB4 02000232 */  andi       $v0, $s0, 0x2
.L800C4DB8:
/* B55B8 800C4DB8 EEFF4010 */  beqz       $v0, .L800C4D74
/* B55BC 800C4DBC 00000000 */   nop
/* B55C0 800C4DC0 0D80023C */  lui        $v0, %hi(CD_cbsync)
/* B55C4 800C4DC4 84E9428C */  lw         $v0, %lo(CD_cbsync)($v0)
/* B55C8 800C4DC8 00000000 */  nop
/* B55CC 800C4DCC E9FF4010 */  beqz       $v0, .L800C4D74
/* B55D0 800C4DD0 00000000 */   nop
/* B55D4 800C4DD4 00004492 */  lbu        $a0, 0x0($s2)
/* B55D8 800C4DD8 0E80053C */  lui        $a1, %hi(StStartFrame + 0x44)
/* B55DC 800C4DDC 09F84000 */  jalr       $v0
/* B55E0 800C4DE0 88FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x44)
/* B55E4 800C4DE4 5D130308 */  j          .L800C4D74
/* B55E8 800C4DE8 00000000 */   nop
.L800C4DEC:
/* B55EC 800C4DEC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B55F0 800C4DF0 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B55F4 800C4DF4 00000000 */  nop
/* B55F8 800C4DF8 000051A0 */  sb         $s1, 0x0($v0)
.L800C4DFC:
/* B55FC 800C4DFC 00004292 */  lbu        $v0, 0x0($s2)
/* B5600 800C4E00 00000000 */  nop
/* B5604 800C4E04 A1FF4010 */  beqz       $v0, .L800C4C8C
/* B5608 800C4E08 2130C002 */   addu      $a2, $s6, $zero
.L800C4E0C:
/* B560C 800C4E0C 0E80043C */  lui        $a0, %hi(StStartFrame + 0x44)
/* B5610 800C4E10 88FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x44)
/* B5614 800C4E14 0800C010 */  beqz       $a2, .L800C4E38
/* B5618 800C4E18 07000324 */   addiu     $v1, $zero, 0x7
/* B561C 800C4E1C FFFF0524 */  addiu      $a1, $zero, -0x1
.L800C4E20:
/* B5620 800C4E20 00008290 */  lbu        $v0, 0x0($a0)
/* B5624 800C4E24 01008424 */  addiu      $a0, $a0, 0x1
/* B5628 800C4E28 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B562C 800C4E2C 0000C2A0 */  sb         $v0, 0x0($a2)
/* B5630 800C4E30 FBFF6514 */  bne        $v1, $a1, .L800C4E20
/* B5634 800C4E34 0100C624 */   addiu     $a2, $a2, 0x1
.L800C4E38:
/* B5638 800C4E38 21200000 */  addu       $a0, $zero, $zero
/* B563C 800C4E3C 0D80023C */  lui        $v0, %hi(CD_intstr + 0x238)
/* B5640 800C4E40 60EC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x238)
/* B5644 800C4E44 00004390 */  lbu        $v1, 0x0($v0)
/* B5648 800C4E48 05000224 */  addiu      $v0, $zero, 0x5
/* B564C 800C4E4C 03006214 */  bne        $v1, $v0, .L800C4E5C
/* B5650 800C4E50 21108000 */   addu      $v0, $a0, $zero
/* B5654 800C4E54 FFFF0424 */  addiu      $a0, $zero, -0x1
/* B5658 800C4E58 21108000 */  addu       $v0, $a0, $zero
.L800C4E5C:
/* B565C 800C4E5C 3400BF8F */  lw         $ra, 0x34($sp)
/* B5660 800C4E60 3000B68F */  lw         $s6, 0x30($sp)
/* B5664 800C4E64 2C00B58F */  lw         $s5, 0x2C($sp)
/* B5668 800C4E68 2800B48F */  lw         $s4, 0x28($sp)
/* B566C 800C4E6C 2400B38F */  lw         $s3, 0x24($sp)
/* B5670 800C4E70 2000B28F */  lw         $s2, 0x20($sp)
/* B5674 800C4E74 1C00B18F */  lw         $s1, 0x1C($sp)
/* B5678 800C4E78 1800B08F */  lw         $s0, 0x18($sp)
/* B567C 800C4E7C 0800E003 */  jr         $ra
/* B5680 800C4E80 3800BD27 */   addiu     $sp, $sp, 0x38
.size func_800C4A78, . - func_800C4A78
