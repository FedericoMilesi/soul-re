.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ProcessTimers
/* 51654 80060E54 30CE828F */  lw         $v0, %gp_rel(numActiveEventTimers)($gp)
/* 51658 80060E58 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5165C 80060E5C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 51660 80060E60 1800B2AF */  sw         $s2, 0x18($sp)
/* 51664 80060E64 1400B1AF */  sw         $s1, 0x14($sp)
/* 51668 80060E68 3B004010 */  beqz       $v0, .L80060F58
/* 5166C 80060E6C 1000B0AF */   sw        $s0, 0x10($sp)
/* 51670 80060E70 21900000 */  addu       $s2, $zero, $zero
/* 51674 80060E74 21884002 */  addu       $s1, $s2, $zero
.L80060E78:
/* 51678 80060E78 F0CB8227 */  addiu      $v0, $gp, %gp_rel(eventTimerArray)
/* 5167C 80060E7C 21802202 */  addu       $s0, $s1, $v0
/* 51680 80060E80 0000038E */  lw         $v1, 0x0($s0)
/* 51684 80060E84 00000000 */  nop
/* 51688 80060E88 01006230 */  andi       $v0, $v1, 0x1
/* 5168C 80060E8C 2E004010 */  beqz       $v0, .L80060F48
/* 51690 80060E90 43200300 */   sra       $a0, $v1, 1
/* 51694 80060E94 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 51698 80060E98 00000000 */  nop
/* 5169C 80060E9C 2B108500 */  sltu       $v0, $a0, $a1
/* 516A0 80060EA0 03004010 */  beqz       $v0, .L80060EB0
/* 516A4 80060EA4 01006230 */   andi      $v0, $v1, 0x1
/* 516A8 80060EA8 B1830108 */  j          .L80060EC4
/* 516AC 80060EAC 000002AE */   sw        $v0, 0x0($s0)
.L80060EB0:
/* 516B0 80060EB0 01006330 */  andi       $v1, $v1, 0x1
/* 516B4 80060EB4 23108500 */  subu       $v0, $a0, $a1
/* 516B8 80060EB8 40100200 */  sll        $v0, $v0, 1
/* 516BC 80060EBC 25186200 */  or         $v1, $v1, $v0
/* 516C0 80060EC0 000003AE */  sw         $v1, 0x0($s0)
.L80060EC4:
/* 516C4 80060EC4 0000038E */  lw         $v1, 0x0($s0)
/* 516C8 80060EC8 00000000 */  nop
/* 516CC 80060ECC 43100300 */  sra        $v0, $v1, 1
/* 516D0 80060ED0 1D00401C */  bgtz       $v0, .L80060F48
/* 516D4 80060ED4 01006230 */   andi      $v0, $v1, 0x1
/* 516D8 80060ED8 0800058E */  lw         $a1, 0x8($s0)
/* 516DC 80060EDC 0400038E */  lw         $v1, 0x4($s0)
/* 516E0 80060EE0 000002AE */  sw         $v0, 0x0($s0)
/* 516E4 80060EE4 0200A294 */  lhu        $v0, 0x2($a1)
/* 516E8 80060EE8 21200002 */  addu       $a0, $s0, $zero
/* 516EC 80060EEC 50CB83AF */  sw         $v1, %gp_rel(currentEventInstance)($gp)
/* 516F0 80060EF0 FEFF4230 */  andi       $v0, $v0, 0xFFFE
/* 516F4 80060EF4 6784010C */  jal        EVENT_RemoveTimer
/* 516F8 80060EF8 0200A2A4 */   sh        $v0, 0x2($a1)
/* 516FC 80060EFC 0400048E */  lw         $a0, 0x4($s0)
/* 51700 80060F00 0800058E */  lw         $a1, 0x8($s0)
/* 51704 80060F04 1000028E */  lw         $v0, 0x10($s0)
/* 51708 80060F08 1400038E */  lw         $v1, 0x14($s0)
/* 5170C 80060F0C 0C00068E */  lw         $a2, 0xC($s0)
/* 51710 80060F10 58A480A7 */  sh         $zero, %gp_rel(EventAbortLine)($gp)
/* 51714 80060F14 ECCB82AF */  sw         $v0, %gp_rel(CurrentPuzzleLevel)($gp)
/* 51718 80060F18 64A483AF */  sw         $v1, %gp_rel(EventCurrentEventIndex)($gp)
/* 5171C 80060F1C 9886010C */  jal        EVENT_DoAction
/* 51720 80060F20 00000000 */   nop
/* 51724 80060F24 08004010 */  beqz       $v0, .L80060F48
/* 51728 80060F28 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 5172C 80060F2C 64A4858F */  lw         $a1, %gp_rel(EventCurrentEventIndex)($gp)
/* 51730 80060F30 00000000 */  nop
/* 51734 80060F34 0400A210 */  beq        $a1, $v0, .L80060F48
/* 51738 80060F38 00000000 */   nop
/* 5173C 80060F3C 0400048E */  lw         $a0, 0x4($s0)
/* 51740 80060F40 9985010C */  jal        EVENT_Process
/* 51744 80060F44 00000000 */   nop
.L80060F48:
/* 51748 80060F48 01005226 */  addiu      $s2, $s2, 0x1
/* 5174C 80060F4C 1800422A */  slti       $v0, $s2, 0x18
/* 51750 80060F50 C9FF4014 */  bnez       $v0, .L80060E78
/* 51754 80060F54 18003126 */   addiu     $s1, $s1, 0x18
.L80060F58:
/* 51758 80060F58 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5175C 80060F5C 1800B28F */  lw         $s2, 0x18($sp)
/* 51760 80060F60 1400B18F */  lw         $s1, 0x14($sp)
/* 51764 80060F64 1000B08F */  lw         $s0, 0x10($sp)
/* 51768 80060F68 0800E003 */  jr         $ra
/* 5176C 80060F6C 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_ProcessTimers, . - EVENT_ProcessTimers
