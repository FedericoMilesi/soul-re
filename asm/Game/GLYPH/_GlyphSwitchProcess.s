.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphSwitchProcess
/* 6B564 8007AD64 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6B568 8007AD68 1400B1AF */  sw         $s1, 0x14($sp)
/* 6B56C 8007AD6C 21888000 */  addu       $s1, $a0, $zero
/* 6B570 8007AD70 2000BFAF */  sw         $ra, 0x20($sp)
/* 6B574 8007AD74 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6B578 8007AD78 1800B2AF */  sw         $s2, 0x18($sp)
/* 6B57C 8007AD7C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B580 8007AD80 6C01328E */  lw         $s2, 0x16C($s1)
/* 6B584 8007AD84 2198A000 */  addu       $s3, $a1, $zero
/* 6B588 8007AD88 04005026 */  addiu      $s0, $s2, 0x4
/* 6B58C 8007AD8C 36C3010C */  jal        PurgeMessageQueue
/* 6B590 8007AD90 21200002 */   addu      $a0, $s0, $zero
/* 6B594 8007AD94 21200002 */  addu       $a0, $s0, $zero
/* 6B598 8007AD98 1000053C */  lui        $a1, (0x100004 >> 16)
/* 6B59C 8007AD9C 0400A534 */  ori        $a1, $a1, (0x100004 & 0xFFFF)
/* 6B5A0 8007ADA0 4EC3010C */  jal        EnMessageQueueData
/* 6B5A4 8007ADA4 21300000 */   addu      $a2, $zero, $zero
/* 6B5A8 8007ADA8 21202002 */  addu       $a0, $s1, $zero
/* 6B5AC 8007ADAC 21280000 */  addu       $a1, $zero, $zero
/* 6B5B0 8007ADB0 0000428E */  lw         $v0, 0x0($s2)
/* 6B5B4 8007ADB4 00000000 */  nop
/* 6B5B8 8007ADB8 09F84000 */  jalr       $v0
/* 6B5BC 8007ADBC 2130A000 */   addu      $a2, $a1, $zero
/* 6B5C0 8007ADC0 21200002 */  addu       $a0, $s0, $zero
/* 6B5C4 8007ADC4 1000053C */  lui        $a1, (0x100001 >> 16)
/* 6B5C8 8007ADC8 0100A534 */  ori        $a1, $a1, (0x100001 & 0xFFFF)
/* 6B5CC 8007ADCC 4EC3010C */  jal        EnMessageQueueData
/* 6B5D0 8007ADD0 21300000 */   addu      $a2, $zero, $zero
/* 6B5D4 8007ADD4 21202002 */  addu       $a0, $s1, $zero
/* 6B5D8 8007ADD8 21280000 */  addu       $a1, $zero, $zero
/* 6B5DC 8007ADDC 2130A000 */  addu       $a2, $a1, $zero
/* 6B5E0 8007ADE0 09F86002 */  jalr       $s3
/* 6B5E4 8007ADE4 000053AE */   sw        $s3, 0x0($s2)
/* 6B5E8 8007ADE8 2000BF8F */  lw         $ra, 0x20($sp)
/* 6B5EC 8007ADEC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6B5F0 8007ADF0 1800B28F */  lw         $s2, 0x18($sp)
/* 6B5F4 8007ADF4 1400B18F */  lw         $s1, 0x14($sp)
/* 6B5F8 8007ADF8 1000B08F */  lw         $s0, 0x10($sp)
/* 6B5FC 8007ADFC 0800E003 */  jr         $ra
/* 6B600 8007AE00 2800BD27 */   addiu     $sp, $sp, 0x28
.size _GlyphSwitchProcess, . - _GlyphSwitchProcess
