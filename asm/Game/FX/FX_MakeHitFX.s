.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeHitFX
/* 3AF3C 8004A73C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 3AF40 8004A740 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 3AF44 8004A744 21888000 */  addu       $s1, $a0, $zero
/* 3AF48 8004A748 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 3AF4C 8004A74C 3000BFAF */  sw         $ra, 0x30($sp)
/* 3AF50 8004A750 C009010C */  jal        FX_GetPrim
/* 3AF54 8004A754 2800B0AF */   sw        $s0, 0x28($sp)
/* 3AF58 8004A758 21804000 */  addu       $s0, $v0, $zero
/* 3AF5C 8004A75C 17000012 */  beqz       $s0, .L8004A7BC
/* 3AF60 8004A760 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* 3AF64 8004A764 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 3AF68 8004A768 21200002 */  addu       $a0, $s0, $zero
/* 3AF6C 8004A76C 21282002 */  addu       $a1, $s1, $zero
/* 3AF70 8004A770 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3AF74 8004A774 60000224 */  addiu      $v0, $zero, 0x60
/* 3AF78 8004A778 2000A2AF */  sw         $v0, 0x20($sp)
/* 3AF7C 8004A77C 08000224 */  addiu      $v0, $zero, 0x8
/* 3AF80 8004A780 21300000 */  addu       $a2, $zero, $zero
/* 3AF84 8004A784 2138C000 */  addu       $a3, $a2, $zero
/* 3AF88 8004A788 1000A0AF */  sw         $zero, 0x10($sp)
/* 3AF8C 8004A78C 1400A0AF */  sw         $zero, 0x14($sp)
/* 3AF90 8004A790 1800A0AF */  sw         $zero, 0x18($sp)
/* 3AF94 8004A794 8D29010C */  jal        FX_MakeParticleTexFX
/* 3AF98 8004A798 2400A2AF */   sw        $v0, 0x24($sp)
/* 3AF9C 8004A79C 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 3AFA0 8004A7A0 21280002 */  addu       $a1, $s0, $zero
/* 3AFA4 8004A7A4 8F19010C */  jal        FX_Sprite_Insert
/* 3AFA8 8004A7A8 986D8424 */   addiu     $a0, $a0, 0x6D98
/* 3AFAC 8004A7AC 0C00028E */  lw         $v0, 0xC($s0)
/* 3AFB0 8004A7B0 00000000 */  nop
/* 3AFB4 8004A7B4 00804234 */  ori        $v0, $v0, 0x8000
/* 3AFB8 8004A7B8 0C0002AE */  sw         $v0, 0xC($s0)
.L8004A7BC:
/* 3AFBC 8004A7BC 3000BF8F */  lw         $ra, 0x30($sp)
/* 3AFC0 8004A7C0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 3AFC4 8004A7C4 2800B08F */  lw         $s0, 0x28($sp)
/* 3AFC8 8004A7C8 0800E003 */  jr         $ra
/* 3AFCC 8004A7CC 3800BD27 */   addiu     $sp, $sp, 0x38
.size FX_MakeHitFX, . - FX_MakeHitFX
