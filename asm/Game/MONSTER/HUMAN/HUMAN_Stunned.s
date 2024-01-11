.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Stunned
/* 6DA94 8007D294 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6DA98 8007D298 1400B1AF */  sw         $s1, 0x14($sp)
/* 6DA9C 8007D29C 21888000 */  addu       $s1, $a0, $zero
/* 6DAA0 8007D2A0 1800BFAF */  sw         $ra, 0x18($sp)
/* 6DAA4 8007D2A4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6DAA8 8007D2A8 6C01308E */  lw         $s0, 0x16C($s1)
/* 6DAAC 8007D2AC 00000000 */  nop
/* 6DAB0 8007D2B0 0400028E */  lw         $v0, 0x4($s0)
/* 6DAB4 8007D2B4 00000000 */  nop
/* 6DAB8 8007D2B8 10004230 */  andi       $v0, $v0, 0x10
/* 6DABC 8007D2BC 18004010 */  beqz       $v0, .L8007D320
/* 6DAC0 8007D2C0 00000000 */   nop
/* 6DAC4 8007D2C4 1800228E */  lw         $v0, 0x18($s1)
/* 6DAC8 8007D2C8 00000000 */  nop
/* 6DACC 8007D2CC 10004230 */  andi       $v0, $v0, 0x10
/* 6DAD0 8007D2D0 03004010 */  beqz       $v0, .L8007D2E0
/* 6DAD4 8007D2D4 05000524 */   addiu     $a1, $zero, 0x5
/* 6DAD8 8007D2D8 B6FF010C */  jal        MON_PlayAnim
/* 6DADC 8007D2DC 02000624 */   addiu     $a2, $zero, 0x2
.L8007D2E0:
/* 6DAE0 8007D2E0 9006020C */  jal        MON_GetTime
/* 6DAE4 8007D2E4 21202002 */   addu      $a0, $s1, $zero
/* 6DAE8 8007D2E8 1401038E */  lw         $v1, 0x114($s0)
/* 6DAEC 8007D2EC 00000000 */  nop
/* 6DAF0 8007D2F0 2B186200 */  sltu       $v1, $v1, $v0
/* 6DAF4 8007D2F4 06006010 */  beqz       $v1, .L8007D310
/* 6DAF8 8007D2F8 00400224 */   addiu     $v0, $zero, 0x4000
/* 6DAFC 8007D2FC 480102A6 */  sh         $v0, 0x148($s0)
/* 6DB00 8007D300 0400028E */  lw         $v0, 0x4($s0)
/* 6DB04 8007D304 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 6DB08 8007D308 24104300 */  and        $v0, $v0, $v1
/* 6DB0C 8007D30C 040002AE */  sw         $v0, 0x4($s0)
.L8007D310:
/* 6DB10 8007D310 0917020C */  jal        MON_DefaultQueueHandler
/* 6DB14 8007D314 21202002 */   addu      $a0, $s1, $zero
/* 6DB18 8007D318 CAF40108 */  j          .L8007D328
/* 6DB1C 8007D31C 00000000 */   nop
.L8007D320:
/* 6DB20 8007D320 8825020C */  jal        MON_Stunned
/* 6DB24 8007D324 21202002 */   addu      $a0, $s1, $zero
.L8007D328:
/* 6DB28 8007D328 1800BF8F */  lw         $ra, 0x18($sp)
/* 6DB2C 8007D32C 1400B18F */  lw         $s1, 0x14($sp)
/* 6DB30 8007D330 1000B08F */  lw         $s0, 0x10($sp)
/* 6DB34 8007D334 0800E003 */  jr         $ra
/* 6DB38 8007D338 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_Stunned, . - HUMAN_Stunned
