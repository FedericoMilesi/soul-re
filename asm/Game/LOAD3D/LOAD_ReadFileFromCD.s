.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ReadFileFromCD
/* 28160 80037960 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 28164 80037964 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 28168 80037968 21888000 */  addu       $s1, $a0, $zero
/* 2816C 8003796C 3000B2AF */  sw         $s2, 0x30($sp)
/* 28170 80037970 2190A000 */  addu       $s2, $a1, $zero
/* 28174 80037974 2800B0AF */  sw         $s0, 0x28($sp)
/* 28178 80037978 21800000 */  addu       $s0, $zero, $zero
/* 2817C 8003797C 3400BFAF */  sw         $ra, 0x34($sp)
.L80037980:
/* 28180 80037980 1000A427 */  addiu      $a0, $sp, 0x10
/* 28184 80037984 B5F9020C */  jal        func_800BE6D4
/* 28188 80037988 21282002 */   addu      $a1, $s1, $zero
/* 2818C 8003798C 07004014 */  bnez       $v0, .L800379AC
/* 28190 80037990 0A000224 */   addiu     $v0, $zero, 0xA
/* 28194 80037994 0EF8020C */  jal        func_800BE038
/* 28198 80037998 21200000 */   addu      $a0, $zero, $zero
/* 2819C 8003799C 01001026 */  addiu      $s0, $s0, 0x1
/* 281A0 800379A0 0A00022A */  slti       $v0, $s0, 0xA
/* 281A4 800379A4 F6FF4014 */  bnez       $v0, .L80037980
/* 281A8 800379A8 0A000224 */   addiu     $v0, $zero, 0xA
.L800379AC:
/* 281AC 800379AC 1E000212 */  beq        $s0, $v0, .L80037A28
/* 281B0 800379B0 21100000 */   addu      $v0, $zero, $zero
/* 281B4 800379B4 1400A48F */  lw         $a0, 0x14($sp)
/* 281B8 800379B8 8140010C */  jal        MEMPACK_Malloc
/* 281BC 800379BC FF004532 */   andi      $a1, $s2, 0xFF
/* 281C0 800379C0 21804000 */  addu       $s0, $v0, $zero
/* 281C4 800379C4 18000012 */  beqz       $s0, .L80037A28
/* 281C8 800379C8 21100000 */   addu      $v0, $zero, $zero
/* 281CC 800379CC 56FC020C */  jal        func_800BF158
/* 281D0 800379D0 1000A427 */   addiu     $a0, $sp, 0x10
/* 281D4 800379D4 1400A48F */  lw         $a0, 0x14($sp)
/* 281D8 800379D8 F0BB858F */  lw         $a1, %gp_rel(loadStatus + 0x5C)($gp)
/* 281DC 800379DC 01000324 */  addiu      $v1, $zero, 0x1
/* 281E0 800379E0 9CBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x8)($gp)
/* 281E4 800379E4 A0BB90AF */  sw         $s0, %gp_rel(loadStatus + 0xC)($gp)
/* 281E8 800379E8 A8BB83AF */  sw         $v1, %gp_rel(loadStatus + 0x14)($gp)
/* 281EC 800379EC B0BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x1C)($gp)
/* 281F0 800379F0 ACBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x18)($gp)
/* 281F4 800379F4 23104500 */  subu       $v0, $v0, $a1
/* 281F8 800379F8 C0120200 */  sll        $v0, $v0, 11
/* 281FC 800379FC 98BB84AF */  sw         $a0, %gp_rel(loadStatus + 0x4)($gp)
/* 28200 80037A00 94BB82AF */  sw         $v0, %gp_rel(loadStatus)($gp)
.L80037A04:
/* 28204 80037A04 EFDD000C */  jal        LOAD_ProcessReadQueue
/* 28208 80037A08 00000000 */   nop
/* 2820C 80037A0C 32E1000C */  jal        LOAD_IsFileLoading
/* 28210 80037A10 00000000 */   nop
/* 28214 80037A14 FBFF4014 */  bnez       $v0, .L80037A04
/* 28218 80037A18 09000424 */   addiu     $a0, $zero, 0x9
/* 2821C 80037A1C 9FF8020C */  jal        func_800BE27C
/* 28220 80037A20 21280000 */   addu      $a1, $zero, $zero
/* 28224 80037A24 21100002 */  addu       $v0, $s0, $zero
.L80037A28:
/* 28228 80037A28 3400BF8F */  lw         $ra, 0x34($sp)
/* 2822C 80037A2C 3000B28F */  lw         $s2, 0x30($sp)
/* 28230 80037A30 2C00B18F */  lw         $s1, 0x2C($sp)
/* 28234 80037A34 2800B08F */  lw         $s0, 0x28($sp)
/* 28238 80037A38 0800E003 */  jr         $ra
/* 2823C 80037A3C 3800BD27 */   addiu     $sp, $sp, 0x38
.size LOAD_ReadFileFromCD, . - LOAD_ReadFileFromCD
