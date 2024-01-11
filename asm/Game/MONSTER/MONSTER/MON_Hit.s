.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Hit
/* 7A2D0 80089AD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7A2D4 80089AD4 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A2D8 80089AD8 21808000 */  addu       $s0, $a0, $zero
/* 7A2DC 80089ADC 1800BFAF */  sw         $ra, 0x18($sp)
/* 7A2E0 80089AE0 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A2E4 80089AE4 6C01118E */  lw         $s1, 0x16C($s0)
/* 7A2E8 80089AE8 9006020C */  jal        MON_GetTime
/* 7A2EC 80089AEC 00000000 */   nop
/* 7A2F0 80089AF0 1401238E */  lw         $v1, 0x114($s1)
/* 7A2F4 80089AF4 00000000 */  nop
/* 7A2F8 80089AF8 2B186200 */  sltu       $v1, $v1, $v0
/* 7A2FC 80089AFC 0F006010 */  beqz       $v1, .L80089B3C
/* 7A300 80089B00 00000000 */   nop
/* 7A304 80089B04 0000228E */  lw         $v0, 0x0($s1)
/* 7A308 80089B08 00000000 */  nop
/* 7A30C 80089B0C 00014230 */  andi       $v0, $v0, 0x100
/* 7A310 80089B10 03004010 */  beqz       $v0, .L80089B20
/* 7A314 80089B14 21200002 */   addu      $a0, $s0, $zero
/* 7A318 80089B18 C9260208 */  j          .L80089B24
/* 7A31C 80089B1C 09000524 */   addiu     $a1, $zero, 0x9
.L80089B20:
/* 7A320 80089B20 0D000524 */  addiu      $a1, $zero, 0xD
.L80089B24:
/* 7A324 80089B24 91FE010C */  jal        MON_SwitchState
/* 7A328 80089B28 00000000 */   nop
/* 7A32C 80089B2C 740100AE */  sw         $zero, 0x174($s0)
/* 7A330 80089B30 780100AE */  sw         $zero, 0x178($s0)
/* 7A334 80089B34 D6260208 */  j          .L80089B58
/* 7A338 80089B38 7C0100AE */   sw        $zero, 0x17C($s0)
.L80089B3C:
/* 7A33C 80089B3C 1800028E */  lw         $v0, 0x18($s0)
/* 7A340 80089B40 00000000 */  nop
/* 7A344 80089B44 10004230 */  andi       $v0, $v0, 0x10
/* 7A348 80089B48 03004010 */  beqz       $v0, .L80089B58
/* 7A34C 80089B4C 21200002 */   addu      $a0, $s0, $zero
/* 7A350 80089B50 9D03020C */  jal        MON_PlayCombatIdle
/* 7A354 80089B54 02000524 */   addiu     $a1, $zero, 0x2
.L80089B58:
/* 7A358 80089B58 0917020C */  jal        MON_DefaultQueueHandler
/* 7A35C 80089B5C 21200002 */   addu      $a0, $s0, $zero
/* 7A360 80089B60 21200002 */  addu       $a0, $s0, $zero
/* 7A364 80089B64 21280000 */  addu       $a1, $zero, $zero
/* 7A368 80089B68 2130A000 */  addu       $a2, $a1, $zero
/* 7A36C 80089B6C 47DF010C */  jal        PHYSICS_StopIfCloseToTarget
/* 7A370 80089B70 2138A000 */   addu      $a3, $a1, $zero
/* 7A374 80089B74 21200002 */  addu       $a0, $s0, $zero
/* 7A378 80089B78 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7A37C 80089B7C 4FDE010C */  jal        PhysicsMove
/* 7A380 80089B80 5C000526 */   addiu     $a1, $s0, 0x5C
/* 7A384 80089B84 9801038E */  lw         $v1, 0x198($s0)
/* 7A388 80089B88 08000224 */  addiu      $v0, $zero, 0x8
/* 7A38C 80089B8C 05006210 */  beq        $v1, $v0, .L80089BA4
/* 7A390 80089B90 DFFF0324 */   addiu     $v1, $zero, -0x21
/* 7A394 80089B94 5800028E */  lw         $v0, 0x58($s0)
/* 7A398 80089B98 00000000 */  nop
/* 7A39C 80089B9C 24104300 */  and        $v0, $v0, $v1
/* 7A3A0 80089BA0 580002AE */  sw         $v0, 0x58($s0)
.L80089BA4:
/* 7A3A4 80089BA4 1800BF8F */  lw         $ra, 0x18($sp)
/* 7A3A8 80089BA8 1400B18F */  lw         $s1, 0x14($sp)
/* 7A3AC 80089BAC 1000B08F */  lw         $s0, 0x10($sp)
/* 7A3B0 80089BB0 0800E003 */  jr         $ra
/* 7A3B4 80089BB4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Hit, . - MON_Hit
