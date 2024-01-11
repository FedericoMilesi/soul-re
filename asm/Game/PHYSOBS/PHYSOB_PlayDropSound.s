.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_PlayDropSound
/* 594A4 80068CA4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 594A8 80068CA8 2000BFAF */  sw         $ra, 0x20($sp)
/* 594AC 80068CAC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 594B0 80068CB0 1800B0AF */  sw         $s0, 0x18($sp)
/* 594B4 80068CB4 2400858C */  lw         $a1, 0x24($a0)
/* 594B8 80068CB8 00000000 */  nop
/* 594BC 80068CBC 0200A394 */  lhu        $v1, 0x2($a1)
/* 594C0 80068CC0 01000224 */  addiu      $v0, $zero, 0x1
/* 594C4 80068CC4 04006214 */  bne        $v1, $v0, .L80068CD8
/* 594C8 80068CC8 02000224 */   addiu     $v0, $zero, 0x2
/* 594CC 80068CCC 0A00A384 */  lh         $v1, 0xA($a1)
/* 594D0 80068CD0 45A30108 */  j          .L80068D14
/* 594D4 80068CD4 00000000 */   nop
.L80068CD8:
/* 594D8 80068CD8 04006014 */  bnez       $v1, .L80068CEC
/* 594DC 80068CDC 03000224 */   addiu     $v0, $zero, 0x3
/* 594E0 80068CE0 1300A380 */  lb         $v1, 0x13($a1)
/* 594E4 80068CE4 45A30108 */  j          .L80068D14
/* 594E8 80068CE8 02000224 */   addiu     $v0, $zero, 0x2
.L80068CEC:
/* 594EC 80068CEC 08006214 */  bne        $v1, $v0, .L80068D10
/* 594F0 80068CF0 21180000 */   addu      $v1, $zero, $zero
/* 594F4 80068CF4 2800A28C */  lw         $v0, 0x28($a1)
/* 594F8 80068CF8 00000000 */  nop
/* 594FC 80068CFC 04004010 */  beqz       $v0, .L80068D10
/* 59500 80068D00 00000000 */   nop
/* 59504 80068D04 0B004380 */  lb         $v1, 0xB($v0)
/* 59508 80068D08 45A30108 */  j          .L80068D14
/* 5950C 80068D0C 02000224 */   addiu     $v0, $zero, 0x2
.L80068D10:
/* 59510 80068D10 02000224 */  addiu      $v0, $zero, 0x2
.L80068D14:
/* 59514 80068D14 11006210 */  beq        $v1, $v0, .L80068D5C
/* 59518 80068D18 03006228 */   slti      $v0, $v1, 0x3
/* 5951C 80068D1C 05004010 */  beqz       $v0, .L80068D34
/* 59520 80068D20 01000224 */   addiu     $v0, $zero, 0x1
/* 59524 80068D24 08006210 */  beq        $v1, $v0, .L80068D48
/* 59528 80068D28 30750224 */   addiu     $v0, $zero, 0x7530
/* 5952C 80068D2C 6CA30108 */  j          .L80068DB0
/* 59530 80068D30 00000000 */   nop
.L80068D34:
/* 59534 80068D34 03000224 */  addiu      $v0, $zero, 0x3
/* 59538 80068D38 16006210 */  beq        $v1, $v0, .L80068D94
/* 5953C 80068D3C 30750224 */   addiu     $v0, $zero, 0x7530
/* 59540 80068D40 6CA30108 */  j          .L80068DB0
/* 59544 80068D44 00000000 */   nop
.L80068D48:
/* 59548 80068D48 1000A2AF */  sw         $v0, 0x10($sp)
/* 5954C 80068D4C 5C008424 */  addiu      $a0, $a0, 0x5C
/* 59550 80068D50 0A000524 */  addiu      $a1, $zero, 0xA
/* 59554 80068D54 69A30108 */  j          .L80068DA4
/* 59558 80068D58 9CFF0624 */   addiu     $a2, $zero, -0x64
.L80068D5C:
/* 5955C 80068D5C 5C009124 */  addiu      $s1, $a0, 0x5C
/* 59560 80068D60 21202002 */  addu       $a0, $s1, $zero
/* 59564 80068D64 1A010524 */  addiu      $a1, $zero, 0x11A
/* 59568 80068D68 70FE0624 */  addiu      $a2, $zero, -0x190
/* 5956C 80068D6C 5A000724 */  addiu      $a3, $zero, 0x5A
/* 59570 80068D70 B0361024 */  addiu      $s0, $zero, 0x36B0
/* 59574 80068D74 1300010C */  jal        SOUND_Play3dSound
/* 59578 80068D78 1000B0AF */   sw        $s0, 0x10($sp)
/* 5957C 80068D7C 21202002 */  addu       $a0, $s1, $zero
/* 59580 80068D80 1A010524 */  addiu      $a1, $zero, 0x11A
/* 59584 80068D84 E0FC0624 */  addiu      $a2, $zero, -0x320
/* 59588 80068D88 64000724 */  addiu      $a3, $zero, 0x64
/* 5958C 80068D8C 6AA30108 */  j          .L80068DA8
/* 59590 80068D90 1000B0AF */   sw        $s0, 0x10($sp)
.L80068D94:
/* 59594 80068D94 1000A2AF */  sw         $v0, 0x10($sp)
/* 59598 80068D98 5C008424 */  addiu      $a0, $a0, 0x5C
/* 5959C 80068D9C B2000524 */  addiu      $a1, $zero, 0xB2
/* 595A0 80068DA0 E0FC0624 */  addiu      $a2, $zero, -0x320
.L80068DA4:
/* 595A4 80068DA4 78000724 */  addiu      $a3, $zero, 0x78
.L80068DA8:
/* 595A8 80068DA8 1300010C */  jal        SOUND_Play3dSound
/* 595AC 80068DAC 00000000 */   nop
.L80068DB0:
/* 595B0 80068DB0 2000BF8F */  lw         $ra, 0x20($sp)
/* 595B4 80068DB4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 595B8 80068DB8 1800B08F */  lw         $s0, 0x18($sp)
/* 595BC 80068DBC 0800E003 */  jr         $ra
/* 595C0 80068DC0 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSOB_PlayDropSound, . - PHYSOB_PlayDropSound
