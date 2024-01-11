.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdateWind
/* 39E74 80049674 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39E78 80049678 1800BFAF */  sw         $ra, 0x18($sp)
/* 39E7C 8004967C 1400B1AF */  sw         $s1, 0x14($sp)
/* 39E80 80049680 3AF2020C */  jal        func_800BC8E8
/* 39E84 80049684 1000B0AF */   sw        $s0, 0x10($sp)
/* 39E88 80049688 21184000 */  addu       $v1, $v0, $zero
/* 39E8C 8004968C 03006104 */  bgez       $v1, .L8004969C
/* 39E90 80049690 83100200 */   sra       $v0, $v0, 2
/* 39E94 80049694 03006224 */  addiu      $v0, $v1, 0x3
/* 39E98 80049698 83100200 */  sra        $v0, $v0, 2
.L8004969C:
/* 39E9C 8004969C 80100200 */  sll        $v0, $v0, 2
/* 39EA0 800496A0 23886200 */  subu       $s1, $v1, $v0
/* 39EA4 800496A4 3AF2020C */  jal        func_800BC8E8
/* 39EA8 800496A8 21802002 */   addu      $s0, $s1, $zero
/* 39EAC 800496AC 01004230 */  andi       $v0, $v0, 0x1
/* 39EB0 800496B0 02004010 */  beqz       $v0, .L800496BC
/* 39EB4 800496B4 00000000 */   nop
/* 39EB8 800496B8 23801100 */  negu       $s0, $s1
.L800496BC:
/* 39EBC 800496BC AA9A8297 */  lhu        $v0, %gp_rel(wind_speed)($gp)
/* 39EC0 800496C0 00000000 */  nop
/* 39EC4 800496C4 21105000 */  addu       $v0, $v0, $s0
/* 39EC8 800496C8 AA9A82A7 */  sh         $v0, %gp_rel(wind_speed)($gp)
/* 39ECC 800496CC 00140200 */  sll        $v0, $v0, 16
/* 39ED0 800496D0 03140200 */  sra        $v0, $v0, 16
/* 39ED4 800496D4 29004228 */  slti       $v0, $v0, 0x29
/* 39ED8 800496D8 02004014 */  bnez       $v0, .L800496E4
/* 39EDC 800496DC 28000224 */   addiu     $v0, $zero, 0x28
/* 39EE0 800496E0 AA9A82A7 */  sh         $v0, %gp_rel(wind_speed)($gp)
.L800496E4:
/* 39EE4 800496E4 AA9A8287 */  lh         $v0, %gp_rel(wind_speed)($gp)
/* 39EE8 800496E8 00000000 */  nop
/* 39EEC 800496EC 0F004228 */  slti       $v0, $v0, 0xF
/* 39EF0 800496F0 02004010 */  beqz       $v0, .L800496FC
/* 39EF4 800496F4 0F000224 */   addiu     $v0, $zero, 0xF
/* 39EF8 800496F8 AA9A82A7 */  sh         $v0, %gp_rel(wind_speed)($gp)
.L800496FC:
/* 39EFC 800496FC 3AF2020C */  jal        func_800BC8E8
/* 39F00 80049700 00000000 */   nop
/* 39F04 80049704 21184000 */  addu       $v1, $v0, $zero
/* 39F08 80049708 03006104 */  bgez       $v1, .L80049718
/* 39F0C 8004970C C3100200 */   sra       $v0, $v0, 3
/* 39F10 80049710 07006224 */  addiu      $v0, $v1, 0x7
/* 39F14 80049714 C3100200 */  sra        $v0, $v0, 3
.L80049718:
/* 39F18 80049718 C0100200 */  sll        $v0, $v0, 3
/* 39F1C 8004971C 23886200 */  subu       $s1, $v1, $v0
/* 39F20 80049720 3AF2020C */  jal        func_800BC8E8
/* 39F24 80049724 21802002 */   addu      $s0, $s1, $zero
/* 39F28 80049728 01004230 */  andi       $v0, $v0, 0x1
/* 39F2C 8004972C 02004010 */  beqz       $v0, .L80049738
/* 39F30 80049730 00000000 */   nop
/* 39F34 80049734 23801100 */  negu       $s0, $s1
.L80049738:
/* 39F38 80049738 A89A8297 */  lhu        $v0, %gp_rel(wind_deg)($gp)
/* 39F3C 8004973C 00000000 */  nop
/* 39F40 80049740 21105000 */  addu       $v0, $v0, $s0
/* 39F44 80049744 A89A82A7 */  sh         $v0, %gp_rel(wind_deg)($gp)
/* 39F48 80049748 00140200 */  sll        $v0, $v0, 16
/* 39F4C 8004974C 03140200 */  sra        $v0, $v0, 16
/* 39F50 80049750 01054228 */  slti       $v0, $v0, 0x501
/* 39F54 80049754 02004014 */  bnez       $v0, .L80049760
/* 39F58 80049758 00050224 */   addiu     $v0, $zero, 0x500
/* 39F5C 8004975C A89A82A7 */  sh         $v0, %gp_rel(wind_deg)($gp)
.L80049760:
/* 39F60 80049760 A89A8287 */  lh         $v0, %gp_rel(wind_deg)($gp)
/* 39F64 80049764 00000000 */  nop
/* 39F68 80049768 00034228 */  slti       $v0, $v0, 0x300
/* 39F6C 8004976C 02004010 */  beqz       $v0, .L80049778
/* 39F70 80049770 00030224 */   addiu     $v0, $zero, 0x300
/* 39F74 80049774 A89A82A7 */  sh         $v0, %gp_rel(wind_deg)($gp)
.L80049778:
/* 39F78 80049778 A89A8487 */  lh         $a0, %gp_rel(wind_deg)($gp)
/* 39F7C 8004977C DCE4010C */  jal        func_80079370
/* 39F80 80049780 00000000 */   nop
/* 39F84 80049784 AA9A8387 */  lh         $v1, %gp_rel(wind_speed)($gp)
/* 39F88 80049788 00000000 */  nop
/* 39F8C 8004978C 18004300 */  mult       $v0, $v1
/* 39F90 80049790 12100000 */  mflo       $v0
/* 39F94 80049794 02004104 */  bgez       $v0, .L800497A0
/* 39F98 80049798 00000000 */   nop
/* 39F9C 8004979C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800497A0:
/* 39FA0 800497A0 A89A8487 */  lh         $a0, %gp_rel(wind_deg)($gp)
/* 39FA4 800497A4 03130200 */  sra        $v0, $v0, 12
/* 39FA8 800497A8 A49A82A7 */  sh         $v0, %gp_rel(windx)($gp)
/* 39FAC 800497AC D0E4010C */  jal        func_80079340
/* 39FB0 800497B0 00000000 */   nop
/* 39FB4 800497B4 AA9A8387 */  lh         $v1, %gp_rel(wind_speed)($gp)
/* 39FB8 800497B8 00000000 */  nop
/* 39FBC 800497BC 18004300 */  mult       $v0, $v1
/* 39FC0 800497C0 12100000 */  mflo       $v0
/* 39FC4 800497C4 02004104 */  bgez       $v0, .L800497D0
/* 39FC8 800497C8 00000000 */   nop
/* 39FCC 800497CC FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800497D0:
/* 39FD0 800497D0 1800BF8F */  lw         $ra, 0x18($sp)
/* 39FD4 800497D4 1400B18F */  lw         $s1, 0x14($sp)
/* 39FD8 800497D8 1000B08F */  lw         $s0, 0x10($sp)
/* 39FDC 800497DC 03130200 */  sra        $v0, $v0, 12
/* 39FE0 800497E0 A69A82A7 */  sh         $v0, %gp_rel(windy)($gp)
/* 39FE4 800497E4 0800E003 */  jr         $ra
/* 39FE8 800497E8 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_UpdateWind, . - FX_UpdateWind
