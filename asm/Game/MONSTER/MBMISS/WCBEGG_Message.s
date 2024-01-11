.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_Message
/* 7F8E8 8008F0E8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7F8EC 8008F0EC 2400B1AF */  sw         $s1, 0x24($sp)
/* 7F8F0 8008F0F0 21888000 */  addu       $s1, $a0, $zero
/* 7F8F4 8008F0F4 2800B2AF */  sw         $s2, 0x28($sp)
/* 7F8F8 8008F0F8 2190A000 */  addu       $s2, $a1, $zero
/* 7F8FC 8008F0FC 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7F900 8008F100 2198C000 */  addu       $s3, $a2, $zero
/* 7F904 8008F104 8000023C */  lui        $v0, (0x800002 >> 16)
/* 7F908 8008F108 02004234 */  ori        $v0, $v0, (0x800002 & 0xFFFF)
/* 7F90C 8008F10C 3000BFAF */  sw         $ra, 0x30($sp)
/* 7F910 8008F110 13004216 */  bne        $s2, $v0, .L8008F160
/* 7F914 8008F114 2000B0AF */   sw        $s0, 0x20($sp)
/* 7F918 8008F118 0801238E */  lw         $v1, 0x108($s1)
/* 7F91C 8008F11C 0980023C */  lui        $v0, %hi(WCBEGG_Process)
/* 7F920 8008F120 84F24224 */  addiu      $v0, $v0, %lo(WCBEGG_Process)
/* 7F924 8008F124 12006214 */  bne        $v1, $v0, .L8008F170
/* 7F928 8008F128 00000000 */   nop
/* 7F92C 8008F12C 6C01308E */  lw         $s0, 0x16C($s1)
/* 7F930 8008F130 9006020C */  jal        MON_GetTime
/* 7F934 8008F134 00000000 */   nop
/* 7F938 8008F138 21202002 */  addu       $a0, $s1, $zero
/* 7F93C 8008F13C 21280000 */  addu       $a1, $zero, $zero
/* 7F940 8008F140 01000624 */  addiu      $a2, $zero, 0x1
/* 7F944 8008F144 2138A000 */  addu       $a3, $a1, $zero
/* 7F948 8008F148 280002AE */  sw         $v0, 0x28($s0)
/* 7F94C 8008F14C 02000224 */  addiu      $v0, $zero, 0x2
/* 7F950 8008F150 1000A0AF */  sw         $zero, 0x10($sp)
/* 7F954 8008F154 1400A2AF */  sw         $v0, 0x14($sp)
/* 7F958 8008F158 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 7F95C 8008F15C 1800A0AF */   sw        $zero, 0x18($sp)
.L8008F160:
/* 7F960 8008F160 21202002 */  addu       $a0, $s1, $zero
/* 7F964 8008F164 21284002 */  addu       $a1, $s2, $zero
/* 7F968 8008F168 52B2010C */  jal        PhysicalObjectPost
/* 7F96C 8008F16C 21306002 */   addu      $a2, $s3, $zero
.L8008F170:
/* 7F970 8008F170 3000BF8F */  lw         $ra, 0x30($sp)
/* 7F974 8008F174 2C00B38F */  lw         $s3, 0x2C($sp)
/* 7F978 8008F178 2800B28F */  lw         $s2, 0x28($sp)
/* 7F97C 8008F17C 2400B18F */  lw         $s1, 0x24($sp)
/* 7F980 8008F180 2000B08F */  lw         $s0, 0x20($sp)
/* 7F984 8008F184 0800E003 */  jr         $ra
/* 7F988 8008F188 3800BD27 */   addiu     $sp, $sp, 0x38
.size WCBEGG_Message, . - WCBEGG_Message
