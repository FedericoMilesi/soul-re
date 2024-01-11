.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_Collide
/* 8013C 8008F93C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 80140 8008F940 1000B0AF */  sw         $s0, 0x10($sp)
/* 80144 8008F944 21808000 */  addu       $s0, $a0, $zero
/* 80148 8008F948 1800BFAF */  sw         $ra, 0x18($sp)
/* 8014C 8008F94C 1400B1AF */  sw         $s1, 0x14($sp)
/* 80150 8008F950 C000048E */  lw         $a0, 0xC0($s0)
/* 80154 8008F954 00000000 */  nop
/* 80158 8008F958 07008390 */  lbu        $v1, 0x7($a0)
/* 8015C 8008F95C 01000224 */  addiu      $v0, $zero, 0x1
/* 80160 8008F960 0A006214 */  bne        $v1, $v0, .L8008F98C
/* 80164 8008F964 2188A000 */   addu      $s1, $a1, $zero
/* 80168 8008F968 1400828C */  lw         $v0, 0x14($a0)
/* 8016C 8008F96C 00000000 */  nop
/* 80170 8008F970 1C00428C */  lw         $v0, 0x1C($v0)
/* 80174 8008F974 0D80053C */  lui        $a1, %hi(WORSHIP_FunctionTable + 0x2C)
/* 80178 8008F978 2400448C */  lw         $a0, 0x24($v0)
/* 8017C 8008F97C 1CD2010C */  jal        strcmpi
/* 80180 8008F980 FC1BA524 */   addiu     $a1, $a1, %lo(WORSHIP_FunctionTable + 0x2C)
/* 80184 8008F984 08004010 */  beqz       $v0, .L8008F9A8
/* 80188 8008F988 21200002 */   addu      $a0, $s0, $zero
.L8008F98C:
/* 8018C 8008F98C 21200002 */  addu       $a0, $s0, $zero
/* 80190 8008F990 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 80194 8008F994 07000524 */   addiu     $a1, $zero, 0x7
/* 80198 8008F998 0980023C */  lui        $v0, %hi(WCBEGG_ExplodeCollide)
/* 8019C 8008F99C B8F74224 */  addiu      $v0, $v0, %lo(WCBEGG_ExplodeCollide)
/* 801A0 8008F9A0 0C0102AE */  sw         $v0, 0x10C($s0)
/* 801A4 8008F9A4 21200002 */  addu       $a0, $s0, $zero
.L8008F9A8:
/* 801A8 8008F9A8 89B5010C */  jal        CollidePhysicalObject
/* 801AC 8008F9AC 21282002 */   addu      $a1, $s1, $zero
/* 801B0 8008F9B0 1800BF8F */  lw         $ra, 0x18($sp)
/* 801B4 8008F9B4 1400B18F */  lw         $s1, 0x14($sp)
/* 801B8 8008F9B8 1000B08F */  lw         $s0, 0x10($sp)
/* 801BC 8008F9BC 0800E003 */  jr         $ra
/* 801C0 8008F9C0 2000BD27 */   addiu     $sp, $sp, 0x20
.size WCBEGG_Collide, . - WCBEGG_Collide
