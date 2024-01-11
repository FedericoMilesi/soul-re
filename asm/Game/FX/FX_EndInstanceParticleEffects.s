.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_EndInstanceParticleEffects
/* 3DEAC 8004D6AC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3DEB0 8004D6B0 1800B2AF */  sw         $s2, 0x18($sp)
/* 3DEB4 8004D6B4 21908000 */  addu       $s2, $a0, $zero
/* 3DEB8 8004D6B8 649A848F */  lw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3DEBC 8004D6BC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3DEC0 8004D6C0 1400B1AF */  sw         $s1, 0x14($sp)
/* 3DEC4 8004D6C4 0F008010 */  beqz       $a0, .L8004D704
/* 3DEC8 8004D6C8 1000B0AF */   sw        $s0, 0x10($sp)
/* 3DECC 8004D6CC 01001124 */  addiu      $s1, $zero, 0x1
.L8004D6D0:
/* 3DED0 8004D6D0 0800828C */  lw         $v0, 0x8($a0)
/* 3DED4 8004D6D4 0000908C */  lw         $s0, 0x0($a0)
/* 3DED8 8004D6D8 07005214 */  bne        $v0, $s2, .L8004D6F8
/* 3DEDC 8004D6DC 00000000 */   nop
/* 3DEE0 8004D6E0 0C008290 */  lbu        $v0, 0xC($a0)
/* 3DEE4 8004D6E4 00000000 */  nop
/* 3DEE8 8004D6E8 03005114 */  bne        $v0, $s1, .L8004D6F8
/* 3DEEC 8004D6EC 00000000 */   nop
/* 3DEF0 8004D6F0 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3DEF4 8004D6F4 00000000 */   nop
.L8004D6F8:
/* 3DEF8 8004D6F8 21200002 */  addu       $a0, $s0, $zero
/* 3DEFC 8004D6FC F4FF8014 */  bnez       $a0, .L8004D6D0
/* 3DF00 8004D700 00000000 */   nop
.L8004D704:
/* 3DF04 8004D704 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3DF08 8004D708 1800B28F */  lw         $s2, 0x18($sp)
/* 3DF0C 8004D70C 1400B18F */  lw         $s1, 0x14($sp)
/* 3DF10 8004D710 1000B08F */  lw         $s0, 0x10($sp)
/* 3DF14 8004D714 0800E003 */  jr         $ra
/* 3DF18 8004D718 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_EndInstanceParticleEffects, . - FX_EndInstanceParticleEffects
