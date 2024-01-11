.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSoundBank
/* 42D0C 8005250C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 42D10 80052510 2400B3AF */  sw         $s3, 0x24($sp)
/* 42D14 80052514 21988000 */  addu       $s3, $a0, $zero
/* 42D18 80052518 2800B4AF */  sw         $s4, 0x28($sp)
/* 42D1C 8005251C 21A0A000 */  addu       $s4, $a1, $zero
/* 42D20 80052520 2000B2AF */  sw         $s2, 0x20($sp)
/* 42D24 80052524 2190C000 */  addu       $s2, $a2, $zero
/* 42D28 80052528 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 42D2C 8005252C 21A8E000 */  addu       $s5, $a3, $zero
/* 42D30 80052530 21200000 */  addu       $a0, $zero, $zero
/* 42D34 80052534 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42D38 80052538 01000524 */  addiu      $a1, $zero, 0x1
/* 42D3C 8005253C 3000BFAF */  sw         $ra, 0x30($sp)
/* 42D40 80052540 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 42D44 80052544 1800B0AF */  sw         $s0, 0x18($sp)
/* 42D48 80052548 D8065124 */  addiu      $s1, $v0, 0x6D8
/* 42D4C 8005254C 21184000 */  addu       $v1, $v0, $zero
.L80052550:
/* 42D50 80052550 0005628C */  lw         $v0, 0x500($v1)
/* 42D54 80052554 00000000 */  nop
/* 42D58 80052558 09004510 */  beq        $v0, $a1, .L80052580
/* 42D5C 8005255C 01008424 */   addiu     $a0, $a0, 0x1
/* 42D60 80052560 02008228 */  slti       $v0, $a0, 0x2
/* 42D64 80052564 FAFF4014 */  bnez       $v0, .L80052550
/* 42D68 80052568 04006324 */   addiu     $v1, $v1, 0x4
/* 42D6C 8005256C 0200422A */  slti       $v0, $s2, 0x2
/* 42D70 80052570 05004014 */  bnez       $v0, .L80052588
/* 42D74 80052574 80101200 */   sll       $v0, $s2, 2
/* 42D78 80052578 90490108 */  j          .L80052640
/* 42D7C 8005257C 05100224 */   addiu     $v0, $zero, 0x1005
.L80052580:
/* 42D80 80052580 90490108 */  j          .L80052640
/* 42D84 80052584 06100224 */   addiu     $v0, $zero, 0x1006
.L80052588:
/* 42D88 80052588 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 42D8C 8005258C 00000000 */  nop
/* 42D90 80052590 21206200 */  addu       $a0, $v1, $v0
/* 42D94 80052594 0005838C */  lw         $v1, 0x500($a0)
/* 42D98 80052598 02000224 */  addiu      $v0, $zero, 0x2
/* 42D9C 8005259C 07006214 */  bne        $v1, $v0, .L800525BC
/* 42DA0 800525A0 00000000 */   nop
/* 42DA4 800525A4 0805828C */  lw         $v0, 0x508($a0)
/* 42DA8 800525A8 00000000 */  nop
/* 42DAC 800525AC 04004010 */  beqz       $v0, .L800525C0
/* 42DB0 800525B0 21202002 */   addu      $a0, $s1, $zero
/* 42DB4 800525B4 584A010C */  jal        aadFreeDynamicSoundBank
/* 42DB8 800525B8 21204002 */   addu      $a0, $s2, $zero
.L800525BC:
/* 42DBC 800525BC 21202002 */  addu       $a0, $s1, $zero
.L800525C0:
/* 42DC0 800525C0 21286002 */  addu       $a1, $s3, $zero
/* 42DC4 800525C4 1F000624 */  addiu      $a2, $zero, 0x1F
/* 42DC8 800525C8 80801200 */  sll        $s0, $s2, 2
/* 42DCC 800525CC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42DD0 800525D0 01000324 */  addiu      $v1, $zero, 0x1
/* 42DD4 800525D4 21105000 */  addu       $v0, $v0, $s0
/* 42DD8 800525D8 3DFE020C */  jal        strncpy
/* 42DDC 800525DC 000543AC */   sw        $v1, 0x500($v0)
/* 42DE0 800525E0 20002426 */  addiu      $a0, $s1, 0x20
/* 42DE4 800525E4 21288002 */  addu       $a1, $s4, $zero
/* 42DE8 800525E8 3DFE020C */  jal        strncpy
/* 42DEC 800525EC 1F000624 */   addiu     $a2, $zero, 0x1F
/* 42DF0 800525F0 21206002 */  addu       $a0, $s3, $zero
/* 42DF4 800525F4 0580053C */  lui        $a1, %hi(aadLoadDynamicSoundBankReturn)
/* 42DF8 800525F8 21302002 */  addu       $a2, $s1, $zero
/* 42DFC 800525FC 4000D2AC */  sw         $s2, 0x40($a2)
/* 42E00 80052600 4400D5AC */  sw         $s5, 0x44($a2)
/* 42E04 80052604 4800A28F */  lw         $v0, 0x48($sp)
/* 42E08 80052608 6426A524 */  addiu      $a1, $a1, %lo(aadLoadDynamicSoundBankReturn)
/* 42E0C 8005260C 5400C0AC */  sw         $zero, 0x54($a2)
/* 42E10 80052610 4800C2AC */  sw         $v0, 0x48($a2)
/* 42E14 80052614 04000224 */  addiu      $v0, $zero, 0x4
/* 42E18 80052618 1400A2AF */  sw         $v0, 0x14($sp)
/* 42E1C 8005261C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42E20 80052620 08051026 */  addiu      $s0, $s0, 0x508
/* 42E24 80052624 21805000 */  addu       $s0, $v0, $s0
/* 42E28 80052628 1000B0AF */  sw         $s0, 0x10($sp)
/* 42E2C 8005262C 3007428C */  lw         $v0, 0x730($v0)
/* 42E30 80052630 00000000 */  nop
/* 42E34 80052634 09F84000 */  jalr       $v0
/* 42E38 80052638 21380000 */   addu      $a3, $zero, $zero
/* 42E3C 8005263C 21100000 */  addu       $v0, $zero, $zero
.L80052640:
/* 42E40 80052640 3000BF8F */  lw         $ra, 0x30($sp)
/* 42E44 80052644 2C00B58F */  lw         $s5, 0x2C($sp)
/* 42E48 80052648 2800B48F */  lw         $s4, 0x28($sp)
/* 42E4C 8005264C 2400B38F */  lw         $s3, 0x24($sp)
/* 42E50 80052650 2000B28F */  lw         $s2, 0x20($sp)
/* 42E54 80052654 1C00B18F */  lw         $s1, 0x1C($sp)
/* 42E58 80052658 1800B08F */  lw         $s0, 0x18($sp)
/* 42E5C 8005265C 0800E003 */  jr         $ra
/* 42E60 80052660 3800BD27 */   addiu     $sp, $sp, 0x38
.size aadLoadDynamicSoundBank, . - aadLoadDynamicSoundBank
