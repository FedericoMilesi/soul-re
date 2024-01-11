.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadPauseSound
/* 454D8 80054CD8 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 454DC 80054CDC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 454E0 80054CE0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 454E4 80054CE4 1800B2AF */  sw         $s2, 0x18($sp)
/* 454E8 80054CE8 1400B1AF */  sw         $s1, 0x14($sp)
/* 454EC 80054CEC 1000B0AF */  sw         $s0, 0x10($sp)
/* 454F0 80054CF0 2400838C */  lw         $v1, 0x24($a0)
/* 454F4 80054CF4 00000000 */  nop
/* 454F8 80054CF8 08006230 */  andi       $v0, $v1, 0x8
/* 454FC 80054CFC 16004014 */  bnez       $v0, .L80054D58
/* 45500 80054D00 0C006234 */   ori       $v0, $v1, 0xC
/* 45504 80054D04 240082AC */  sw         $v0, 0x24($a0)
/* 45508 80054D08 21800000 */  addu       $s0, $zero, $zero
/* 4550C 80054D0C 94041224 */  addiu      $s2, $zero, 0x494
/* 45510 80054D10 21880002 */  addu       $s1, $s0, $zero
.L80054D14:
/* 45514 80054D14 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 45518 80054D18 21200002 */  addu       $a0, $s0, $zero
/* 4551C 80054D1C 21285200 */  addu       $a1, $v0, $s2
/* 45520 80054D20 02005226 */  addiu      $s2, $s2, 0x2
/* 45524 80054D24 21105100 */  addu       $v0, $v0, $s1
/* 45528 80054D28 EE014394 */  lhu        $v1, 0x1EE($v0)
/* 4552C 80054D2C 1C003126 */  addiu      $s1, $s1, 0x1C
/* 45530 80054D30 FDFF6330 */  andi       $v1, $v1, 0xFFFD
/* 45534 80054D34 95FE020C */  jal        SpuGetVoicePitch
/* 45538 80054D38 EE0143A4 */   sh        $v1, 0x1EE($v0)
/* 4553C 80054D3C 21200002 */  addu       $a0, $s0, $zero
/* 45540 80054D40 9DFE020C */  jal        SpuSetVoicePitch
/* 45544 80054D44 21280000 */   addu      $a1, $zero, $zero
/* 45548 80054D48 01001026 */  addiu      $s0, $s0, 0x1
/* 4554C 80054D4C 1800022A */  slti       $v0, $s0, 0x18
/* 45550 80054D50 F0FF4014 */  bnez       $v0, .L80054D14
/* 45554 80054D54 00000000 */   nop
.L80054D58:
/* 45558 80054D58 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4555C 80054D5C 1800B28F */  lw         $s2, 0x18($sp)
/* 45560 80054D60 1400B18F */  lw         $s1, 0x14($sp)
/* 45564 80054D64 1000B08F */  lw         $s0, 0x10($sp)
/* 45568 80054D68 0800E003 */  jr         $ra
/* 4556C 80054D6C 2000BD27 */   addiu     $sp, $sp, 0x20
.size aadPauseSound, . - aadPauseSound
