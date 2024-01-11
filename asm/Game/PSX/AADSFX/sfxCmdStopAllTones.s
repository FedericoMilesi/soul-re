.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdStopAllTones
/* 47E0C 8005760C 21180000 */  addu       $v1, $zero, $zero
/* 47E10 80057610 21386000 */  addu       $a3, $v1, $zero
/* 47E14 80057614 D0000A24 */  addiu      $t2, $zero, 0xD0
/* 47E18 80057618 02000924 */  addiu      $t1, $zero, 0x2
/* 47E1C 8005761C FF000824 */  addiu      $t0, $zero, 0xFF
/* 47E20 80057620 FFFFE530 */  andi       $a1, $a3, 0xFFFF
.L80057624:
/* 47E24 80057624 C0100500 */  sll        $v0, $a1, 3
/* 47E28 80057628 23104500 */  subu       $v0, $v0, $a1
/* 47E2C 8005762C 80100200 */  sll        $v0, $v0, 2
/* 47E30 80057630 D89B868F */  lw         $a2, %gp_rel(aadMem)($gp)
/* 47E34 80057634 DC014224 */  addiu      $v0, $v0, 0x1DC
/* 47E38 80057638 2120C200 */  addu       $a0, $a2, $v0
/* 47E3C 8005763C 08008290 */  lbu        $v0, 0x8($a0)
/* 47E40 80057640 00000000 */  nop
/* 47E44 80057644 0A004A14 */  bne        $v0, $t2, .L80057670
/* 47E48 80057648 2110C500 */   addu      $v0, $a2, $a1
/* 47E4C 8005764C 7C044290 */  lbu        $v0, 0x47C($v0)
/* 47E50 80057650 00000000 */  nop
/* 47E54 80057654 06004010 */  beqz       $v0, .L80057670
/* 47E58 80057658 00000000 */   nop
/* 47E5C 8005765C 04004910 */  beq        $v0, $t1, .L80057670
/* 47E60 80057660 00000000 */   nop
/* 47E64 80057664 0000828C */  lw         $v0, 0x0($a0)
/* 47E68 80057668 080088A0 */  sb         $t0, 0x8($a0)
/* 47E6C 8005766C 25186200 */  or         $v1, $v1, $v0
.L80057670:
/* 47E70 80057670 0100E724 */  addiu      $a3, $a3, 0x1
/* 47E74 80057674 FFFFE230 */  andi       $v0, $a3, 0xFFFF
/* 47E78 80057678 1800422C */  sltiu      $v0, $v0, 0x18
/* 47E7C 8005767C E9FF4014 */  bnez       $v0, .L80057624
/* 47E80 80057680 FFFFE530 */   andi      $a1, $a3, 0xFFFF
/* 47E84 80057684 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 47E88 80057688 00000000 */  nop
/* 47E8C 8005768C C404828C */  lw         $v0, 0x4C4($a0)
/* 47E90 80057690 00000000 */  nop
/* 47E94 80057694 25104300 */  or         $v0, $v0, $v1
/* 47E98 80057698 C40482AC */  sw         $v0, 0x4C4($a0)
/* 47E9C 8005769C C804828C */  lw         $v0, 0x4C8($a0)
/* 47EA0 800576A0 27180300 */  nor        $v1, $zero, $v1
/* 47EA4 800576A4 24104300 */  and        $v0, $v0, $v1
/* 47EA8 800576A8 0800E003 */  jr         $ra
/* 47EAC 800576AC C80482AC */   sw        $v0, 0x4C8($a0)
.size sfxCmdStopAllTones, . - sfxCmdStopAllTones
