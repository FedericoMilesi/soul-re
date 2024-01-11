.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AnimInit
/* 70824 80080024 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 70828 80080028 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7082C 8008002C 21888000 */  addu       $s1, $a0, $zero
/* 70830 80080030 3800BFAF */  sw         $ra, 0x38($sp)
/* 70834 80080034 3400B7AF */  sw         $s7, 0x34($sp)
/* 70838 80080038 3000B6AF */  sw         $s6, 0x30($sp)
/* 7083C 8008003C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 70840 80080040 2800B4AF */  sw         $s4, 0x28($sp)
/* 70844 80080044 2400B3AF */  sw         $s3, 0x24($sp)
/* 70848 80080048 2000B2AF */  sw         $s2, 0x20($sp)
/* 7084C 8008004C 1800B0AF */  sw         $s0, 0x18($sp)
/* 70850 80080050 6C01328E */  lw         $s2, 0x16C($s1)
/* 70854 80080054 00000000 */  nop
/* 70858 80080058 6801428E */  lw         $v0, 0x168($s2)
/* 7085C 8008005C 21B00000 */  addu       $s6, $zero, $zero
/* 70860 80080060 2A005790 */  lbu        $s7, 0x2A($v0)
/* 70864 80080064 2180C002 */  addu       $s0, $s6, $zero
/* 70868 80080068 BC0040AE */  sw         $zero, 0xBC($s2)
/* 7086C 8008006C 31CA010C */  jal        G2EmulationInstanceSetTotalSections
/* 70870 80080070 2128E002 */   addu      $a1, $s7, $zero
/* 70874 80080074 3500E012 */  beqz       $s7, .L8008014C
/* 70878 80080078 94001524 */   addiu     $s5, $zero, 0x94
/* 7087C 8008007C EC011424 */  addiu      $s4, $zero, 0x1EC
.L80080080:
/* 70880 80080080 6801428E */  lw         $v0, 0x168($s2)
/* 70884 80080084 00000000 */  nop
/* 70888 80080088 21105000 */  addu       $v0, $v0, $s0
/* 7088C 8008008C 2B004790 */  lbu        $a3, 0x2B($v0)
/* 70890 80080090 00000000 */  nop
/* 70894 80080094 1100E014 */  bnez       $a3, .L800800DC
/* 70898 80080098 21983402 */   addu      $s3, $s1, $s4
/* 7089C 8008009C 21202002 */  addu       $a0, $s1, $zero
/* 708A0 800800A0 1C00238E */  lw         $v1, 0x1C($s1)
/* 708A4 800800A4 26012286 */  lh         $v0, 0x126($s1)
/* 708A8 800800A8 0C00638C */  lw         $v1, 0xC($v1)
/* 708AC 800800AC 80100200 */  sll        $v0, $v0, 2
/* 708B0 800800B0 21104300 */  addu       $v0, $v0, $v1
/* 708B4 800800B4 0000428C */  lw         $v0, 0x0($v0)
/* 708B8 800800B8 21280002 */  addu       $a1, $s0, $zero
/* 708BC 800800BC 18004794 */  lhu        $a3, 0x18($v0)
/* 708C0 800800C0 2130C002 */  addu       $a2, $s6, $zero
/* 708C4 800800C4 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 708C8 800800C8 003C0700 */  sll        $a3, $a3, 16
/* 708CC 800800CC 1ACA010C */  jal        G2EmulationInstanceSetStartAndEndSegment
/* 708D0 800800D0 033C0700 */   sra       $a3, $a3, 16
/* 708D4 800800D4 42000208 */  j          .L80080108
/* 708D8 800800D8 21206002 */   addu      $a0, $s3, $zero
.L800800DC:
/* 708DC 800800DC 21202002 */  addu       $a0, $s1, $zero
/* 708E0 800800E0 21280002 */  addu       $a1, $s0, $zero
/* 708E4 800800E4 1ACA010C */  jal        G2EmulationInstanceSetStartAndEndSegment
/* 708E8 800800E8 2130C002 */   addu      $a2, $s6, $zero
/* 708EC 800800EC 6801428E */  lw         $v0, 0x168($s2)
/* 708F0 800800F0 00000000 */  nop
/* 708F4 800800F4 21105000 */  addu       $v0, $v0, $s0
/* 708F8 800800F8 2B004290 */  lbu        $v0, 0x2B($v0)
/* 708FC 800800FC 00000000 */  nop
/* 70900 80080100 01005624 */  addiu      $s6, $v0, 0x1
/* 70904 80080104 21206002 */  addu       $a0, $s3, $zero
.L80080108:
/* 70908 80080108 4940020C */  jal        G2AnimSection_SetInterpInfo
/* 7090C 8008010C 21285502 */   addu      $a1, $s2, $s5
/* 70910 80080110 1000A0AF */  sw         $zero, 0x10($sp)
/* 70914 80080114 21202002 */  addu       $a0, $s1, $zero
/* 70918 80080118 21280002 */  addu       $a1, $s0, $zero
/* 7091C 8008011C 21300000 */  addu       $a2, $zero, $zero
/* 70920 80080120 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 70924 80080124 2138C000 */   addu      $a3, $a2, $zero
/* 70928 80080128 21202002 */  addu       $a0, $s1, $zero
/* 7092C 8008012C 21280002 */  addu       $a1, $s0, $zero
/* 70930 80080130 71C9010C */  jal        G2EmulationInstanceSetMode
/* 70934 80080134 02000624 */   addiu     $a2, $zero, 0x2
/* 70938 80080138 0C00B526 */  addiu      $s5, $s5, 0xC
/* 7093C 8008013C 01001026 */  addiu      $s0, $s0, 0x1
/* 70940 80080140 2A101702 */  slt        $v0, $s0, $s7
/* 70944 80080144 CEFF4014 */  bnez       $v0, .L80080080
/* 70948 80080148 30009426 */   addiu     $s4, $s4, 0x30
.L8008014C:
/* 7094C 8008014C 21202002 */  addu       $a0, $s1, $zero
/* 70950 80080150 21280000 */  addu       $a1, $zero, $zero
/* 70954 80080154 0880063C */  lui        $a2, %hi(MON_AnimCallback)
/* 70958 80080158 74FFC624 */  addiu      $a2, $a2, %lo(MON_AnimCallback)
/* 7095C 8008015C 5ECA010C */  jal        G2EmulationInstanceInitSection
/* 70960 80080160 21382002 */   addu      $a3, $s1, $zero
/* 70964 80080164 21202002 */  addu       $a0, $s1, $zero
/* 70968 80080168 3403020C */  jal        MON_PlayRandomIdle
/* 7096C 8008016C 02000524 */   addiu     $a1, $zero, 0x2
/* 70970 80080170 3800BF8F */  lw         $ra, 0x38($sp)
/* 70974 80080174 3400B78F */  lw         $s7, 0x34($sp)
/* 70978 80080178 3000B68F */  lw         $s6, 0x30($sp)
/* 7097C 8008017C 2C00B58F */  lw         $s5, 0x2C($sp)
/* 70980 80080180 2800B48F */  lw         $s4, 0x28($sp)
/* 70984 80080184 2400B38F */  lw         $s3, 0x24($sp)
/* 70988 80080188 2000B28F */  lw         $s2, 0x20($sp)
/* 7098C 8008018C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 70990 80080190 1800B08F */  lw         $s0, 0x18($sp)
/* 70994 80080194 0800E003 */  jr         $ra
/* 70998 80080198 4000BD27 */   addiu     $sp, $sp, 0x40
.size MON_AnimInit, . - MON_AnimInit
