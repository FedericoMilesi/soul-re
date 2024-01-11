.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_LevelSelectNew
/* 4D20 80014520 108A828F */  lw         $v0, %gp_rel(debugMenuChoice)($gp)
/* 4D24 80014524 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4D28 80014528 1400B1AF */  sw         $s1, 0x14($sp)
/* 4D2C 8001452C 21880000 */  addu       $s1, $zero, $zero
/* 4D30 80014530 2000BFAF */  sw         $ra, 0x20($sp)
/* 4D34 80014534 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4D38 80014538 1800B2AF */  sw         $s2, 0x18($sp)
/* 4D3C 8001453C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4D40 80014540 40180200 */  sll        $v1, $v0, 1
/* 4D44 80014544 21186200 */  addu       $v1, $v1, $v0
/* 4D48 80014548 0C8A828F */  lw         $v0, %gp_rel(currentMenu)($gp)
/* 4D4C 8001454C C0180300 */  sll        $v1, $v1, 3
/* 4D50 80014550 21186200 */  addu       $v1, $v1, $v0
/* 4D54 80014554 0C00708C */  lw         $s0, 0xC($v1)
/* 4D58 80014558 04007294 */  lhu        $s2, 0x4($v1)
/* 4D5C 8001455C 00000292 */  lbu        $v0, 0x0($s0)
/* 4D60 80014560 00000000 */  nop
/* 4D64 80014564 13004010 */  beqz       $v0, .L800145B4
/* 4D68 80014568 21980002 */   addu      $s3, $s0, $zero
/* 4D6C 8001456C 20000524 */  addiu      $a1, $zero, 0x20
/* 4D70 80014570 09000424 */  addiu      $a0, $zero, 0x9
/* 4D74 80014574 0A000324 */  addiu      $v1, $zero, 0xA
/* 4D78 80014578 FF004230 */  andi       $v0, $v0, 0xFF
.L8001457C:
/* 4D7C 8001457C 05004510 */  beq        $v0, $a1, .L80014594
/* 4D80 80014580 00000000 */   nop
/* 4D84 80014584 03004410 */  beq        $v0, $a0, .L80014594
/* 4D88 80014588 00000000 */   nop
/* 4D8C 8001458C 04004314 */  bne        $v0, $v1, .L800145A0
/* 4D90 80014590 00000000 */   nop
.L80014594:
/* 4D94 80014594 00001192 */  lbu        $s1, 0x0($s0)
/* 4D98 80014598 6D510008 */  j          .L800145B4
/* 4D9C 8001459C 000000A2 */   sb        $zero, 0x0($s0)
.L800145A0:
/* 4DA0 800145A0 01001026 */  addiu      $s0, $s0, 0x1
/* 4DA4 800145A4 00000292 */  lbu        $v0, 0x0($s0)
/* 4DA8 800145A8 00000000 */  nop
/* 4DAC 800145AC F3FF4014 */  bnez       $v0, .L8001457C
/* 4DB0 800145B0 FF004230 */   andi      $v0, $v0, 0xFF
.L800145B4:
/* 4DB4 800145B4 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 4DB8 800145B8 2000033C */  lui        $v1, (0x200000 >> 16)
/* 4DBC 800145BC 24104300 */  and        $v0, $v0, $v1
/* 4DC0 800145C0 04004010 */  beqz       $v0, .L800145D4
/* 4DC4 800145C4 002C1200 */   sll       $a1, $s2, 16
/* 4DC8 800145C8 3DDA020C */  jal        SAVE_SaveGame
/* 4DCC 800145CC 00000000 */   nop
/* 4DD0 800145D0 002C1200 */  sll        $a1, $s2, 16
.L800145D4:
/* 4DD4 800145D4 21206002 */  addu       $a0, $s3, $zero
/* 4DD8 800145D8 032C0500 */  sra        $a1, $a1, 16
/* 4DDC 800145DC 0CBF8627 */  addiu      $a2, $gp, %gp_rel(gameTrackerX + 0x144)
/* 4DE0 800145E0 56C4000C */  jal        GAMELOOP_RequestLevelChange
/* 4DE4 800145E4 BCFEC624 */   addiu     $a2, $a2, -0x144
/* 4DE8 800145E8 04000224 */  addiu      $v0, $zero, 0x4
/* 4DEC 800145EC 34BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x16C)($gp)
/* 4DF0 800145F0 02002012 */  beqz       $s1, .L800145FC
/* 4DF4 800145F4 00000000 */   nop
/* 4DF8 800145F8 000011A2 */  sb         $s1, 0x0($s0)
.L800145FC:
/* 4DFC 800145FC 2000BF8F */  lw         $ra, 0x20($sp)
/* 4E00 80014600 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4E04 80014604 1800B28F */  lw         $s2, 0x18($sp)
/* 4E08 80014608 1400B18F */  lw         $s1, 0x14($sp)
/* 4E0C 8001460C 1000B08F */  lw         $s0, 0x10($sp)
/* 4E10 80014610 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 4E14 80014614 0800E003 */  jr         $ra
/* 4E18 80014618 2800BD27 */   addiu     $sp, $sp, 0x28
.size DEBUG_LevelSelectNew, . - DEBUG_LevelSelectNew
