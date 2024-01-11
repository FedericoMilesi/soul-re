.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_HitEntry
/* 7A22C 80089A2C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7A230 80089A30 1400B1AF */  sw         $s1, 0x14($sp)
/* 7A234 80089A34 21888000 */  addu       $s1, $a0, $zero
/* 7A238 80089A38 1800BFAF */  sw         $ra, 0x18($sp)
/* 7A23C 80089A3C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A240 80089A40 6C01308E */  lw         $s0, 0x16C($s1)
/* 7A244 80089A44 00000000 */  nop
/* 7A248 80089A48 C400048E */  lw         $a0, 0xC4($s0)
/* 7A24C 80089A4C 00000000 */  nop
/* 7A250 80089A50 18008294 */  lhu        $v0, 0x18($a0)
/* 7A254 80089A54 0100033C */  lui        $v1, (0x10000 >> 16)
/* 7A258 80089A58 00044234 */  ori        $v0, $v0, 0x400
/* 7A25C 80089A5C 180082A4 */  sh         $v0, 0x18($a0)
/* 7A260 80089A60 0000028E */  lw         $v0, 0x0($s0)
/* 7A264 80089A64 C000068E */  lw         $a2, 0xC0($s0)
/* 7A268 80089A68 25104300 */  or         $v0, $v0, $v1
/* 7A26C 80089A6C 000002AE */  sw         $v0, 0x0($s0)
/* 7A270 80089A70 0400858C */  lw         $a1, 0x4($a0)
/* 7A274 80089A74 3511020C */  jal        MON_SetUpKnockBack
/* 7A278 80089A78 21202002 */   addu      $a0, $s1, $zero
/* 7A27C 80089A7C 03004010 */  beqz       $v0, .L80089A8C
/* 7A280 80089A80 21202002 */   addu      $a0, $s1, $zero
/* 7A284 80089A84 A4260208 */  j          .L80089A90
/* 7A288 80089A88 21280000 */   addu      $a1, $zero, $zero
.L80089A8C:
/* 7A28C 80089A8C 01000524 */  addiu      $a1, $zero, 0x1
.L80089A90:
/* 7A290 80089A90 B6FF010C */  jal        MON_PlayAnim
/* 7A294 80089A94 01000624 */   addiu     $a2, $zero, 0x1
/* 7A298 80089A98 00800234 */  ori        $v0, $zero, 0x8000
/* 7A29C 80089A9C 080102AE */  sw         $v0, 0x108($s0)
/* 7A2A0 80089AA0 5800228E */  lw         $v0, 0x58($s1)
/* 7A2A4 80089AA4 21202002 */  addu       $a0, $s1, $zero
/* 7A2A8 80089AA8 20004234 */  ori        $v0, $v0, 0x20
/* 7A2AC 80089AAC 9006020C */  jal        MON_GetTime
/* 7A2B0 80089AB0 580082AC */   sw        $v0, 0x58($a0)
/* 7A2B4 80089AB4 AC264224 */  addiu      $v0, $v0, 0x26AC
/* 7A2B8 80089AB8 180102AE */  sw         $v0, 0x118($s0)
/* 7A2BC 80089ABC 1800BF8F */  lw         $ra, 0x18($sp)
/* 7A2C0 80089AC0 1400B18F */  lw         $s1, 0x14($sp)
/* 7A2C4 80089AC4 1000B08F */  lw         $s0, 0x10($sp)
/* 7A2C8 80089AC8 0800E003 */  jr         $ra
/* 7A2CC 80089ACC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_HitEntry, . - MON_HitEntry
