.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_InitVertexColors
/* 7C9EC 8008C1EC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7C9F0 8008C1F0 1400B1AF */  sw         $s1, 0x14($sp)
/* 7C9F4 8008C1F4 21888000 */  addu       $s1, $a0, $zero
/* 7C9F8 8008C1F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C9FC 8008C1FC 2180A000 */  addu       $s0, $a1, $zero
/* 7CA00 8008C200 1800BFAF */  sw         $ra, 0x18($sp)
/* 7CA04 8008C204 0000048E */  lw         $a0, 0x0($s0)
/* 7CA08 8008C208 21000524 */  addiu      $a1, $zero, 0x21
/* 7CA0C 8008C20C 8140010C */  jal        MEMPACK_Malloc
/* 7CA10 8008C210 80200400 */   sll       $a0, $a0, 2
/* 7CA14 8008C214 980222AE */  sw         $v0, 0x298($s1)
/* 7CA18 8008C218 0000108E */  lw         $s0, 0x0($s0)
/* 7CA1C 8008C21C 00000000 */  nop
/* 7CA20 8008C220 07000012 */  beqz       $s0, .L8008C240
/* 7CA24 8008C224 00000000 */   nop
/* 7CA28 8008C228 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 7CA2C 8008C22C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
.L8008C230:
/* 7CA30 8008C230 000043AC */  sw         $v1, 0x0($v0)
/* 7CA34 8008C234 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 7CA38 8008C238 FDFF0016 */  bnez       $s0, .L8008C230
/* 7CA3C 8008C23C 04004224 */   addiu     $v0, $v0, 0x4
.L8008C240:
/* 7CA40 8008C240 1800BF8F */  lw         $ra, 0x18($sp)
/* 7CA44 8008C244 1400B18F */  lw         $s1, 0x14($sp)
/* 7CA48 8008C248 1000B08F */  lw         $s0, 0x10($sp)
/* 7CA4C 8008C24C 0800E003 */  jr         $ra
/* 7CA50 8008C250 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONSTER_InitVertexColors, . - MONSTER_InitVertexColors
