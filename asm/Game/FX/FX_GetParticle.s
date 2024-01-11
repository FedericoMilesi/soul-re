.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetParticle
/* 32F70 80042770 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32F74 80042774 1400B1AF */  sw         $s1, 0x14($sp)
/* 32F78 80042778 21888000 */  addu       $s1, $a0, $zero
/* 32F7C 8004277C 1000B0AF */  sw         $s0, 0x10($sp)
/* 32F80 80042780 2180A000 */  addu       $s0, $a1, $zero
/* 32F84 80042784 4C000424 */  addiu      $a0, $zero, 0x4C
/* 32F88 80042788 1800BFAF */  sw         $ra, 0x18($sp)
/* 32F8C 8004278C 8140010C */  jal        MEMPACK_Malloc
/* 32F90 80042790 0D000524 */   addiu     $a1, $zero, 0xD
/* 32F94 80042794 21184000 */  addu       $v1, $v0, $zero
/* 32F98 80042798 16006010 */  beqz       $v1, .L800427F4
/* 32F9C 8004279C 01000224 */   addiu     $v0, $zero, 0x1
/* 32FA0 800427A0 0C0062A0 */  sb         $v0, 0xC($v1)
/* 32FA4 800427A4 0580023C */  lui        $v0, %hi(FX_ContinueParticle)
/* 32FA8 800427A8 B09C4224 */  addiu      $v0, $v0, %lo(FX_ContinueParticle)
/* 32FAC 800427AC 040062AC */  sw         $v0, 0x4($v1)
/* 32FB0 800427B0 00100224 */  addiu      $v0, $zero, 0x1000
/* 32FB4 800427B4 0D0060A0 */  sb         $zero, 0xD($v1)
/* 32FB8 800427B8 080071AC */  sw         $s1, 0x8($v1)
/* 32FBC 800427BC 3A0070A0 */  sb         $s0, 0x3A($v1)
/* 32FC0 800427C0 100060AC */  sw         $zero, 0x10($v1)
/* 32FC4 800427C4 180060AC */  sw         $zero, 0x18($v1)
/* 32FC8 800427C8 140060AC */  sw         $zero, 0x14($v1)
/* 32FCC 800427CC 320062A4 */  sh         $v0, 0x32($v1)
/* 32FD0 800427D0 220060A4 */  sh         $zero, 0x22($v1)
/* 32FD4 800427D4 380060A4 */  sh         $zero, 0x38($v1)
/* 32FD8 800427D8 360060A4 */  sh         $zero, 0x36($v1)
/* 32FDC 800427DC 340060A4 */  sh         $zero, 0x34($v1)
/* 32FE0 800427E0 300060A4 */  sh         $zero, 0x30($v1)
/* 32FE4 800427E4 2E0060A4 */  sh         $zero, 0x2E($v1)
/* 32FE8 800427E8 2C0060A4 */  sh         $zero, 0x2C($v1)
/* 32FEC 800427EC 2A0060A4 */  sh         $zero, 0x2A($v1)
/* 32FF0 800427F0 3B0060A0 */  sb         $zero, 0x3B($v1)
.L800427F4:
/* 32FF4 800427F4 1800BF8F */  lw         $ra, 0x18($sp)
/* 32FF8 800427F8 1400B18F */  lw         $s1, 0x14($sp)
/* 32FFC 800427FC 1000B08F */  lw         $s0, 0x10($sp)
/* 33000 80042800 21106000 */  addu       $v0, $v1, $zero
/* 33004 80042804 0800E003 */  jr         $ra
/* 33008 80042808 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_GetParticle, . - FX_GetParticle
