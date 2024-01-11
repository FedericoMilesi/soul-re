.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetupSoundRamp
/* 98540 800A7D40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 98544 800A7D44 2400B3AF */  sw         $s3, 0x24($sp)
/* 98548 800A7D48 4400B38F */  lw         $s3, 0x44($sp)
/* 9854C 800A7D4C 1800B0AF */  sw         $s0, 0x18($sp)
/* 98550 800A7D50 2180A000 */  addu       $s0, $a1, $zero
/* 98554 800A7D54 2800B4AF */  sw         $s4, 0x28($sp)
/* 98558 800A7D58 4C00B48F */  lw         $s4, 0x4C($sp)
/* 9855C 800A7D5C 2128C000 */  addu       $a1, $a2, $zero
/* 98560 800A7D60 2000B2AF */  sw         $s2, 0x20($sp)
/* 98564 800A7D64 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 98568 800A7D68 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9856C 800A7D6C 0000028E */  lw         $v0, 0x0($s0)
/* 98570 800A7D70 5000B18F */  lw         $s1, 0x50($sp)
/* 98574 800A7D74 07004014 */  bnez       $v0, .L800A7D94
/* 98578 800A7D78 2190E000 */   addu      $s2, $a3, $zero
/* 9857C 800A7D7C 5C008424 */  addiu      $a0, $a0, 0x5C
/* 98580 800A7D80 21304002 */  addu       $a2, $s2, $zero
/* 98584 800A7D84 21386002 */  addu       $a3, $s3, $zero
/* 98588 800A7D88 1300010C */  jal        SOUND_Play3dSound
/* 9858C 800A7D8C 1000B1AF */   sw        $s1, 0x10($sp)
/* 98590 800A7D90 000002AE */  sw         $v0, 0x0($s0)
.L800A7D94:
/* 98594 800A7D94 02008016 */  bnez       $s4, .L800A7DA0
/* 98598 800A7D98 00000000 */   nop
/* 9859C 800A7D9C 000000AE */  sw         $zero, 0x0($s0)
.L800A7DA0:
/* 985A0 800A7DA0 100012A6 */  sh         $s2, 0x10($s0)
/* 985A4 800A7DA4 4000A28F */  lw         $v0, 0x40($sp)
/* 985A8 800A7DA8 140013A6 */  sh         $s3, 0x14($s0)
/* 985AC 800A7DAC 120002A6 */  sh         $v0, 0x12($s0)
/* 985B0 800A7DB0 4800A28F */  lw         $v0, 0x48($sp)
/* 985B4 800A7DB4 0C0011AE */  sw         $s1, 0xC($s0)
/* 985B8 800A7DB8 080014AE */  sw         $s4, 0x8($s0)
/* 985BC 800A7DBC 040000AE */  sw         $zero, 0x4($s0)
/* 985C0 800A7DC0 160002A6 */  sh         $v0, 0x16($s0)
/* 985C4 800A7DC4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 985C8 800A7DC8 2800B48F */  lw         $s4, 0x28($sp)
/* 985CC 800A7DCC 2400B38F */  lw         $s3, 0x24($sp)
/* 985D0 800A7DD0 2000B28F */  lw         $s2, 0x20($sp)
/* 985D4 800A7DD4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 985D8 800A7DD8 1800B08F */  lw         $s0, 0x18($sp)
/* 985DC 800A7DDC 0800E003 */  jr         $ra
/* 985E0 800A7DE0 3000BD27 */   addiu     $sp, $sp, 0x30
.size razSetupSoundRamp, . - razSetupSoundRamp
