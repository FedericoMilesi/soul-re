.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_BirthObject
/* 246B0 80033EB0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 246B4 80033EB4 1800B2AF */  sw         $s2, 0x18($sp)
/* 246B8 80033EB8 21908000 */  addu       $s2, $a0, $zero
/* 246BC 80033EBC 2000B4AF */  sw         $s4, 0x20($sp)
/* 246C0 80033EC0 21A0A000 */  addu       $s4, $a1, $zero
/* 246C4 80033EC4 1400B1AF */  sw         $s1, 0x14($sp)
/* 246C8 80033EC8 2188C000 */  addu       $s1, $a2, $zero
/* 246CC 80033ECC 2400BFAF */  sw         $ra, 0x24($sp)
/* 246D0 80033ED0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 246D4 80033ED4 89008012 */  beqz       $s4, .L800340FC
/* 246D8 80033ED8 1000B0AF */   sw        $s0, 0x10($sp)
/* 246DC 80033EDC FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 246E0 80033EE0 98C9000C */  jal        INSTANCE_NewInstance
/* 246E4 80033EE4 00000000 */   nop
/* 246E8 80033EE8 21804000 */  addu       $s0, $v0, $zero
/* 246EC 80033EEC 83000012 */  beqz       $s0, .L800340FC
/* 246F0 80033EF0 21200002 */   addu      $a0, $s0, $zero
/* 246F4 80033EF4 21288002 */  addu       $a1, $s4, $zero
/* 246F8 80033EF8 4AD0000C */  jal        INSTANCE_DefaultInit
/* 246FC 80033EFC 21302002 */   addu      $a2, $s1, $zero
/* 24700 80033F00 5F00478A */  lwl        $a3, 0x5F($s2)
/* 24704 80033F04 5C00479A */  lwr        $a3, 0x5C($s2)
/* 24708 80033F08 60004886 */  lh         $t0, 0x60($s2)
/* 2470C 80033F0C 5F0007AA */  swl        $a3, 0x5F($s0)
/* 24710 80033F10 5C0007BA */  swr        $a3, 0x5C($s0)
/* 24714 80033F14 600008A6 */  sh         $t0, 0x60($s0)
/* 24718 80033F18 5F00078A */  lwl        $a3, 0x5F($s0)
/* 2471C 80033F1C 5C00079A */  lwr        $a3, 0x5C($s0)
/* 24720 80033F20 60000886 */  lh         $t0, 0x60($s0)
/* 24724 80033F24 710007AA */  swl        $a3, 0x71($s0)
/* 24728 80033F28 6E0007BA */  swr        $a3, 0x6E($s0)
/* 2472C 80033F2C 720008A6 */  sh         $t0, 0x72($s0)
/* 24730 80033F30 5F00478A */  lwl        $a3, 0x5F($s2)
/* 24734 80033F34 5C00479A */  lwr        $a3, 0x5C($s2)
/* 24738 80033F38 60004886 */  lh         $t0, 0x60($s2)
/* 2473C 80033F3C 670007AA */  swl        $a3, 0x67($s0)
/* 24740 80033F40 640007BA */  swr        $a3, 0x64($s0)
/* 24744 80033F44 680008A6 */  sh         $t0, 0x68($s0)
/* 24748 80033F48 7700478A */  lwl        $a3, 0x77($s2)
/* 2474C 80033F4C 7400479A */  lwr        $a3, 0x74($s2)
/* 24750 80033F50 7B00488A */  lwl        $t0, 0x7B($s2)
/* 24754 80033F54 7800489A */  lwr        $t0, 0x78($s2)
/* 24758 80033F58 770007AA */  swl        $a3, 0x77($s0)
/* 2475C 80033F5C 740007BA */  swr        $a3, 0x74($s0)
/* 24760 80033F60 7B0008AA */  swl        $t0, 0x7B($s0)
/* 24764 80033F64 780008BA */  swr        $t0, 0x78($s0)
/* 24768 80033F68 8700478A */  lwl        $a3, 0x87($s2)
/* 2476C 80033F6C 8400479A */  lwr        $a3, 0x84($s2)
/* 24770 80033F70 8B00488A */  lwl        $t0, 0x8B($s2)
/* 24774 80033F74 8800489A */  lwr        $t0, 0x88($s2)
/* 24778 80033F78 870007AA */  swl        $a3, 0x87($s0)
/* 2477C 80033F7C 840007BA */  swr        $a3, 0x84($s0)
/* 24780 80033F80 8B0008AA */  swl        $t0, 0x8B($s0)
/* 24784 80033F84 880008BA */  swr        $t0, 0x88($s0)
/* 24788 80033F88 62004292 */  lbu        $v0, 0x62($s2)
/* 2478C 80033F8C 00000000 */  nop
/* 24790 80033F90 620002A2 */  sb         $v0, 0x62($s0)
/* 24794 80033F94 6A004292 */  lbu        $v0, 0x6A($s2)
/* 24798 80033F98 00000000 */  nop
/* 2479C 80033F9C 6A0002A2 */  sb         $v0, 0x6A($s0)
/* 247A0 80033FA0 3800428E */  lw         $v0, 0x38($s2)
/* 247A4 80033FA4 40A8858F */  lw         $a1, %gp_rel(GlobalSave)($gp)
/* 247A8 80033FA8 380002AE */  sw         $v0, 0x38($s0)
/* 247AC 80033FAC 3400428E */  lw         $v0, 0x34($s2)
/* 247B0 80033FB0 5C010426 */  addiu      $a0, $s0, 0x15C
/* 247B4 80033FB4 340002AE */  sw         $v0, 0x34($s0)
/* 247B8 80033FB8 7600A294 */  lhu        $v0, 0x76($a1)
/* 247BC 80033FBC 21880000 */  addu       $s1, $zero, $zero
/* 247C0 80033FC0 01004324 */  addiu      $v1, $v0, 0x1
/* 247C4 80033FC4 00140200 */  sll        $v0, $v0, 16
/* 247C8 80033FC8 03140200 */  sra        $v0, $v0, 16
/* 247CC 80033FCC 7600A3A4 */  sh         $v1, 0x76($a1)
/* 247D0 80033FD0 3C0002AE */  sw         $v0, 0x3C($s0)
/* 247D4 80033FD4 2400858E */  lw         $a1, 0x24($s4)
/* 247D8 80033FD8 1CF4020C */  jal        strcpy
/* 247DC 80033FDC 5F001324 */   addiu     $s3, $zero, 0x5F
.L80033FE0:
/* 247E0 80033FE0 ACF4020C */  jal        strlen
/* 247E4 80033FE4 5C010426 */   addiu     $a0, $s0, 0x15C
/* 247E8 80033FE8 2A102202 */  slt        $v0, $s1, $v0
/* 247EC 80033FEC 06004010 */  beqz       $v0, .L80034008
/* 247F0 80033FF0 21181102 */   addu      $v1, $s0, $s1
/* 247F4 80033FF4 5C016290 */  lbu        $v0, 0x15C($v1)
/* 247F8 80033FF8 00000000 */  nop
/* 247FC 80033FFC F8FF5314 */  bne        $v0, $s3, .L80033FE0
/* 24800 80034000 01003126 */   addiu     $s1, $s1, 0x1
/* 24804 80034004 5C0160A0 */  sb         $zero, 0x15C($v1)
.L80034008:
/* 24808 80034008 2C0012AE */  sw         $s2, 0x2C($s0)
/* 2480C 8003400C 2000428E */  lw         $v0, 0x20($s2)
/* 24810 80034010 94020426 */  addiu      $a0, $s0, 0x294
/* 24814 80034014 200002AE */  sw         $v0, 0x20($s0)
/* 24818 80034018 2800428E */  lw         $v0, 0x28($s2)
/* 2481C 8003401C 21280002 */  addu       $a1, $s0, $zero
/* 24820 80034020 14D8000C */  jal        LIGHT_GetAmbient
/* 24824 80034024 280002AE */   sw        $v0, 0x28($s0)
/* 24828 80034028 1C00028E */  lw         $v0, 0x1C($s0)
/* 2482C 8003402C 00000000 */  nop
/* 24830 80034030 0000428C */  lw         $v0, 0x0($v0)
/* 24834 80034034 00000000 */  nop
/* 24838 80034038 00014230 */  andi       $v0, $v0, 0x100
/* 2483C 8003403C 04004010 */  beqz       $v0, .L80034050
/* 24840 80034040 21200002 */   addu      $a0, $s0, $zero
/* 24844 80034044 48D0000C */  jal        INSTANCE_BuildStaticShadow
/* 24848 80034048 21200002 */   addu      $a0, $s0, $zero
/* 2484C 8003404C 21200002 */  addu       $a0, $s0, $zero
.L80034050:
/* 24850 80034050 21280000 */  addu       $a1, $zero, $zero
/* 24854 80034054 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 24858 80034058 2130A000 */   addu      $a2, $a1, $zero
/* 2485C 8003405C 05004014 */  bnez       $v0, .L80034074
/* 24860 80034060 1000033C */   lui       $v1, (0x100000 >> 16)
/* 24864 80034064 1400028E */  lw         $v0, 0x14($s0)
/* 24868 80034068 00000000 */  nop
/* 2486C 8003406C 25104300 */  or         $v0, $v0, $v1
/* 24870 80034070 140002AE */  sw         $v0, 0x14($s0)
.L80034074:
/* 24874 80034074 1800428E */  lw         $v0, 0x18($s2)
/* 24878 80034078 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 2487C 8003407C 24104300 */  and        $v0, $v0, $v1
/* 24880 80034080 05004010 */  beqz       $v0, .L80034098
/* 24884 80034084 00000000 */   nop
/* 24888 80034088 1800028E */  lw         $v0, 0x18($s0)
/* 2488C 8003408C 00000000 */  nop
/* 24890 80034090 25104300 */  or         $v0, $v0, $v1
/* 24894 80034094 180002AE */  sw         $v0, 0x18($s0)
.L80034098:
/* 24898 80034098 FCBD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 2489C 8003409C 02CA000C */  jal        INSTANCE_InsertInstanceGroup
/* 248A0 800340A0 21280002 */   addu      $a1, $s0, $zero
/* 248A4 800340A4 27F8000C */  jal        OBTABLE_GetInstanceCollideFunc
/* 248A8 800340A8 21200002 */   addu      $a0, $s0, $zero
/* 248AC 800340AC 49F8000C */  jal        OBTABLE_GetInstanceProcessFunc
/* 248B0 800340B0 21200002 */   addu      $a0, $s0, $zero
/* 248B4 800340B4 5BF8000C */  jal        OBTABLE_GetInstanceQueryFunc
/* 248B8 800340B8 21200002 */   addu      $a0, $s0, $zero
/* 248BC 800340BC 6DF8000C */  jal        OBTABLE_GetInstanceMessageFunc
/* 248C0 800340C0 21200002 */   addu      $a0, $s0, $zero
/* 248C4 800340C4 39F8000C */  jal        OBTABLE_GetInstanceAdditionalCollideFunc
/* 248C8 800340C8 21200002 */   addu      $a0, $s0, $zero
/* 248CC 800340CC 1400028E */  lw         $v0, 0x14($s0)
/* 248D0 800340D0 21200002 */  addu       $a0, $s0, $zero
/* 248D4 800340D4 02004234 */  ori        $v0, $v0, 0x2
/* 248D8 800340D8 EEF7000C */  jal        OBTABLE_InstanceInit
/* 248DC 800340DC 140002AE */   sw        $v0, 0x14($s0)
/* 248E0 800340E0 289F010C */  jal        EVENT_AddInstanceToInstanceList
/* 248E4 800340E4 21200002 */   addu      $a0, $s0, $zero
/* 248E8 800340E8 21200002 */  addu       $a0, $s0, $zero
/* 248EC 800340EC 48CB000C */  jal        INSTANCE_InitEffects
/* 248F0 800340F0 21288002 */   addu      $a1, $s4, $zero
/* 248F4 800340F4 40D00008 */  j          .L80034100
/* 248F8 800340F8 21100002 */   addu      $v0, $s0, $zero
.L800340FC:
/* 248FC 800340FC 21100000 */  addu       $v0, $zero, $zero
.L80034100:
/* 24900 80034100 2400BF8F */  lw         $ra, 0x24($sp)
/* 24904 80034104 2000B48F */  lw         $s4, 0x20($sp)
/* 24908 80034108 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2490C 8003410C 1800B28F */  lw         $s2, 0x18($sp)
/* 24910 80034110 1400B18F */  lw         $s1, 0x14($sp)
/* 24914 80034114 1000B08F */  lw         $s0, 0x10($sp)
/* 24918 80034118 0800E003 */  jr         $ra
/* 2491C 8003411C 2800BD27 */   addiu     $sp, $sp, 0x28
.size INSTANCE_BirthObject, . - INSTANCE_BirthObject
