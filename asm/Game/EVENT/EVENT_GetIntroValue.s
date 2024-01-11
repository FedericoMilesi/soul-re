.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetIntroValue
/* 57854 80067054 0400828C */  lw         $v0, 0x4($a0)
/* 57858 80067058 01000624 */  addiu      $a2, $zero, 0x1
/* 5785C 8006705C 21184600 */  addu       $v1, $v0, $a2
/* 57860 80067060 A800622C */  sltiu      $v0, $v1, 0xA8
/* 57864 80067064 1E004010 */  beqz       $v0, .L800670E0
/* 57868 80067068 21280000 */   addu      $a1, $zero, $zero
/* 5786C 8006706C 0180023C */  lui        $v0, %hi(jtbl_80011488)
/* 57870 80067070 88144224 */  addiu      $v0, $v0, %lo(jtbl_80011488)
/* 57874 80067074 80180300 */  sll        $v1, $v1, 2
/* 57878 80067078 21186200 */  addu       $v1, $v1, $v0
/* 5787C 8006707C 0000628C */  lw         $v0, 0x0($v1)
/* 57880 80067080 00000000 */  nop
/* 57884 80067084 08004000 */  jr         $v0
/* 57888 80067088 00000000 */   nop
jlabel .L8006708C
/* 5788C 8006708C 389C0108 */  j          .L800670E0
/* 57890 80067090 01000524 */   addiu     $a1, $zero, 0x1
jlabel .L80067094
/* 57894 80067094 389C0108 */  j          .L800670E0
/* 57898 80067098 FFFF0524 */   addiu     $a1, $zero, -0x1
jlabel .L8006709C
/* 5789C 8006709C 0100C638 */  xori       $a2, $a2, 0x1
jlabel .L800670A0
/* 578A0 800670A0 0000828C */  lw         $v0, 0x0($a0)
/* 578A4 800670A4 00000000 */  nop
/* 578A8 800670A8 2C00428C */  lw         $v0, 0x2C($v0)
/* 578AC 800670AC 2128C000 */  addu       $a1, $a2, $zero
/* 578B0 800670B0 339C0108 */  j          .L800670CC
/* 578B4 800670B4 80004230 */   andi      $v0, $v0, 0x80
jlabel .L800670B8
/* 578B8 800670B8 0000828C */  lw         $v0, 0x0($a0)
/* 578BC 800670BC 00000000 */  nop
/* 578C0 800670C0 2C00428C */  lw         $v0, 0x2C($v0)
/* 578C4 800670C4 2128C000 */  addu       $a1, $a2, $zero
/* 578C8 800670C8 08004230 */  andi       $v0, $v0, 0x8
.L800670CC:
/* 578CC 800670CC 04004014 */  bnez       $v0, .L800670E0
/* 578D0 800670D0 00000000 */   nop
/* 578D4 800670D4 389C0108 */  j          .L800670E0
/* 578D8 800670D8 0100A538 */   xori      $a1, $a1, 0x1
jlabel .L800670DC
/* 578DC 800670DC 21280000 */  addu       $a1, $zero, $zero
jlabel .L800670E0
/* 578E0 800670E0 0800E003 */  jr         $ra
/* 578E4 800670E4 2110A000 */   addu      $v0, $a1, $zero
.size EVENT_GetIntroValue, . - EVENT_GetIntroValue
