.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_InitCdLoader
/* 282D4 80037AD4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 282D8 80037AD8 3000B0AF */  sw         $s0, 0x30($sp)
/* 282DC 80037ADC 21808000 */  addu       $s0, $a0, $zero
/* 282E0 80037AE0 3400B1AF */  sw         $s1, 0x34($sp)
/* 282E4 80037AE4 21880000 */  addu       $s1, $zero, $zero
/* 282E8 80037AE8 3800BFAF */  sw         $ra, 0x38($sp)
/* 282EC 80037AEC C0BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x2C)($gp)
.L80037AF0:
/* 282F0 80037AF0 1800A427 */  addiu      $a0, $sp, 0x18
/* 282F4 80037AF4 B5F9020C */  jal        func_800BE6D4
/* 282F8 80037AF8 21280002 */   addu      $a1, $s0, $zero
/* 282FC 80037AFC 07004014 */  bnez       $v0, .L80037B1C
/* 28300 80037B00 0A000224 */   addiu     $v0, $zero, 0xA
/* 28304 80037B04 0EF8020C */  jal        func_800BE038
/* 28308 80037B08 21200000 */   addu      $a0, $zero, $zero
/* 2830C 80037B0C 01003126 */  addiu      $s1, $s1, 0x1
/* 28310 80037B10 0A00222A */  slti       $v0, $s1, 0xA
/* 28314 80037B14 F6FF4014 */  bnez       $v0, .L80037AF0
/* 28318 80037B18 0A000224 */   addiu     $v0, $zero, 0xA
.L80037B1C:
/* 2831C 80037B1C 3D002212 */  beq        $s1, $v0, .L80037C14
/* 28320 80037B20 00000000 */   nop
/* 28324 80037B24 B5E0000C */  jal        LOAD_InitCdStreamMode
/* 28328 80037B28 00000000 */   nop
/* 2832C 80037B2C 56FC020C */  jal        func_800BF158
/* 28330 80037B30 1800A427 */   addiu     $a0, $sp, 0x18
/* 28334 80037B34 21200000 */  addu       $a0, $zero, $zero
/* 28338 80037B38 0CBC8527 */  addiu      $a1, $gp, %gp_rel(loadStatus + 0x78)
/* 2833C 80037B3C 04000624 */  addiu      $a2, $zero, 0x4
/* 28340 80037B40 21388000 */  addu       $a3, $a0, $zero
/* 28344 80037B44 F0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x5C)($gp)
/* 28348 80037B48 CCBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x38)($gp)
/* 2834C 80037B4C A8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x14)($gp)
/* 28350 80037B50 F8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x64)($gp)
/* 28354 80037B54 00BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x6C)($gp)
/* 28358 80037B58 FCBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x68)($gp)
/* 2835C 80037B5C 04BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x70)($gp)
/* 28360 80037B60 08BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x74)($gp)
/* 28364 80037B64 90DE000C */  jal        LOAD_CdReadFromBigFile
/* 28368 80037B68 1000A0AF */   sw        $zero, 0x10($sp)
.L80037B6C:
/* 2836C 80037B6C EFDD000C */  jal        LOAD_ProcessReadQueue
/* 28370 80037B70 00000000 */   nop
/* 28374 80037B74 32E1000C */  jal        LOAD_IsFileLoading
/* 28378 80037B78 00000000 */   nop
/* 2837C 80037B7C FBFF4014 */  bnez       $v0, .L80037B6C
/* 28380 80037B80 09000424 */   addiu     $a0, $zero, 0x9
/* 28384 80037B84 9FF8020C */  jal        func_800BE27C
/* 28388 80037B88 21280000 */   addu      $a1, $zero, $zero
/* 2838C 80037B8C 0CBC828F */  lw         $v0, %gp_rel(loadStatus + 0x78)($gp)
/* 28390 80037B90 08000524 */  addiu      $a1, $zero, 0x8
/* 28394 80037B94 C0100200 */  sll        $v0, $v0, 3
/* 28398 80037B98 04005124 */  addiu      $s1, $v0, 0x4
/* 2839C 80037B9C 8140010C */  jal        MEMPACK_Malloc
/* 283A0 80037BA0 21202002 */   addu      $a0, $s1, $zero
/* 283A4 80037BA4 21200000 */  addu       $a0, $zero, $zero
/* 283A8 80037BA8 21288000 */  addu       $a1, $a0, $zero
/* 283AC 80037BAC 36F8020C */  jal        func_800BE0D8
/* 283B0 80037BB0 21804000 */   addu      $s0, $v0, $zero
/* 283B4 80037BB4 21200000 */  addu       $a0, $zero, $zero
/* 283B8 80037BB8 21280002 */  addu       $a1, $s0, $zero
/* 283BC 80037BBC 21302002 */  addu       $a2, $s1, $zero
/* 283C0 80037BC0 21388000 */  addu       $a3, $a0, $zero
/* 283C4 80037BC4 90DE000C */  jal        LOAD_CdReadFromBigFile
/* 283C8 80037BC8 1000A0AF */   sw        $zero, 0x10($sp)
/* 283CC 80037BCC 04001026 */  addiu      $s0, $s0, 0x4
/* 283D0 80037BD0 10BC90AF */  sw         $s0, %gp_rel(loadStatus + 0x7C)($gp)
.L80037BD4:
/* 283D4 80037BD4 EFDD000C */  jal        LOAD_ProcessReadQueue
/* 283D8 80037BD8 00000000 */   nop
/* 283DC 80037BDC 32E1000C */  jal        LOAD_IsFileLoading
/* 283E0 80037BE0 00000000 */   nop
/* 283E4 80037BE4 FBFF4014 */  bnez       $v0, .L80037BD4
/* 283E8 80037BE8 00000000 */   nop
/* 283EC 80037BEC 10BC848F */  lw         $a0, %gp_rel(loadStatus + 0x7C)($gp)
/* 283F0 80037BF0 9BDE000C */  jal        LOAD_ReadDirectory
/* 283F4 80037BF4 00000000 */   nop
/* 283F8 80037BF8 F4BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x60)($gp)
.L80037BFC:
/* 283FC 80037BFC EFDD000C */  jal        LOAD_ProcessReadQueue
/* 28400 80037C00 00000000 */   nop
/* 28404 80037C04 32E1000C */  jal        LOAD_IsFileLoading
/* 28408 80037C08 00000000 */   nop
/* 2840C 80037C0C FBFF4014 */  bnez       $v0, .L80037BFC
/* 28410 80037C10 00000000 */   nop
.L80037C14:
/* 28414 80037C14 3800BF8F */  lw         $ra, 0x38($sp)
/* 28418 80037C18 3400B18F */  lw         $s1, 0x34($sp)
/* 2841C 80037C1C 3000B08F */  lw         $s0, 0x30($sp)
/* 28420 80037C20 0800E003 */  jr         $ra
/* 28424 80037C24 4000BD27 */   addiu     $sp, $sp, 0x40
.size LOAD_InitCdLoader, . - LOAD_InitCdLoader
