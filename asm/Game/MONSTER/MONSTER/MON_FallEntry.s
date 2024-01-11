.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_FallEntry
/* 79158 80088958 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7915C 8008895C 1000B0AF */  sw         $s0, 0x10($sp)
/* 79160 80088960 21808000 */  addu       $s0, $a0, $zero
/* 79164 80088964 1800BFAF */  sw         $ra, 0x18($sp)
/* 79168 80088968 1400B1AF */  sw         $s1, 0x14($sp)
/* 7916C 8008896C 6C01118E */  lw         $s1, 0x16C($s0)
/* 79170 80088970 00000000 */  nop
/* 79174 80088974 59012382 */  lb         $v1, 0x159($s1)
/* 79178 80088978 0E000224 */  addiu      $v0, $zero, 0xE
/* 7917C 8008897C 04006214 */  bne        $v1, $v0, .L80088990
/* 79180 80088980 01000224 */   addiu     $v0, $zero, 0x1
/* 79184 80088984 14000524 */  addiu      $a1, $zero, 0x14
/* 79188 80088988 75220208 */  j          .L800889D4
/* 7918C 8008898C 01000624 */   addiu     $a2, $zero, 0x1
.L80088990:
/* 79190 80088990 07006210 */  beq        $v1, $v0, .L800889B0
/* 79194 80088994 13000224 */   addiu     $v0, $zero, 0x13
/* 79198 80088998 05006210 */  beq        $v1, $v0, .L800889B0
/* 7919C 8008899C 0D000224 */   addiu     $v0, $zero, 0xD
/* 791A0 800889A0 03006210 */  beq        $v1, $v0, .L800889B0
/* 791A4 800889A4 05000224 */   addiu     $v0, $zero, 0x5
/* 791A8 800889A8 08006214 */  bne        $v1, $v0, .L800889CC
/* 791AC 800889AC 21200002 */   addu      $a0, $s0, $zero
.L800889B0:
/* 791B0 800889B0 21200002 */  addu       $a0, $s0, $zero
/* 791B4 800889B4 74000526 */  addiu      $a1, $s0, 0x74
/* 791B8 800889B8 D2DE010C */  jal        PhysicsSetVelFromRot
/* 791BC 800889BC 28000624 */   addiu     $a2, $zero, 0x28
/* 791C0 800889C0 28000224 */  addiu      $v0, $zero, 0x28
/* 791C4 800889C4 7C0102AE */  sw         $v0, 0x17C($s0)
/* 791C8 800889C8 21200002 */  addu       $a0, $s0, $zero
.L800889CC:
/* 791CC 800889CC 13000524 */  addiu      $a1, $zero, 0x13
/* 791D0 800889D0 02000624 */  addiu      $a2, $zero, 0x2
.L800889D4:
/* 791D4 800889D4 B6FF010C */  jal        MON_PlayAnim
/* 791D8 800889D8 00000000 */   nop
/* 791DC 800889DC F0FF0224 */  addiu      $v0, $zero, -0x10
/* 791E0 800889E0 800100AE */  sw         $zero, 0x180($s0)
/* 791E4 800889E4 840100AE */  sw         $zero, 0x184($s0)
/* 791E8 800889E8 880102AE */  sw         $v0, 0x188($s0)
/* 791EC 800889EC 1000023C */  lui        $v0, (0x100000 >> 16)
/* 791F0 800889F0 21200002 */  addu       $a0, $s0, $zero
/* 791F4 800889F4 9006020C */  jal        MON_GetTime
/* 791F8 800889F8 080122AE */   sw        $v0, 0x108($s1)
/* 791FC 800889FC D0074224 */  addiu      $v0, $v0, 0x7D0
/* 79200 80088A00 140122AE */  sw         $v0, 0x114($s1)
/* 79204 80088A04 1800BF8F */  lw         $ra, 0x18($sp)
/* 79208 80088A08 1400B18F */  lw         $s1, 0x14($sp)
/* 7920C 80088A0C 1000B08F */  lw         $s0, 0x10($sp)
/* 79210 80088A10 0800E003 */  jr         $ra
/* 79214 80088A14 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_FallEntry, . - MON_FallEntry
