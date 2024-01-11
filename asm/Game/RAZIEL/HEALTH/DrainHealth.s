.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrainHealth
/* 94EC8 800A46C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94ECC 800A46CC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 94ED0 800A46D0 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 94ED4 800A46D4 24104300 */  and        $v0, $v0, $v1
/* 94ED8 800A46D8 3E004014 */  bnez       $v0, .L800A47D4
/* 94EDC 800A46DC 1000BFAF */   sw        $ra, 0x10($sp)
/* 94EE0 800A46E0 02008104 */  bgez       $a0, .L800A46EC
/* 94EE4 800A46E4 21108000 */   addu      $v0, $a0, $zero
/* 94EE8 800A46E8 FF0F8224 */  addiu      $v0, $a0, 0xFFF
.L800A46EC:
/* 94EEC 800A46EC 03230200 */  sra        $a0, $v0, 12
/* 94EF0 800A46F0 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 94EF4 800A46F4 01000224 */  addiu      $v0, $zero, 0x1
/* 94EF8 800A46F8 1C006214 */  bne        $v1, $v0, .L800A476C
/* 94EFC 800A46FC 00000000 */   nop
/* 94F00 800A4700 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 94F04 800A4704 00000000 */  nop
/* 94F08 800A4708 30004284 */  lh         $v0, 0x30($v0)
/* 94F0C 800A470C 00000000 */  nop
/* 94F10 800A4710 18004400 */  mult       $v0, $a0
/* 94F14 800A4714 12180000 */  mflo       $v1
/* 94F18 800A4718 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 94F1C 800A471C 00000000 */  nop
/* 94F20 800A4720 18006200 */  mult       $v1, $v0
/* 94F24 800A4724 12100000 */  mflo       $v0
/* 94F28 800A4728 03004104 */  bgez       $v0, .L800A4738
/* 94F2C 800A472C 031B0200 */   sra       $v1, $v0, 12
/* 94F30 800A4730 FF0F4224 */  addiu      $v0, $v0, 0xFFF
/* 94F34 800A4734 031B0200 */  sra        $v1, $v0, 12
.L800A4738:
/* 94F38 800A4738 2CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94F3C 800A473C 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 94F40 800A4740 21104300 */  addu       $v0, $v0, $v1
/* 94F44 800A4744 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94F48 800A4748 22008010 */  beqz       $a0, .L800A47D4
/* 94F4C 800A474C 8000053C */   lui       $a1, (0x800101 >> 16)
/* 94F50 800A4750 0101A534 */  ori        $a1, $a1, (0x800101 & 0xFFFF)
/* 94F54 800A4754 A1D1000C */  jal        INSTANCE_Post
/* 94F58 800A4758 21300000 */   addu      $a2, $zero, $zero
/* 94F5C 800A475C ED97020C */  jal        razReaverImbue
/* 94F60 800A4760 02000424 */   addiu     $a0, $zero, 0x2
/* 94F64 800A4764 F5910208 */  j          .L800A47D4
/* 94F68 800A4768 00000000 */   nop
.L800A476C:
/* 94F6C 800A476C 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 94F70 800A4770 00000000 */  nop
/* 94F74 800A4774 17004014 */  bnez       $v0, .L800A47D4
/* 94F78 800A4778 00000000 */   nop
/* 94F7C 800A477C 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 94F80 800A4780 00000000 */  nop
/* 94F84 800A4784 0E026228 */  slti       $v0, $v1, 0x20E
/* 94F88 800A4788 12004014 */  bnez       $v0, .L800A47D4
/* 94F8C 800A478C 00000000 */   nop
/* 94F90 800A4790 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 94F94 800A4794 00000000 */  nop
/* 94F98 800A4798 32004284 */  lh         $v0, 0x32($v0)
/* 94F9C 800A479C 00000000 */  nop
/* 94FA0 800A47A0 23100200 */  negu       $v0, $v0
/* 94FA4 800A47A4 18004400 */  mult       $v0, $a0
/* 94FA8 800A47A8 12400000 */  mflo       $t0
/* 94FAC 800A47AC 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 94FB0 800A47B0 00000000 */  nop
/* 94FB4 800A47B4 18000201 */  mult       $t0, $v0
/* 94FB8 800A47B8 12100000 */  mflo       $v0
/* 94FBC 800A47BC 02004104 */  bgez       $v0, .L800A47C8
/* 94FC0 800A47C0 00000000 */   nop
/* 94FC4 800A47C4 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A47C8:
/* 94FC8 800A47C8 03130200 */  sra        $v0, $v0, 12
/* 94FCC 800A47CC 21106200 */  addu       $v0, $v1, $v0
/* 94FD0 800A47D0 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
.L800A47D4:
/* 94FD4 800A47D4 1000BF8F */  lw         $ra, 0x10($sp)
/* 94FD8 800A47D8 00000000 */  nop
/* 94FDC 800A47DC 0800E003 */  jr         $ra
/* 94FE0 800A47E0 1800BD27 */   addiu     $sp, $sp, 0x18
.size DrainHealth, . - DrainHealth
