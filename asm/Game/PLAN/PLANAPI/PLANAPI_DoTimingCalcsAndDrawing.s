.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_DoTimingCalcsAndDrawing
/* 88608 80097E08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8860C 80097E0C 1800B2AF */  sw         $s2, 0x18($sp)
/* 88610 80097E10 2190A000 */  addu       $s2, $a1, $zero
/* 88614 80097E14 1400B1AF */  sw         $s1, 0x14($sp)
/* 88618 80097E18 FF7F113C */  lui        $s1, (0x7FFFFFFF >> 16)
/* 8861C 80097E1C FFFF3136 */  ori        $s1, $s1, (0x7FFFFFFF & 0xFFFF)
/* 88620 80097E20 1000B0AF */  sw         $s0, 0x10($sp)
/* 88624 80097E24 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 88628 80097E28 93F7000C */  jal        TIMER_TimeDiff
/* 8862C 80097E2C 21800000 */   addu      $s0, $zero, $zero
/* 88630 80097E30 21280002 */  addu       $a1, $s0, $zero
/* 88634 80097E34 E8F5838F */  lw         $v1, %gp_rel(timerIndex)($gp)
/* 88638 80097E38 C0F58427 */  addiu      $a0, $gp, %gp_rel(timerArray)
/* 8863C 80097E3C 80180300 */  sll        $v1, $v1, 2
/* 88640 80097E40 21186400 */  addu       $v1, $v1, $a0
/* 88644 80097E44 000062AC */  sw         $v0, 0x0($v1)
.L80097E48:
/* 88648 80097E48 0000838C */  lw         $v1, 0x0($a0)
/* 8864C 80097E4C 00000000 */  nop
/* 88650 80097E50 2A107100 */  slt        $v0, $v1, $s1
/* 88654 80097E54 02004010 */  beqz       $v0, .L80097E60
/* 88658 80097E58 2A100302 */   slt       $v0, $s0, $v1
/* 8865C 80097E5C 21886000 */  addu       $s1, $v1, $zero
.L80097E60:
/* 88660 80097E60 02004010 */  beqz       $v0, .L80097E6C
/* 88664 80097E64 00000000 */   nop
/* 88668 80097E68 21806000 */  addu       $s0, $v1, $zero
.L80097E6C:
/* 8866C 80097E6C 0100A524 */  addiu      $a1, $a1, 0x1
/* 88670 80097E70 0A00A228 */  slti       $v0, $a1, 0xA
/* 88674 80097E74 F4FF4014 */  bnez       $v0, .L80097E48
/* 88678 80097E78 04008424 */   addiu     $a0, $a0, 0x4
/* 8867C 80097E7C E8F5828F */  lw         $v0, %gp_rel(timerIndex)($gp)
/* 88680 80097E80 00000000 */  nop
/* 88684 80097E84 01004224 */  addiu      $v0, $v0, 0x1
/* 88688 80097E88 E8F582AF */  sw         $v0, %gp_rel(timerIndex)($gp)
/* 8868C 80097E8C 0A004228 */  slti       $v0, $v0, 0xA
/* 88690 80097E90 02004014 */  bnez       $v0, .L80097E9C
/* 88694 80097E94 00000000 */   nop
/* 88698 80097E98 E8F580AF */  sw         $zero, %gp_rel(timerIndex)($gp)
.L80097E9C:
/* 8869C 80097E9C 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 886A0 80097EA0 00000000 */  nop
/* 886A4 80097EA4 10004230 */  andi       $v0, $v0, 0x10
/* 886A8 80097EA8 18004010 */  beqz       $v0, .L80097F0C
/* 886AC 80097EAC 21204002 */   addu      $a0, $s2, $zero
/* 886B0 80097EB0 B664020C */  jal        PLANPOOL_NumberOfNodesOfType
/* 886B4 80097EB4 04000524 */   addiu     $a1, $zero, 0x4
/* 886B8 80097EB8 21204002 */  addu       $a0, $s2, $zero
/* 886BC 80097EBC B664020C */  jal        PLANPOOL_NumberOfNodesOfType
/* 886C0 80097EC0 0C000524 */   addiu     $a1, $zero, 0xC
/* 886C4 80097EC4 21204002 */  addu       $a0, $s2, $zero
/* 886C8 80097EC8 B664020C */  jal        PLANPOOL_NumberOfNodesOfType
/* 886CC 80097ECC 14000524 */   addiu     $a1, $zero, 0x14
/* 886D0 80097ED0 21204002 */  addu       $a0, $s2, $zero
/* 886D4 80097ED4 B664020C */  jal        PLANPOOL_NumberOfNodesOfType
/* 886D8 80097ED8 1C000524 */   addiu     $a1, $zero, 0x1C
/* 886DC 80097EDC 21204002 */  addu       $a0, $s2, $zero
/* 886E0 80097EE0 C964020C */  jal        PLANPOOL_NumberOfNodesOfSource
/* 886E4 80097EE4 21280000 */   addu      $a1, $zero, $zero
/* 886E8 80097EE8 21204002 */  addu       $a0, $s2, $zero
/* 886EC 80097EEC C964020C */  jal        PLANPOOL_NumberOfNodesOfSource
/* 886F0 80097EF0 02000524 */   addiu     $a1, $zero, 0x2
/* 886F4 80097EF4 21204002 */  addu       $a0, $s2, $zero
/* 886F8 80097EF8 C964020C */  jal        PLANPOOL_NumberOfNodesOfSource
/* 886FC 80097EFC 03000524 */   addiu     $a1, $zero, 0x3
/* 88700 80097F00 21204002 */  addu       $a0, $s2, $zero
/* 88704 80097F04 C964020C */  jal        PLANPOOL_NumberOfNodesOfSource
/* 88708 80097F08 01000524 */   addiu     $a1, $zero, 0x1
.L80097F0C:
/* 8870C 80097F0C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 88710 80097F10 1800B28F */  lw         $s2, 0x18($sp)
/* 88714 80097F14 1400B18F */  lw         $s1, 0x14($sp)
/* 88718 80097F18 1000B08F */  lw         $s0, 0x10($sp)
/* 8871C 80097F1C 0800E003 */  jr         $ra
/* 88720 80097F20 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLANAPI_DoTimingCalcsAndDrawing, . - PLANAPI_DoTimingCalcsAndDrawing
