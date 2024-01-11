.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ExecuteActionCommand
/* 58FC4 800687C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 58FC8 800687C8 1800B0AF */  sw         $s0, 0x18($sp)
/* 58FCC 800687CC 21808000 */  addu       $s0, $a0, $zero
/* 58FD0 800687D0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 58FD4 800687D4 0000028E */  lw         $v0, 0x0($s0)
/* 58FD8 800687D8 00000000 */  nop
/* 58FDC 800687DC FFFF4324 */  addiu      $v1, $v0, -0x1
/* 58FE0 800687E0 1C00622C */  sltiu      $v0, $v1, 0x1C
/* 58FE4 800687E4 65004010 */  beqz       $v0, .L8006897C
/* 58FE8 800687E8 0180023C */   lui       $v0, %hi(jtbl_80011B80)
/* 58FEC 800687EC 801B4224 */  addiu      $v0, $v0, %lo(jtbl_80011B80)
/* 58FF0 800687F0 80180300 */  sll        $v1, $v1, 2
/* 58FF4 800687F4 21186200 */  addu       $v1, $v1, $v0
/* 58FF8 800687F8 0000628C */  lw         $v0, 0x0($v1)
/* 58FFC 800687FC 00000000 */  nop
/* 59000 80068800 08004000 */  jr         $v0
/* 59004 80068804 00000000 */   nop
jlabel .L80068808
/* 59008 80068808 04000386 */  lh         $v1, 0x4($s0)
/* 5900C 8006880C 01000224 */  addiu      $v0, $zero, 0x1
/* 59010 80068810 05006214 */  bne        $v1, $v0, .L80068828
/* 59014 80068814 00000000 */   nop
/* 59018 80068818 2497010C */  jal        EVENT_DoSoundMarkerAction
/* 5901C 8006881C 04000426 */   addiu     $a0, $s0, 0x4
/* 59020 80068820 5FA20108 */  j          .L8006897C
/* 59024 80068824 00000000 */   nop
.L80068828:
/* 59028 80068828 D796010C */  jal        EVENT_DoObjectSoundAction
/* 5902C 8006882C 04000426 */   addiu     $a0, $s0, 0x4
/* 59030 80068830 5FA20108 */  j          .L8006897C
/* 59034 80068834 00000000 */   nop
jlabel .L80068838
/* 59038 80068838 7397010C */  jal        EVENT_DoAreaAction
/* 5903C 8006883C 04000426 */   addiu     $a0, $s0, 0x4
/* 59040 80068840 5FA20108 */  j          .L8006897C
/* 59044 80068844 00000000 */   nop
jlabel .L80068848
/* 59048 80068848 9E97010C */  jal        EVENT_DoIntroAction
/* 5904C 8006884C 04000426 */   addiu     $a0, $s0, 0x4
/* 59050 80068850 5FA20108 */  j          .L8006897C
/* 59054 80068854 00000000 */   nop
jlabel .L80068858
/* 59058 80068858 2120A000 */  addu       $a0, $a1, $zero
/* 5905C 8006885C 1000A527 */  addiu      $a1, $sp, 0x10
/* 59060 80068860 63A2010C */  jal        EVENT_GetScalerValueFromOperand
/* 59064 80068864 1400A627 */   addiu     $a2, $sp, 0x14
/* 59068 80068868 1000A38F */  lw         $v1, 0x10($sp)
/* 5906C 8006886C 00000000 */  nop
/* 59070 80068870 42006014 */  bnez       $v1, .L8006897C
/* 59074 80068874 21204000 */   addu      $a0, $v0, $zero
/* 59078 80068878 0400028E */  lw         $v0, 0x4($s0)
/* 5907C 8006887C 5FA20108 */  j          .L8006897C
/* 59080 80068880 000044A4 */   sh        $a0, 0x0($v0)
jlabel .L80068884
/* 59084 80068884 2120A000 */  addu       $a0, $a1, $zero
/* 59088 80068888 1000A527 */  addiu      $a1, $sp, 0x10
/* 5908C 8006888C 63A2010C */  jal        EVENT_GetScalerValueFromOperand
/* 59090 80068890 1400A627 */   addiu     $a2, $sp, 0x14
/* 59094 80068894 1000A38F */  lw         $v1, 0x10($sp)
/* 59098 80068898 00000000 */  nop
/* 5909C 8006889C 37006014 */  bnez       $v1, .L8006897C
/* 590A0 800688A0 21204000 */   addu      $a0, $v0, $zero
/* 590A4 800688A4 0400028E */  lw         $v0, 0x4($s0)
/* 590A8 800688A8 5FA20108 */  j          .L8006897C
/* 590AC 800688AC 000044A0 */   sb        $a0, 0x0($v0)
jlabel .L800688B0
/* 590B0 800688B0 2120A000 */  addu       $a0, $a1, $zero
/* 590B4 800688B4 1000A527 */  addiu      $a1, $sp, 0x10
/* 590B8 800688B8 63A2010C */  jal        EVENT_GetScalerValueFromOperand
/* 590BC 800688BC 1400A627 */   addiu     $a2, $sp, 0x14
/* 590C0 800688C0 1000A38F */  lw         $v1, 0x10($sp)
/* 590C4 800688C4 00000000 */  nop
/* 590C8 800688C8 2C006014 */  bnez       $v1, .L8006897C
/* 590CC 800688CC 21204000 */   addu      $a0, $v0, $zero
/* 590D0 800688D0 0400028E */  lw         $v0, 0x4($s0)
/* 590D4 800688D4 5FA20108 */  j          .L8006897C
/* 590D8 800688D8 000044AC */   sw        $a0, 0x0($v0)
jlabel .L800688DC
/* 590DC 800688DC 8990010C */  jal        EVENT_DoSplineAction
/* 590E0 800688E0 04000426 */   addiu     $a0, $s0, 0x4
/* 590E4 800688E4 5FA20108 */  j          .L8006897C
/* 590E8 800688E8 00000000 */   nop
jlabel .L800688EC
/* 590EC 800688EC 04000426 */  addiu      $a0, $s0, 0x4
/* 590F0 800688F0 3192010C */  jal        EVENT_DoInstanceAction
/* 590F4 800688F4 2130E000 */   addu      $a2, $a3, $zero
/* 590F8 800688F8 5FA20108 */  j          .L8006897C
/* 590FC 800688FC 00000000 */   nop
jlabel .L80068900
/* 59100 80068900 758F010C */  jal        EVENT_DoSignalAction
/* 59104 80068904 04000426 */   addiu     $a0, $s0, 0x4
/* 59108 80068908 5FA20108 */  j          .L8006897C
/* 5910C 8006890C 00000000 */   nop
jlabel .L80068910
/* 59110 80068910 7C91010C */  jal        EVENT_DoAnimateAction
/* 59114 80068914 04000426 */   addiu     $a0, $s0, 0x4
/* 59118 80068918 5FA20108 */  j          .L8006897C
/* 5911C 8006891C 00000000 */   nop
jlabel .L80068920
/* 59120 80068920 0390010C */  jal        EVENT_DoInstanceAnimateTextureAction
/* 59124 80068924 04000426 */   addiu     $a0, $s0, 0x4
/* 59128 80068928 5FA20108 */  j          .L8006897C
/* 5912C 8006892C 00000000 */   nop
jlabel .L80068930
/* 59130 80068930 3595010C */  jal        EVENT_DoTGroupAction
/* 59134 80068934 04000426 */   addiu     $a0, $s0, 0x4
/* 59138 80068938 5FA20108 */  j          .L8006897C
/* 5913C 8006893C 00000000 */   nop
jlabel .L80068940
/* 59140 80068940 04000426 */  addiu      $a0, $s0, 0x4
/* 59144 80068944 F795010C */  jal        EVENT_DoCameraAction
/* 59148 80068948 2130E000 */   addu      $a2, $a3, $zero
/* 5914C 8006894C 5FA20108 */  j          .L8006897C
/* 59150 80068950 00000000 */   nop
jlabel .L80068954
/* 59154 80068954 168E010C */  jal        EVENT_DoVMObjectAction
/* 59158 80068958 04000426 */   addiu     $a0, $s0, 0x4
/* 5915C 8006895C 5FA20108 */  j          .L8006897C
/* 59160 80068960 00000000 */   nop
jlabel .L80068964
/* 59164 80068964 B88E010C */  jal        EVENT_DoGameAction
/* 59168 80068968 04000426 */   addiu     $a0, $s0, 0x4
/* 5916C 8006896C 5FA20108 */  j          .L8006897C
/* 59170 80068970 00000000 */   nop
jlabel .L80068974
/* 59174 80068974 3A9C010C */  jal        EVENT_DoSubListAction
/* 59178 80068978 04000426 */   addiu     $a0, $s0, 0x4
jlabel .L8006897C
/* 5917C 8006897C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 59180 80068980 1800B08F */  lw         $s0, 0x18($sp)
/* 59184 80068984 0800E003 */  jr         $ra
/* 59188 80068988 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_ExecuteActionCommand, . - EVENT_ExecuteActionCommand
