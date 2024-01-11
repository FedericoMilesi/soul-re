.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemoveIntroducedLights
/* 4B4C0 8005ACC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4B4C4 8005ACC4 1800B2AF */  sw         $s2, 0x18($sp)
/* 4B4C8 8005ACC8 21908000 */  addu       $s2, $a0, $zero
/* 4B4CC 8005ACCC DCBE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x114)($gp)
/* 4B4D0 8005ACD0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4B4D4 8005ACD4 1400B1AF */  sw         $s1, 0x14($sp)
/* 4B4D8 8005ACD8 6BDC000C */  jal        LIGHT_Restore
/* 4B4DC 8005ACDC 1000B0AF */   sw        $s0, 0x10($sp)
/* 4B4E0 8005ACE0 DCBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x114)($gp)
/* 4B4E4 8005ACE4 00000000 */  nop
/* 4B4E8 8005ACE8 780440AC */  sw         $zero, 0x478($v0)
/* 4B4EC 8005ACEC 1000428E */  lw         $v0, 0x10($s2)
/* 4B4F0 8005ACF0 00000000 */  nop
/* 4B4F4 8005ACF4 11004018 */  blez       $v0, .L8005AD3C
/* 4B4F8 8005ACF8 21800000 */   addu      $s0, $zero, $zero
/* 4B4FC 8005ACFC 21880002 */  addu       $s1, $s0, $zero
.L8005AD00:
/* 4B500 8005AD00 1400428E */  lw         $v0, 0x14($s2)
/* 4B504 8005AD04 00000000 */  nop
/* 4B508 8005AD08 21202202 */  addu       $a0, $s1, $v0
/* 4B50C 8005AD0C 0B008290 */  lbu        $v0, 0xB($a0)
/* 4B510 8005AD10 00000000 */  nop
/* 4B514 8005AD14 10004230 */  andi       $v0, $v0, 0x10
/* 4B518 8005AD18 03004010 */  beqz       $v0, .L8005AD28
/* 4B51C 8005AD1C 00000000 */   nop
/* 4B520 8005AD20 E03E010C */  jal        LIST_DeleteFunc
/* 4B524 8005AD24 00000000 */   nop
.L8005AD28:
/* 4B528 8005AD28 1000428E */  lw         $v0, 0x10($s2)
/* 4B52C 8005AD2C 01001026 */  addiu      $s0, $s0, 0x1
/* 4B530 8005AD30 2A100202 */  slt        $v0, $s0, $v0
/* 4B534 8005AD34 F2FF4014 */  bnez       $v0, .L8005AD00
/* 4B538 8005AD38 28003126 */   addiu     $s1, $s1, 0x28
.L8005AD3C:
/* 4B53C 8005AD3C 1800428E */  lw         $v0, 0x18($s2)
/* 4B540 8005AD40 00000000 */  nop
/* 4B544 8005AD44 11004018 */  blez       $v0, .L8005AD8C
/* 4B548 8005AD48 21800000 */   addu      $s0, $zero, $zero
/* 4B54C 8005AD4C 21880002 */  addu       $s1, $s0, $zero
.L8005AD50:
/* 4B550 8005AD50 1C00428E */  lw         $v0, 0x1C($s2)
/* 4B554 8005AD54 00000000 */  nop
/* 4B558 8005AD58 21202202 */  addu       $a0, $s1, $v0
/* 4B55C 8005AD5C 0B008290 */  lbu        $v0, 0xB($a0)
/* 4B560 8005AD60 00000000 */  nop
/* 4B564 8005AD64 10004230 */  andi       $v0, $v0, 0x10
/* 4B568 8005AD68 03004010 */  beqz       $v0, .L8005AD78
/* 4B56C 8005AD6C 00000000 */   nop
/* 4B570 8005AD70 E03E010C */  jal        LIST_DeleteFunc
/* 4B574 8005AD74 00000000 */   nop
.L8005AD78:
/* 4B578 8005AD78 1800428E */  lw         $v0, 0x18($s2)
/* 4B57C 8005AD7C 01001026 */  addiu      $s0, $s0, 0x1
/* 4B580 8005AD80 2A100202 */  slt        $v0, $s0, $v0
/* 4B584 8005AD84 F2FF4014 */  bnez       $v0, .L8005AD50
/* 4B588 8005AD88 18003126 */   addiu     $s1, $s1, 0x18
.L8005AD8C:
/* 4B58C 8005AD8C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4B590 8005AD90 1800B28F */  lw         $s2, 0x18($sp)
/* 4B594 8005AD94 1400B18F */  lw         $s1, 0x14($sp)
/* 4B598 8005AD98 1000B08F */  lw         $s0, 0x10($sp)
/* 4B59C 8005AD9C 0800E003 */  jr         $ra
/* 4B5A0 8005ADA0 2000BD27 */   addiu     $sp, $sp, 0x20
.size RemoveIntroducedLights, . - RemoveIntroducedLights
