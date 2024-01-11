.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadLoadDynamicSoundBankReturn
/* 42E64 80052664 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 42E68 80052668 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 42E6C 8005266C 2198A000 */  addu       $s3, $a1, $zero
/* 42E70 80052670 2000BFAF */  sw         $ra, 0x20($sp)
/* 42E74 80052674 1800B2AF */  sw         $s2, 0x18($sp)
/* 42E78 80052678 1400B1AF */  sw         $s1, 0x14($sp)
/* 42E7C 8005267C 1000B0AF */  sw         $s0, 0x10($sp)
/* 42E80 80052680 4000718E */  lw         $s1, 0x40($s3)
/* 42E84 80052684 774A010C */  jal        aadOpenDynamicSoundBank
/* 42E88 80052688 21282002 */   addu      $a1, $s1, $zero
/* 42E8C 8005268C 21804000 */  addu       $s0, $v0, $zero
/* 42E90 80052690 18000012 */  beqz       $s0, .L800526F4
/* 42E94 80052694 80901100 */   sll       $s2, $s1, 2
/* 42E98 80052698 D89B858F */  lw         $a1, %gp_rel(aadMem)($gp)
/* 42E9C 8005269C 80000236 */  ori        $v0, $s0, 0x80
/* 42EA0 800526A0 2118B200 */  addu       $v1, $a1, $s2
/* 42EA4 800526A4 0805648C */  lw         $a0, 0x508($v1)
/* 42EA8 800526A8 FF004230 */  andi       $v0, $v0, 0xFF
/* 42EAC 800526AC 09008010 */  beqz       $a0, .L800526D4
/* 42EB0 800526B0 000562AC */   sw        $v0, 0x500($v1)
/* 42EB4 800526B4 3C07A28C */  lw         $v0, 0x73C($a1)
/* 42EB8 800526B8 00000000 */  nop
/* 42EBC 800526BC 09F84000 */  jalr       $v0
/* 42EC0 800526C0 00000000 */   nop
/* 42EC4 800526C4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42EC8 800526C8 00000000 */  nop
/* 42ECC 800526CC 21105200 */  addu       $v0, $v0, $s2
/* 42ED0 800526D0 080540AC */  sw         $zero, 0x508($v0)
.L800526D4:
/* 42ED4 800526D4 4800668E */  lw         $a2, 0x48($s3)
/* 42ED8 800526D8 00000000 */  nop
/* 42EDC 800526DC 0E00C010 */  beqz       $a2, .L80052718
/* 42EE0 800526E0 FFFF2432 */   andi      $a0, $s1, 0xFFFF
/* 42EE4 800526E4 09F8C000 */  jalr       $a2
/* 42EE8 800526E8 21280002 */   addu      $a1, $s0, $zero
/* 42EEC 800526EC C6490108 */  j          .L80052718
/* 42EF0 800526F0 00000000 */   nop
.L800526F4:
/* 42EF4 800526F4 20006426 */  addiu      $a0, $s3, 0x20
/* 42EF8 800526F8 0580053C */  lui        $a1, %hi(aadLoadDynamicSoundBankReturn2)
/* 42EFC 800526FC 3427A524 */  addiu      $a1, $a1, %lo(aadLoadDynamicSoundBankReturn2)
/* 42F00 80052700 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 42F04 80052704 21306002 */  addu       $a2, $s3, $zero
/* 42F08 80052708 3407428C */  lw         $v0, 0x734($v0)
/* 42F0C 8005270C 00000000 */  nop
/* 42F10 80052710 09F84000 */  jalr       $v0
/* 42F14 80052714 21380000 */   addu      $a3, $zero, $zero
.L80052718:
/* 42F18 80052718 2000BF8F */  lw         $ra, 0x20($sp)
/* 42F1C 8005271C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 42F20 80052720 1800B28F */  lw         $s2, 0x18($sp)
/* 42F24 80052724 1400B18F */  lw         $s1, 0x14($sp)
/* 42F28 80052728 1000B08F */  lw         $s0, 0x10($sp)
/* 42F2C 8005272C 0800E003 */  jr         $ra
/* 42F30 80052730 2800BD27 */   addiu     $sp, $sp, 0x28
.size aadLoadDynamicSoundBankReturn, . - aadLoadDynamicSoundBankReturn
