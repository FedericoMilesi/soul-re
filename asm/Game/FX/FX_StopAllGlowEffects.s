.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StopAllGlowEffects
/* 3BF7C 8004B77C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3BF80 8004B780 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3BF84 8004B784 21988000 */  addu       $s3, $a0, $zero
/* 3BF88 8004B788 649A848F */  lw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BF8C 8004B78C 40110500 */  sll        $v0, $a1, 5
/* 3BF90 8004B790 1000B0AF */  sw         $s0, 0x10($sp)
/* 3BF94 8004B794 21804500 */  addu       $s0, $v0, $a1
/* 3BF98 8004B798 2000BFAF */  sw         $ra, 0x20($sp)
/* 3BF9C 8004B79C 1800B2AF */  sw         $s2, 0x18($sp)
/* 3BFA0 8004B7A0 14008010 */  beqz       $a0, .L8004B7F4
/* 3BFA4 8004B7A4 1400B1AF */   sw        $s1, 0x14($sp)
/* 3BFA8 8004B7A8 83001224 */  addiu      $s2, $zero, 0x83
.L8004B7AC:
/* 3BFAC 8004B7AC 0C008290 */  lbu        $v0, 0xC($a0)
/* 3BFB0 8004B7B0 0000918C */  lw         $s1, 0x0($a0)
/* 3BFB4 8004B7B4 0C005214 */  bne        $v0, $s2, .L8004B7E8
/* 3BFB8 8004B7B8 00000000 */   nop
/* 3BFBC 8004B7BC 0800828C */  lw         $v0, 0x8($a0)
/* 3BFC0 8004B7C0 00000000 */  nop
/* 3BFC4 8004B7C4 08005314 */  bne        $v0, $s3, .L8004B7E8
/* 3BFC8 8004B7C8 00000000 */   nop
/* 3BFCC 8004B7CC 04000012 */  beqz       $s0, .L8004B7E0
/* 3BFD0 8004B7D0 00000000 */   nop
/* 3BFD4 8004B7D4 2A0090A4 */  sh         $s0, 0x2A($a0)
/* 3BFD8 8004B7D8 FA2D0108 */  j          .L8004B7E8
/* 3BFDC 8004B7DC 0E0090A4 */   sh        $s0, 0xE($a0)
.L8004B7E0:
/* 3BFE0 8004B7E0 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3BFE4 8004B7E4 00000000 */   nop
.L8004B7E8:
/* 3BFE8 8004B7E8 21202002 */  addu       $a0, $s1, $zero
/* 3BFEC 8004B7EC EFFF8014 */  bnez       $a0, .L8004B7AC
/* 3BFF0 8004B7F0 00000000 */   nop
.L8004B7F4:
/* 3BFF4 8004B7F4 2000BF8F */  lw         $ra, 0x20($sp)
/* 3BFF8 8004B7F8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3BFFC 8004B7FC 1800B28F */  lw         $s2, 0x18($sp)
/* 3C000 8004B800 1400B18F */  lw         $s1, 0x14($sp)
/* 3C004 8004B804 1000B08F */  lw         $s0, 0x10($sp)
/* 3C008 8004B808 0800E003 */  jr         $ra
/* 3C00C 8004B80C 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_StopAllGlowEffects, . - FX_StopAllGlowEffects
