.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_GetData
/* 22368 80031B68 64BA828F */  lw         $v0, %gp_rel(ignoreFind)($gp)
/* 2236C 80031B6C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 22370 80031B70 1000B0AF */  sw         $s0, 0x10($sp)
/* 22374 80031B74 21808000 */  addu       $s0, $a0, $zero
/* 22378 80031B78 1800BFAF */  sw         $ra, 0x18($sp)
/* 2237C 80031B7C 1400B1AF */  sw         $s1, 0x14($sp)
/* 22380 80031B80 080000AE */  sw         $zero, 0x8($s0)
/* 22384 80031B84 040000AE */  sw         $zero, 0x4($s0)
/* 22388 80031B88 000000AE */  sw         $zero, 0x0($s0)
/* 2238C 80031B8C 1C0000AE */  sw         $zero, 0x1C($s0)
/* 22390 80031B90 180000AE */  sw         $zero, 0x18($s0)
/* 22394 80031B94 140000AE */  sw         $zero, 0x14($s0)
/* 22398 80031B98 CCBA80A7 */  sh         $zero, %gp_rel(psxData)($gp)
/* 2239C 80031B9C CEBA80A7 */  sh         $zero, %gp_rel(psxData + 0x2)($gp)
/* 223A0 80031BA0 0C0000AE */  sw         $zero, 0xC($s0)
/* 223A4 80031BA4 100000AE */  sw         $zero, 0x10($s0)
/* 223A8 80031BA8 200000AE */  sw         $zero, 0x20($s0)
/* 223AC 80031BAC 56004010 */  beqz       $v0, .L80031D08
/* 223B0 80031BB0 240000AE */   sw        $zero, 0x24($s0)
/* 223B4 80031BB4 D0BA8427 */  addiu      $a0, $gp, %gp_rel(gpbuffer1)
/* 223B8 80031BB8 F4BA8327 */  addiu      $v1, $gp, %gp_rel(readGPBuffer1)
/* 223BC 80031BBC 25106400 */  or         $v0, $v1, $a0
/* 223C0 80031BC0 03004230 */  andi       $v0, $v0, 0x3
/* 223C4 80031BC4 17004010 */  beqz       $v0, .L80031C24
/* 223C8 80031BC8 00000000 */   nop
/* 223CC 80031BCC 14BB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer1 + 0x20)
.L80031BD0:
/* 223D0 80031BD0 03006788 */  lwl        $a3, 0x3($v1)
/* 223D4 80031BD4 00006798 */  lwr        $a3, 0x0($v1)
/* 223D8 80031BD8 07006888 */  lwl        $t0, 0x7($v1)
/* 223DC 80031BDC 04006898 */  lwr        $t0, 0x4($v1)
/* 223E0 80031BE0 0B006988 */  lwl        $t1, 0xB($v1)
/* 223E4 80031BE4 08006998 */  lwr        $t1, 0x8($v1)
/* 223E8 80031BE8 0F006A88 */  lwl        $t2, 0xF($v1)
/* 223EC 80031BEC 0C006A98 */  lwr        $t2, 0xC($v1)
/* 223F0 80031BF0 030087A8 */  swl        $a3, 0x3($a0)
/* 223F4 80031BF4 000087B8 */  swr        $a3, 0x0($a0)
/* 223F8 80031BF8 070088A8 */  swl        $t0, 0x7($a0)
/* 223FC 80031BFC 040088B8 */  swr        $t0, 0x4($a0)
/* 22400 80031C00 0B0089A8 */  swl        $t1, 0xB($a0)
/* 22404 80031C04 080089B8 */  swr        $t1, 0x8($a0)
/* 22408 80031C08 0F008AA8 */  swl        $t2, 0xF($a0)
/* 2240C 80031C0C 0C008AB8 */  swr        $t2, 0xC($a0)
/* 22410 80031C10 10006324 */  addiu      $v1, $v1, 0x10
/* 22414 80031C14 EEFF6214 */  bne        $v1, $v0, .L80031BD0
/* 22418 80031C18 10008424 */   addiu     $a0, $a0, 0x10
/* 2241C 80031C1C 15C70008 */  j          .L80031C54
/* 22420 80031C20 00000000 */   nop
.L80031C24:
/* 22424 80031C24 14BB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer1 + 0x20)
.L80031C28:
/* 22428 80031C28 0000678C */  lw         $a3, 0x0($v1)
/* 2242C 80031C2C 0400688C */  lw         $t0, 0x4($v1)
/* 22430 80031C30 0800698C */  lw         $t1, 0x8($v1)
/* 22434 80031C34 0C006A8C */  lw         $t2, 0xC($v1)
/* 22438 80031C38 000087AC */  sw         $a3, 0x0($a0)
/* 2243C 80031C3C 040088AC */  sw         $t0, 0x4($a0)
/* 22440 80031C40 080089AC */  sw         $t1, 0x8($a0)
/* 22444 80031C44 0C008AAC */  sw         $t2, 0xC($a0)
/* 22448 80031C48 10006324 */  addiu      $v1, $v1, 0x10
/* 2244C 80031C4C F6FF6214 */  bne        $v1, $v0, .L80031C28
/* 22450 80031C50 10008424 */   addiu     $a0, $a0, 0x10
.L80031C54:
/* 22454 80031C54 00006784 */  lh         $a3, 0x0($v1)
/* 22458 80031C58 00000000 */  nop
/* 2245C 80031C5C 000087A4 */  sh         $a3, 0x0($a0)
/* 22460 80031C60 18BB8427 */  addiu      $a0, $gp, %gp_rel(gpbuffer2)
/* 22464 80031C64 3CBB8327 */  addiu      $v1, $gp, %gp_rel(readGPBuffer2)
/* 22468 80031C68 25106400 */  or         $v0, $v1, $a0
/* 2246C 80031C6C 03004230 */  andi       $v0, $v0, 0x3
/* 22470 80031C70 17004010 */  beqz       $v0, .L80031CD0
/* 22474 80031C74 00000000 */   nop
/* 22478 80031C78 5CBB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer2 + 0x20)
.L80031C7C:
/* 2247C 80031C7C 03006788 */  lwl        $a3, 0x3($v1)
/* 22480 80031C80 00006798 */  lwr        $a3, 0x0($v1)
/* 22484 80031C84 07006888 */  lwl        $t0, 0x7($v1)
/* 22488 80031C88 04006898 */  lwr        $t0, 0x4($v1)
/* 2248C 80031C8C 0B006988 */  lwl        $t1, 0xB($v1)
/* 22490 80031C90 08006998 */  lwr        $t1, 0x8($v1)
/* 22494 80031C94 0F006A88 */  lwl        $t2, 0xF($v1)
/* 22498 80031C98 0C006A98 */  lwr        $t2, 0xC($v1)
/* 2249C 80031C9C 030087A8 */  swl        $a3, 0x3($a0)
/* 224A0 80031CA0 000087B8 */  swr        $a3, 0x0($a0)
/* 224A4 80031CA4 070088A8 */  swl        $t0, 0x7($a0)
/* 224A8 80031CA8 040088B8 */  swr        $t0, 0x4($a0)
/* 224AC 80031CAC 0B0089A8 */  swl        $t1, 0xB($a0)
/* 224B0 80031CB0 080089B8 */  swr        $t1, 0x8($a0)
/* 224B4 80031CB4 0F008AA8 */  swl        $t2, 0xF($a0)
/* 224B8 80031CB8 0C008AB8 */  swr        $t2, 0xC($a0)
/* 224BC 80031CBC 10006324 */  addiu      $v1, $v1, 0x10
/* 224C0 80031CC0 EEFF6214 */  bne        $v1, $v0, .L80031C7C
/* 224C4 80031CC4 10008424 */   addiu     $a0, $a0, 0x10
/* 224C8 80031CC8 A1C70008 */  j          .L80031E84
/* 224CC 80031CCC 00000000 */   nop
.L80031CD0:
/* 224D0 80031CD0 5CBB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer2 + 0x20)
.L80031CD4:
/* 224D4 80031CD4 0000678C */  lw         $a3, 0x0($v1)
/* 224D8 80031CD8 0400688C */  lw         $t0, 0x4($v1)
/* 224DC 80031CDC 0800698C */  lw         $t1, 0x8($v1)
/* 224E0 80031CE0 0C006A8C */  lw         $t2, 0xC($v1)
/* 224E4 80031CE4 000087AC */  sw         $a3, 0x0($a0)
/* 224E8 80031CE8 040088AC */  sw         $t0, 0x4($a0)
/* 224EC 80031CEC 080089AC */  sw         $t1, 0x8($a0)
/* 224F0 80031CF0 0C008AAC */  sw         $t2, 0xC($a0)
/* 224F4 80031CF4 10006324 */  addiu      $v1, $v1, 0x10
/* 224F8 80031CF8 F6FF6214 */  bne        $v1, $v0, .L80031CD4
/* 224FC 80031CFC 10008424 */   addiu     $a0, $a0, 0x10
/* 22500 80031D00 A1C70008 */  j          .L80031E84
/* 22504 80031D04 00000000 */   nop
.L80031D08:
/* 22508 80031D08 BAF6020C */  jal        PadGetState
/* 2250C 80031D0C 21200000 */   addu      $a0, $zero, $zero
/* 22510 80031D10 21184000 */  addu       $v1, $v0, $zero
/* 22514 80031D14 01000224 */  addiu      $v0, $zero, 0x1
/* 22518 80031D18 60006210 */  beq        $v1, $v0, .L80031E9C
/* 2251C 80031D1C 04000224 */   addiu     $v0, $zero, 0x4
/* 22520 80031D20 5B006210 */  beq        $v1, $v0, .L80031E90
/* 22524 80031D24 05000224 */   addiu     $v0, $zero, 0x5
/* 22528 80031D28 5A006210 */  beq        $v1, $v0, .L80031E94
/* 2252C 80031D2C 01000224 */   addiu     $v0, $zero, 0x1
/* 22530 80031D30 9BC5000C */  jal        GAMEPAD_HandleDualShock
/* 22534 80031D34 00000000 */   nop
/* 22538 80031D38 D0BA8427 */  addiu      $a0, $gp, %gp_rel(gpbuffer1)
/* 2253C 80031D3C F4BA8327 */  addiu      $v1, $gp, %gp_rel(readGPBuffer1)
/* 22540 80031D40 25106400 */  or         $v0, $v1, $a0
/* 22544 80031D44 03004230 */  andi       $v0, $v0, 0x3
/* 22548 80031D48 17004010 */  beqz       $v0, .L80031DA8
/* 2254C 80031D4C 00000000 */   nop
/* 22550 80031D50 14BB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer1 + 0x20)
.L80031D54:
/* 22554 80031D54 03006788 */  lwl        $a3, 0x3($v1)
/* 22558 80031D58 00006798 */  lwr        $a3, 0x0($v1)
/* 2255C 80031D5C 07006888 */  lwl        $t0, 0x7($v1)
/* 22560 80031D60 04006898 */  lwr        $t0, 0x4($v1)
/* 22564 80031D64 0B006988 */  lwl        $t1, 0xB($v1)
/* 22568 80031D68 08006998 */  lwr        $t1, 0x8($v1)
/* 2256C 80031D6C 0F006A88 */  lwl        $t2, 0xF($v1)
/* 22570 80031D70 0C006A98 */  lwr        $t2, 0xC($v1)
/* 22574 80031D74 030087A8 */  swl        $a3, 0x3($a0)
/* 22578 80031D78 000087B8 */  swr        $a3, 0x0($a0)
/* 2257C 80031D7C 070088A8 */  swl        $t0, 0x7($a0)
/* 22580 80031D80 040088B8 */  swr        $t0, 0x4($a0)
/* 22584 80031D84 0B0089A8 */  swl        $t1, 0xB($a0)
/* 22588 80031D88 080089B8 */  swr        $t1, 0x8($a0)
/* 2258C 80031D8C 0F008AA8 */  swl        $t2, 0xF($a0)
/* 22590 80031D90 0C008AB8 */  swr        $t2, 0xC($a0)
/* 22594 80031D94 10006324 */  addiu      $v1, $v1, 0x10
/* 22598 80031D98 EEFF6214 */  bne        $v1, $v0, .L80031D54
/* 2259C 80031D9C 10008424 */   addiu     $a0, $a0, 0x10
/* 225A0 80031DA0 76C70008 */  j          .L80031DD8
/* 225A4 80031DA4 00000000 */   nop
.L80031DA8:
/* 225A8 80031DA8 14BB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer1 + 0x20)
.L80031DAC:
/* 225AC 80031DAC 0000678C */  lw         $a3, 0x0($v1)
/* 225B0 80031DB0 0400688C */  lw         $t0, 0x4($v1)
/* 225B4 80031DB4 0800698C */  lw         $t1, 0x8($v1)
/* 225B8 80031DB8 0C006A8C */  lw         $t2, 0xC($v1)
/* 225BC 80031DBC 000087AC */  sw         $a3, 0x0($a0)
/* 225C0 80031DC0 040088AC */  sw         $t0, 0x4($a0)
/* 225C4 80031DC4 080089AC */  sw         $t1, 0x8($a0)
/* 225C8 80031DC8 0C008AAC */  sw         $t2, 0xC($a0)
/* 225CC 80031DCC 10006324 */  addiu      $v1, $v1, 0x10
/* 225D0 80031DD0 F6FF6214 */  bne        $v1, $v0, .L80031DAC
/* 225D4 80031DD4 10008424 */   addiu     $a0, $a0, 0x10
.L80031DD8:
/* 225D8 80031DD8 00006784 */  lh         $a3, 0x0($v1)
/* 225DC 80031DDC 00000000 */  nop
/* 225E0 80031DE0 000087A4 */  sh         $a3, 0x0($a0)
/* 225E4 80031DE4 18BB8427 */  addiu      $a0, $gp, %gp_rel(gpbuffer2)
/* 225E8 80031DE8 3CBB8327 */  addiu      $v1, $gp, %gp_rel(readGPBuffer2)
/* 225EC 80031DEC 25106400 */  or         $v0, $v1, $a0
/* 225F0 80031DF0 03004230 */  andi       $v0, $v0, 0x3
/* 225F4 80031DF4 17004010 */  beqz       $v0, .L80031E54
/* 225F8 80031DF8 00000000 */   nop
/* 225FC 80031DFC 5CBB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer2 + 0x20)
.L80031E00:
/* 22600 80031E00 03006788 */  lwl        $a3, 0x3($v1)
/* 22604 80031E04 00006798 */  lwr        $a3, 0x0($v1)
/* 22608 80031E08 07006888 */  lwl        $t0, 0x7($v1)
/* 2260C 80031E0C 04006898 */  lwr        $t0, 0x4($v1)
/* 22610 80031E10 0B006988 */  lwl        $t1, 0xB($v1)
/* 22614 80031E14 08006998 */  lwr        $t1, 0x8($v1)
/* 22618 80031E18 0F006A88 */  lwl        $t2, 0xF($v1)
/* 2261C 80031E1C 0C006A98 */  lwr        $t2, 0xC($v1)
/* 22620 80031E20 030087A8 */  swl        $a3, 0x3($a0)
/* 22624 80031E24 000087B8 */  swr        $a3, 0x0($a0)
/* 22628 80031E28 070088A8 */  swl        $t0, 0x7($a0)
/* 2262C 80031E2C 040088B8 */  swr        $t0, 0x4($a0)
/* 22630 80031E30 0B0089A8 */  swl        $t1, 0xB($a0)
/* 22634 80031E34 080089B8 */  swr        $t1, 0x8($a0)
/* 22638 80031E38 0F008AA8 */  swl        $t2, 0xF($a0)
/* 2263C 80031E3C 0C008AB8 */  swr        $t2, 0xC($a0)
/* 22640 80031E40 10006324 */  addiu      $v1, $v1, 0x10
/* 22644 80031E44 EEFF6214 */  bne        $v1, $v0, .L80031E00
/* 22648 80031E48 10008424 */   addiu     $a0, $a0, 0x10
/* 2264C 80031E4C A1C70008 */  j          .L80031E84
/* 22650 80031E50 00000000 */   nop
.L80031E54:
/* 22654 80031E54 5CBB8227 */  addiu      $v0, $gp, %gp_rel(readGPBuffer2 + 0x20)
.L80031E58:
/* 22658 80031E58 0000678C */  lw         $a3, 0x0($v1)
/* 2265C 80031E5C 0400688C */  lw         $t0, 0x4($v1)
/* 22660 80031E60 0800698C */  lw         $t1, 0x8($v1)
/* 22664 80031E64 0C006A8C */  lw         $t2, 0xC($v1)
/* 22668 80031E68 000087AC */  sw         $a3, 0x0($a0)
/* 2266C 80031E6C 040088AC */  sw         $t0, 0x4($a0)
/* 22670 80031E70 080089AC */  sw         $t1, 0x8($a0)
/* 22674 80031E74 0C008AAC */  sw         $t2, 0xC($a0)
/* 22678 80031E78 10006324 */  addiu      $v1, $v1, 0x10
/* 2267C 80031E7C F6FF6214 */  bne        $v1, $v0, .L80031E58
/* 22680 80031E80 10008424 */   addiu     $a0, $a0, 0x10
.L80031E84:
/* 22684 80031E84 00006784 */  lh         $a3, 0x0($v1)
/* 22688 80031E88 A9C70008 */  j          .L80031EA4
/* 2268C 80031E8C 000087A4 */   sh        $a3, 0x0($a0)
.L80031E90:
/* 22690 80031E90 01000224 */  addiu      $v0, $zero, 0x1
.L80031E94:
/* 22694 80031E94 03006214 */  bne        $v1, $v0, .L80031EA4
/* 22698 80031E98 00000000 */   nop
.L80031E9C:
/* 2269C 80031E9C C8C6000C */  jal        GAMEPAD_DetectInit
/* 226A0 80031EA0 00000000 */   nop
.L80031EA4:
/* 226A4 80031EA4 D0BA8393 */  lbu        $v1, %gp_rel(gpbuffer1)($gp)
/* 226A8 80031EA8 FF000224 */  addiu      $v0, $zero, 0xFF
/* 226AC 80031EAC 34006210 */  beq        $v1, $v0, .L80031F80
/* 226B0 80031EB0 00000000 */   nop
/* 226B4 80031EB4 70BB828F */  lw         $v0, %gp_rel(gamePadControllerOut)($gp)
/* 226B8 80031EB8 00000000 */  nop
/* 226BC 80031EBC 06004228 */  slti       $v0, $v0, 0x6
/* 226C0 80031EC0 03004014 */  bnez       $v0, .L80031ED0
/* 226C4 80031EC4 00000000 */   nop
/* 226C8 80031EC8 C8C6000C */  jal        GAMEPAD_DetectInit
/* 226CC 80031ECC 00000000 */   nop
.L80031ED0:
/* 226D0 80031ED0 D2BA8297 */  lhu        $v0, %gp_rel(gpbuffer1 + 0x2)($gp)
/* 226D4 80031ED4 00000000 */  nop
/* 226D8 80031ED8 CCBA82A7 */  sh         $v0, %gp_rel(psxData)($gp)
/* 226DC 80031EDC C8BA8293 */  lbu        $v0, %gp_rel(controllerType)($gp)
/* 226E0 80031EE0 53001124 */  addiu      $s1, $zero, 0x53
/* 226E4 80031EE4 70BB80AF */  sw         $zero, %gp_rel(gamePadControllerOut)($gp)
/* 226E8 80031EE8 05005114 */  bne        $v0, $s1, .L80031F00
/* 226EC 80031EEC 00000000 */   nop
/* 226F0 80031EF0 CCBA8497 */  lhu        $a0, %gp_rel(psxData)($gp)
/* 226F4 80031EF4 B5C6000C */  jal        GAMEPAD_RemapAnalogueButtons
/* 226F8 80031EF8 00000000 */   nop
/* 226FC 80031EFC CCBA82A7 */  sh         $v0, %gp_rel(psxData)($gp)
.L80031F00:
/* 22700 80031F00 CCBA8597 */  lhu        $a1, %gp_rel(psxData)($gp)
/* 22704 80031F04 70928697 */  lhu        $a2, %gp_rel(lastData)($gp)
/* 22708 80031F08 6CC6000C */  jal        PSXPAD_TranslateData
/* 2270C 80031F0C 21200002 */   addu      $a0, $s0, $zero
/* 22710 80031F10 D1BA8393 */  lbu        $v1, %gp_rel(gpbuffer1 + 0x1)($gp)
/* 22714 80031F14 CCBA8297 */  lhu        $v0, %gp_rel(psxData)($gp)
/* 22718 80031F18 C8BA83A3 */  sb         $v1, %gp_rel(controllerType)($gp)
/* 2271C 80031F1C FF006330 */  andi       $v1, $v1, 0xFF
/* 22720 80031F20 709282A7 */  sh         $v0, %gp_rel(lastData)($gp)
/* 22724 80031F24 73000224 */  addiu      $v0, $zero, 0x73
/* 22728 80031F28 03006210 */  beq        $v1, $v0, .L80031F38
/* 2272C 80031F2C 00000000 */   nop
/* 22730 80031F30 17007114 */  bne        $v1, $s1, .L80031F90
/* 22734 80031F34 00000000 */   nop
.L80031F38:
/* 22738 80031F38 D6BA8493 */  lbu        $a0, %gp_rel(gpbuffer1 + 0x6)($gp)
/* 2273C 80031F3C D7BA8393 */  lbu        $v1, %gp_rel(gpbuffer1 + 0x7)($gp)
/* 22740 80031F40 B6FF8224 */  addiu      $v0, $a0, -0x4A
/* 22744 80031F44 6D00422C */  sltiu      $v0, $v0, 0x6D
/* 22748 80031F48 08004010 */  beqz       $v0, .L80031F6C
/* 2274C 80031F4C 4A006228 */   slti      $v0, $v1, 0x4A
/* 22750 80031F50 07004014 */  bnez       $v0, .L80031F70
/* 22754 80031F54 80FF8224 */   addiu     $v0, $a0, -0x80
/* 22758 80031F58 B7006228 */  slti       $v0, $v1, 0xB7
/* 2275C 80031F5C 04004010 */  beqz       $v0, .L80031F70
/* 22760 80031F60 80FF8224 */   addiu     $v0, $a0, -0x80
/* 22764 80031F64 80000424 */  addiu      $a0, $zero, 0x80
/* 22768 80031F68 21188000 */  addu       $v1, $a0, $zero
.L80031F6C:
/* 2276C 80031F6C 80FF8224 */  addiu      $v0, $a0, -0x80
.L80031F70:
/* 22770 80031F70 0C0002AE */  sw         $v0, 0xC($s0)
/* 22774 80031F74 80FF6224 */  addiu      $v0, $v1, -0x80
/* 22778 80031F78 E4C70008 */  j          .L80031F90
/* 2277C 80031F7C 100002AE */   sw        $v0, 0x10($s0)
.L80031F80:
/* 22780 80031F80 70BB828F */  lw         $v0, %gp_rel(gamePadControllerOut)($gp)
/* 22784 80031F84 00000000 */  nop
/* 22788 80031F88 01004224 */  addiu      $v0, $v0, 0x1
/* 2278C 80031F8C 70BB82AF */  sw         $v0, %gp_rel(gamePadControllerOut)($gp)
.L80031F90:
/* 22790 80031F90 1800BF8F */  lw         $ra, 0x18($sp)
/* 22794 80031F94 1400B18F */  lw         $s1, 0x14($sp)
/* 22798 80031F98 1000B08F */  lw         $s0, 0x10($sp)
/* 2279C 80031F9C 0800E003 */  jr         $ra
/* 227A0 80031FA0 2000BD27 */   addiu     $sp, $sp, 0x20
.size GAMEPAD_GetData, . - GAMEPAD_GetData
