.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSfxReturn2
/* 4445C 80053C5C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 44460 80053C60 1400B1AF */  sw         $s1, 0x14($sp)
/* 44464 80053C64 2188E000 */  addu       $s1, $a3, $zero
/* 44468 80053C68 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4446C 80053C6C 21980000 */  addu       $s3, $zero, $zero
/* 44470 80053C70 1800B2AF */  sw         $s2, 0x18($sp)
/* 44474 80053C74 2190A000 */  addu       $s2, $a1, $zero
/* 44478 80053C78 2000B4AF */  sw         $s4, 0x20($sp)
/* 4447C 80053C7C 21A08000 */  addu       $s4, $a0, $zero
/* 44480 80053C80 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 44484 80053C84 2800B6AF */  sw         $s6, 0x28($sp)
/* 44488 80053C88 2400B5AF */  sw         $s5, 0x24($sp)
/* 4448C 80053C8C 9B004012 */  beqz       $s2, .L80053EFC
/* 44490 80053C90 1000B0AF */   sw        $s0, 0x10($sp)
/* 44494 80053C94 01001524 */  addiu      $s5, $zero, 0x1
/* 44498 80053C98 18001624 */  addiu      $s6, $zero, 0x18
.L80053C9C:
/* 4449C 80053C9C 6000238E */  lw         $v1, 0x60($s1)
/* 444A0 80053CA0 00000000 */  nop
/* 444A4 80053CA4 37007510 */  beq        $v1, $s5, .L80053D84
/* 444A8 80053CA8 02006228 */   slti      $v0, $v1, 0x2
/* 444AC 80053CAC 05004010 */  beqz       $v0, .L80053CC4
/* 444B0 80053CB0 00000000 */   nop
/* 444B4 80053CB4 0A006010 */  beqz       $v1, .L80053CE0
/* 444B8 80053CB8 61000424 */   addiu     $a0, $zero, 0x61
/* 444BC 80053CBC BD4F0108 */  j          .L80053EF4
/* 444C0 80053CC0 00000000 */   nop
.L80053CC4:
/* 444C4 80053CC4 02000224 */  addiu      $v0, $zero, 0x2
/* 444C8 80053CC8 44006210 */  beq        $v1, $v0, .L80053DDC
/* 444CC 80053CCC 03000224 */   addiu     $v0, $zero, 0x3
/* 444D0 80053CD0 56006210 */  beq        $v1, $v0, .L80053E2C
/* 444D4 80053CD4 00000000 */   nop
/* 444D8 80053CD8 BD4F0108 */  j          .L80053EF4
/* 444DC 80053CDC 00000000 */   nop
.L80053CE0:
/* 444E0 80053CE0 53000524 */  addiu      $a1, $zero, 0x53
/* 444E4 80053CE4 4D000624 */  addiu      $a2, $zero, 0x4D
/* 444E8 80053CE8 3949010C */  jal        aadCreateFourCharID
/* 444EC 80053CEC 46000724 */   addiu     $a3, $zero, 0x46
/* 444F0 80053CF0 0000838E */  lw         $v1, 0x0($s4)
/* 444F4 80053CF4 00000000 */  nop
/* 444F8 80053CF8 05006210 */  beq        $v1, $v0, .L80053D10
/* 444FC 80053CFC 21202002 */   addu      $a0, $s1, $zero
/* 44500 80053D00 8A4C010C */  jal        aadLoadDynamicSfxAbort
/* 44504 80053D04 0B100524 */   addiu     $a1, $zero, 0x100B
/* 44508 80053D08 BF4F0108 */  j          .L80053EFC
/* 4450C 80053D0C 00000000 */   nop
.L80053D10:
/* 44510 80053D10 04008396 */  lhu        $v1, 0x4($s4)
/* 44514 80053D14 00010224 */  addiu      $v0, $zero, 0x100
/* 44518 80053D18 05006210 */  beq        $v1, $v0, .L80053D30
/* 4451C 80053D1C 00000000 */   nop
/* 44520 80053D20 8A4C010C */  jal        aadLoadDynamicSfxAbort
/* 44524 80053D24 0C100524 */   addiu     $a1, $zero, 0x100C
/* 44528 80053D28 BF4F0108 */  j          .L80053EFC
/* 4452C 80053D2C 00000000 */   nop
.L80053D30:
/* 44530 80053D30 7800248E */  lw         $a0, 0x78($s1)
/* 44534 80053D34 06008396 */  lhu        $v1, 0x6($s4)
/* 44538 80053D38 06008294 */  lhu        $v0, 0x6($a0)
/* 4453C 80053D3C 00000000 */  nop
/* 44540 80053D40 06006214 */  bne        $v1, $v0, .L80053D5C
/* 44544 80053D44 00000000 */   nop
/* 44548 80053D48 08008396 */  lhu        $v1, 0x8($s4)
/* 4454C 80053D4C 0A008294 */  lhu        $v0, 0xA($a0)
/* 44550 80053D50 00000000 */  nop
/* 44554 80053D54 06006210 */  beq        $v1, $v0, .L80053D70
/* 44558 80053D58 10007326 */   addiu     $s3, $s3, 0x10
.L80053D5C:
/* 4455C 80053D5C 21202002 */  addu       $a0, $s1, $zero
/* 44560 80053D60 8A4C010C */  jal        aadLoadDynamicSfxAbort
/* 44564 80053D64 0D100524 */   addiu     $a1, $zero, 0x100D
/* 44568 80053D68 BF4F0108 */  j          .L80053EFC
/* 4456C 80053D6C 00000000 */   nop
.L80053D70:
/* 44570 80053D70 F0FF5226 */  addiu      $s2, $s2, -0x10
/* 44574 80053D74 600035AE */  sw         $s5, 0x60($s1)
/* 44578 80053D78 640036AE */  sw         $s6, 0x64($s1)
/* 4457C 80053D7C BD4F0108 */  j          .L80053EF4
/* 44580 80053D80 680022AE */   sw        $v0, 0x68($s1)
.L80053D84:
/* 44584 80053D84 6400308E */  lw         $s0, 0x64($s1)
/* 44588 80053D88 00000000 */  nop
/* 4458C 80053D8C 2B105002 */  sltu       $v0, $s2, $s0
/* 44590 80053D90 02004010 */  beqz       $v0, .L80053D9C
/* 44594 80053D94 21289302 */   addu      $a1, $s4, $s3
/* 44598 80053D98 21804002 */  addu       $s0, $s2, $zero
.L80053D9C:
/* 4459C 80053D9C 21300002 */  addu       $a2, $s0, $zero
/* 445A0 80053DA0 6400248E */  lw         $a0, 0x64($s1)
/* 445A4 80053DA4 21987002 */  addu       $s3, $s3, $s0
/* 445A8 80053DA8 6CFF8424 */  addiu      $a0, $a0, -0x94
/* 445AC 80053DAC 02E5010C */  jal        memcpy
/* 445B0 80053DB0 23202402 */   subu      $a0, $s1, $a0
/* 445B4 80053DB4 6400228E */  lw         $v0, 0x64($s1)
/* 445B8 80053DB8 23905002 */  subu       $s2, $s2, $s0
/* 445BC 80053DBC 23105000 */  subu       $v0, $v0, $s0
/* 445C0 80053DC0 4C004014 */  bnez       $v0, .L80053EF4
/* 445C4 80053DC4 640022AE */   sw        $v0, 0x64($s1)
/* 445C8 80053DC8 554E010C */  jal        aadLoadSingleDynSfx
/* 445CC 80053DCC 21202002 */   addu      $a0, $s1, $zero
/* 445D0 80053DD0 9000228E */  lw         $v0, 0x90($s1)
/* 445D4 80053DD4 BD4F0108 */  j          .L80053EF4
/* 445D8 80053DD8 640022AE */   sw        $v0, 0x64($s1)
.L80053DDC:
/* 445DC 80053DDC 6400308E */  lw         $s0, 0x64($s1)
/* 445E0 80053DE0 00000000 */  nop
/* 445E4 80053DE4 2B105002 */  sltu       $v0, $s2, $s0
/* 445E8 80053DE8 02004010 */  beqz       $v0, .L80053DF4
/* 445EC 80053DEC 00000000 */   nop
/* 445F0 80053DF0 21804002 */  addu       $s0, $s2, $zero
.L80053DF4:
/* 445F4 80053DF4 21987002 */  addu       $s3, $s3, $s0
/* 445F8 80053DF8 6400228E */  lw         $v0, 0x64($s1)
/* 445FC 80053DFC 23905002 */  subu       $s2, $s2, $s0
/* 44600 80053E00 23105000 */  subu       $v0, $v0, $s0
/* 44604 80053E04 3B004014 */  bnez       $v0, .L80053EF4
/* 44608 80053E08 640022AE */   sw        $v0, 0x64($s1)
/* 4460C 80053E0C 6800228E */  lw         $v0, 0x68($s1)
/* 44610 80053E10 00000000 */  nop
/* 44614 80053E14 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 44618 80053E18 27004010 */  beqz       $v0, .L80053EB8
/* 4461C 80053E1C 680022AE */   sw        $v0, 0x68($s1)
/* 44620 80053E20 600035AE */  sw         $s5, 0x60($s1)
/* 44624 80053E24 BD4F0108 */  j          .L80053EF4
/* 44628 80053E28 640036AE */   sw        $s6, 0x64($s1)
.L80053E2C:
/* 4462C 80053E2C 6400308E */  lw         $s0, 0x64($s1)
/* 44630 80053E30 00000000 */  nop
/* 44634 80053E34 2B105002 */  sltu       $v0, $s2, $s0
/* 44638 80053E38 02004010 */  beqz       $v0, .L80053E44
/* 4463C 80053E3C 00000000 */   nop
/* 44640 80053E40 21804002 */  addu       $s0, $s2, $zero
.L80053E44:
/* 44644 80053E44 2151010C */  jal        aadWaitForSramTransferComplete
/* 44648 80053E48 23905002 */   subu      $s2, $s2, $s0
/* 4464C 80053E4C 0580043C */  lui        $a0, %hi(HackCallback)
/* 44650 80053E50 E4FF020C */  jal        SpuSetTransferCallback
/* 44654 80053E54 243C8424 */   addiu     $a0, $a0, %lo(HackCallback)
/* 44658 80053E58 7000248E */  lw         $a0, 0x70($s1)
/* 4465C 80053E5C 59FE020C */  jal        SpuSetTransferStartAddr
/* 44660 80053E60 00000000 */   nop
/* 44664 80053E64 21209302 */  addu       $a0, $s4, $s3
/* 44668 80053E68 71FE020C */  jal        SpuWrite
/* 4466C 80053E6C 21280002 */   addu      $a1, $s0, $zero
/* 44670 80053E70 21987002 */  addu       $s3, $s3, $s0
/* 44674 80053E74 7000228E */  lw         $v0, 0x70($s1)
/* 44678 80053E78 6400238E */  lw         $v1, 0x64($s1)
/* 4467C 80053E7C 21105000 */  addu       $v0, $v0, $s0
/* 44680 80053E80 23187000 */  subu       $v1, $v1, $s0
/* 44684 80053E84 700022AE */  sw         $v0, 0x70($s1)
/* 44688 80053E88 11006014 */  bnez       $v1, .L80053ED0
/* 4468C 80053E8C 640023AE */   sw        $v1, 0x64($s1)
/* 44690 80053E90 7400228E */  lw         $v0, 0x74($s1)
/* 44694 80053E94 9000248E */  lw         $a0, 0x90($s1)
/* 44698 80053E98 6800238E */  lw         $v1, 0x68($s1)
/* 4469C 80053E9C 21104400 */  addu       $v0, $v0, $a0
/* 446A0 80053EA0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 446A4 80053EA4 740022AE */  sw         $v0, 0x74($s1)
/* 446A8 80053EA8 07006014 */  bnez       $v1, .L80053EC8
/* 446AC 80053EAC 680023AE */   sw        $v1, 0x68($s1)
/* 446B0 80053EB0 E4FF020C */  jal        SpuSetTransferCallback
/* 446B4 80053EB4 21200000 */   addu      $a0, $zero, $zero
.L80053EB8:
/* 446B8 80053EB8 AB4C010C */  jal        aadLoadDynamicSfxDone
/* 446BC 80053EBC 21202002 */   addu      $a0, $s1, $zero
/* 446C0 80053EC0 BF4F0108 */  j          .L80053EFC
/* 446C4 80053EC4 00000000 */   nop
.L80053EC8:
/* 446C8 80053EC8 600035AE */  sw         $s5, 0x60($s1)
/* 446CC 80053ECC 640036AE */  sw         $s6, 0x64($s1)
.L80053ED0:
/* 446D0 80053ED0 06004012 */  beqz       $s2, .L80053EEC
/* 446D4 80053ED4 21109302 */   addu      $v0, $s4, $s3
/* 446D8 80053ED8 08C782AF */  sw         $v0, %gp_rel(smfDataPtr)($gp)
/* 446DC 80053EDC 0CC792AF */  sw         $s2, %gp_rel(smfBytesLeft)($gp)
/* 446E0 80053EE0 10C791AF */  sw         $s1, %gp_rel(smfInfo)($gp)
/* 446E4 80053EE4 BF4F0108 */  j          .L80053EFC
/* 446E8 80053EE8 00000000 */   nop
.L80053EEC:
/* 446EC 80053EEC E4FF020C */  jal        SpuSetTransferCallback
/* 446F0 80053EF0 21200000 */   addu      $a0, $zero, $zero
.L80053EF4:
/* 446F4 80053EF4 69FF4016 */  bnez       $s2, .L80053C9C
/* 446F8 80053EF8 00000000 */   nop
.L80053EFC:
/* 446FC 80053EFC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 44700 80053F00 2800B68F */  lw         $s6, 0x28($sp)
/* 44704 80053F04 2400B58F */  lw         $s5, 0x24($sp)
/* 44708 80053F08 2000B48F */  lw         $s4, 0x20($sp)
/* 4470C 80053F0C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 44710 80053F10 1800B28F */  lw         $s2, 0x18($sp)
/* 44714 80053F14 1400B18F */  lw         $s1, 0x14($sp)
/* 44718 80053F18 1000B08F */  lw         $s0, 0x10($sp)
/* 4471C 80053F1C 0800E003 */  jr         $ra
/* 44720 80053F20 3000BD27 */   addiu     $sp, $sp, 0x30
.size aadLoadDynamicSfxReturn2, . - aadLoadDynamicSfxReturn2
