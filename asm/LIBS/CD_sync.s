.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CD_sync
/* B4D30 800C4530 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* B4D34 800C4534 3000B6AF */  sw         $s6, 0x30($sp)
/* B4D38 800C4538 21B08000 */  addu       $s6, $a0, $zero
/* B4D3C 800C453C 3400B7AF */  sw         $s7, 0x34($sp)
/* B4D40 800C4540 21B8A000 */  addu       $s7, $a1, $zero
/* B4D44 800C4544 FFFF0424 */  addiu      $a0, $zero, -0x1
/* B4D48 800C4548 3C00BFAF */  sw         $ra, 0x3C($sp)
/* B4D4C 800C454C 3800BEAF */  sw         $fp, 0x38($sp)
/* B4D50 800C4550 2C00B5AF */  sw         $s5, 0x2C($sp)
/* B4D54 800C4554 2800B4AF */  sw         $s4, 0x28($sp)
/* B4D58 800C4558 2400B3AF */  sw         $s3, 0x24($sp)
/* B4D5C 800C455C 2000B2AF */  sw         $s2, 0x20($sp)
/* B4D60 800C4560 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B4D64 800C4564 5EF2020C */  jal        VSync
/* B4D68 800C4568 1800B0AF */   sw        $s0, 0x18($sp)
/* B4D6C 800C456C 0D801E3C */  lui        $fp, %hi(CD_comstr)
/* B4D70 800C4570 A8E9DE27 */  addiu      $fp, $fp, %lo(CD_comstr)
/* B4D74 800C4574 0D80143C */  lui        $s4, %hi(CD_intstr)
/* B4D78 800C4578 28EA9426 */  addiu      $s4, $s4, %lo(CD_intstr)
/* B4D7C 800C457C 0D80123C */  lui        $s2, %hi(CD_intstr + 0x238)
/* B4D80 800C4580 60EC5226 */  addiu      $s2, $s2, %lo(CD_intstr + 0x238)
/* B4D84 800C4584 01005526 */  addiu      $s5, $s2, 0x1
/* B4D88 800C4588 02001324 */  addiu      $s3, $zero, 0x2
/* B4D8C 800C458C C0034224 */  addiu      $v0, $v0, 0x3C0
/* B4D90 800C4590 0E80013C */  lui        $at, %hi(StStartFrame + 0x5C)
/* B4D94 800C4594 A0FD22AC */  sw         $v0, %lo(StStartFrame + 0x5C)($at)
/* B4D98 800C4598 0180023C */  lui        $v0, %hi(D_80012C18)
/* B4D9C 800C459C 182C4224 */  addiu      $v0, $v0, %lo(D_80012C18)
/* B4DA0 800C45A0 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B4DA4 800C45A4 A4FD20AC */  sw         $zero, %lo(StStartFrame + 0x60)($at)
/* B4DA8 800C45A8 0E80013C */  lui        $at, %hi(StStartFrame + 0x64)
/* B4DAC 800C45AC A8FD22AC */  sw         $v0, %lo(StStartFrame + 0x64)($at)
.L800C45B0:
/* B4DB0 800C45B0 5EF2020C */  jal        VSync
/* B4DB4 800C45B4 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B4DB8 800C45B8 0E80033C */  lui        $v1, %hi(StStartFrame + 0x5C)
/* B4DBC 800C45BC A0FD638C */  lw         $v1, %lo(StStartFrame + 0x5C)($v1)
/* B4DC0 800C45C0 00000000 */  nop
/* B4DC4 800C45C4 2A186200 */  slt        $v1, $v1, $v0
/* B4DC8 800C45C8 0C006014 */  bnez       $v1, .L800C45FC
/* B4DCC 800C45CC 00000000 */   nop
/* B4DD0 800C45D0 0E80023C */  lui        $v0, %hi(StStartFrame + 0x60)
/* B4DD4 800C45D4 A4FD428C */  lw         $v0, %lo(StStartFrame + 0x60)($v0)
/* B4DD8 800C45D8 00000000 */  nop
/* B4DDC 800C45DC 21184000 */  addu       $v1, $v0, $zero
/* B4DE0 800C45E0 01004224 */  addiu      $v0, $v0, 0x1
/* B4DE4 800C45E4 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B4DE8 800C45E8 A4FD22AC */  sw         $v0, %lo(StStartFrame + 0x60)($at)
/* B4DEC 800C45EC 3C00023C */  lui        $v0, (0x3C0000 >> 16)
/* B4DF0 800C45F0 2A104300 */  slt        $v0, $v0, $v1
/* B4DF4 800C45F4 1B004010 */  beqz       $v0, .L800C4664
/* B4DF8 800C45F8 00000000 */   nop
.L800C45FC:
/* B4DFC 800C45FC 0180043C */  lui        $a0, %hi(D_80012B90)
/* B4E00 800C4600 9901030C */  jal        puts
/* B4E04 800C4604 902B8424 */   addiu     $a0, $a0, %lo(D_80012B90)
/* B4E08 800C4608 00004492 */  lbu        $a0, 0x0($s2)
/* B4E0C 800C460C 01004292 */  lbu        $v0, 0x1($s2)
/* B4E10 800C4610 0E80053C */  lui        $a1, %hi(StStartFrame + 0x64)
/* B4E14 800C4614 A8FDA58C */  lw         $a1, %lo(StStartFrame + 0x64)($a1)
/* B4E18 800C4618 80100200 */  sll        $v0, $v0, 2
/* B4E1C 800C461C 21105400 */  addu       $v0, $v0, $s4
/* B4E20 800C4620 80200400 */  sll        $a0, $a0, 2
/* B4E24 800C4624 0000438C */  lw         $v1, 0x0($v0)
/* B4E28 800C4628 0D80023C */  lui        $v0, %hi(CD_com)
/* B4E2C 800C462C A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B4E30 800C4630 21209400 */  addu       $a0, $a0, $s4
/* B4E34 800C4634 80100200 */  sll        $v0, $v0, 2
/* B4E38 800C4638 21105E00 */  addu       $v0, $v0, $fp
/* B4E3C 800C463C 1000A3AF */  sw         $v1, 0x10($sp)
/* B4E40 800C4640 0000468C */  lw         $a2, 0x0($v0)
/* B4E44 800C4644 0000878C */  lw         $a3, 0x0($a0)
/* B4E48 800C4648 0180043C */  lui        $a0, %hi(D_80012BA0)
/* B4E4C 800C464C 06D1010C */  jal        printf
/* B4E50 800C4650 A02B8424 */   addiu     $a0, $a0, %lo(D_80012BA0)
/* B4E54 800C4654 A113030C */  jal        CD_flush
/* B4E58 800C4658 00000000 */   nop
/* B4E5C 800C465C 9A110308 */  j          .L800C4668
/* B4E60 800C4660 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800C4664:
/* B4E64 800C4664 21100000 */  addu       $v0, $zero, $zero
.L800C4668:
/* B4E68 800C4668 45004014 */  bnez       $v0, .L800C4780
/* B4E6C 800C466C FFFF0224 */   addiu     $v0, $zero, -0x1
/* B4E70 800C4670 E8E6020C */  jal        CheckCallback
/* B4E74 800C4674 00000000 */   nop
/* B4E78 800C4678 29004010 */  beqz       $v0, .L800C4720
/* B4E7C 800C467C 00000000 */   nop
/* B4E80 800C4680 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B4E84 800C4684 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B4E88 800C4688 00000000 */  nop
/* B4E8C 800C468C 00004290 */  lbu        $v0, 0x0($v0)
/* B4E90 800C4690 00000000 */  nop
/* B4E94 800C4694 03005130 */  andi       $s1, $v0, 0x3
.L800C4698:
/* B4E98 800C4698 F30F030C */  jal        func_800C3FCC
/* B4E9C 800C469C 00000000 */   nop
/* B4EA0 800C46A0 21804000 */  addu       $s0, $v0, $zero
/* B4EA4 800C46A4 1A000012 */  beqz       $s0, .L800C4710
/* B4EA8 800C46A8 04000232 */   andi      $v0, $s0, 0x4
/* B4EAC 800C46AC 0B004010 */  beqz       $v0, .L800C46DC
/* B4EB0 800C46B0 02000232 */   andi      $v0, $s0, 0x2
/* B4EB4 800C46B4 0D80023C */  lui        $v0, %hi(CD_cbready)
/* B4EB8 800C46B8 88E9428C */  lw         $v0, %lo(CD_cbready)($v0)
/* B4EBC 800C46BC 00000000 */  nop
/* B4EC0 800C46C0 05004010 */  beqz       $v0, .L800C46D8
/* B4EC4 800C46C4 00000000 */   nop
/* B4EC8 800C46C8 0000A492 */  lbu        $a0, 0x0($s5)
/* B4ECC 800C46CC 0E80053C */  lui        $a1, %hi(StStartFrame + 0x4C)
/* B4ED0 800C46D0 09F84000 */  jalr       $v0
/* B4ED4 800C46D4 90FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x4C)
.L800C46D8:
/* B4ED8 800C46D8 02000232 */  andi       $v0, $s0, 0x2
.L800C46DC:
/* B4EDC 800C46DC EEFF4010 */  beqz       $v0, .L800C4698
/* B4EE0 800C46E0 00000000 */   nop
/* B4EE4 800C46E4 0D80023C */  lui        $v0, %hi(CD_cbsync)
/* B4EE8 800C46E8 84E9428C */  lw         $v0, %lo(CD_cbsync)($v0)
/* B4EEC 800C46EC 00000000 */  nop
/* B4EF0 800C46F0 E9FF4010 */  beqz       $v0, .L800C4698
/* B4EF4 800C46F4 00000000 */   nop
/* B4EF8 800C46F8 00004492 */  lbu        $a0, 0x0($s2)
/* B4EFC 800C46FC 0E80053C */  lui        $a1, %hi(StStartFrame + 0x44)
/* B4F00 800C4700 09F84000 */  jalr       $v0
/* B4F04 800C4704 88FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x44)
/* B4F08 800C4708 A6110308 */  j          .L800C4698
/* B4F0C 800C470C 00000000 */   nop
.L800C4710:
/* B4F10 800C4710 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B4F14 800C4714 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B4F18 800C4718 00000000 */  nop
/* B4F1C 800C471C 000051A0 */  sb         $s1, 0x0($v0)
.L800C4720:
/* B4F20 800C4720 00004292 */  lbu        $v0, 0x0($s2)
/* B4F24 800C4724 00000000 */  nop
/* B4F28 800C4728 FF004630 */  andi       $a2, $v0, 0xFF
/* B4F2C 800C472C 0300D310 */  beq        $a2, $s3, .L800C473C
/* B4F30 800C4730 05000224 */   addiu     $v0, $zero, 0x5
/* B4F34 800C4734 1000C214 */  bne        $a2, $v0, .L800C4778
/* B4F38 800C4738 00000000 */   nop
.L800C473C:
/* B4F3C 800C473C 000053A2 */  sb         $s3, 0x0($s2)
/* B4F40 800C4740 2128E002 */  addu       $a1, $s7, $zero
/* B4F44 800C4744 0E80043C */  lui        $a0, %hi(StStartFrame + 0x44)
/* B4F48 800C4748 88FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x44)
/* B4F4C 800C474C 0800A010 */  beqz       $a1, .L800C4770
/* B4F50 800C4750 07000324 */   addiu     $v1, $zero, 0x7
/* B4F54 800C4754 FFFF0724 */  addiu      $a3, $zero, -0x1
.L800C4758:
/* B4F58 800C4758 00008290 */  lbu        $v0, 0x0($a0)
/* B4F5C 800C475C 01008424 */  addiu      $a0, $a0, 0x1
/* B4F60 800C4760 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B4F64 800C4764 0000A2A0 */  sb         $v0, 0x0($a1)
/* B4F68 800C4768 FBFF6714 */  bne        $v1, $a3, .L800C4758
/* B4F6C 800C476C 0100A524 */   addiu     $a1, $a1, 0x1
.L800C4770:
/* B4F70 800C4770 E0110308 */  j          .L800C4780
/* B4F74 800C4774 2110C000 */   addu      $v0, $a2, $zero
.L800C4778:
/* B4F78 800C4778 8DFFC012 */  beqz       $s6, .L800C45B0
/* B4F7C 800C477C 21100000 */   addu      $v0, $zero, $zero
.L800C4780:
/* B4F80 800C4780 3C00BF8F */  lw         $ra, 0x3C($sp)
/* B4F84 800C4784 3800BE8F */  lw         $fp, 0x38($sp)
/* B4F88 800C4788 3400B78F */  lw         $s7, 0x34($sp)
/* B4F8C 800C478C 3000B68F */  lw         $s6, 0x30($sp)
/* B4F90 800C4790 2C00B58F */  lw         $s5, 0x2C($sp)
/* B4F94 800C4794 2800B48F */  lw         $s4, 0x28($sp)
/* B4F98 800C4798 2400B38F */  lw         $s3, 0x24($sp)
/* B4F9C 800C479C 2000B28F */  lw         $s2, 0x20($sp)
/* B4FA0 800C47A0 1C00B18F */  lw         $s1, 0x1C($sp)
/* B4FA4 800C47A4 1800B08F */  lw         $s0, 0x18($sp)
/* B4FA8 800C47A8 0800E003 */  jr         $ra
/* B4FAC 800C47AC 4000BD27 */   addiu     $sp, $sp, 0x40
.size CD_sync, . - CD_sync
