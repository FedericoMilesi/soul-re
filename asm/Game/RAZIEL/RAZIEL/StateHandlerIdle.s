.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerIdle
/* 98CE0 800A84E0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 98CE4 800A84E4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 98CE8 800A84E8 21888000 */  addu       $s1, $a0, $zero
/* 98CEC 800A84EC 2000B2AF */  sw         $s2, 0x20($sp)
/* 98CF0 800A84F0 2190A000 */  addu       $s2, $a1, $zero
/* 98CF4 800A84F4 3800BEAF */  sw         $fp, 0x38($sp)
/* 98CF8 800A84F8 21F0C000 */  addu       $fp, $a2, $zero
/* 98CFC 800A84FC 3400B7AF */  sw         $s7, 0x34($sp)
/* 98D00 800A8500 21B80000 */  addu       $s7, $zero, $zero
/* 98D04 800A8504 2400B3AF */  sw         $s3, 0x24($sp)
/* 98D08 800A8508 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 98D0C 800A850C EFFF0324 */  addiu      $v1, $zero, -0x11
/* 98D10 800A8510 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 98D14 800A8514 3000B6AF */  sw         $s6, 0x30($sp)
/* 98D18 800A8518 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 98D1C 800A851C 2800B4AF */  sw         $s4, 0x28($sp)
/* 98D20 800A8520 1800B0AF */  sw         $s0, 0x18($sp)
/* 98D24 800A8524 24104300 */  and        $v0, $v0, $v1
/* 98D28 800A8528 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 98D2C 800A852C F6C9010C */  jal        G2EmulationQueryFrame
/* 98D30 800A8530 01001324 */   addiu     $s3, $zero, 0x1
/* 98D34 800A8534 21202002 */  addu       $a0, $s1, $zero
/* 98D38 800A8538 A9C9010C */  jal        G2EmulationQueryAnimation
/* 98D3C 800A853C 21284002 */   addu      $a1, $s2, $zero
/* 98D40 800A8540 21A84000 */  addu       $s5, $v0, $zero
/* 98D44 800A8544 C0101200 */  sll        $v0, $s2, 3
/* 98D48 800A8548 21105200 */  addu       $v0, $v0, $s2
/* 98D4C 800A854C C0100200 */  sll        $v0, $v0, 3
/* 98D50 800A8550 23105200 */  subu       $v0, $v0, $s2
/* 98D54 800A8554 80B00200 */  sll        $s6, $v0, 2
/* 98D58 800A8558 21A03602 */  addu       $s4, $s1, $s6
/* 98D5C 800A855C 2120D102 */  addu       $a0, $s6, $s1
.L800A8560:
/* 98D60 800A8560 39C3010C */  jal        PeekMessageQueue
/* 98D64 800A8564 0C008424 */   addiu     $a0, $a0, 0xC
/* 98D68 800A8568 21804000 */  addu       $s0, $v0, $zero
/* 98D6C 800A856C CA010012 */  beqz       $s0, .L800A8C98
/* 98D70 800A8570 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 98D74 800A8574 0000038E */  lw         $v1, 0x0($s0)
/* 98D78 800A8578 00000000 */  nop
/* 98D7C 800A857C 26016210 */  beq        $v1, $v0, .L800A8A18
/* 98D80 800A8580 2A104300 */   slt       $v0, $v0, $v1
/* 98D84 800A8584 1E004014 */  bnez       $v0, .L800A8600
/* 98D88 800A8588 0104023C */   lui       $v0, (0x4010400 >> 16)
/* 98D8C 800A858C 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 98D90 800A8590 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 98D94 800A8594 89006210 */  beq        $v1, $v0, .L800A87BC
/* 98D98 800A8598 2A104300 */   slt       $v0, $v0, $v1
/* 98D9C 800A859C 08004014 */  bnez       $v0, .L800A85C0
/* 98DA0 800A85A0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 98DA4 800A85A4 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 98DA8 800A85A8 7A006210 */  beq        $v1, $v0, .L800A8794
/* 98DAC 800A85AC 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 98DB0 800A85B0 02016210 */  beq        $v1, $v0, .L800A89BC
/* 98DB4 800A85B4 21202002 */   addu      $a0, $s1, $zero
/* 98DB8 800A85B8 1FA30208 */  j          .L800A8C7C
/* 98DBC 800A85BC 21284002 */   addu      $a1, $s2, $zero
.L800A85C0:
/* 98DC0 800A85C0 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 98DC4 800A85C4 2B006210 */  beq        $v1, $v0, .L800A8674
/* 98DC8 800A85C8 2A104300 */   slt       $v0, $v0, $v1
/* 98DCC 800A85CC 07004014 */  bnez       $v0, .L800A85EC
/* 98DD0 800A85D0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 98DD4 800A85D4 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 98DD8 800A85D8 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 98DDC 800A85DC 8C016210 */  beq        $v1, $v0, .L800A8C10
/* 98DE0 800A85E0 21202002 */   addu      $a0, $s1, $zero
/* 98DE4 800A85E4 1FA30208 */  j          .L800A8C7C
/* 98DE8 800A85E8 21284002 */   addu      $a1, $s2, $zero
.L800A85EC:
/* 98DEC 800A85EC 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 98DF0 800A85F0 33006210 */  beq        $v1, $v0, .L800A86C0
/* 98DF4 800A85F4 21202002 */   addu      $a0, $s1, $zero
/* 98DF8 800A85F8 1FA30208 */  j          .L800A8C7C
/* 98DFC 800A85FC 21284002 */   addu      $a1, $s2, $zero
.L800A8600:
/* 98E00 800A8600 00044234 */  ori        $v0, $v0, (0x4010400 & 0xFFFF)
/* 98E04 800A8604 6C016210 */  beq        $v1, $v0, .L800A8BB8
/* 98E08 800A8608 2A104300 */   slt       $v0, $v0, $v1
/* 98E0C 800A860C 0B004014 */  bnez       $v0, .L800A863C
/* 98E10 800A8610 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 98E14 800A8614 0002023C */  lui        $v0, (0x2000002 >> 16)
/* 98E18 800A8618 02004234 */  ori        $v0, $v0, (0x2000002 & 0xFFFF)
/* 98E1C 800A861C 2A104300 */  slt        $v0, $v0, $v1
/* 98E20 800A8620 98014010 */  beqz       $v0, .L800A8C84
/* 98E24 800A8624 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 98E28 800A8628 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 98E2C 800A862C 72006210 */  beq        $v1, $v0, .L800A87F8
/* 98E30 800A8630 21202002 */   addu      $a0, $s1, $zero
/* 98E34 800A8634 1FA30208 */  j          .L800A8C7C
/* 98E38 800A8638 21284002 */   addu      $a1, $s2, $zero
.L800A863C:
/* 98E3C 800A863C 29006210 */  beq        $v1, $v0, .L800A86E4
/* 98E40 800A8640 2A104300 */   slt       $v0, $v0, $v1
/* 98E44 800A8644 07004014 */  bnez       $v0, .L800A8664
/* 98E48 800A8648 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 98E4C 800A864C 0104023C */  lui        $v0, (0x4010401 >> 16)
/* 98E50 800A8650 01044234 */  ori        $v0, $v0, (0x4010401 & 0xFFFF)
/* 98E54 800A8654 66006210 */  beq        $v1, $v0, .L800A87F0
/* 98E58 800A8658 00000000 */   nop
/* 98E5C 800A865C 1EA30208 */  j          .L800A8C78
/* 98E60 800A8660 21202002 */   addu      $a0, $s1, $zero
.L800A8664:
/* 98E64 800A8664 74006210 */  beq        $v1, $v0, .L800A8838
/* 98E68 800A8668 21202002 */   addu      $a0, $s1, $zero
/* 98E6C 800A866C 1FA30208 */  j          .L800A8C7C
/* 98E70 800A8670 21284002 */   addu      $a1, $s2, $zero
.L800A8674:
/* 98E74 800A8674 0D004016 */  bnez       $s2, .L800A86AC
/* 98E78 800A8678 21202002 */   addu      $a0, $s1, $zero
/* 98E7C 800A867C 0200023C */  lui        $v0, (0x2A109 >> 16)
/* 98E80 800A8680 09A14234 */  ori        $v0, $v0, (0x2A109 & 0xFFFF)
/* 98E84 800A8684 90F993AF */  sw         $s3, %gp_rel(Raziel + 0x360)($gp)
/* 98E88 800A8688 70FA80AF */  sw         $zero, %gp_rel(Raziel + 0x440)($gp)
/* 98E8C 800A868C 0000248E */  lw         $a0, 0x0($s1)
/* 98E90 800A8690 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 98E94 800A8694 03000224 */  addiu      $v0, $zero, 0x3
/* 98E98 800A8698 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 98E9C 800A869C 938B020C */  jal        SteerSwitchMode
/* 98EA0 800A86A0 21280000 */   addu      $a1, $zero, $zero
/* 98EA4 800A86A4 C4F980A7 */  sh         $zero, %gp_rel(Raziel + 0x394)($gp)
/* 98EA8 800A86A8 21202002 */  addu       $a0, $s1, $zero
.L800A86AC:
/* 98EAC 800A86AC 0400068E */  lw         $a2, 0x4($s0)
/* 98EB0 800A86B0 8FA0020C */  jal        StateInitIdle
/* 98EB4 800A86B4 21284002 */   addu      $a1, $s2, $zero
/* 98EB8 800A86B8 22A30208 */  j          .L800A8C88
/* 98EBC 800A86BC 2120D102 */   addu      $a0, $s6, $s1
.L800A86C0:
/* 98EC0 800A86C0 71014016 */  bnez       $s2, .L800A8C88
/* 98EC4 800A86C4 2120D102 */   addu      $a0, $s6, $s1
/* 98EC8 800A86C8 0698020C */  jal        razReaverScale
/* 98ECC 800A86CC 00100424 */   addiu     $a0, $zero, 0x1000
/* 98ED0 800A86D0 0000248E */  lw         $a0, 0x0($s1)
/* 98ED4 800A86D4 FD98020C */  jal        razResetPauseTranslation
/* 98ED8 800A86D8 00000000 */   nop
/* 98EDC 800A86DC E0A10208 */  j          .L800A8780
/* 98EE0 800A86E0 00000000 */   nop
.L800A86E4:
/* 98EE4 800A86E4 D7000224 */  addiu      $v0, $zero, 0xD7
/* 98EE8 800A86E8 0700A216 */  bne        $s5, $v0, .L800A8708
/* 98EEC 800A86EC D6000224 */   addiu     $v0, $zero, 0xD6
/* 98EF0 800A86F0 7FFF033C */  lui        $v1, (0xFF7FFFFF >> 16)
/* 98EF4 800A86F4 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 98EF8 800A86F8 FFFF6334 */  ori        $v1, $v1, (0xFF7FFFFF & 0xFFFF)
/* 98EFC 800A86FC 24104300 */  and        $v0, $v0, $v1
/* 98F00 800A8700 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 98F04 800A8704 D6000224 */  addiu      $v0, $zero, 0xD6
.L800A8708:
/* 98F08 800A8708 0B00A216 */  bne        $s5, $v0, .L800A8738
/* 98F0C 800A870C 21200000 */   addu      $a0, $zero, $zero
/* 98F10 800A8710 21202002 */  addu       $a0, $s1, $zero
/* 98F14 800A8714 21284002 */  addu       $a1, $s2, $zero
/* 98F18 800A8718 D7000624 */  addiu      $a2, $zero, 0xD7
/* 98F1C 800A871C 21380000 */  addu       $a3, $zero, $zero
/* 98F20 800A8720 03000224 */  addiu      $v0, $zero, 0x3
/* 98F24 800A8724 1000A2AF */  sw         $v0, 0x10($sp)
/* 98F28 800A8728 20C8010C */  jal        G2EmulationSwitchAnimation
/* 98F2C 800A872C 1400B3AF */   sw        $s3, 0x14($sp)
/* 98F30 800A8730 22A30208 */  j          .L800A8C88
/* 98F34 800A8734 2120D102 */   addu      $a0, $s6, $s1
.L800A8738:
/* 98F38 800A8738 21288000 */  addu       $a1, $a0, $zero
/* 98F3C 800A873C 4FC6010C */  jal        SetControlInitIdleData
/* 98F40 800A8740 03000624 */   addiu     $a2, $zero, 0x3
/* 98F44 800A8744 21202002 */  addu       $a0, $s1, $zero
/* 98F48 800A8748 21284002 */  addu       $a1, $s2, $zero
/* 98F4C 800A874C 8FA0020C */  jal        StateInitIdle
/* 98F50 800A8750 21304000 */   addu      $a2, $v0, $zero
/* 98F54 800A8754 4C014016 */  bnez       $s2, .L800A8C88
/* 98F58 800A8758 2120D102 */   addu      $a0, $s6, $s1
/* 98F5C 800A875C E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* 98F60 800A8760 0100033C */  lui        $v1, (0x10000 >> 16)
/* 98F64 800A8764 24104300 */  and        $v0, $v0, $v1
/* 98F68 800A8768 05004014 */  bnez       $v0, .L800A8780
/* 98F6C 800A876C FFFF033C */   lui       $v1, (0xFFFF7FFF >> 16)
/* 98F70 800A8770 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 98F74 800A8774 FF7F6334 */  ori        $v1, $v1, (0xFFFF7FFF & 0xFFFF)
/* 98F78 800A8778 24104300 */  and        $v0, $v0, $v1
/* 98F7C 800A877C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800A8780:
/* 98F80 800A8780 0000248E */  lw         $a0, 0x0($s1)
/* 98F84 800A8784 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 98F88 800A8788 01000524 */   addiu     $a1, $zero, 0x1
/* 98F8C 800A878C 22A30208 */  j          .L800A8C88
/* 98F90 800A8790 2120D102 */   addu      $a0, $s6, $s1
.L800A8794:
/* 98F94 800A8794 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 98F98 800A8798 00000000 */  nop
/* 98F9C 800A879C 80004230 */  andi       $v0, $v0, 0x80
/* 98FA0 800A87A0 39014014 */  bnez       $v0, .L800A8C88
/* 98FA4 800A87A4 2120D102 */   addu      $a0, $s6, $s1
/* 98FA8 800A87A8 21202002 */  addu       $a0, $s1, $zero
/* 98FAC 800A87AC 21284002 */  addu       $a1, $s2, $zero
/* 98FB0 800A87B0 0A80063C */  lui        $a2, %hi(StateHandlerAttack2)
/* 98FB4 800A87B4 6BA20208 */  j          .L800A89AC
/* 98FB8 800A87B8 E4BDC624 */   addiu     $a2, $a2, %lo(StateHandlerAttack2)
.L800A87BC:
/* 98FBC 800A87BC 32014016 */  bnez       $s2, .L800A8C88
/* 98FC0 800A87C0 2120D102 */   addu      $a0, $s6, $s1
/* 98FC4 800A87C4 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 98FC8 800A87C8 88A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x4)($gp)
/* 98FCC 800A87CC 0000428C */  lw         $v0, 0x0($v0)
/* 98FD0 800A87D0 00000000 */  nop
/* 98FD4 800A87D4 24104300 */  and        $v0, $v0, $v1
/* 98FD8 800A87D8 2B014010 */  beqz       $v0, .L800A8C88
/* 98FDC 800A87DC 0B80053C */   lui       $a1, %hi(StateHandlerSoulSuck)
/* 98FE0 800A87E0 38FB80AF */  sw         $zero, %gp_rel(Raziel + 0x508)($gp)
/* 98FE4 800A87E4 21202002 */  addu       $a0, $s1, $zero
/* 98FE8 800A87E8 1AA30208 */  j          .L800A8C68
/* 98FEC 800A87EC E09AA524 */   addiu     $a1, $a1, %lo(StateHandlerSoulSuck)
.L800A87F0:
/* 98FF0 800A87F0 21A30208 */  j          .L800A8C84
/* 98FF4 800A87F4 01001724 */   addiu     $s7, $zero, 0x1
.L800A87F8:
/* 98FF8 800A87F8 23014016 */  bnez       $s2, .L800A8C88
/* 98FFC 800A87FC 2120D102 */   addu      $a0, $s6, $s1
/* 99000 800A8800 0400028E */  lw         $v0, 0x4($s0)
/* 99004 800A8804 00000000 */  nop
/* 99008 800A8808 06004010 */  beqz       $v0, .L800A8824
/* 9900C 800A880C 00000000 */   nop
/* 99010 800A8810 0000248E */  lw         $a0, 0x0($s1)
/* 99014 800A8814 FD98020C */  jal        razResetPauseTranslation
/* 99018 800A8818 00000000 */   nop
/* 9901C 800A881C 22A30208 */  j          .L800A8C88
/* 99020 800A8820 2120D102 */   addu      $a0, $s6, $s1
.L800A8824:
/* 99024 800A8824 0000248E */  lw         $a0, 0x0($s1)
/* 99028 800A8828 E098020C */  jal        razSetPauseTranslation
/* 9902C 800A882C 00000000 */   nop
/* 99030 800A8830 22A30208 */  j          .L800A8C88
/* 99034 800A8834 2120D102 */   addu      $a0, $s6, $s1
.L800A8838:
/* 99038 800A8838 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9903C 800A883C A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* 99040 800A8840 0000428C */  lw         $v0, 0x0($v0)
/* 99044 800A8844 00000000 */  nop
/* 99048 800A8848 24104300 */  and        $v0, $v0, $v1
/* 9904C 800A884C 4E004014 */  bnez       $v0, .L800A8988
/* 99050 800A8850 21284002 */   addu      $a1, $s2, $zero
/* 99054 800A8854 B4F98387 */  lh         $v1, %gp_rel(Raziel + 0x384)($gp)
/* 99058 800A8858 00000000 */  nop
/* 9905C 800A885C 00FE6228 */  slti       $v0, $v1, -0x200
/* 99060 800A8860 1E004010 */  beqz       $v0, .L800A88DC
/* 99064 800A8864 01026228 */   slti      $v0, $v1, 0x201
/* 99068 800A8868 0C005316 */  bne        $s2, $s3, .L800A889C
/* 9906C 800A886C 00000000 */   nop
/* 99070 800A8870 2F97020C */  jal        razGetHeldWeapon
/* 99074 800A8874 00000000 */   nop
/* 99078 800A8878 0F004014 */  bnez       $v0, .L800A88B8
/* 9907C 800A887C 01000524 */   addiu     $a1, $zero, 0x1
/* 99080 800A8880 21202002 */  addu       $a0, $s1, $zero
/* 99084 800A8884 36000624 */  addiu      $a2, $zero, 0x36
/* 99088 800A8888 21380000 */  addu       $a3, $zero, $zero
/* 9908C 800A888C 02000224 */  addiu      $v0, $zero, 0x2
/* 99090 800A8890 1000A2AF */  sw         $v0, 0x10($sp)
/* 99094 800A8894 2CA20208 */  j          .L800A88B0
/* 99098 800A8898 1400B2AF */   sw        $s2, 0x14($sp)
.L800A889C:
/* 9909C 800A889C 36000624 */  addiu      $a2, $zero, 0x36
/* 990A0 800A88A0 21380000 */  addu       $a3, $zero, $zero
/* 990A4 800A88A4 02000224 */  addiu      $v0, $zero, 0x2
/* 990A8 800A88A8 1000A2AF */  sw         $v0, 0x10($sp)
/* 990AC 800A88AC 1400B3AF */  sw         $s3, 0x14($sp)
.L800A88B0:
/* 990B0 800A88B0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 990B4 800A88B4 00000000 */   nop
.L800A88B8:
/* 990B8 800A88B8 21202002 */  addu       $a0, $s1, $zero
/* 990BC 800A88BC 21284002 */  addu       $a1, $s2, $zero
/* 990C0 800A88C0 0B80063C */  lui        $a2, %hi(StateHandlerStartTurn)
/* 990C4 800A88C4 18A0C624 */  addiu      $a2, $a2, %lo(StateHandlerStartTurn)
/* 990C8 800A88C8 C1CA010C */  jal        StateSwitchStateData
/* 990CC 800A88CC 21380000 */   addu      $a3, $zero, $zero
/* 990D0 800A88D0 34000224 */  addiu      $v0, $zero, 0x34
/* 990D4 800A88D4 21A30208 */  j          .L800A8C84
/* 990D8 800A88D8 1C0182AE */   sw        $v0, 0x11C($s4)
.L800A88DC:
/* 990DC 800A88DC 22004014 */  bnez       $v0, .L800A8968
/* 990E0 800A88E0 00000000 */   nop
/* 990E4 800A88E4 0F005316 */  bne        $s2, $s3, .L800A8924
/* 990E8 800A88E8 21202002 */   addu      $a0, $s1, $zero
/* 990EC 800A88EC 0000228E */  lw         $v0, 0x0($s1)
/* 990F0 800A88F0 00000000 */  nop
/* 990F4 800A88F4 4C01428C */  lw         $v0, 0x14C($v0)
/* 990F8 800A88F8 00000000 */  nop
/* 990FC 800A88FC 13004014 */  bnez       $v0, .L800A894C
/* 99100 800A8900 21284002 */   addu      $a1, $s2, $zero
/* 99104 800A8904 21202002 */  addu       $a0, $s1, $zero
/* 99108 800A8908 01000524 */  addiu      $a1, $zero, 0x1
/* 9910C 800A890C 35000624 */  addiu      $a2, $zero, 0x35
/* 99110 800A8910 21380000 */  addu       $a3, $zero, $zero
/* 99114 800A8914 02000224 */  addiu      $v0, $zero, 0x2
/* 99118 800A8918 1000A2AF */  sw         $v0, 0x10($sp)
/* 9911C 800A891C 4FA20208 */  j          .L800A893C
/* 99120 800A8920 1400B2AF */   sw        $s2, 0x14($sp)
.L800A8924:
/* 99124 800A8924 21284002 */  addu       $a1, $s2, $zero
/* 99128 800A8928 35000624 */  addiu      $a2, $zero, 0x35
/* 9912C 800A892C 21380000 */  addu       $a3, $zero, $zero
/* 99130 800A8930 02000224 */  addiu      $v0, $zero, 0x2
/* 99134 800A8934 1000A2AF */  sw         $v0, 0x10($sp)
/* 99138 800A8938 1400B3AF */  sw         $s3, 0x14($sp)
.L800A893C:
/* 9913C 800A893C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 99140 800A8940 00000000 */   nop
/* 99144 800A8944 21202002 */  addu       $a0, $s1, $zero
/* 99148 800A8948 21284002 */  addu       $a1, $s2, $zero
.L800A894C:
/* 9914C 800A894C 0B80063C */  lui        $a2, %hi(StateHandlerStartTurn)
/* 99150 800A8950 18A0C624 */  addiu      $a2, $a2, %lo(StateHandlerStartTurn)
/* 99154 800A8954 C1CA010C */  jal        StateSwitchStateData
/* 99158 800A8958 21380000 */   addu      $a3, $zero, $zero
/* 9915C 800A895C 33000224 */  addiu      $v0, $zero, 0x33
/* 99160 800A8960 21A30208 */  j          .L800A8C84
/* 99164 800A8964 1C0182AE */   sw        $v0, 0x11C($s4)
.L800A8968:
/* 99168 800A8968 C700E016 */  bnez       $s7, .L800A8C88
/* 9916C 800A896C 2120D102 */   addu      $a0, $s6, $s1
/* 99170 800A8970 A4F9828F */  lw         $v0, %gp_rel(Raziel + 0x374)($gp)
/* 99174 800A8974 00000000 */  nop
/* 99178 800A8978 00104228 */  slti       $v0, $v0, 0x1000
/* 9917C 800A897C 08004010 */  beqz       $v0, .L800A89A0
/* 99180 800A8980 21202002 */   addu      $a0, $s1, $zero
/* 99184 800A8984 21284002 */  addu       $a1, $s2, $zero
.L800A8988:
/* 99188 800A8988 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9918C 800A898C A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 99190 800A8990 C1CA010C */  jal        StateSwitchStateData
/* 99194 800A8994 03000724 */   addiu     $a3, $zero, 0x3
/* 99198 800A8998 22A30208 */  j          .L800A8C88
/* 9919C 800A899C 2120D102 */   addu      $a0, $s6, $s1
.L800A89A0:
/* 991A0 800A89A0 21284002 */  addu       $a1, $s2, $zero
/* 991A4 800A89A4 0B80063C */  lui        $a2, %hi(StateHandlerStartMove)
/* 991A8 800A89A8 C4A2C624 */  addiu      $a2, $a2, %lo(StateHandlerStartMove)
.L800A89AC:
/* 991AC 800A89AC C1CA010C */  jal        StateSwitchStateData
/* 991B0 800A89B0 21380000 */   addu      $a3, $zero, $zero
/* 991B4 800A89B4 22A30208 */  j          .L800A8C88
/* 991B8 800A89B8 2120D102 */   addu      $a0, $s6, $s1
.L800A89BC:
/* 991BC 800A89BC B2004016 */  bnez       $s2, .L800A8C88
/* 991C0 800A89C0 2120D102 */   addu      $a0, $s6, $s1
/* 991C4 800A89C4 10000524 */  addiu      $a1, $zero, 0x10
/* 991C8 800A89C8 21300000 */  addu       $a2, $zero, $zero
/* 991CC 800A89CC 2110A000 */  addu       $v0, $a1, $zero
/* 991D0 800A89D0 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 991D4 800A89D4 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 991D8 800A89D8 0000248E */  lw         $a0, 0x0($s1)
/* 991DC 800A89DC 25104500 */  or         $v0, $v0, $a1
/* 991E0 800A89E0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 991E4 800A89E4 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 991E8 800A89E8 2138C000 */   addu      $a3, $a2, $zero
/* 991EC 800A89EC 06004010 */  beqz       $v0, .L800A8A08
/* 991F0 800A89F0 21202002 */   addu      $a0, $s1, $zero
/* 991F4 800A89F4 1000B3AF */  sw         $s3, 0x10($sp)
/* 991F8 800A89F8 22000524 */  addiu      $a1, $zero, 0x22
/* 991FC 800A89FC 21300000 */  addu       $a2, $zero, $zero
/* 99200 800A8A00 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99204 800A8A04 02000724 */   addiu     $a3, $zero, 0x2
.L800A8A08:
/* 99208 800A8A08 21202002 */  addu       $a0, $s1, $zero
/* 9920C 800A8A0C 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 99210 800A8A10 1AA30208 */  j          .L800A8C68
/* 99214 800A8A14 ACB5A524 */   addiu     $a1, $a1, %lo(StateHandlerCompression)
.L800A8A18:
/* 99218 800A8A18 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9921C 800A8A1C 00000000 */  nop
/* 99220 800A8A20 01004230 */  andi       $v0, $v0, 0x1
/* 99224 800A8A24 19004010 */  beqz       $v0, .L800A8A8C
/* 99228 800A8A28 03000224 */   addiu     $v0, $zero, 0x3
/* 9922C 800A8A2C 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 99230 800A8A30 00000000 */  nop
/* 99234 800A8A34 15006210 */  beq        $v1, $v0, .L800A8A8C
/* 99238 800A8A38 00020224 */   addiu     $v0, $zero, 0x200
/* 9923C 800A8A3C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 99240 800A8A40 0C004016 */  bnez       $s2, .L800A8A74
/* 99244 800A8A44 1C0180AE */   sw        $zero, 0x11C($s4)
/* 99248 800A8A48 1000B3AF */  sw         $s3, 0x10($sp)
/* 9924C 800A8A4C 21202002 */  addu       $a0, $s1, $zero
/* 99250 800A8A50 15000524 */  addiu      $a1, $zero, 0x15
/* 99254 800A8A54 21300000 */  addu       $a2, $zero, $zero
/* 99258 800A8A58 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9925C 800A8A5C 06000724 */   addiu     $a3, $zero, 0x6
/* 99260 800A8A60 21202002 */  addu       $a0, $s1, $zero
/* 99264 800A8A64 0B80053C */  lui        $a1, %hi(StateHandlerPushObject)
/* 99268 800A8A68 98D8A524 */  addiu      $a1, $a1, %lo(StateHandlerPushObject)
/* 9926C 800A8A6C F4CA010C */  jal        StateSwitchStateCharacterData
/* 99270 800A8A70 21300000 */   addu      $a2, $zero, $zero
.L800A8A74:
/* 99274 800A8A74 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 99278 800A8A78 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 9927C 800A8A7C 24104300 */  and        $v0, $v0, $v1
/* 99280 800A8A80 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 99284 800A8A84 22A30208 */  j          .L800A8C88
/* 99288 800A8A88 2120D102 */   addu      $a0, $s6, $s1
.L800A8A8C:
/* 9928C 800A8A8C 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 99290 800A8A90 00000000 */  nop
/* 99294 800A8A94 08004230 */  andi       $v0, $v0, 0x8
/* 99298 800A8A98 0B004010 */  beqz       $v0, .L800A8AC8
/* 9929C 800A8A9C 03000224 */   addiu     $v0, $zero, 0x3
/* 992A0 800A8AA0 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 992A4 800A8AA4 00000000 */  nop
/* 992A8 800A8AA8 07006210 */  beq        $v1, $v0, .L800A8AC8
/* 992AC 800A8AAC 00000000 */   nop
/* 992B0 800A8AB0 75004016 */  bnez       $s2, .L800A8C88
/* 992B4 800A8AB4 2120D102 */   addu      $a0, $s6, $s1
/* 992B8 800A8AB8 21202002 */  addu       $a0, $s1, $zero
/* 992BC 800A8ABC 0B80053C */  lui        $a1, %hi(StateHandlerPullSwitch)
/* 992C0 800A8AC0 1AA30208 */  j          .L800A8C68
/* 992C4 800A8AC4 BCDFA524 */   addiu     $a1, $a1, %lo(StateHandlerPullSwitch)
.L800A8AC8:
/* 992C8 800A8AC8 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 992CC 800A8ACC 00000000 */  nop
/* 992D0 800A8AD0 10206230 */  andi       $v0, $v1, 0x2010
/* 992D4 800A8AD4 17004010 */  beqz       $v0, .L800A8B34
/* 992D8 800A8AD8 00086230 */   andi      $v0, $v1, 0x800
/* 992DC 800A8ADC 6A004016 */  bnez       $s2, .L800A8C88
/* 992E0 800A8AE0 2120D102 */   addu      $a0, $s6, $s1
/* 992E4 800A8AE4 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 992E8 800A8AE8 03000224 */  addiu      $v0, $zero, 0x3
/* 992EC 800A8AEC 0E006214 */  bne        $v1, $v0, .L800A8B28
/* 992F0 800A8AF0 21202002 */   addu      $a0, $s1, $zero
/* 992F4 800A8AF4 2197020C */  jal        razGetHeldItem
/* 992F8 800A8AF8 00000000 */   nop
/* 992FC 800A8AFC 62004010 */  beqz       $v0, .L800A8C88
/* 99300 800A8B00 2120D102 */   addu      $a0, $s6, $s1
/* 99304 800A8B04 21204000 */  addu       $a0, $v0, $zero
/* 99308 800A8B08 92D1000C */  jal        INSTANCE_Query
/* 9930C 800A8B0C 02000524 */   addiu     $a1, $zero, 0x2
/* 99310 800A8B10 20004230 */  andi       $v0, $v0, 0x20
/* 99314 800A8B14 5B004010 */  beqz       $v0, .L800A8C84
/* 99318 800A8B18 0B80053C */   lui       $a1, %hi(StateHandlerBreakOff)
/* 9931C 800A8B1C 21202002 */  addu       $a0, $s1, $zero
/* 99320 800A8B20 1AA30208 */  j          .L800A8C68
/* 99324 800A8B24 C4DBA524 */   addiu     $a1, $a1, %lo(StateHandlerBreakOff)
.L800A8B28:
/* 99328 800A8B28 0B80053C */  lui        $a1, %hi(StateHandlerBreakOff)
/* 9932C 800A8B2C 1AA30208 */  j          .L800A8C68
/* 99330 800A8B30 C4DBA524 */   addiu     $a1, $a1, %lo(StateHandlerBreakOff)
.L800A8B34:
/* 99334 800A8B34 0A004010 */  beqz       $v0, .L800A8B60
/* 99338 800A8B38 00406230 */   andi      $v0, $v1, 0x4000
/* 9933C 800A8B3C 52005316 */  bne        $s2, $s3, .L800A8C88
/* 99340 800A8B40 2120D102 */   addu      $a0, $s6, $s1
/* 99344 800A8B44 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 99348 800A8B48 0000248E */  lw         $a0, 0x0($s1)
/* 9934C 800A8B4C 5800458C */  lw         $a1, 0x58($v0)
/* 99350 800A8B50 BE97020C */  jal        razReaverPickup
/* 99354 800A8B54 00000000 */   nop
/* 99358 800A8B58 22A30208 */  j          .L800A8C88
/* 9935C 800A8B5C 2120D102 */   addu      $a0, $s6, $s1
.L800A8B60:
/* 99360 800A8B60 07004010 */  beqz       $v0, .L800A8B80
/* 99364 800A8B64 21202002 */   addu      $a0, $s1, $zero
/* 99368 800A8B68 47004016 */  bnez       $s2, .L800A8C88
/* 9936C 800A8B6C 2120D102 */   addu      $a0, $s6, $s1
/* 99370 800A8B70 21202002 */  addu       $a0, $s1, $zero
/* 99374 800A8B74 0A80053C */  lui        $a1, %hi(StateHandlerWarpGate)
/* 99378 800A8B78 1AA30208 */  j          .L800A8C68
/* 9937C 800A8B7C 04B2A524 */   addiu     $a1, $a1, %lo(StateHandlerWarpGate)
.L800A8B80:
/* 99380 800A8B80 3A96020C */  jal        razPickupAndGrab
/* 99384 800A8B84 21284002 */   addu      $a1, $s2, $zero
/* 99388 800A8B88 3F004010 */  beqz       $v0, .L800A8C88
/* 9938C 800A8B8C 2120D102 */   addu      $a0, $s6, $s1
/* 99390 800A8B90 3D004016 */  bnez       $s2, .L800A8C88
/* 99394 800A8B94 00000000 */   nop
/* 99398 800A8B98 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9939C 800A8B9C 00000000 */  nop
/* 993A0 800A8BA0 80004230 */  andi       $v0, $v0, 0x80
/* 993A4 800A8BA4 38004014 */  bnez       $v0, .L800A8C88
/* 993A8 800A8BA8 0A80053C */   lui       $a1, %hi(StateHandlerAttack2)
/* 993AC 800A8BAC 21202002 */  addu       $a0, $s1, $zero
/* 993B0 800A8BB0 1AA30208 */  j          .L800A8C68
/* 993B4 800A8BB4 E4BDA524 */   addiu     $a1, $a1, %lo(StateHandlerAttack2)
.L800A8BB8:
/* 993B8 800A8BB8 0400028E */  lw         $v0, 0x4($s0)
/* 993BC 800A8BBC 00000000 */  nop
/* 993C0 800A8BC0 2000428C */  lw         $v0, 0x20($v0)
/* 993C4 800A8BC4 0200033C */  lui        $v1, (0x20000 >> 16)
/* 993C8 800A8BC8 24104300 */  and        $v0, $v0, $v1
/* 993CC 800A8BCC 2E004010 */  beqz       $v0, .L800A8C88
/* 993D0 800A8BD0 2120D102 */   addu      $a0, $s6, $s1
/* 993D4 800A8BD4 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 993D8 800A8BD8 00000000 */  nop
/* 993DC 800A8BDC 01004230 */  andi       $v0, $v0, 0x1
/* 993E0 800A8BE0 29004010 */  beqz       $v0, .L800A8C88
/* 993E4 800A8BE4 02000224 */   addiu     $v0, $zero, 0x2
/* 993E8 800A8BE8 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 993EC 800A8BEC 00000000 */  nop
/* 993F0 800A8BF0 25006214 */  bne        $v1, $v0, .L800A8C88
/* 993F4 800A8BF4 0100033C */   lui       $v1, (0x10000 >> 16)
/* 993F8 800A8BF8 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 993FC 800A8BFC 00000000 */  nop
/* 99400 800A8C00 25104300 */  or         $v0, $v0, $v1
/* 99404 800A8C04 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 99408 800A8C08 22A30208 */  j          .L800A8C88
/* 9940C 800A8C0C 00000000 */   nop
.L800A8C10:
/* 99410 800A8C10 1D004016 */  bnez       $s2, .L800A8C88
/* 99414 800A8C14 2120D102 */   addu      $a0, $s6, $s1
/* 99418 800A8C18 CCF9838F */  lw         $v1, %gp_rel(Raziel + 0x39C)($gp)
/* 9941C 800A8C1C 00000000 */  nop
/* 99420 800A8C20 04006230 */  andi       $v0, $v1, 0x4
/* 99424 800A8C24 18004010 */  beqz       $v0, .L800A8C88
/* 99428 800A8C28 80006230 */   andi      $v0, $v1, 0x80
/* 9942C 800A8C2C 06004014 */  bnez       $v0, .L800A8C48
/* 99430 800A8C30 94002426 */   addiu     $a0, $s1, 0x94
/* 99434 800A8C34 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 99438 800A8C38 00000000 */  nop
/* 9943C 800A8C3C 04004230 */  andi       $v0, $v0, 0x4
/* 99440 800A8C40 07004010 */  beqz       $v0, .L800A8C60
/* 99444 800A8C44 0B80053C */   lui       $a1, %hi(StateHandlerGlyphs)
.L800A8C48:
/* 99448 800A8C48 0080053C */  lui        $a1, (0x80000010 >> 16)
/* 9944C 800A8C4C 1000A534 */  ori        $a1, $a1, (0x80000010 & 0xFFFF)
/* 99450 800A8C50 4EC3010C */  jal        EnMessageQueueData
/* 99454 800A8C54 21300000 */   addu      $a2, $zero, $zero
/* 99458 800A8C58 22A30208 */  j          .L800A8C88
/* 9945C 800A8C5C 2120D102 */   addu      $a0, $s6, $s1
.L800A8C60:
/* 99460 800A8C60 21202002 */  addu       $a0, $s1, $zero
/* 99464 800A8C64 50F6A524 */  addiu      $a1, $a1, %lo(StateHandlerGlyphs)
.L800A8C68:
/* 99468 800A8C68 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9946C 800A8C6C 21300000 */   addu      $a2, $zero, $zero
/* 99470 800A8C70 22A30208 */  j          .L800A8C88
/* 99474 800A8C74 2120D102 */   addu      $a0, $s6, $s1
.L800A8C78:
/* 99478 800A8C78 21284002 */  addu       $a1, $s2, $zero
.L800A8C7C:
/* 9947C 800A8C7C B9BF020C */  jal        DefaultStateHandler
/* 99480 800A8C80 2130C003 */   addu      $a2, $fp, $zero
.L800A8C84:
/* 99484 800A8C84 2120D102 */  addu       $a0, $s6, $s1
.L800A8C88:
/* 99488 800A8C88 27C3010C */  jal        DeMessageQueue
/* 9948C 800A8C8C 0C008424 */   addiu     $a0, $a0, 0xC
/* 99490 800A8C90 58A10208 */  j          .L800A8560
/* 99494 800A8C94 2120D102 */   addu      $a0, $s6, $s1
.L800A8C98:
/* 99498 800A8C98 35004016 */  bnez       $s2, .L800A8D70
/* 9949C 800A8C9C 00000000 */   nop
/* 994A0 800A8CA0 0000248E */  lw         $a0, 0x0($s1)
/* 994A4 800A8CA4 A3CE020C */  jal        CheckHolding
/* 994A8 800A8CA8 00000000 */   nop
/* 994AC 800A8CAC 30004014 */  bnez       $v0, .L800A8D70
/* 994B0 800A8CB0 37000224 */   addiu     $v0, $zero, 0x37
/* 994B4 800A8CB4 2E00A212 */  beq        $s5, $v0, .L800A8D70
/* 994B8 800A8CB8 D6000224 */   addiu     $v0, $zero, 0xD6
/* 994BC 800A8CBC 2C00A212 */  beq        $s5, $v0, .L800A8D70
/* 994C0 800A8CC0 00000000 */   nop
/* 994C4 800A8CC4 70FA828F */  lw         $v0, %gp_rel(Raziel + 0x440)($gp)
/* 994C8 800A8CC8 00000000 */  nop
/* 994CC 800A8CCC 01004424 */  addiu      $a0, $v0, 0x1
/* 994D0 800A8CD0 2D01822C */  sltiu      $v0, $a0, 0x12D
/* 994D4 800A8CD4 70FA84AF */  sw         $a0, %gp_rel(Raziel + 0x440)($gp)
/* 994D8 800A8CD8 25004014 */  bnez       $v0, .L800A8D70
/* 994DC 800A8CDC 00000000 */   nop
/* 994E0 800A8CE0 A291023C */  lui        $v0, (0x91A2B3C5 >> 16)
/* 994E4 800A8CE4 C5B34234 */  ori        $v0, $v0, (0x91A2B3C5 & 0xFFFF)
/* 994E8 800A8CE8 19008200 */  multu      $a0, $v0
/* 994EC 800A8CEC 10400000 */  mfhi       $t0
/* 994F0 800A8CF0 421A0800 */  srl        $v1, $t0, 9
/* 994F4 800A8CF4 C0100300 */  sll        $v0, $v1, 3
/* 994F8 800A8CF8 23104300 */  subu       $v0, $v0, $v1
/* 994FC 800A8CFC 40110200 */  sll        $v0, $v0, 5
/* 99500 800A8D00 21104300 */  addu       $v0, $v0, $v1
/* 99504 800A8D04 80100200 */  sll        $v0, $v0, 2
/* 99508 800A8D08 19008214 */  bne        $a0, $v0, .L800A8D70
/* 9950C 800A8D0C 00000000 */   nop
/* 99510 800A8D10 74FA828F */  lw         $v0, %gp_rel(Raziel + 0x444)($gp)
/* 99514 800A8D14 00000000 */  nop
/* 99518 800A8D18 0B004010 */  beqz       $v0, .L800A8D48
/* 9951C 800A8D1C 01000624 */   addiu     $a2, $zero, 0x1
/* 99520 800A8D20 03000224 */  addiu      $v0, $zero, 0x3
/* 99524 800A8D24 1000A2AF */  sw         $v0, 0x10($sp)
/* 99528 800A8D28 2110C000 */  addu       $v0, $a2, $zero
/* 9952C 800A8D2C 1400A2AF */  sw         $v0, 0x14($sp)
/* 99530 800A8D30 0000248E */  lw         $a0, 0x0($s1)
/* 99534 800A8D34 74FA858F */  lw         $a1, %gp_rel(Raziel + 0x444)($gp)
/* 99538 800A8D38 C1C8010C */  jal        G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 9953C 800A8D3C 21380000 */   addu      $a3, $zero, $zero
/* 99540 800A8D40 5CA30208 */  j          .L800A8D70
/* 99544 800A8D44 00000000 */   nop
.L800A8D48:
/* 99548 800A8D48 21202002 */  addu       $a0, $s1, $zero
/* 9954C 800A8D4C 18000524 */  addiu      $a1, $zero, 0x18
/* 99550 800A8D50 21300000 */  addu       $a2, $zero, $zero
/* 99554 800A8D54 03000724 */  addiu      $a3, $zero, 0x3
/* 99558 800A8D58 01000224 */  addiu      $v0, $zero, 0x1
/* 9955C 800A8D5C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99560 800A8D60 1000A2AF */   sw        $v0, 0x10($sp)
/* 99564 800A8D64 0000248E */  lw         $a0, 0x0($s1)
/* 99568 800A8D68 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 9956C 800A8D6C 01000524 */   addiu     $a1, $zero, 0x1
.L800A8D70:
/* 99570 800A8D70 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 99574 800A8D74 3800BE8F */  lw         $fp, 0x38($sp)
/* 99578 800A8D78 3400B78F */  lw         $s7, 0x34($sp)
/* 9957C 800A8D7C 3000B68F */  lw         $s6, 0x30($sp)
/* 99580 800A8D80 2C00B58F */  lw         $s5, 0x2C($sp)
/* 99584 800A8D84 2800B48F */  lw         $s4, 0x28($sp)
/* 99588 800A8D88 2400B38F */  lw         $s3, 0x24($sp)
/* 9958C 800A8D8C 2000B28F */  lw         $s2, 0x20($sp)
/* 99590 800A8D90 1C00B18F */  lw         $s1, 0x1C($sp)
/* 99594 800A8D94 1800B08F */  lw         $s0, 0x18($sp)
/* 99598 800A8D98 0800E003 */  jr         $ra
/* 9959C 800A8D9C 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerIdle, . - StateHandlerIdle
