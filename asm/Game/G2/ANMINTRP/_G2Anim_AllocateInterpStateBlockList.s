.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_AllocateInterpStateBlockList
/* 8320C 80092A0C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 83210 80092A10 21108000 */  addu       $v0, $a0, $zero
/* 83214 80092A14 88F58427 */  addiu      $a0, $gp, %gp_rel(_interpStateBlockPool)
/* 83218 80092A18 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8321C 80092A1C 1800B2AF */  sw         $s2, 0x18($sp)
/* 83220 80092A20 1400B1AF */  sw         $s1, 0x14($sp)
/* 83224 80092A24 1000B0AF */  sw         $s0, 0x10($sp)
/* 83228 80092A28 03005090 */  lbu        $s0, 0x3($v0)
/* 8322C 80092A2C 2C00528C */  lw         $s2, 0x2C($v0)
/* 83230 80092A30 E157020C */  jal        G2PoolMem_Allocate
/* 83234 80092A34 00000000 */   nop
/* 83238 80092A38 13004010 */  beqz       $v0, .L80092A88
/* 8323C 80092A3C 080042AE */   sw        $v0, 0x8($s2)
/* 83240 80092A40 9E4A0208 */  j          .L80092A78
/* 83244 80092A44 21884000 */   addu      $s1, $v0, $zero
.L80092A48:
/* 83248 80092A48 88F58427 */  addiu      $a0, $gp, %gp_rel(_interpStateBlockPool)
/* 8324C 80092A4C E157020C */  jal        G2PoolMem_Allocate
/* 83250 80092A50 00000000 */   nop
/* 83254 80092A54 07004014 */  bnez       $v0, .L80092A74
/* 83258 80092A58 000022AE */   sw        $v0, 0x0($s1)
/* 8325C 80092A5C 0800448E */  lw         $a0, 0x8($s2)
/* 83260 80092A60 A94A020C */  jal        _G2Anim_FreeInterpStateBlockList
/* 83264 80092A64 00000000 */   nop
/* 83268 80092A68 21100000 */  addu       $v0, $zero, $zero
/* 8326C 80092A6C A34A0208 */  j          .L80092A8C
/* 83270 80092A70 080040AE */   sw        $zero, 0x8($s2)
.L80092A74:
/* 83274 80092A74 21884000 */  addu       $s1, $v0, $zero
.L80092A78:
/* 83278 80092A78 FCFF1026 */  addiu      $s0, $s0, -0x4
/* 8327C 80092A7C F2FF001E */  bgtz       $s0, .L80092A48
/* 83280 80092A80 00000000 */   nop
/* 83284 80092A84 000020AE */  sw         $zero, 0x0($s1)
.L80092A88:
/* 83288 80092A88 0800428E */  lw         $v0, 0x8($s2)
.L80092A8C:
/* 8328C 80092A8C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 83290 80092A90 1800B28F */  lw         $s2, 0x18($sp)
/* 83294 80092A94 1400B18F */  lw         $s1, 0x14($sp)
/* 83298 80092A98 1000B08F */  lw         $s0, 0x10($sp)
/* 8329C 80092A9C 0800E003 */  jr         $ra
/* 832A0 80092AA0 2000BD27 */   addiu     $sp, $sp, 0x20
.size _G2Anim_AllocateInterpStateBlockList, . - _G2Anim_AllocateInterpStateBlockList
