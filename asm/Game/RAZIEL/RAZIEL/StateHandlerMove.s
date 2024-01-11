.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerMove
/* 9B3A8 800AABA8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9B3AC 800AABAC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9B3B0 800AABB0 21888000 */  addu       $s1, $a0, $zero
/* 9B3B4 800AABB4 2000B2AF */  sw         $s2, 0x20($sp)
/* 9B3B8 800AABB8 2190A000 */  addu       $s2, $a1, $zero
/* 9B3BC 800AABBC 3400B7AF */  sw         $s7, 0x34($sp)
/* 9B3C0 800AABC0 21B8C000 */  addu       $s7, $a2, $zero
/* 9B3C4 800AABC4 3800BFAF */  sw         $ra, 0x38($sp)
/* 9B3C8 800AABC8 3000B6AF */  sw         $s6, 0x30($sp)
/* 9B3CC 800AABCC 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9B3D0 800AABD0 2800B4AF */  sw         $s4, 0x28($sp)
/* 9B3D4 800AABD4 2400B3AF */  sw         $s3, 0x24($sp)
/* 9B3D8 800AABD8 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9B3DC 800AABDC 1800B0AF */   sw        $s0, 0x18($sp)
/* 9B3E0 800AABE0 21B04000 */  addu       $s6, $v0, $zero
/* 9B3E4 800AABE4 C0101200 */  sll        $v0, $s2, 3
/* 9B3E8 800AABE8 21105200 */  addu       $v0, $v0, $s2
/* 9B3EC 800AABEC C0100200 */  sll        $v0, $v0, 3
/* 9B3F0 800AABF0 23105200 */  subu       $v0, $v0, $s2
/* 9B3F4 800AABF4 80100200 */  sll        $v0, $v0, 2
/* 9B3F8 800AABF8 21A84000 */  addu       $s5, $v0, $zero
/* 9B3FC 800AABFC 21103502 */  addu       $v0, $s1, $s5
/* 9B400 800AAC00 21984000 */  addu       $s3, $v0, $zero
/* 9B404 800AAC04 1C01628E */  lw         $v0, 0x11C($s3)
/* 9B408 800AAC08 02001424 */  addiu      $s4, $zero, 0x2
/* 9B40C 800AAC0C 01004224 */  addiu      $v0, $v0, 0x1
/* 9B410 800AAC10 1C0162AE */  sw         $v0, 0x11C($s3)
/* 9B414 800AAC14 2120B102 */  addu       $a0, $s5, $s1
.L800AAC18:
/* 9B418 800AAC18 39C3010C */  jal        PeekMessageQueue
/* 9B41C 800AAC1C 0C008424 */   addiu     $a0, $a0, 0xC
/* 9B420 800AAC20 21804000 */  addu       $s0, $v0, $zero
/* 9B424 800AAC24 81010012 */  beqz       $s0, .L800AB22C
/* 9B428 800AAC28 00000000 */   nop
/* 9B42C 800AAC2C 0000038E */  lw         $v1, 0x0($s0)
/* 9B430 800AAC30 00000000 */  nop
/* 9B434 800AAC34 87006010 */  beqz       $v1, .L800AAE54
/* 9B438 800AAC38 00000000 */   nop
/* 9B43C 800AAC3C 1C00601C */  bgtz       $v1, .L800AACB0
/* 9B440 800AAC40 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 9B444 800AAC44 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 9B448 800AAC48 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 9B44C 800AAC4C 6B006210 */  beq        $v1, $v0, .L800AADFC
/* 9B450 800AAC50 2A104300 */   slt       $v0, $v0, $v1
/* 9B454 800AAC54 07004014 */  bnez       $v0, .L800AAC74
/* 9B458 800AAC58 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 9B45C 800AAC5C 32016210 */  beq        $v1, $v0, .L800AB128
/* 9B460 800AAC60 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 9B464 800AAC64 FE006210 */  beq        $v1, $v0, .L800AB060
/* 9B468 800AAC68 21202002 */   addu      $a0, $s1, $zero
/* 9B46C 800AAC6C 84AC0208 */  j          .L800AB210
/* 9B470 800AAC70 21284002 */   addu      $a1, $s2, $zero
.L800AAC74:
/* 9B474 800AAC74 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9B478 800AAC78 67016210 */  beq        $v1, $v0, .L800AB218
/* 9B47C 800AAC7C 2A104300 */   slt       $v0, $v0, $v1
/* 9B480 800AAC80 06004014 */  bnez       $v0, .L800AAC9C
/* 9B484 800AAC84 0080023C */   lui       $v0, (0x80000004 >> 16)
/* 9B488 800AAC88 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 9B48C 800AAC8C D4006210 */  beq        $v1, $v0, .L800AAFE0
/* 9B490 800AAC90 21202002 */   addu      $a0, $s1, $zero
/* 9B494 800AAC94 84AC0208 */  j          .L800AB210
/* 9B498 800AAC98 21284002 */   addu      $a1, $s2, $zero
.L800AAC9C:
/* 9B49C 800AAC9C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9B4A0 800AACA0 5D006210 */  beq        $v1, $v0, .L800AAE18
/* 9B4A4 800AACA4 21202002 */   addu      $a0, $s1, $zero
/* 9B4A8 800AACA8 84AC0208 */  j          .L800AB210
/* 9B4AC 800AACAC 21284002 */   addu      $a1, $s2, $zero
.L800AACB0:
/* 9B4B0 800AACB0 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 9B4B4 800AACB4 38006210 */  beq        $v1, $v0, .L800AAD98
/* 9B4B8 800AACB8 2A104300 */   slt       $v0, $v0, $v1
/* 9B4BC 800AACBC 11004014 */  bnez       $v0, .L800AAD04
/* 9B4C0 800AACC0 0020023C */   lui       $v0, (0x20000004 >> 16)
/* 9B4C4 800AACC4 1000023C */  lui        $v0, (0x100004 >> 16)
/* 9B4C8 800AACC8 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9B4CC 800AACCC 2D006210 */  beq        $v1, $v0, .L800AAD84
/* 9B4D0 800AACD0 2A104300 */   slt       $v0, $v0, $v1
/* 9B4D4 800AACD4 07004014 */  bnez       $v0, .L800AACF4
/* 9B4D8 800AACD8 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 9B4DC 800AACDC 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9B4E0 800AACE0 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9B4E4 800AACE4 16006210 */  beq        $v1, $v0, .L800AAD40
/* 9B4E8 800AACE8 21202002 */   addu      $a0, $s1, $zero
/* 9B4EC 800AACEC 84AC0208 */  j          .L800AB210
/* 9B4F0 800AACF0 21284002 */   addu      $a1, $s2, $zero
.L800AACF4:
/* 9B4F4 800AACF4 38006210 */  beq        $v1, $v0, .L800AADD8
/* 9B4F8 800AACF8 21202002 */   addu      $a0, $s1, $zero
/* 9B4FC 800AACFC 84AC0208 */  j          .L800AB210
/* 9B500 800AAD00 21284002 */   addu      $a1, $s2, $zero
.L800AAD04:
/* 9B504 800AAD04 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* 9B508 800AAD08 D1006210 */  beq        $v1, $v0, .L800AB050
/* 9B50C 800AAD0C 2A104300 */   slt       $v0, $v0, $v1
/* 9B510 800AAD10 06004014 */  bnez       $v0, .L800AAD2C
/* 9B514 800AAD14 0020023C */   lui       $v0, (0x20000008 >> 16)
/* 9B518 800AAD18 0010023C */  lui        $v0, (0x10000008 >> 16)
/* 9B51C 800AAD1C A2006210 */  beq        $v1, $v0, .L800AAFA8
/* 9B520 800AAD20 21202002 */   addu      $a0, $s1, $zero
/* 9B524 800AAD24 84AC0208 */  j          .L800AB210
/* 9B528 800AAD28 21284002 */   addu      $a1, $s2, $zero
.L800AAD2C:
/* 9B52C 800AAD2C 08004234 */  ori        $v0, $v0, (0x10000008 & 0xFFFF)
/* 9B530 800AAD30 C7006210 */  beq        $v1, $v0, .L800AB050
/* 9B534 800AAD34 21202002 */   addu      $a0, $s1, $zero
/* 9B538 800AAD38 84AC0208 */  j          .L800AB210
/* 9B53C 800AAD3C 21284002 */   addu      $a1, $s2, $zero
.L800AAD40:
/* 9B540 800AAD40 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9B544 800AAD44 200162AE */  sw         $v0, 0x120($s3)
/* 9B548 800AAD48 0400068E */  lw         $a2, 0x4($s0)
/* 9B54C 800AAD4C 59AA020C */  jal        StateInitMove
/* 9B550 800AAD50 21284002 */   addu      $a1, $s2, $zero
/* 9B554 800AAD54 01000224 */  addiu      $v0, $zero, 0x1
/* 9B558 800AAD58 54FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x424)($gp)
/* 9B55C 800AAD5C 0000248E */  lw         $a0, 0x0($s1)
/* 9B560 800AAD60 938B020C */  jal        SteerSwitchMode
/* 9B564 800AAD64 02000524 */   addiu     $a1, $zero, 0x2
/* 9B568 800AAD68 1C0160AE */  sw         $zero, 0x11C($s3)
/* 9B56C 800AAD6C 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9B570 800AAD70 00000000 */  nop
/* 9B574 800AAD74 00104234 */  ori        $v0, $v0, 0x1000
/* 9B578 800AAD78 3CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9B57C 800AAD7C 87AC0208 */  j          .L800AB21C
/* 9B580 800AAD80 2120B102 */   addu      $a0, $s5, $s1
.L800AAD84:
/* 9B584 800AAD84 21200000 */  addu       $a0, $zero, $zero
/* 9B588 800AAD88 261F010C */  jal        FX_EndConstrict
/* 9B58C 800AAD8C 21288000 */   addu      $a1, $a0, $zero
/* 9B590 800AAD90 86AC0208 */  j          .L800AB218
/* 9B594 800AAD94 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AAD98:
/* 9B598 800AAD98 20014016 */  bnez       $s2, .L800AB21C
/* 9B59C 800AAD9C 2120B102 */   addu      $a0, $s5, $s1
/* 9B5A0 800AADA0 0400028E */  lw         $v0, 0x4($s0)
/* 9B5A4 800AADA4 00000000 */  nop
/* 9B5A8 800AADA8 06004010 */  beqz       $v0, .L800AADC4
/* 9B5AC 800AADAC 00000000 */   nop
/* 9B5B0 800AADB0 0000248E */  lw         $a0, 0x0($s1)
/* 9B5B4 800AADB4 FD98020C */  jal        razResetPauseTranslation
/* 9B5B8 800AADB8 00000000 */   nop
/* 9B5BC 800AADBC 87AC0208 */  j          .L800AB21C
/* 9B5C0 800AADC0 2120B102 */   addu      $a0, $s5, $s1
.L800AADC4:
/* 9B5C4 800AADC4 0000248E */  lw         $a0, 0x0($s1)
/* 9B5C8 800AADC8 E098020C */  jal        razSetPauseTranslation
/* 9B5CC 800AADCC 00000000 */   nop
/* 9B5D0 800AADD0 87AC0208 */  j          .L800AB21C
/* 9B5D4 800AADD4 2120B102 */   addu      $a0, $s5, $s1
.L800AADD8:
/* 9B5D8 800AADD8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9B5DC 800AADDC 00000000 */  nop
/* 9B5E0 800AADE0 20004230 */  andi       $v0, $v0, 0x20
/* 9B5E4 800AADE4 05004010 */  beqz       $v0, .L800AADFC
/* 9B5E8 800AADE8 00000000 */   nop
/* 9B5EC 800AADEC 3A96020C */  jal        razPickupAndGrab
/* 9B5F0 800AADF0 21284002 */   addu      $a1, $s2, $zero
/* 9B5F4 800AADF4 87AC0208 */  j          .L800AB21C
/* 9B5F8 800AADF8 2120B102 */   addu      $a0, $s5, $s1
.L800AADFC:
/* 9B5FC 800AADFC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9B600 800AAE00 9CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x18)($gp)
/* 9B604 800AAE04 0000428C */  lw         $v0, 0x0($v0)
/* 9B608 800AAE08 00000000 */  nop
/* 9B60C 800AAE0C 24104300 */  and        $v0, $v0, $v1
/* 9B610 800AAE10 02014014 */  bnez       $v0, .L800AB21C
/* 9B614 800AAE14 2120B102 */   addu      $a0, $s5, $s1
.L800AAE18:
/* 9B618 800AAE18 00014016 */  bnez       $s2, .L800AB21C
/* 9B61C 800AAE1C 2120B102 */   addu      $a0, $s5, $s1
/* 9B620 800AAE20 0000228E */  lw         $v0, 0x0($s1)
/* 9B624 800AAE24 00000000 */  nop
/* 9B628 800AAE28 B400428C */  lw         $v0, 0xB4($v0)
/* 9B62C 800AAE2C 00000000 */  nop
/* 9B630 800AAE30 08004010 */  beqz       $v0, .L800AAE54
/* 9B634 800AAE34 94002426 */   addiu     $a0, $s1, 0x94
/* 9B638 800AAE38 0000058E */  lw         $a1, 0x0($s0)
/* 9B63C 800AAE3C 4EC3010C */  jal        EnMessageQueueData
/* 9B640 800AAE40 21300000 */   addu      $a2, $zero, $zero
/* 9B644 800AAE44 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B648 800AAE48 8000033C */  lui        $v1, (0x800000 >> 16)
/* 9B64C 800AAE4C 25104300 */  or         $v0, $v0, $v1
/* 9B650 800AAE50 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AAE54:
/* 9B654 800AAE54 F1004016 */  bnez       $s2, .L800AB21C
/* 9B658 800AAE58 2120B102 */   addu      $a0, $s5, $s1
/* 9B65C 800AAE5C B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 9B660 800AAE60 09000224 */  addiu      $v0, $zero, 0x9
/* 9B664 800AAE64 05006210 */  beq        $v1, $v0, .L800AAE7C
/* 9B668 800AAE68 0E000224 */   addiu     $v0, $zero, 0xE
/* 9B66C 800AAE6C 03006210 */  beq        $v1, $v0, .L800AAE7C
/* 9B670 800AAE70 0F000224 */   addiu     $v0, $zero, 0xF
/* 9B674 800AAE74 06006214 */  bne        $v1, $v0, .L800AAE90
/* 9B678 800AAE78 00000000 */   nop
.L800AAE7C:
/* 9B67C 800AAE7C 21202002 */  addu       $a0, $s1, $zero
/* 9B680 800AAE80 AF9A020C */  jal        razApplyMotion
/* 9B684 800AAE84 21284002 */   addu      $a1, $s2, $zero
/* 9B688 800AAE88 87AC0208 */  j          .L800AB21C
/* 9B68C 800AAE8C 2120B102 */   addu      $a0, $s5, $s1
.L800AAE90:
/* 9B690 800AAE90 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9B694 800AAE94 00000000 */  nop
/* 9B698 800AAE98 05007410 */  beq        $v1, $s4, .L800AAEB0
/* 9B69C 800AAE9C 7B000224 */   addiu     $v0, $zero, 0x7B
/* 9B6A0 800AAEA0 0300C212 */  beq        $s6, $v0, .L800AAEB0
/* 9B6A4 800AAEA4 7C000224 */   addiu     $v0, $zero, 0x7C
/* 9B6A8 800AAEA8 0C00C216 */  bne        $s6, $v0, .L800AAEDC
/* 9B6AC 800AAEAC 0001023C */   lui       $v0, (0x1000000 >> 16)
.L800AAEB0:
/* 9B6B0 800AAEB0 21200000 */  addu       $a0, $zero, $zero
/* 9B6B4 800AAEB4 21288000 */  addu       $a1, $a0, $zero
/* 9B6B8 800AAEB8 4FC6010C */  jal        SetControlInitIdleData
/* 9B6BC 800AAEBC 03000624 */   addiu     $a2, $zero, 0x3
/* 9B6C0 800AAEC0 21202002 */  addu       $a0, $s1, $zero
/* 9B6C4 800AAEC4 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9B6C8 800AAEC8 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9B6CC 800AAECC F4CA010C */  jal        StateSwitchStateCharacterData
/* 9B6D0 800AAED0 21304000 */   addu      $a2, $v0, $zero
/* 9B6D4 800AAED4 87AC0208 */  j          .L800AB21C
/* 9B6D8 800AAED8 2120B102 */   addu      $a0, $s5, $s1
.L800AAEDC:
/* 9B6DC 800AAEDC 04006214 */  bne        $v1, $v0, .L800AAEF0
/* 9B6E0 800AAEE0 21202002 */   addu      $a0, $s1, $zero
/* 9B6E4 800AAEE4 0B80053C */  lui        $a1, %hi(StateHandlerCrouch)
/* 9B6E8 800AAEE8 73AC0208 */  j          .L800AB1CC
/* 9B6EC 800AAEEC E890A524 */   addiu     $a1, $a1, %lo(StateHandlerCrouch)
.L800AAEF0:
/* 9B6F0 800AAEF0 0400028E */  lw         $v0, 0x4($s0)
/* 9B6F4 800AAEF4 00000000 */  nop
/* 9B6F8 800AAEF8 04004228 */  slti       $v0, $v0, 0x4
/* 9B6FC 800AAEFC 18004010 */  beqz       $v0, .L800AAF60
/* 9B700 800AAF00 8000023C */   lui       $v0, (0x800000 >> 16)
/* 9B704 800AAF04 C8FD858F */  lw         $a1, %gp_rel(ControlFlag)($gp)
/* 9B708 800AAF08 00000000 */  nop
/* 9B70C 800AAF0C 2410A200 */  and        $v0, $a1, $v0
/* 9B710 800AAF10 13004014 */  bnez       $v0, .L800AAF60
/* 9B714 800AAF14 0080043C */   lui       $a0, (0x8000000F >> 16)
/* 9B718 800AAF18 C4FC838F */  lw         $v1, %gp_rel(PadData)($gp)
/* 9B71C 800AAF1C 0020A234 */  ori        $v0, $a1, 0x2000
/* 9B720 800AAF20 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B724 800AAF24 0000628C */  lw         $v0, 0x0($v1)
/* 9B728 800AAF28 0F008434 */  ori        $a0, $a0, (0x8000000F & 0xFFFF)
/* 9B72C 800AAF2C 24104400 */  and        $v0, $v0, $a0
/* 9B730 800AAF30 BA004014 */  bnez       $v0, .L800AB21C
/* 9B734 800AAF34 2120B102 */   addu      $a0, $s5, $s1
/* 9B738 800AAF38 94002426 */  addiu      $a0, $s1, 0x94
/* 9B73C 800AAF3C 0400068E */  lw         $a2, 0x4($s0)
/* 9B740 800AAF40 21280000 */  addu       $a1, $zero, $zero
/* 9B744 800AAF44 4EC3010C */  jal        EnMessageQueueData
/* 9B748 800AAF48 0100C624 */   addiu     $a2, $a2, 0x1
/* 9B74C 800AAF4C 21202002 */  addu       $a0, $s1, $zero
/* 9B750 800AAF50 AF9A020C */  jal        razApplyMotion
/* 9B754 800AAF54 21280000 */   addu      $a1, $zero, $zero
/* 9B758 800AAF58 87AC0208 */  j          .L800AB21C
/* 9B75C 800AAF5C 2120B102 */   addu      $a0, $s5, $s1
.L800AAF60:
/* 9B760 800AAF60 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 9B764 800AAF64 00000000 */  nop
/* 9B768 800AAF68 00206230 */  andi       $v0, $v1, 0x2000
/* 9B76C 800AAF6C 02004010 */  beqz       $v0, .L800AAF78
/* 9B770 800AAF70 21300000 */   addu      $a2, $zero, $zero
/* 9B774 800AAF74 1E000624 */  addiu      $a2, $zero, 0x1E
.L800AAF78:
/* 9B778 800AAF78 00106230 */  andi       $v0, $v1, 0x1000
/* 9B77C 800AAF7C 02004010 */  beqz       $v0, .L800AAF88
/* 9B780 800AAF80 00000000 */   nop
/* 9B784 800AAF84 3C000624 */  addiu      $a2, $zero, 0x3C
.L800AAF88:
/* 9B788 800AAF88 A4004016 */  bnez       $s2, .L800AB21C
/* 9B78C 800AAF8C 2120B102 */   addu      $a0, $s5, $s1
/* 9B790 800AAF90 21202002 */  addu       $a0, $s1, $zero
/* 9B794 800AAF94 0B80053C */  lui        $a1, %hi(StateHandlerStopMove)
/* 9B798 800AAF98 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9B79C 800AAF9C 7CB2A524 */   addiu     $a1, $a1, %lo(StateHandlerStopMove)
/* 9B7A0 800AAFA0 87AC0208 */  j          .L800AB21C
/* 9B7A4 800AAFA4 2120B102 */   addu      $a0, $s5, $s1
.L800AAFA8:
/* 9B7A8 800AAFA8 A4F9828F */  lw         $v0, %gp_rel(Raziel + 0x374)($gp)
/* 9B7AC 800AAFAC 00000000 */  nop
/* 9B7B0 800AAFB0 00104228 */  slti       $v0, $v0, 0x1000
/* 9B7B4 800AAFB4 05004010 */  beqz       $v0, .L800AAFCC
/* 9B7B8 800AAFB8 21284002 */   addu      $a1, $s2, $zero
/* 9B7BC 800AAFBC 59AA020C */  jal        StateInitMove
/* 9B7C0 800AAFC0 03000624 */   addiu     $a2, $zero, 0x3
/* 9B7C4 800AAFC4 87AC0208 */  j          .L800AB21C
/* 9B7C8 800AAFC8 2120B102 */   addu      $a0, $s5, $s1
.L800AAFCC:
/* 9B7CC 800AAFCC 21202002 */  addu       $a0, $s1, $zero
/* 9B7D0 800AAFD0 59AA020C */  jal        StateInitMove
/* 9B7D4 800AAFD4 21300000 */   addu      $a2, $zero, $zero
/* 9B7D8 800AAFD8 87AC0208 */  j          .L800AB21C
/* 9B7DC 800AAFDC 2120B102 */   addu      $a0, $s5, $s1
.L800AAFE0:
/* 9B7E0 800AAFE0 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B7E4 800AAFE4 2000033C */  lui        $v1, (0x200000 >> 16)
/* 9B7E8 800AAFE8 24104300 */  and        $v0, $v0, $v1
/* 9B7EC 800AAFEC 8B004014 */  bnez       $v0, .L800AB21C
/* 9B7F0 800AAFF0 2120B102 */   addu      $a0, $s5, $s1
/* 9B7F4 800AAFF4 08005416 */  bne        $s2, $s4, .L800AB018
/* 9B7F8 800AAFF8 21202002 */   addu      $a0, $s1, $zero
/* 9B7FC 800AAFFC 02000524 */  addiu      $a1, $zero, 0x2
/* 9B800 800AB000 21300000 */  addu       $a2, $zero, $zero
/* 9B804 800AB004 2138C000 */  addu       $a3, $a2, $zero
/* 9B808 800AB008 03000224 */  addiu      $v0, $zero, 0x3
/* 9B80C 800AB00C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B810 800AB010 0CAC0208 */  j          .L800AB030
/* 9B814 800AB014 1400B2AF */   sw        $s2, 0x14($sp)
.L800AB018:
/* 9B818 800AB018 21284002 */  addu       $a1, $s2, $zero
/* 9B81C 800AB01C 01000624 */  addiu      $a2, $zero, 0x1
/* 9B820 800AB020 21380000 */  addu       $a3, $zero, $zero
/* 9B824 800AB024 03000224 */  addiu      $v0, $zero, 0x3
/* 9B828 800AB028 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B82C 800AB02C 1400B4AF */  sw         $s4, 0x14($sp)
.L800AB030:
/* 9B830 800AB030 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9B834 800AB034 00000000 */   nop
/* 9B838 800AB038 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B83C 800AB03C 90F994AF */  sw         $s4, %gp_rel(Raziel + 0x360)($gp)
/* 9B840 800AB040 00204234 */  ori        $v0, $v0, 0x2000
/* 9B844 800AB044 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B848 800AB048 87AC0208 */  j          .L800AB21C
/* 9B84C 800AB04C 2120B102 */   addu      $a0, $s5, $s1
.L800AB050:
/* 9B850 800AB050 04000224 */  addiu      $v0, $zero, 0x4
/* 9B854 800AB054 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B858 800AB058 44AC0208 */  j          .L800AB110
/* 9B85C 800AB05C 00000000 */   nop
.L800AB060:
/* 9B860 800AB060 6E004016 */  bnez       $s2, .L800AB21C
/* 9B864 800AB064 2120B102 */   addu      $a0, $s5, $s1
/* 9B868 800AB068 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9B86C 800AB06C 9CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x18)($gp)
/* 9B870 800AB070 0000428C */  lw         $v0, 0x0($v0)
/* 9B874 800AB074 00000000 */  nop
/* 9B878 800AB078 24104300 */  and        $v0, $v0, $v1
/* 9B87C 800AB07C 0F004010 */  beqz       $v0, .L800AB0BC
/* 9B880 800AB080 20000524 */   addiu     $a1, $zero, 0x20
/* 9B884 800AB084 21300000 */  addu       $a2, $zero, $zero
/* 9B888 800AB088 2110A000 */  addu       $v0, $a1, $zero
/* 9B88C 800AB08C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B890 800AB090 0000248E */  lw         $a0, 0x0($s1)
/* 9B894 800AB094 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9B898 800AB098 2138C000 */   addu      $a3, $a2, $zero
/* 9B89C 800AB09C 17004010 */  beqz       $v0, .L800AB0FC
/* 9B8A0 800AB0A0 01000224 */   addiu     $v0, $zero, 0x1
/* 9B8A4 800AB0A4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B8A8 800AB0A8 21202002 */  addu       $a0, $s1, $zero
/* 9B8AC 800AB0AC 1A000524 */  addiu      $a1, $zero, 0x1A
/* 9B8B0 800AB0B0 21300000 */  addu       $a2, $zero, $zero
/* 9B8B4 800AB0B4 3DAC0208 */  j          .L800AB0F4
/* 9B8B8 800AB0B8 21384000 */   addu      $a3, $v0, $zero
.L800AB0BC:
/* 9B8BC 800AB0BC 21280000 */  addu       $a1, $zero, $zero
/* 9B8C0 800AB0C0 2130A000 */  addu       $a2, $a1, $zero
/* 9B8C4 800AB0C4 08000224 */  addiu      $v0, $zero, 0x8
/* 9B8C8 800AB0C8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B8CC 800AB0CC 0000248E */  lw         $a0, 0x0($s1)
/* 9B8D0 800AB0D0 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9B8D4 800AB0D4 2138A000 */   addu      $a3, $a1, $zero
/* 9B8D8 800AB0D8 08004010 */  beqz       $v0, .L800AB0FC
/* 9B8DC 800AB0DC 01000224 */   addiu     $v0, $zero, 0x1
/* 9B8E0 800AB0E0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B8E4 800AB0E4 21202002 */  addu       $a0, $s1, $zero
/* 9B8E8 800AB0E8 1A000524 */  addiu      $a1, $zero, 0x1A
/* 9B8EC 800AB0EC 21300000 */  addu       $a2, $zero, $zero
/* 9B8F0 800AB0F0 2138C000 */  addu       $a3, $a2, $zero
.L800AB0F4:
/* 9B8F4 800AB0F4 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9B8F8 800AB0F8 00000000 */   nop
.L800AB0FC:
/* 9B8FC 800AB0FC 21202002 */  addu       $a0, $s1, $zero
/* 9B900 800AB100 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 9B904 800AB104 ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
/* 9B908 800AB108 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9B90C 800AB10C 21300000 */   addu      $a2, $zero, $zero
.L800AB110:
/* 9B910 800AB110 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B914 800AB114 FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 9B918 800AB118 24104300 */  and        $v0, $v0, $v1
/* 9B91C 800AB11C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B920 800AB120 87AC0208 */  j          .L800AB21C
/* 9B924 800AB124 2120B102 */   addu      $a0, $s5, $s1
.L800AB128:
/* 9B928 800AB128 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9B92C 800AB12C A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* 9B930 800AB130 0000428C */  lw         $v0, 0x0($v0)
/* 9B934 800AB134 00000000 */  nop
/* 9B938 800AB138 24104300 */  and        $v0, $v0, $v1
/* 9B93C 800AB13C 27004014 */  bnez       $v0, .L800AB1DC
/* 9B940 800AB140 44000224 */   addiu     $v0, $zero, 0x44
/* 9B944 800AB144 2001638E */  lw         $v1, 0x120($s3)
/* 9B948 800AB148 00000000 */  nop
/* 9B94C 800AB14C 15006214 */  bne        $v1, $v0, .L800AB1A4
/* 9B950 800AB150 38000224 */   addiu     $v0, $zero, 0x38
/* 9B954 800AB154 01000224 */  addiu      $v0, $zero, 0x1
/* 9B958 800AB158 0D004216 */  bne        $s2, $v0, .L800AB190
/* 9B95C 800AB15C C8000224 */   addiu     $v0, $zero, 0xC8
/* 9B960 800AB160 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9B964 800AB164 00000000 */  nop
/* 9B968 800AB168 80004230 */  andi       $v0, $v0, 0x80
/* 9B96C 800AB16C 08004014 */  bnez       $v0, .L800AB190
/* 9B970 800AB170 C8000224 */   addiu     $v0, $zero, 0xC8
/* 9B974 800AB174 21202002 */  addu       $a0, $s1, $zero
/* 9B978 800AB178 01000524 */  addiu      $a1, $zero, 0x1
/* 9B97C 800AB17C 0A80063C */  lui        $a2, %hi(StateHandlerAttack2)
/* 9B980 800AB180 E4BDC624 */  addiu      $a2, $a2, %lo(StateHandlerAttack2)
/* 9B984 800AB184 C1CA010C */  jal        StateSwitchStateData
/* 9B988 800AB188 0A000724 */   addiu     $a3, $zero, 0xA
/* 9B98C 800AB18C C8000224 */  addiu      $v0, $zero, 0xC8
.L800AB190:
/* 9B990 800AB190 24FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F4)($gp)
/* 9B994 800AB194 A0FF0224 */  addiu      $v0, $zero, -0x60
/* 9B998 800AB198 26FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F6)($gp)
/* 9B99C 800AB19C 87AC0208 */  j          .L800AB21C
/* 9B9A0 800AB1A0 2120B102 */   addu      $a0, $s5, $s1
.L800AB1A4:
/* 9B9A4 800AB1A4 0D006214 */  bne        $v1, $v0, .L800AB1DC
/* 9B9A8 800AB1A8 00000000 */   nop
/* 9B9AC 800AB1AC 2197020C */  jal        razGetHeldItem
/* 9B9B0 800AB1B0 00000000 */   nop
/* 9B9B4 800AB1B4 19004010 */  beqz       $v0, .L800AB21C
/* 9B9B8 800AB1B8 2120B102 */   addu      $a0, $s5, $s1
/* 9B9BC 800AB1BC 17004016 */  bnez       $s2, .L800AB21C
/* 9B9C0 800AB1C0 0B80053C */   lui       $a1, %hi(StateHandlerDropAction)
/* 9B9C4 800AB1C4 21202002 */  addu       $a0, $s1, $zero
/* 9B9C8 800AB1C8 6098A524 */  addiu      $a1, $a1, %lo(StateHandlerDropAction)
.L800AB1CC:
/* 9B9CC 800AB1CC F4CA010C */  jal        StateSwitchStateCharacterData
/* 9B9D0 800AB1D0 21300000 */   addu      $a2, $zero, $zero
/* 9B9D4 800AB1D4 87AC0208 */  j          .L800AB21C
/* 9B9D8 800AB1D8 2120B102 */   addu      $a0, $s5, $s1
.L800AB1DC:
/* 9B9DC 800AB1DC CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9B9E0 800AB1E0 00000000 */  nop
/* 9B9E4 800AB1E4 80004230 */  andi       $v0, $v0, 0x80
/* 9B9E8 800AB1E8 0C004014 */  bnez       $v0, .L800AB21C
/* 9B9EC 800AB1EC 2120B102 */   addu      $a0, $s5, $s1
/* 9B9F0 800AB1F0 21202002 */  addu       $a0, $s1, $zero
/* 9B9F4 800AB1F4 21284002 */  addu       $a1, $s2, $zero
/* 9B9F8 800AB1F8 0A80063C */  lui        $a2, %hi(StateHandlerAttack2)
/* 9B9FC 800AB1FC E4BDC624 */  addiu      $a2, $a2, %lo(StateHandlerAttack2)
/* 9BA00 800AB200 C1CA010C */  jal        StateSwitchStateData
/* 9BA04 800AB204 21380000 */   addu      $a3, $zero, $zero
/* 9BA08 800AB208 87AC0208 */  j          .L800AB21C
/* 9BA0C 800AB20C 2120B102 */   addu      $a0, $s5, $s1
.L800AB210:
/* 9BA10 800AB210 B9BF020C */  jal        DefaultStateHandler
/* 9BA14 800AB214 2130E002 */   addu      $a2, $s7, $zero
.L800AB218:
/* 9BA18 800AB218 2120B102 */  addu       $a0, $s5, $s1
.L800AB21C:
/* 9BA1C 800AB21C 27C3010C */  jal        DeMessageQueue
/* 9BA20 800AB220 0C008424 */   addiu     $a0, $a0, 0xC
/* 9BA24 800AB224 06AB0208 */  j          .L800AAC18
/* 9BA28 800AB228 2120B102 */   addu      $a0, $s5, $s1
.L800AB22C:
/* 9BA2C 800AB22C 08004016 */  bnez       $s2, .L800AB250
/* 9BA30 800AB230 0B80023C */   lui       $v0, %hi(StateHandlerMove)
/* 9BA34 800AB234 0800238E */  lw         $v1, 0x8($s1)
/* 9BA38 800AB238 A8AB4224 */  addiu      $v0, $v0, %lo(StateHandlerMove)
/* 9BA3C 800AB23C 04006210 */  beq        $v1, $v0, .L800AB250
/* 9BA40 800AB240 00000000 */   nop
/* 9BA44 800AB244 0000248E */  lw         $a0, 0x0($s1)
/* 9BA48 800AB248 139B020C */  jal        razResetMotion
/* 9BA4C 800AB24C 00000000 */   nop
.L800AB250:
/* 9BA50 800AB250 3800BF8F */  lw         $ra, 0x38($sp)
/* 9BA54 800AB254 3400B78F */  lw         $s7, 0x34($sp)
/* 9BA58 800AB258 3000B68F */  lw         $s6, 0x30($sp)
/* 9BA5C 800AB25C 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9BA60 800AB260 2800B48F */  lw         $s4, 0x28($sp)
/* 9BA64 800AB264 2400B38F */  lw         $s3, 0x24($sp)
/* 9BA68 800AB268 2000B28F */  lw         $s2, 0x20($sp)
/* 9BA6C 800AB26C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9BA70 800AB270 1800B08F */  lw         $s0, 0x18($sp)
/* 9BA74 800AB274 0800E003 */  jr         $ra
/* 9BA78 800AB278 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerMove, . - StateHandlerMove
