.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_InstanceListWithSignals
/* 1528C 80024A8C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15290 80024A90 1800BFAF */  sw         $ra, 0x18($sp)
/* 15294 80024A94 1400B1AF */  sw         $s1, 0x14($sp)
/* 15298 80024A98 1000B0AF */  sw         $s0, 0x10($sp)
/* 1529C 80024A9C 0400908C */  lw         $s0, 0x4($a0)
/* 152A0 80024AA0 00000000 */  nop
/* 152A4 80024AA4 11000012 */  beqz       $s0, .L80024AEC
/* 152A8 80024AA8 0024113C */   lui       $s1, (0x24000000 >> 16)
.L80024AAC:
/* 152AC 80024AAC 1800028E */  lw         $v0, 0x18($s0)
/* 152B0 80024AB0 00000000 */  nop
/* 152B4 80024AB4 24105100 */  and        $v0, $v0, $s1
/* 152B8 80024AB8 08004014 */  bnez       $v0, .L80024ADC
/* 152BC 80024ABC 00000000 */   nop
/* 152C0 80024AC0 3800048E */  lw         $a0, 0x38($s0)
/* 152C4 80024AC4 1C66010C */  jal        STREAM_GetLevelWithID
/* 152C8 80024AC8 00000000 */   nop
/* 152CC 80024ACC 03004010 */  beqz       $v0, .L80024ADC
/* 152D0 80024AD0 21200002 */   addu      $a0, $s0, $zero
/* 152D4 80024AD4 6D91000C */  jal        COLLIDE_InstanceTerrainSignal
/* 152D8 80024AD8 21284000 */   addu      $a1, $v0, $zero
.L80024ADC:
/* 152DC 80024ADC 0800108E */  lw         $s0, 0x8($s0)
/* 152E0 80024AE0 00000000 */  nop
/* 152E4 80024AE4 F1FF0016 */  bnez       $s0, .L80024AAC
/* 152E8 80024AE8 00000000 */   nop
.L80024AEC:
/* 152EC 80024AEC 1800BF8F */  lw         $ra, 0x18($sp)
/* 152F0 80024AF0 1400B18F */  lw         $s1, 0x14($sp)
/* 152F4 80024AF4 1000B08F */  lw         $s0, 0x10($sp)
/* 152F8 80024AF8 0800E003 */  jr         $ra
/* 152FC 80024AFC 2000BD27 */   addiu     $sp, $sp, 0x20
.size COLLIDE_InstanceListWithSignals, . - COLLIDE_InstanceListWithSignals
