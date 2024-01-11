.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformInstanceAttribute
/* 52D8C 8006258C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 52D90 80062590 3400B1AF */  sw         $s1, 0x34($sp)
/* 52D94 80062594 2188A000 */  addu       $s1, $a1, $zero
/* 52D98 80062598 FCFFC324 */  addiu      $v1, $a2, -0x4
/* 52D9C 8006259C A700622C */  sltiu      $v0, $v1, 0xA7
/* 52DA0 800625A0 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 52DA4 800625A4 3800B2AF */  sw         $s2, 0x38($sp)
/* 52DA8 800625A8 3000B0AF */  sw         $s0, 0x30($sp)
/* 52DAC 800625AC 0400308E */  lw         $s0, 0x4($s1)
/* 52DB0 800625B0 88014010 */  beqz       $v0, .L80062BD4
/* 52DB4 800625B4 21200000 */   addu      $a0, $zero, $zero
/* 52DB8 800625B8 0180023C */  lui        $v0, %hi(jtbl_80010498)
/* 52DBC 800625BC 98044224 */  addiu      $v0, $v0, %lo(jtbl_80010498)
/* 52DC0 800625C0 80180300 */  sll        $v1, $v1, 2
/* 52DC4 800625C4 21186200 */  addu       $v1, $v1, $v0
/* 52DC8 800625C8 0000628C */  lw         $v0, 0x0($v1)
/* 52DCC 800625CC 00000000 */  nop
/* 52DD0 800625D0 08004000 */  jr         $v0
/* 52DD4 800625D4 00000000 */   nop
jlabel .L800625D8
/* 52DD8 800625D8 21200002 */  addu       $a0, $s0, $zero
/* 52DDC 800625DC 92D1000C */  jal        INSTANCE_Query
/* 52DE0 800625E0 06000524 */   addiu     $a1, $zero, 0x6
/* 52DE4 800625E4 06004014 */  bnez       $v0, .L80062600
/* 52DE8 800625E8 00000000 */   nop
/* 52DEC 800625EC 5C000586 */  lh         $a1, 0x5C($s0)
/* 52DF0 800625F0 5E000686 */  lh         $a2, 0x5E($s0)
/* 52DF4 800625F4 60000786 */  lh         $a3, 0x60($s0)
/* 52DF8 800625F8 83890108 */  j          .L8006260C
/* 52DFC 800625FC 00000000 */   nop
.L80062600:
/* 52E00 80062600 00004584 */  lh         $a1, 0x0($v0)
/* 52E04 80062604 02004684 */  lh         $a2, 0x2($v0)
/* 52E08 80062608 04004784 */  lh         $a3, 0x4($v0)
.L8006260C:
/* 52E0C 8006260C 3800028E */  lw         $v0, 0x38($s0)
/* 52E10 80062610 21202002 */  addu       $a0, $s1, $zero
/* 52E14 80062614 9B88010C */  jal        EVENT_ChangeOperandVector3d
/* 52E18 80062618 1000A2AF */   sw        $v0, 0x10($sp)
/* 52E1C 8006261C F58A0108 */  j          .L80062BD4
/* 52E20 80062620 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062624
/* 52E24 80062624 21200002 */  addu       $a0, $s0, $zero
/* 52E28 80062628 92D1000C */  jal        INSTANCE_Query
/* 52E2C 8006262C 07000524 */   addiu     $a1, $zero, 0x7
/* 52E30 80062630 21184000 */  addu       $v1, $v0, $zero
/* 52E34 80062634 0A006014 */  bnez       $v1, .L80062660
/* 52E38 80062638 00000000 */   nop
/* 52E3C 8006263C 74000296 */  lhu        $v0, 0x74($s0)
/* 52E40 80062640 00000000 */  nop
/* 52E44 80062644 1800A2A7 */  sh         $v0, 0x18($sp)
/* 52E48 80062648 76000296 */  lhu        $v0, 0x76($s0)
/* 52E4C 8006264C 00000000 */  nop
/* 52E50 80062650 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 52E54 80062654 78000296 */  lhu        $v0, 0x78($s0)
/* 52E58 80062658 A1890108 */  j          .L80062684
/* 52E5C 8006265C 1C00A2A7 */   sh        $v0, 0x1C($sp)
.L80062660:
/* 52E60 80062660 00006294 */  lhu        $v0, 0x0($v1)
/* 52E64 80062664 00000000 */  nop
/* 52E68 80062668 1800A2A7 */  sh         $v0, 0x18($sp)
/* 52E6C 8006266C 02006294 */  lhu        $v0, 0x2($v1)
/* 52E70 80062670 00000000 */  nop
/* 52E74 80062674 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 52E78 80062678 04006294 */  lhu        $v0, 0x4($v1)
/* 52E7C 8006267C 00000000 */  nop
/* 52E80 80062680 1C00A2A7 */  sh         $v0, 0x1C($sp)
.L80062684:
/* 52E84 80062684 21202002 */  addu       $a0, $s1, $zero
/* 52E88 80062688 1800A527 */  addiu      $a1, $sp, 0x18
/* 52E8C 8006268C 00020224 */  addiu      $v0, $zero, 0x200
/* 52E90 80062690 2000A2A7 */  sh         $v0, 0x20($sp)
/* 52E94 80062694 2400A2A7 */  sh         $v0, 0x24($sp)
/* 52E98 80062698 C588010C */  jal        EVENT_ChangeOperandRotation3d
/* 52E9C 8006269C 2200A2A7 */   sh        $v0, 0x22($sp)
/* 52EA0 800626A0 F58A0108 */  j          .L80062BD4
/* 52EA4 800626A4 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800626A8
/* 52EA8 800626A8 21200002 */  addu       $a0, $s0, $zero
/* 52EAC 800626AC 10002526 */  addiu      $a1, $s1, 0x10
/* 52EB0 800626B0 14002626 */  addiu      $a2, $s1, 0x14
/* 52EB4 800626B4 0F000224 */  addiu      $v0, $zero, 0xF
/* 52EB8 800626B8 000022AE */  sw         $v0, 0x0($s1)
/* 52EBC 800626BC 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 52EC0 800626C0 040024AE */   sw        $a0, 0x4($s1)
/* 52EC4 800626C4 01000424 */  addiu      $a0, $zero, 0x1
/* 52EC8 800626C8 080022AE */  sw         $v0, 0x8($s1)
/* 52ECC 800626CC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 52ED0 800626D0 180020AE */  sw         $zero, 0x18($s1)
/* 52ED4 800626D4 F58A0108 */  j          .L80062BD4
/* 52ED8 800626D8 0C0022AE */   sw        $v0, 0xC($s1)
jlabel .L800626DC
/* 52EDC 800626DC 1B000224 */  addiu      $v0, $zero, 0x1B
/* 52EE0 800626E0 000022AE */  sw         $v0, 0x0($s1)
/* 52EE4 800626E4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 52EE8 800626E8 140030AE */  sw         $s0, 0x14($s1)
/* 52EEC 800626EC 0600E010 */  beqz       $a3, .L80062708
/* 52EF0 800626F0 060022A6 */   sh        $v0, 0x6($s1)
/* 52EF4 800626F4 01000224 */  addiu      $v0, $zero, 0x1
/* 52EF8 800626F8 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 52EFC 800626FC 0200E284 */  lh         $v0, 0x2($a3)
/* 52F00 80062700 00000000 */  nop
/* 52F04 80062704 080022AE */  sw         $v0, 0x8($s1)
.L80062708:
/* 52F08 80062708 1C00028E */  lw         $v0, 0x1C($s0)
/* 52F0C 8006270C 0800258E */  lw         $a1, 0x8($s1)
/* 52F10 80062710 2800448C */  lw         $a0, 0x28($v0)
/* 52F14 80062714 91FE000C */  jal        SOUND_IsInstanceSoundLoaded
/* 52F18 80062718 00000000 */   nop
/* 52F1C 8006271C 21184000 */  addu       $v1, $v0, $zero
/* 52F20 80062720 0B006014 */  bnez       $v1, .L80062750
/* 52F24 80062724 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 52F28 80062728 34CE828F */  lw         $v0, %gp_rel(WaitingToLoadSound)($gp)
/* 52F2C 8006272C 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 52F30 80062730 00000000 */  nop
/* 52F34 80062734 23104300 */  subu       $v0, $v0, $v1
/* 52F38 80062738 34CE82AF */  sw         $v0, %gp_rel(WaitingToLoadSound)($gp)
/* 52F3C 8006273C 06004018 */  blez       $v0, .L80062758
/* 52F40 80062740 01000224 */   addiu     $v0, $zero, 0x1
/* 52F44 80062744 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
/* 52F48 80062748 F58A0108 */  j          .L80062BD4
/* 52F4C 8006274C 01000424 */   addiu     $a0, $zero, 0x1
.L80062750:
/* 52F50 80062750 20016210 */  beq        $v1, $v0, .L80062BD4
/* 52F54 80062754 01000424 */   addiu     $a0, $zero, 0x1
.L80062758:
/* 52F58 80062758 0900023C */  lui        $v0, (0x96000 >> 16)
/* 52F5C 8006275C 00604234 */  ori        $v0, $v0, (0x96000 & 0xFFFF)
/* 52F60 80062760 34CE82AF */  sw         $v0, %gp_rel(WaitingToLoadSound)($gp)
/* 52F64 80062764 F58A0108 */  j          .L80062BD4
/* 52F68 80062768 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L8006276C
/* 52F6C 8006276C 1C00028E */  lw         $v0, 0x1C($s0)
/* 52F70 80062770 00000000 */  nop
/* 52F74 80062774 1000428C */  lw         $v0, 0x10($v0)
/* 52F78 80062778 00000000 */  nop
/* 52F7C 8006277C 15014010 */  beqz       $v0, .L80062BD4
/* 52F80 80062780 13000224 */   addiu     $v0, $zero, 0x13
/* 52F84 80062784 9E8A0108 */  j          .L80062A78
/* 52F88 80062788 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L8006278C
/* 52F8C 8006278C 21200002 */  addu       $a0, $s0, $zero
/* 52F90 80062790 92D1000C */  jal        INSTANCE_Query
/* 52F94 80062794 0A000524 */   addiu     $a1, $zero, 0xA
/* 52F98 80062798 21202002 */  addu       $a0, $s1, $zero
/* 52F9C 8006279C 21284000 */  addu       $a1, $v0, $zero
/* 52FA0 800627A0 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 52FA4 800627A4 03000624 */   addiu     $a2, $zero, 0x3
/* 52FA8 800627A8 F58A0108 */  j          .L80062BD4
/* 52FAC 800627AC 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800627B0
/* 52FB0 800627B0 21200002 */  addu       $a0, $s0, $zero
/* 52FB4 800627B4 92D1000C */  jal        INSTANCE_Query
/* 52FB8 800627B8 2B000524 */   addiu     $a1, $zero, 0x2B
/* 52FBC 800627BC 21202002 */  addu       $a0, $s1, $zero
/* 52FC0 800627C0 21284000 */  addu       $a1, $v0, $zero
/* 52FC4 800627C4 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 52FC8 800627C8 21300000 */   addu      $a2, $zero, $zero
/* 52FCC 800627CC F58A0108 */  j          .L80062BD4
/* 52FD0 800627D0 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800627D4
/* 52FD4 800627D4 21200002 */  addu       $a0, $s0, $zero
/* 52FD8 800627D8 92D1000C */  jal        INSTANCE_Query
/* 52FDC 800627DC 1F000524 */   addiu     $a1, $zero, 0x1F
/* 52FE0 800627E0 21202002 */  addu       $a0, $s1, $zero
/* 52FE4 800627E4 21284000 */  addu       $a1, $v0, $zero
/* 52FE8 800627E8 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 52FEC 800627EC 21300000 */   addu      $a2, $zero, $zero
/* 52FF0 800627F0 F58A0108 */  j          .L80062BD4
/* 52FF4 800627F4 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800627F8
/* 52FF8 800627F8 21200002 */  addu       $a0, $s0, $zero
/* 52FFC 800627FC 92D1000C */  jal        INSTANCE_Query
/* 53000 80062800 20000524 */   addiu     $a1, $zero, 0x20
/* 53004 80062804 21202002 */  addu       $a0, $s1, $zero
/* 53008 80062808 21284000 */  addu       $a1, $v0, $zero
/* 5300C 8006280C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53010 80062810 21300000 */   addu      $a2, $zero, $zero
/* 53014 80062814 F58A0108 */  j          .L80062BD4
/* 53018 80062818 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L8006281C
/* 5301C 8006281C 21200002 */  addu       $a0, $s0, $zero
/* 53020 80062820 92D1000C */  jal        INSTANCE_Query
/* 53024 80062824 2C000524 */   addiu     $a1, $zero, 0x2C
/* 53028 80062828 21804000 */  addu       $s0, $v0, $zero
/* 5302C 8006282C 03000016 */  bnez       $s0, .L8006283C
/* 53030 80062830 21200002 */   addu      $a0, $s0, $zero
/* 53034 80062834 1C8A0108 */  j          .L80062870
/* 53038 80062838 21280000 */   addu      $a1, $zero, $zero
.L8006283C:
/* 5303C 8006283C 92D1000C */  jal        INSTANCE_Query
/* 53040 80062840 01000524 */   addiu     $a1, $zero, 0x1
/* 53044 80062844 20004230 */  andi       $v0, $v0, 0x20
/* 53048 80062848 08004010 */  beqz       $v0, .L8006286C
/* 5304C 8006284C 21200002 */   addu      $a0, $s0, $zero
/* 53050 80062850 92D1000C */  jal        INSTANCE_Query
/* 53054 80062854 04000524 */   addiu     $a1, $zero, 0x4
/* 53058 80062858 03004330 */  andi       $v1, $v0, 0x3
/* 5305C 8006285C DE006014 */  bnez       $v1, .L80062BD8
/* 53060 80062860 01000224 */   addiu     $v0, $zero, 0x1
/* 53064 80062864 F68A0108 */  j          .L80062BD8
/* 53068 80062868 02000224 */   addiu     $v0, $zero, 0x2
.L8006286C:
/* 5306C 8006286C 03000524 */  addiu      $a1, $zero, 0x3
.L80062870:
/* 53070 80062870 21202002 */  addu       $a0, $s1, $zero
/* 53074 80062874 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53078 80062878 21300000 */   addu      $a2, $zero, $zero
/* 5307C 8006287C F58A0108 */  j          .L80062BD4
/* 53080 80062880 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062884
/* 53084 80062884 21200002 */  addu       $a0, $s0, $zero
/* 53088 80062888 92D1000C */  jal        INSTANCE_Query
/* 5308C 8006288C 21280000 */   addu      $a1, $zero, $zero
/* 53090 80062890 21202002 */  addu       $a0, $s1, $zero
/* 53094 80062894 82170200 */  srl        $v0, $v0, 30
/* 53098 80062898 01004530 */  andi       $a1, $v0, 0x1
/* 5309C 8006289C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 530A0 800628A0 21300000 */   addu      $a2, $zero, $zero
/* 530A4 800628A4 F58A0108 */  j          .L80062BD4
/* 530A8 800628A8 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800628AC
/* 530AC 800628AC 21200002 */  addu       $a0, $s0, $zero
/* 530B0 800628B0 92D1000C */  jal        INSTANCE_Query
/* 530B4 800628B4 21280000 */   addu      $a1, $zero, $zero
/* 530B8 800628B8 21202002 */  addu       $a0, $s1, $zero
/* 530BC 800628BC 82160200 */  srl        $v0, $v0, 26
/* 530C0 800628C0 01004530 */  andi       $a1, $v0, 0x1
/* 530C4 800628C4 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 530C8 800628C8 21300000 */   addu      $a2, $zero, $zero
/* 530CC 800628CC F58A0108 */  j          .L80062BD4
/* 530D0 800628D0 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800628D4
/* 530D4 800628D4 21200002 */  addu       $a0, $s0, $zero
/* 530D8 800628D8 92D1000C */  jal        INSTANCE_Query
/* 530DC 800628DC 01000524 */   addiu     $a1, $zero, 0x1
/* 530E0 800628E0 21202002 */  addu       $a0, $s1, $zero
/* 530E4 800628E4 04004230 */  andi       $v0, $v0, 0x4
/* 530E8 800628E8 2B280200 */  sltu       $a1, $zero, $v0
/* 530EC 800628EC 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 530F0 800628F0 21300000 */   addu      $a2, $zero, $zero
/* 530F4 800628F4 F58A0108 */  j          .L80062BD4
/* 530F8 800628F8 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800628FC
/* 530FC 800628FC 21200002 */  addu       $a0, $s0, $zero
/* 53100 80062900 92D1000C */  jal        INSTANCE_Query
/* 53104 80062904 09000524 */   addiu     $a1, $zero, 0x9
/* 53108 80062908 21202002 */  addu       $a0, $s1, $zero
/* 5310C 8006290C 21284000 */  addu       $a1, $v0, $zero
/* 53110 80062910 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53114 80062914 01000624 */   addiu     $a2, $zero, 0x1
/* 53118 80062918 F58A0108 */  j          .L80062BD4
/* 5311C 8006291C 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062920
/* 53120 80062920 21200002 */  addu       $a0, $s0, $zero
/* 53124 80062924 92D1000C */  jal        INSTANCE_Query
/* 53128 80062928 1E000524 */   addiu     $a1, $zero, 0x1E
/* 5312C 8006292C 21202002 */  addu       $a0, $s1, $zero
/* 53130 80062930 21284000 */  addu       $a1, $v0, $zero
/* 53134 80062934 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53138 80062938 21300000 */   addu      $a2, $zero, $zero
/* 5313C 8006293C F58A0108 */  j          .L80062BD4
/* 53140 80062940 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062944
/* 53144 80062944 21202002 */  addu       $a0, $s1, $zero
/* 53148 80062948 01000524 */  addiu      $a1, $zero, 0x1
/* 5314C 8006294C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53150 80062950 21300000 */   addu      $a2, $zero, $zero
/* 53154 80062954 F58A0108 */  j          .L80062BD4
/* 53158 80062958 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L8006295C
/* 5315C 8006295C 14000224 */  addiu      $v0, $zero, 0x14
/* 53160 80062960 000022AE */  sw         $v0, 0x0($s1)
/* 53164 80062964 040030AE */  sw         $s0, 0x4($s1)
/* 53168 80062968 1C00038E */  lw         $v1, 0x1C($s0)
/* 5316C 8006296C 26010286 */  lh         $v0, 0x126($s0)
/* 53170 80062970 0C00638C */  lw         $v1, 0xC($v1)
/* 53174 80062974 80100200 */  sll        $v0, $v0, 2
/* 53178 80062978 21104300 */  addu       $v0, $v0, $v1
/* 5317C 8006297C 0000428C */  lw         $v0, 0x0($v0)
/* 53180 80062980 01000424 */  addiu      $a0, $zero, 0x1
/* 53184 80062984 2000438C */  lw         $v1, 0x20($v0)
/* 53188 80062988 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5318C 8006298C 0C0022AE */  sw         $v0, 0xC($s1)
/* 53190 80062990 F58A0108 */  j          .L80062BD4
/* 53194 80062994 080023AE */   sw        $v1, 0x8($s1)
jlabel .L80062998
/* 53198 80062998 8C00028E */  lw         $v0, 0x8C($s0)
/* 5319C 8006299C 00000000 */  nop
/* 531A0 800629A0 19004014 */  bnez       $v0, .L80062A08
/* 531A4 800629A4 21900000 */   addu      $s2, $zero, $zero
/* 531A8 800629A8 3800048E */  lw         $a0, 0x38($s0)
/* 531AC 800629AC 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 531B0 800629B0 00000000 */   nop
/* 531B4 800629B4 16004010 */  beqz       $v0, .L80062A10
/* 531B8 800629B8 21202002 */   addu      $a0, $s1, $zero
/* 531BC 800629BC 0800428C */  lw         $v0, 0x8($v0)
/* 531C0 800629C0 00000000 */  nop
/* 531C4 800629C4 0000448C */  lw         $a0, 0x0($v0)
/* 531C8 800629C8 C400038E */  lw         $v1, 0xC4($s0)
/* 531CC 800629CC 4400828C */  lw         $v0, 0x44($a0)
/* 531D0 800629D0 00000000 */  nop
/* 531D4 800629D4 2A106200 */  slt        $v0, $v1, $v0
/* 531D8 800629D8 0C004010 */  beqz       $v0, .L80062A0C
/* 531DC 800629DC C0100300 */   sll       $v0, $v1, 3
/* 531E0 800629E0 21104300 */  addu       $v0, $v0, $v1
/* 531E4 800629E4 4800838C */  lw         $v1, 0x48($a0)
/* 531E8 800629E8 80100200 */  sll        $v0, $v0, 2
/* 531EC 800629EC 21104300 */  addu       $v0, $v0, $v1
/* 531F0 800629F0 3800038E */  lw         $v1, 0x38($s0)
/* 531F4 800629F4 1A004284 */  lh         $v0, 0x1A($v0)
/* 531F8 800629F8 001A0300 */  sll        $v1, $v1, 8
/* 531FC 800629FC 21186200 */  addu       $v1, $v1, $v0
/* 53200 80062A00 838A0108 */  j          .L80062A0C
/* 53204 80062A04 23900300 */   negu      $s2, $v1
.L80062A08:
/* 53208 80062A08 21904000 */  addu       $s2, $v0, $zero
.L80062A0C:
/* 5320C 80062A0C 21202002 */  addu       $a0, $s1, $zero
.L80062A10:
/* 53210 80062A10 21284002 */  addu       $a1, $s2, $zero
/* 53214 80062A14 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53218 80062A18 21300000 */   addu      $a2, $zero, $zero
/* 5321C 80062A1C F58A0108 */  j          .L80062BD4
/* 53220 80062A20 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062A24
/* 53224 80062A24 21202002 */  addu       $a0, $s1, $zero
/* 53228 80062A28 21280000 */  addu       $a1, $zero, $zero
/* 5322C 80062A2C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53230 80062A30 2130A000 */   addu      $a2, $a1, $zero
/* 53234 80062A34 F58A0108 */  j          .L80062BD4
/* 53238 80062A38 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062A3C
/* 5323C 80062A3C 21202002 */  addu       $a0, $s1, $zero
/* 53240 80062A40 3800058E */  lw         $a1, 0x38($s0)
/* 53244 80062A44 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53248 80062A48 21300000 */   addu      $a2, $zero, $zero
/* 5324C 80062A4C F58A0108 */  j          .L80062BD4
/* 53250 80062A50 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062A54
/* 53254 80062A54 21202002 */  addu       $a0, $s1, $zero
/* 53258 80062A58 B400058E */  lw         $a1, 0xB4($s0)
/* 5325C 80062A5C 21300000 */  addu       $a2, $zero, $zero
/* 53260 80062A60 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53264 80062A64 2B280500 */   sltu      $a1, $zero, $a1
/* 53268 80062A68 F58A0108 */  j          .L80062BD4
/* 5326C 80062A6C 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062A70
/* 53270 80062A70 01000424 */  addiu      $a0, $zero, 0x1
/* 53274 80062A74 18000224 */  addiu      $v0, $zero, 0x18
.L80062A78:
/* 53278 80062A78 000022AE */  sw         $v0, 0x0($s1)
/* 5327C 80062A7C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 53280 80062A80 040030AE */  sw         $s0, 0x4($s1)
/* 53284 80062A84 F58A0108 */  j          .L80062BD4
/* 53288 80062A88 080022AE */   sw        $v0, 0x8($s1)
jlabel .L80062A8C
/* 5328C 80062A8C 1400038E */  lw         $v1, 0x14($s0)
/* 53290 80062A90 00000000 */  nop
/* 53294 80062A94 04006230 */  andi       $v0, $v1, 0x4
/* 53298 80062A98 05004010 */  beqz       $v0, .L80062AB0
/* 5329C 80062A9C 21280000 */   addu      $a1, $zero, $zero
/* 532A0 80062AA0 01000524 */  addiu      $a1, $zero, 0x1
/* 532A4 80062AA4 FBFF0224 */  addiu      $v0, $zero, -0x5
/* 532A8 80062AA8 24106200 */  and        $v0, $v1, $v0
/* 532AC 80062AAC 140002AE */  sw         $v0, 0x14($s0)
.L80062AB0:
/* 532B0 80062AB0 21202002 */  addu       $a0, $s1, $zero
/* 532B4 80062AB4 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 532B8 80062AB8 21300000 */   addu      $a2, $zero, $zero
/* 532BC 80062ABC F58A0108 */  j          .L80062BD4
/* 532C0 80062AC0 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062AC4
/* 532C4 80062AC4 1400038E */  lw         $v1, 0x14($s0)
/* 532C8 80062AC8 00000000 */  nop
/* 532CC 80062ACC 08006230 */  andi       $v0, $v1, 0x8
/* 532D0 80062AD0 05004010 */  beqz       $v0, .L80062AE8
/* 532D4 80062AD4 21280000 */   addu      $a1, $zero, $zero
/* 532D8 80062AD8 01000524 */  addiu      $a1, $zero, 0x1
/* 532DC 80062ADC F7FF0224 */  addiu      $v0, $zero, -0x9
/* 532E0 80062AE0 24106200 */  and        $v0, $v1, $v0
/* 532E4 80062AE4 140002AE */  sw         $v0, 0x14($s0)
.L80062AE8:
/* 532E8 80062AE8 21202002 */  addu       $a0, $s1, $zero
/* 532EC 80062AEC 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 532F0 80062AF0 21300000 */   addu      $a2, $zero, $zero
/* 532F4 80062AF4 F58A0108 */  j          .L80062BD4
/* 532F8 80062AF8 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062AFC
/* 532FC 80062AFC 1400038E */  lw         $v1, 0x14($s0)
/* 53300 80062B00 00000000 */  nop
/* 53304 80062B04 10006230 */  andi       $v0, $v1, 0x10
/* 53308 80062B08 05004010 */  beqz       $v0, .L80062B20
/* 5330C 80062B0C 21280000 */   addu      $a1, $zero, $zero
/* 53310 80062B10 01000524 */  addiu      $a1, $zero, 0x1
/* 53314 80062B14 EFFF0224 */  addiu      $v0, $zero, -0x11
/* 53318 80062B18 24106200 */  and        $v0, $v1, $v0
/* 5331C 80062B1C 140002AE */  sw         $v0, 0x14($s0)
.L80062B20:
/* 53320 80062B20 21202002 */  addu       $a0, $s1, $zero
/* 53324 80062B24 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53328 80062B28 21300000 */   addu      $a2, $zero, $zero
/* 5332C 80062B2C F58A0108 */  j          .L80062BD4
/* 53330 80062B30 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062B34
/* 53334 80062B34 1400038E */  lw         $v1, 0x14($s0)
/* 53338 80062B38 00000000 */  nop
/* 5333C 80062B3C 06006104 */  bgez       $v1, .L80062B58
/* 53340 80062B40 21280000 */   addu      $a1, $zero, $zero
/* 53344 80062B44 01000524 */  addiu      $a1, $zero, 0x1
/* 53348 80062B48 FF7F023C */  lui        $v0, (0x7FFFFFFF >> 16)
/* 5334C 80062B4C FFFF4234 */  ori        $v0, $v0, (0x7FFFFFFF & 0xFFFF)
/* 53350 80062B50 24106200 */  and        $v0, $v1, $v0
/* 53354 80062B54 140002AE */  sw         $v0, 0x14($s0)
.L80062B58:
/* 53358 80062B58 21202002 */  addu       $a0, $s1, $zero
/* 5335C 80062B5C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 53360 80062B60 21300000 */   addu      $a2, $zero, $zero
/* 53364 80062B64 F58A0108 */  j          .L80062BD4
/* 53368 80062B68 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062B6C
/* 5336C 80062B6C 1800038E */  lw         $v1, 0x18($s0)
/* 53370 80062B70 0100023C */  lui        $v0, (0x10000 >> 16)
/* 53374 80062B74 24106200 */  and        $v0, $v1, $v0
/* 53378 80062B78 06004010 */  beqz       $v0, .L80062B94
/* 5337C 80062B7C 21280000 */   addu      $a1, $zero, $zero
/* 53380 80062B80 01000524 */  addiu      $a1, $zero, 0x1
/* 53384 80062B84 FEFF023C */  lui        $v0, (0xFFFEFFFF >> 16)
/* 53388 80062B88 FFFF4234 */  ori        $v0, $v0, (0xFFFEFFFF & 0xFFFF)
/* 5338C 80062B8C 24106200 */  and        $v0, $v1, $v0
/* 53390 80062B90 180002AE */  sw         $v0, 0x18($s0)
.L80062B94:
/* 53394 80062B94 21202002 */  addu       $a0, $s1, $zero
/* 53398 80062B98 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 5339C 80062B9C 21300000 */   addu      $a2, $zero, $zero
/* 533A0 80062BA0 F58A0108 */  j          .L80062BD4
/* 533A4 80062BA4 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062BA8
/* 533A8 80062BA8 21200002 */  addu       $a0, $s0, $zero
/* 533AC 80062BAC 92D1000C */  jal        INSTANCE_Query
/* 533B0 80062BB0 24000524 */   addiu     $a1, $zero, 0x24
/* 533B4 80062BB4 21202002 */  addu       $a0, $s1, $zero
/* 533B8 80062BB8 21284000 */  addu       $a1, $v0, $zero
/* 533BC 80062BBC 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 533C0 80062BC0 03000624 */   addiu     $a2, $zero, 0x3
/* 533C4 80062BC4 F58A0108 */  j          .L80062BD4
/* 533C8 80062BC8 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L80062BCC
/* 533CC 80062BCC 080026AE */  sw         $a2, 0x8($s1)
/* 533D0 80062BD0 01000424 */  addiu      $a0, $zero, 0x1
jlabel .L80062BD4
/* 533D4 80062BD4 21108000 */  addu       $v0, $a0, $zero
.L80062BD8:
/* 533D8 80062BD8 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 533DC 80062BDC 3800B28F */  lw         $s2, 0x38($sp)
/* 533E0 80062BE0 3400B18F */  lw         $s1, 0x34($sp)
/* 533E4 80062BE4 3000B08F */  lw         $s0, 0x30($sp)
/* 533E8 80062BE8 0800E003 */  jr         $ra
/* 533EC 80062BEC 4000BD27 */   addiu     $sp, $sp, 0x40
.size EVENT_TransformInstanceAttribute, . - EVENT_TransformInstanceAttribute
