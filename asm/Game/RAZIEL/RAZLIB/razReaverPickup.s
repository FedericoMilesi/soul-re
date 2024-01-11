.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverPickup
/* 966F8 800A5EF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 966FC 800A5EFC 21308000 */  addu       $a2, $a0, $zero
/* 96700 800A5F00 1000B0AF */  sw         $s0, 0x10($sp)
/* 96704 800A5F04 2180A000 */  addu       $s0, $a1, $zero
/* 96708 800A5F08 21200002 */  addu       $a0, $s0, $zero
/* 9670C 800A5F0C 8000053C */  lui        $a1, (0x800002 >> 16)
/* 96710 800A5F10 1400BFAF */  sw         $ra, 0x14($sp)
/* 96714 800A5F14 A1D1000C */  jal        INSTANCE_Post
/* 96718 800A5F18 0200A534 */   ori       $a1, $a1, (0x800002 & 0xFFFF)
/* 9671C 800A5F1C 60FA90AF */  sw         $s0, %gp_rel(Raziel + 0x430)($gp)
/* 96720 800A5F20 2197020C */  jal        razGetHeldItem
/* 96724 800A5F24 00000000 */   nop
/* 96728 800A5F28 03004010 */  beqz       $v0, .L800A5F38
/* 9672C 800A5F2C 00000000 */   nop
/* 96730 800A5F30 6397020C */  jal        razReaverOff
/* 96734 800A5F34 00000000 */   nop
.L800A5F38:
/* 96738 800A5F38 38FA838F */  lw         $v1, %gp_rel(Raziel + 0x408)($gp)
/* 9673C 800A5F3C 00000000 */  nop
/* 96740 800A5F40 08006234 */  ori        $v0, $v1, 0x8
/* 96744 800A5F44 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 96748 800A5F48 68FA828F */  lw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 9674C 800A5F4C 01000724 */  addiu      $a3, $zero, 0x1
/* 96750 800A5F50 09004714 */  bne        $v0, $a3, .L800A5F78
/* 96754 800A5F54 21200002 */   addu      $a0, $s0, $zero
/* 96758 800A5F58 8000053C */  lui        $a1, (0x800103 >> 16)
/* 9675C 800A5F5C 0301A534 */  ori        $a1, $a1, (0x800103 & 0xFFFF)
/* 96760 800A5F60 02000624 */  addiu      $a2, $zero, 0x2
/* 96764 800A5F64 2110C000 */  addu       $v0, $a2, $zero
/* 96768 800A5F68 080C6334 */  ori        $v1, $v1, 0xC08
/* 9676C 800A5F6C 64FA82AF */  sw         $v0, %gp_rel(Raziel + 0x434)($gp)
/* 96770 800A5F70 E4970208 */  j          .L800A5F90
/* 96774 800A5F74 00080224 */   addiu     $v0, $zero, 0x800
.L800A5F78:
/* 96778 800A5F78 8000053C */  lui        $a1, (0x800103 >> 16)
/* 9677C 800A5F7C 0301A534 */  ori        $a1, $a1, (0x800103 & 0xFFFF)
/* 96780 800A5F80 01000624 */  addiu      $a2, $zero, 0x1
/* 96784 800A5F84 080C6334 */  ori        $v1, $v1, 0xC08
/* 96788 800A5F88 00040224 */  addiu      $v0, $zero, 0x400
/* 9678C 800A5F8C 64FA87AF */  sw         $a3, %gp_rel(Raziel + 0x434)($gp)
.L800A5F90:
/* 96790 800A5F90 38FA83AF */  sw         $v1, %gp_rel(Raziel + 0x408)($gp)
/* 96794 800A5F94 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 96798 800A5F98 58AB83AF */  sw         $v1, %gp_rel(debugRazielFlags1)($gp)
/* 9679C 800A5F9C A1D1000C */  jal        INSTANCE_Post
/* 967A0 800A5FA0 00000000 */   nop
/* 967A4 800A5FA4 1400BF8F */  lw         $ra, 0x14($sp)
/* 967A8 800A5FA8 1000B08F */  lw         $s0, 0x10($sp)
/* 967AC 800A5FAC 0800E003 */  jr         $ra
/* 967B0 800A5FB0 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverPickup, . - razReaverPickup
