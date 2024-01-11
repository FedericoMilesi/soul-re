.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSelectMotionAnim
/* 96C4C 800A644C A4F9838F */  lw         $v1, %gp_rel(Raziel + 0x374)($gp)
/* 96C50 800A6450 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 96C54 800A6454 3800B6AF */  sw         $s6, 0x38($sp)
/* 96C58 800A6458 21B08000 */  addu       $s6, $a0, $zero
/* 96C5C 800A645C 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 96C60 800A6460 21B8A000 */  addu       $s7, $a1, $zero
/* 96C64 800A6464 3000B4AF */  sw         $s4, 0x30($sp)
/* 96C68 800A6468 21A0C000 */  addu       $s4, $a2, $zero
/* 96C6C 800A646C 4000BEAF */  sw         $fp, 0x40($sp)
/* 96C70 800A6470 21F0E000 */  addu       $fp, $a3, $zero
/* 96C74 800A6474 2000B0AF */  sw         $s0, 0x20($sp)
/* 96C78 800A6478 21800000 */  addu       $s0, $zero, $zero
/* 96C7C 800A647C 2400B1AF */  sw         $s1, 0x24($sp)
/* 96C80 800A6480 21880002 */  addu       $s1, $s0, $zero
/* 96C84 800A6484 4400BFAF */  sw         $ra, 0x44($sp)
/* 96C88 800A6488 3400B5AF */  sw         $s5, 0x34($sp)
/* 96C8C 800A648C 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 96C90 800A6490 B90E6228 */  slti       $v0, $v1, 0xEB9
/* 96C94 800A6494 3E004014 */  bnez       $v0, .L800A6590
/* 96C98 800A6498 2800B2AF */   sw        $s2, 0x28($sp)
/* 96C9C 800A649C 74FB828F */  lw         $v0, %gp_rel(Raziel + 0x544)($gp)
/* 96CA0 800A64A0 00000000 */  nop
/* 96CA4 800A64A4 05004014 */  bnez       $v0, .L800A64BC
/* 96CA8 800A64A8 FFDF0324 */   addiu     $v1, $zero, -0x2001
/* 96CAC 800A64AC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96CB0 800A64B0 00000000 */  nop
/* 96CB4 800A64B4 24104300 */  and        $v0, $v0, $v1
/* 96CB8 800A64B8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800A64BC:
/* 96CBC 800A64BC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96CC0 800A64C0 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 96CC4 800A64C4 24104300 */  and        $v0, $v0, $v1
/* 96CC8 800A64C8 04004010 */  beqz       $v0, .L800A64DC
/* 96CCC 800A64CC 00000000 */   nop
/* 96CD0 800A64D0 0000C48E */  lw         $a0, 0x0($s6)
/* 96CD4 800A64D4 FD98020C */  jal        razResetPauseTranslation
/* 96CD8 800A64D8 00000000 */   nop
.L800A64DC:
/* 96CDC 800A64DC 0000C38F */  lw         $v1, 0x0($fp)
/* 96CE0 800A64E0 3C000224 */  addiu      $v0, $zero, 0x3C
/* 96CE4 800A64E4 11006214 */  bne        $v1, $v0, .L800A652C
/* 96CE8 800A64E8 40000224 */   addiu     $v0, $zero, 0x40
/* 96CEC 800A64EC 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96CF0 800A64F0 00000000 */  nop
/* 96CF4 800A64F4 0F006230 */  andi       $v0, $v1, 0xF
/* 96CF8 800A64F8 02004010 */  beqz       $v0, .L800A6504
/* 96CFC 800A64FC 08006230 */   andi      $v0, $v1, 0x8
/* 96D00 800A6500 03001024 */  addiu      $s0, $zero, 0x3
.L800A6504:
/* 96D04 800A6504 02004010 */  beqz       $v0, .L800A6510
/* 96D08 800A6508 01006230 */   andi      $v0, $v1, 0x1
/* 96D0C 800A650C 05001124 */  addiu      $s1, $zero, 0x5
.L800A6510:
/* 96D10 800A6510 02004010 */  beqz       $v0, .L800A651C
/* 96D14 800A6514 02006230 */   andi      $v0, $v1, 0x2
/* 96D18 800A6518 17001124 */  addiu      $s1, $zero, 0x17
.L800A651C:
/* 96D1C 800A651C 14004010 */  beqz       $v0, .L800A6570
/* 96D20 800A6520 04006230 */   andi      $v0, $v1, 0x4
/* 96D24 800A6524 5C990208 */  j          .L800A6570
/* 96D28 800A6528 11001124 */   addiu     $s1, $zero, 0x11
.L800A652C:
/* 96D2C 800A652C 14006214 */  bne        $v1, $v0, .L800A6580
/* 96D30 800A6530 44000224 */   addiu     $v0, $zero, 0x44
/* 96D34 800A6534 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96D38 800A6538 00000000 */  nop
/* 96D3C 800A653C F0006230 */  andi       $v0, $v1, 0xF0
/* 96D40 800A6540 02004010 */  beqz       $v0, .L800A654C
/* 96D44 800A6544 80006230 */   andi      $v0, $v1, 0x80
/* 96D48 800A6548 03001024 */  addiu      $s0, $zero, 0x3
.L800A654C:
/* 96D4C 800A654C 02004010 */  beqz       $v0, .L800A6558
/* 96D50 800A6550 10006230 */   andi      $v0, $v1, 0x10
/* 96D54 800A6554 05001124 */  addiu      $s1, $zero, 0x5
.L800A6558:
/* 96D58 800A6558 02004010 */  beqz       $v0, .L800A6564
/* 96D5C 800A655C 20006230 */   andi      $v0, $v1, 0x20
/* 96D60 800A6560 17001124 */  addiu      $s1, $zero, 0x17
.L800A6564:
/* 96D64 800A6564 02004010 */  beqz       $v0, .L800A6570
/* 96D68 800A6568 40006230 */   andi      $v0, $v1, 0x40
/* 96D6C 800A656C 11001124 */  addiu      $s1, $zero, 0x11
.L800A6570:
/* 96D70 800A6570 75004010 */  beqz       $v0, .L800A6748
/* 96D74 800A6574 02001224 */   addiu     $s2, $zero, 0x2
/* 96D78 800A6578 D2990208 */  j          .L800A6748
/* 96D7C 800A657C 0B001124 */   addiu     $s1, $zero, 0xB
.L800A6580:
/* 96D80 800A6580 71006210 */  beq        $v1, $v0, .L800A6748
/* 96D84 800A6584 02001224 */   addiu     $s2, $zero, 0x2
/* 96D88 800A6588 D2990208 */  j          .L800A6748
/* 96D8C 800A658C 03001024 */   addiu     $s0, $zero, 0x3
.L800A6590:
/* 96D90 800A6590 20F56224 */  addiu      $v0, $v1, -0xAE0
/* 96D94 800A6594 D903422C */  sltiu      $v0, $v0, 0x3D9
/* 96D98 800A6598 39004010 */  beqz       $v0, .L800A6680
/* 96D9C 800A659C E00A6228 */   slti      $v0, $v1, 0xAE0
/* 96DA0 800A65A0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96DA4 800A65A4 FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 96DA8 800A65A8 24104300 */  and        $v0, $v0, $v1
/* 96DAC 800A65AC 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 96DB0 800A65B0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 96DB4 800A65B4 24104300 */  and        $v0, $v0, $v1
/* 96DB8 800A65B8 04004010 */  beqz       $v0, .L800A65CC
/* 96DBC 800A65BC 00000000 */   nop
/* 96DC0 800A65C0 0000C48E */  lw         $a0, 0x0($s6)
/* 96DC4 800A65C4 FD98020C */  jal        razResetPauseTranslation
/* 96DC8 800A65C8 00000000 */   nop
.L800A65CC:
/* 96DCC 800A65CC 0000C38F */  lw         $v1, 0x0($fp)
/* 96DD0 800A65D0 3C000224 */  addiu      $v0, $zero, 0x3C
/* 96DD4 800A65D4 11006214 */  bne        $v1, $v0, .L800A661C
/* 96DD8 800A65D8 44000224 */   addiu     $v0, $zero, 0x44
/* 96DDC 800A65DC 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96DE0 800A65E0 00000000 */  nop
/* 96DE4 800A65E4 0F006230 */  andi       $v0, $v1, 0xF
/* 96DE8 800A65E8 02004010 */  beqz       $v0, .L800A65F4
/* 96DEC 800A65EC 08006230 */   andi      $v0, $v1, 0x8
/* 96DF0 800A65F0 02001024 */  addiu      $s0, $zero, 0x2
.L800A65F4:
/* 96DF4 800A65F4 02004010 */  beqz       $v0, .L800A6600
/* 96DF8 800A65F8 01006230 */   andi      $v0, $v1, 0x1
/* 96DFC 800A65FC 07001124 */  addiu      $s1, $zero, 0x7
.L800A6600:
/* 96E00 800A6600 02004010 */  beqz       $v0, .L800A660C
/* 96E04 800A6604 02006230 */   andi      $v0, $v1, 0x2
/* 96E08 800A6608 0D001124 */  addiu      $s1, $zero, 0xD
.L800A660C:
/* 96E0C 800A660C 14004010 */  beqz       $v0, .L800A6660
/* 96E10 800A6610 04006230 */   andi      $v0, $v1, 0x4
/* 96E14 800A6614 98990208 */  j          .L800A6660
/* 96E18 800A6618 14001124 */   addiu     $s1, $zero, 0x14
.L800A661C:
/* 96E1C 800A661C 14006214 */  bne        $v1, $v0, .L800A6670
/* 96E20 800A6620 40000224 */   addiu     $v0, $zero, 0x40
/* 96E24 800A6624 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96E28 800A6628 00000000 */  nop
/* 96E2C 800A662C 000F6230 */  andi       $v0, $v1, 0xF00
/* 96E30 800A6630 02004010 */  beqz       $v0, .L800A663C
/* 96E34 800A6634 00086230 */   andi      $v0, $v1, 0x800
/* 96E38 800A6638 02001024 */  addiu      $s0, $zero, 0x2
.L800A663C:
/* 96E3C 800A663C 02004010 */  beqz       $v0, .L800A6648
/* 96E40 800A6640 00016230 */   andi      $v0, $v1, 0x100
/* 96E44 800A6644 07001124 */  addiu      $s1, $zero, 0x7
.L800A6648:
/* 96E48 800A6648 02004010 */  beqz       $v0, .L800A6654
/* 96E4C 800A664C 00026230 */   andi      $v0, $v1, 0x200
/* 96E50 800A6650 0D001124 */  addiu      $s1, $zero, 0xD
.L800A6654:
/* 96E54 800A6654 02004010 */  beqz       $v0, .L800A6660
/* 96E58 800A6658 00046230 */   andi      $v0, $v1, 0x400
/* 96E5C 800A665C 14001124 */  addiu      $s1, $zero, 0x14
.L800A6660:
/* 96E60 800A6660 39004010 */  beqz       $v0, .L800A6748
/* 96E64 800A6664 02001224 */   addiu     $s2, $zero, 0x2
/* 96E68 800A6668 D2990208 */  j          .L800A6748
/* 96E6C 800A666C 19001124 */   addiu     $s1, $zero, 0x19
.L800A6670:
/* 96E70 800A6670 35006210 */  beq        $v1, $v0, .L800A6748
/* 96E74 800A6674 02001224 */   addiu     $s2, $zero, 0x2
/* 96E78 800A6678 D2990208 */  j          .L800A6748
/* 96E7C 800A667C 02001024 */   addiu     $s0, $zero, 0x2
.L800A6680:
/* 96E80 800A6680 31004010 */  beqz       $v0, .L800A6748
/* 96E84 800A6684 02001224 */   addiu     $s2, $zero, 0x2
/* 96E88 800A6688 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 96E8C 800A668C 00000000 */  nop
/* 96E90 800A6690 00204234 */  ori        $v0, $v0, 0x2000
/* 96E94 800A6694 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 96E98 800A6698 0000C38F */  lw         $v1, 0x0($fp)
/* 96E9C 800A669C 40000224 */  addiu      $v0, $zero, 0x40
/* 96EA0 800A66A0 11006214 */  bne        $v1, $v0, .L800A66E8
/* 96EA4 800A66A4 44000224 */   addiu     $v0, $zero, 0x44
/* 96EA8 800A66A8 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96EAC 800A66AC 00000000 */  nop
/* 96EB0 800A66B0 F0006230 */  andi       $v0, $v1, 0xF0
/* 96EB4 800A66B4 02004010 */  beqz       $v0, .L800A66C0
/* 96EB8 800A66B8 80006230 */   andi      $v0, $v1, 0x80
/* 96EBC 800A66BC 01001024 */  addiu      $s0, $zero, 0x1
.L800A66C0:
/* 96EC0 800A66C0 02004010 */  beqz       $v0, .L800A66CC
/* 96EC4 800A66C4 10006230 */   andi      $v0, $v1, 0x10
/* 96EC8 800A66C8 0C001124 */  addiu      $s1, $zero, 0xC
.L800A66CC:
/* 96ECC 800A66CC 02004010 */  beqz       $v0, .L800A66D8
/* 96ED0 800A66D0 20006230 */   andi      $v0, $v1, 0x20
/* 96ED4 800A66D4 14001124 */  addiu      $s1, $zero, 0x14
.L800A66D8:
/* 96ED8 800A66D8 14004010 */  beqz       $v0, .L800A672C
/* 96EDC 800A66DC 40006230 */   andi      $v0, $v1, 0x40
/* 96EE0 800A66E0 CB990208 */  j          .L800A672C
/* 96EE4 800A66E4 20001124 */   addiu     $s1, $zero, 0x20
.L800A66E8:
/* 96EE8 800A66E8 14006214 */  bne        $v1, $v0, .L800A673C
/* 96EEC 800A66EC 3C000224 */   addiu     $v0, $zero, 0x3C
/* 96EF0 800A66F0 3CFB838F */  lw         $v1, %gp_rel(Raziel + 0x50C)($gp)
/* 96EF4 800A66F4 00000000 */  nop
/* 96EF8 800A66F8 000F6230 */  andi       $v0, $v1, 0xF00
/* 96EFC 800A66FC 02004010 */  beqz       $v0, .L800A6708
/* 96F00 800A6700 00086230 */   andi      $v0, $v1, 0x800
/* 96F04 800A6704 01001024 */  addiu      $s0, $zero, 0x1
.L800A6708:
/* 96F08 800A6708 02004010 */  beqz       $v0, .L800A6714
/* 96F0C 800A670C 00016230 */   andi      $v0, $v1, 0x100
/* 96F10 800A6710 0C001124 */  addiu      $s1, $zero, 0xC
.L800A6714:
/* 96F14 800A6714 02004010 */  beqz       $v0, .L800A6720
/* 96F18 800A6718 00026230 */   andi      $v0, $v1, 0x200
/* 96F1C 800A671C 14001124 */  addiu      $s1, $zero, 0x14
.L800A6720:
/* 96F20 800A6720 02004010 */  beqz       $v0, .L800A672C
/* 96F24 800A6724 00046230 */   andi      $v0, $v1, 0x400
/* 96F28 800A6728 20001124 */  addiu      $s1, $zero, 0x20
.L800A672C:
/* 96F2C 800A672C 06004010 */  beqz       $v0, .L800A6748
/* 96F30 800A6730 02001224 */   addiu     $s2, $zero, 0x2
/* 96F34 800A6734 D2990208 */  j          .L800A6748
/* 96F38 800A6738 21880000 */   addu      $s1, $zero, $zero
.L800A673C:
/* 96F3C 800A673C 02006210 */  beq        $v1, $v0, .L800A6748
/* 96F40 800A6740 02001224 */   addiu     $s2, $zero, 0x2
/* 96F44 800A6744 01001024 */  addiu      $s0, $zero, 0x1
.L800A6748:
/* 96F48 800A6748 26001212 */  beq        $s0, $s2, .L800A67E4
/* 96F4C 800A674C 0300022A */   slti      $v0, $s0, 0x3
/* 96F50 800A6750 05004010 */  beqz       $v0, .L800A6768
/* 96F54 800A6754 01000224 */   addiu     $v0, $zero, 0x1
/* 96F58 800A6758 08000212 */  beq        $s0, $v0, .L800A677C
/* 96F5C 800A675C 00000000 */   nop
/* 96F60 800A6760 2C9A0208 */  j          .L800A68B0
/* 96F64 800A6764 00000000 */   nop
.L800A6768:
/* 96F68 800A6768 03000224 */  addiu      $v0, $zero, 0x3
/* 96F6C 800A676C 37000212 */  beq        $s0, $v0, .L800A684C
/* 96F70 800A6770 00000000 */   nop
/* 96F74 800A6774 2C9A0208 */  j          .L800A68B0
/* 96F78 800A6778 00000000 */   nop
.L800A677C:
/* 96F7C 800A677C 0200F216 */  bne        $s7, $s2, .L800A6788
/* 96F80 800A6780 2128E002 */   addu      $a1, $s7, $zero
/* 96F84 800A6784 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
.L800A6788:
/* 96F88 800A6788 3C000624 */  addiu      $a2, $zero, 0x3C
/* 96F8C 800A678C 1000B4AF */  sw         $s4, 0x10($sp)
/* 96F90 800A6790 0000C48E */  lw         $a0, 0x0($s6)
/* 96F94 800A6794 5E9C020C */  jal        razSwitchVAnimGroup
/* 96F98 800A6798 21382002 */   addu      $a3, $s1, $zero
/* 96F9C 800A679C 07004010 */  beqz       $v0, .L800A67BC
/* 96FA0 800A67A0 2120C002 */   addu      $a0, $s6, $zero
/* 96FA4 800A67A4 2128E002 */  addu       $a1, $s7, $zero
/* 96FA8 800A67A8 7B000624 */  addiu      $a2, $zero, 0x7B
/* 96FAC 800A67AC 21382002 */  addu       $a3, $s1, $zero
/* 96FB0 800A67B0 1000B4AF */  sw         $s4, 0x10($sp)
/* 96FB4 800A67B4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 96FB8 800A67B8 1400B2AF */   sw        $s2, 0x14($sp)
.L800A67BC:
/* 96FBC 800A67BC 00100224 */  addiu      $v0, $zero, 0x1000
/* 96FC0 800A67C0 C4F982A7 */  sh         $v0, %gp_rel(Raziel + 0x394)($gp)
/* 96FC4 800A67C4 001C0224 */  addiu      $v0, $zero, 0x1C00
/* 96FC8 800A67C8 C6F982A7 */  sh         $v0, %gp_rel(Raziel + 0x396)($gp)
/* 96FCC 800A67CC FC080224 */  addiu      $v0, $zero, 0x8FC
/* 96FD0 800A67D0 C8F982A7 */  sh         $v0, %gp_rel(Raziel + 0x398)($gp)
/* 96FD4 800A67D4 DF0A0224 */  addiu      $v0, $zero, 0xADF
/* 96FD8 800A67D8 CAF982A7 */  sh         $v0, %gp_rel(Raziel + 0x39A)($gp)
/* 96FDC 800A67DC 2B9A0208 */  j          .L800A68AC
/* 96FE0 800A67E0 3C000224 */   addiu     $v0, $zero, 0x3C
.L800A67E4:
/* 96FE4 800A67E4 0200F216 */  bne        $s7, $s2, .L800A67F0
/* 96FE8 800A67E8 2128E002 */   addu      $a1, $s7, $zero
/* 96FEC 800A67EC 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
.L800A67F0:
/* 96FF0 800A67F0 40000624 */  addiu      $a2, $zero, 0x40
/* 96FF4 800A67F4 1000B4AF */  sw         $s4, 0x10($sp)
/* 96FF8 800A67F8 0000C48E */  lw         $a0, 0x0($s6)
/* 96FFC 800A67FC 5E9C020C */  jal        razSwitchVAnimGroup
/* 97000 800A6800 21382002 */   addu      $a3, $s1, $zero
/* 97004 800A6804 07004010 */  beqz       $v0, .L800A6824
/* 97008 800A6808 2120C002 */   addu      $a0, $s6, $zero
/* 9700C 800A680C 2128E002 */  addu       $a1, $s7, $zero
/* 97010 800A6810 7C000624 */  addiu      $a2, $zero, 0x7C
/* 97014 800A6814 21382002 */  addu       $a3, $s1, $zero
/* 97018 800A6818 1000B4AF */  sw         $s4, 0x10($sp)
/* 9701C 800A681C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 97020 800A6820 1400B2AF */   sw        $s2, 0x14($sp)
.L800A6824:
/* 97024 800A6824 CC0C0224 */  addiu      $v0, $zero, 0xCCC
/* 97028 800A6828 C4F982A7 */  sh         $v0, %gp_rel(Raziel + 0x394)($gp)
/* 9702C 800A682C 00180224 */  addiu      $v0, $zero, 0x1800
/* 97030 800A6830 C6F982A7 */  sh         $v0, %gp_rel(Raziel + 0x396)($gp)
/* 97034 800A6834 DF0A0224 */  addiu      $v0, $zero, 0xADF
/* 97038 800A6838 C8F982A7 */  sh         $v0, %gp_rel(Raziel + 0x398)($gp)
/* 9703C 800A683C B80E0224 */  addiu      $v0, $zero, 0xEB8
/* 97040 800A6840 CAF982A7 */  sh         $v0, %gp_rel(Raziel + 0x39A)($gp)
/* 97044 800A6844 2B9A0208 */  j          .L800A68AC
/* 97048 800A6848 40000224 */   addiu     $v0, $zero, 0x40
.L800A684C:
/* 9704C 800A684C 0200F216 */  bne        $s7, $s2, .L800A6858
/* 97050 800A6850 2128E002 */   addu      $a1, $s7, $zero
/* 97054 800A6854 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
.L800A6858:
/* 97058 800A6858 44000624 */  addiu      $a2, $zero, 0x44
/* 9705C 800A685C 1000B4AF */  sw         $s4, 0x10($sp)
/* 97060 800A6860 0000C48E */  lw         $a0, 0x0($s6)
/* 97064 800A6864 5E9C020C */  jal        razSwitchVAnimGroup
/* 97068 800A6868 21382002 */   addu      $a3, $s1, $zero
/* 9706C 800A686C 07004010 */  beqz       $v0, .L800A688C
/* 97070 800A6870 2120C002 */   addu      $a0, $s6, $zero
/* 97074 800A6874 2128E002 */  addu       $a1, $s7, $zero
/* 97078 800A6878 02000624 */  addiu      $a2, $zero, 0x2
/* 9707C 800A687C 21382002 */  addu       $a3, $s1, $zero
/* 97080 800A6880 1000B4AF */  sw         $s4, 0x10($sp)
/* 97084 800A6884 20C8010C */  jal        G2EmulationSwitchAnimation
/* 97088 800A6888 1400B2AF */   sw        $s2, 0x14($sp)
.L800A688C:
/* 9708C 800A688C DB0D0224 */  addiu      $v0, $zero, 0xDDB
/* 97090 800A6890 00100324 */  addiu      $v1, $zero, 0x1000
/* 97094 800A6894 C4F982A7 */  sh         $v0, %gp_rel(Raziel + 0x394)($gp)
/* 97098 800A6898 B80E0224 */  addiu      $v0, $zero, 0xEB8
/* 9709C 800A689C C8F982A7 */  sh         $v0, %gp_rel(Raziel + 0x398)($gp)
/* 970A0 800A68A0 44000224 */  addiu      $v0, $zero, 0x44
/* 970A4 800A68A4 C6F983A7 */  sh         $v1, %gp_rel(Raziel + 0x396)($gp)
/* 970A8 800A68A8 CAF983A7 */  sh         $v1, %gp_rel(Raziel + 0x39A)($gp)
.L800A68AC:
/* 970AC 800A68AC 0000C2AF */  sw         $v0, 0x0($fp)
.L800A68B0:
/* 970B0 800A68B0 4300E016 */  bnez       $s7, .L800A69C0
/* 970B4 800A68B4 0020033C */   lui       $v1, (0x20000000 >> 16)
/* 970B8 800A68B8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 970BC 800A68BC 00000000 */  nop
/* 970C0 800A68C0 24104300 */  and        $v0, $v0, $v1
/* 970C4 800A68C4 3C004014 */  bnez       $v0, .L800A69B8
/* 970C8 800A68C8 40000224 */   addiu     $v0, $zero, 0x40
/* 970CC 800A68CC 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 970D0 800A68D0 1800A0A7 */  sh         $zero, 0x18($sp)
/* 970D4 800A68D4 0000C38F */  lw         $v1, 0x0($fp)
/* 970D8 800A68D8 00000000 */  nop
/* 970DC 800A68DC 0C006210 */  beq        $v1, $v0, .L800A6910
/* 970E0 800A68E0 41006228 */   slti      $v0, $v1, 0x41
/* 970E4 800A68E4 05004010 */  beqz       $v0, .L800A68FC
/* 970E8 800A68E8 3C000224 */   addiu     $v0, $zero, 0x3C
/* 970EC 800A68EC 09006210 */  beq        $v1, $v0, .L800A6914
/* 970F0 800A68F0 F0FF0224 */   addiu     $v0, $zero, -0x10
/* 970F4 800A68F4 469A0208 */  j          .L800A6918
/* 970F8 800A68F8 00000000 */   nop
.L800A68FC:
/* 970FC 800A68FC 44000224 */  addiu      $v0, $zero, 0x44
/* 97100 800A6900 04006210 */  beq        $v1, $v0, .L800A6914
/* 97104 800A6904 C4FF0224 */   addiu     $v0, $zero, -0x3C
/* 97108 800A6908 469A0208 */  j          .L800A6918
/* 9710C 800A690C 00000000 */   nop
.L800A6910:
/* 97110 800A6910 DDFF0224 */  addiu      $v0, $zero, -0x23
.L800A6914:
/* 97114 800A6914 1A00A2A7 */  sh         $v0, 0x1A($sp)
.L800A6918:
/* 97118 800A6918 0000C48E */  lw         $a0, 0x0($s6)
/* 9711C 800A691C D696020C */  jal        razAdjustSpeed
/* 97120 800A6920 01000524 */   addiu     $a1, $zero, 0x1
/* 97124 800A6924 F058020C */  jal        G2Timer_GetFrameTime
/* 97128 800A6928 21804000 */   addu      $s0, $v0, $zero
/* 9712C 800A692C 00140200 */  sll        $v0, $v0, 16
/* 97130 800A6930 1A00A387 */  lh         $v1, 0x1A($sp)
/* 97134 800A6934 03140200 */  sra        $v0, $v0, 16
/* 97138 800A6938 18006200 */  mult       $v1, $v0
/* 9713C 800A693C 12180000 */  mflo       $v1
/* 97140 800A6940 00000000 */  nop
/* 97144 800A6944 00000000 */  nop
/* 97148 800A6948 18007000 */  mult       $v1, $s0
/* 9714C 800A694C EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 97150 800A6950 12800000 */  mflo       $s0
/* 97154 800A6954 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 97158 800A6958 03131000 */  sra        $v0, $s0, 12
/* 9715C 800A695C 18004300 */  mult       $v0, $v1
/* 97160 800A6960 21280000 */  addu       $a1, $zero, $zero
/* 97164 800A6964 C3871000 */  sra        $s0, $s0, 31
/* 97168 800A6968 10180000 */  mfhi       $v1
/* 9716C 800A696C 43110300 */  sra        $v0, $v1, 5
/* 97170 800A6970 23105000 */  subu       $v0, $v0, $s0
/* 97174 800A6974 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 97178 800A6978 0000C48E */  lw         $a0, 0x0($s6)
/* 9717C 800A697C 22000624 */  addiu      $a2, $zero, 0x22
/* 97180 800A6980 E541020C */  jal        G2Anim_IsControllerActive
/* 97184 800A6984 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 97188 800A6988 06004014 */  bnez       $v0, .L800A69A4
/* 9718C 800A698C 21280000 */   addu      $a1, $zero, $zero
/* 97190 800A6990 0000C48E */  lw         $a0, 0x0($s6)
/* 97194 800A6994 22000624 */  addiu      $a2, $zero, 0x22
/* 97198 800A6998 5641020C */  jal        G2Anim_EnableController
/* 9719C 800A699C C8018424 */   addiu     $a0, $a0, 0x1C8
/* 971A0 800A69A0 21280000 */  addu       $a1, $zero, $zero
.L800A69A4:
/* 971A4 800A69A4 22000624 */  addiu      $a2, $zero, 0x22
/* 971A8 800A69A8 0000C48E */  lw         $a0, 0x0($s6)
/* 971AC 800A69AC 1800A727 */  addiu      $a3, $sp, 0x18
/* 971B0 800A69B0 7D42020C */  jal        G2Anim_SetController_Vector
/* 971B4 800A69B4 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A69B8:
/* 971B8 800A69B8 3400E012 */  beqz       $s7, .L800A6A8C
/* 971BC 800A69BC 00000000 */   nop
.L800A69C0:
/* 971C0 800A69C0 0800C38E */  lw         $v1, 0x8($s6)
/* 971C4 800A69C4 0B80023C */  lui        $v0, %hi(StateHandlerMove)
/* 971C8 800A69C8 A8AB4224 */  addiu      $v0, $v0, %lo(StateHandlerMove)
/* 971CC 800A69CC 2F006214 */  bne        $v1, $v0, .L800A6A8C
/* 971D0 800A69D0 06001424 */   addiu     $s4, $zero, 0x6
/* 971D4 800A69D4 0000C38E */  lw         $v1, 0x0($s6)
/* 971D8 800A69D8 40101700 */  sll        $v0, $s7, 1
/* 971DC 800A69DC 21105700 */  addu       $v0, $v0, $s7
/* 971E0 800A69E0 00110200 */  sll        $v0, $v0, 4
/* 971E4 800A69E4 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 971E8 800A69E8 EC017124 */  addiu      $s1, $v1, 0x1EC
/* 971EC 800A69EC 21202002 */  addu       $a0, $s1, $zero
/* 971F0 800A69F0 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 971F4 800A69F4 21906200 */   addu      $s2, $v1, $v0
/* 971F8 800A69F8 24004014 */  bnez       $v0, .L800A6A8C
/* 971FC 800A69FC 00000000 */   nop
/* 97200 800A6A00 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 97204 800A6A04 21204002 */   addu      $a0, $s2, $zero
/* 97208 800A6A08 20004014 */  bnez       $v0, .L800A6A8C
/* 9720C 800A6A0C 00000000 */   nop
/* 97210 800A6A10 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 97214 800A6A14 21202002 */   addu      $a0, $s1, $zero
/* 97218 800A6A18 21204002 */  addu       $a0, $s2, $zero
/* 9721C 800A6A1C F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 97220 800A6A20 21804000 */   addu      $s0, $v0, $zero
/* 97224 800A6A24 19000212 */  beq        $s0, $v0, .L800A6A8C
/* 97228 800A6A28 21202002 */   addu      $a0, $s1, $zero
/* 9722C 800A6A2C 2400938C */  lw         $s3, 0x24($a0)
/* 97230 800A6A30 14009594 */  lhu        $s5, 0x14($a0)
/* 97234 800A6A34 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 97238 800A6A38 00000000 */   nop
/* 9723C 800A6A3C 21804000 */  addu       $s0, $v0, $zero
/* 97240 800A6A40 DD3F020C */  jal        G2AnimKeylist_GetKeyframeCount
/* 97244 800A6A44 21206002 */   addu      $a0, $s3, $zero
/* 97248 800A6A48 21801402 */  addu       $s0, $s0, $s4
/* 9724C 800A6A4C 1A000202 */  div        $zero, $s0, $v0
/* 97250 800A6A50 10880000 */  mfhi       $s1
/* 97254 800A6A54 2128E002 */  addu       $a1, $s7, $zero
/* 97258 800A6A58 1000B4AF */  sw         $s4, 0x10($sp)
/* 9725C 800A6A5C 0000C48E */  lw         $a0, 0x0($s6)
/* 97260 800A6A60 0000C68F */  lw         $a2, 0x0($fp)
/* 97264 800A6A64 5E9C020C */  jal        razSwitchVAnimGroup
/* 97268 800A6A68 21382002 */   addu      $a3, $s1, $zero
/* 9726C 800A6A6C 07004010 */  beqz       $v0, .L800A6A8C
/* 97270 800A6A70 58020224 */   addiu     $v0, $zero, 0x258
/* 97274 800A6A74 1000A2AF */  sw         $v0, 0x10($sp)
/* 97278 800A6A78 21204002 */  addu       $a0, $s2, $zero
/* 9727C 800A6A7C 21286002 */  addu       $a1, $s3, $zero
/* 97280 800A6A80 2130A002 */  addu       $a2, $s5, $zero
/* 97284 800A6A84 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 97288 800A6A88 21382002 */   addu      $a3, $s1, $zero
.L800A6A8C:
/* 9728C 800A6A8C 4400BF8F */  lw         $ra, 0x44($sp)
/* 97290 800A6A90 4000BE8F */  lw         $fp, 0x40($sp)
/* 97294 800A6A94 3C00B78F */  lw         $s7, 0x3C($sp)
/* 97298 800A6A98 3800B68F */  lw         $s6, 0x38($sp)
/* 9729C 800A6A9C 3400B58F */  lw         $s5, 0x34($sp)
/* 972A0 800A6AA0 3000B48F */  lw         $s4, 0x30($sp)
/* 972A4 800A6AA4 2C00B38F */  lw         $s3, 0x2C($sp)
/* 972A8 800A6AA8 2800B28F */  lw         $s2, 0x28($sp)
/* 972AC 800A6AAC 2400B18F */  lw         $s1, 0x24($sp)
/* 972B0 800A6AB0 2000B08F */  lw         $s0, 0x20($sp)
/* 972B4 800A6AB4 0800E003 */  jr         $ra
/* 972B8 800A6AB8 4800BD27 */   addiu     $sp, $sp, 0x48
.size razSelectMotionAnim, . - razSelectMotionAnim
