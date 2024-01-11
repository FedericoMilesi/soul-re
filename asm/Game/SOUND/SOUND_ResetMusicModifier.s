.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_ResetMusicModifier
/* 31998 80041198 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3199C 8004119C 1000822C */  sltiu      $v0, $a0, 0x10
/* 319A0 800411A0 1C004010 */  beqz       $v0, .L80041214
/* 319A4 800411A4 1000BFAF */   sw        $ra, 0x10($sp)
/* 319A8 800411A8 0180023C */  lui        $v0, %hi(jtbl_800102A8)
/* 319AC 800411AC A8024224 */  addiu      $v0, $v0, %lo(jtbl_800102A8)
/* 319B0 800411B0 80180400 */  sll        $v1, $a0, 2
/* 319B4 800411B4 21186200 */  addu       $v1, $v1, $v0
/* 319B8 800411B8 0000628C */  lw         $v0, 0x0($v1)
/* 319BC 800411BC 00000000 */  nop
/* 319C0 800411C0 08004000 */  jr         $v0
/* 319C4 800411C4 00000000 */   nop
jlabel .L800411C8
/* 319C8 800411C8 83040108 */  j          .L8004120C
/* 319CC 800411CC 21200000 */   addu      $a0, $zero, $zero
jlabel .L800411D0
/* 319D0 800411D0 83040108 */  j          .L8004120C
/* 319D4 800411D4 01000424 */   addiu     $a0, $zero, 0x1
jlabel .L800411D8
/* 319D8 800411D8 83040108 */  j          .L8004120C
/* 319DC 800411DC 02000424 */   addiu     $a0, $zero, 0x2
jlabel .L800411E0
/* 319E0 800411E0 83040108 */  j          .L8004120C
/* 319E4 800411E4 7D000424 */   addiu     $a0, $zero, 0x7D
jlabel .L800411E8
/* 319E8 800411E8 83040108 */  j          .L8004120C
/* 319EC 800411EC 7E000424 */   addiu     $a0, $zero, 0x7E
jlabel .L800411F0
/* 319F0 800411F0 83040108 */  j          .L8004120C
/* 319F4 800411F4 7C000424 */   addiu     $a0, $zero, 0x7C
jlabel .L800411F8
/* 319F8 800411F8 83040108 */  j          .L8004120C
/* 319FC 800411FC 78000424 */   addiu     $a0, $zero, 0x78
jlabel .L80041200
/* 31A00 80041200 83040108 */  j          .L8004120C
/* 31A04 80041204 03000424 */   addiu     $a0, $zero, 0x3
jlabel .L80041208
/* 31A08 80041208 77000424 */  addiu      $a0, $zero, 0x77
.L8004120C:
/* 31A0C 8004120C 6701010C */  jal        SOUND_SetMusicVariable
/* 31A10 80041210 21280000 */   addu      $a1, $zero, $zero
jlabel .L80041214
/* 31A14 80041214 1000BF8F */  lw         $ra, 0x10($sp)
/* 31A18 80041218 00000000 */  nop
/* 31A1C 8004121C 0800E003 */  jr         $ra
/* 31A20 80041220 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_ResetMusicModifier, . - SOUND_ResetMusicModifier
