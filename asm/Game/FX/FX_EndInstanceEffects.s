.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_EndInstanceEffects
/* 3DE58 8004D658 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3DE5C 8004D65C 1400B1AF */  sw         $s1, 0x14($sp)
/* 3DE60 8004D660 21888000 */  addu       $s1, $a0, $zero
/* 3DE64 8004D664 649A848F */  lw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3DE68 8004D668 1800BFAF */  sw         $ra, 0x18($sp)
/* 3DE6C 8004D66C 0A008010 */  beqz       $a0, .L8004D698
/* 3DE70 8004D670 1000B0AF */   sw        $s0, 0x10($sp)
.L8004D674:
/* 3DE74 8004D674 0800828C */  lw         $v0, 0x8($a0)
/* 3DE78 8004D678 0000908C */  lw         $s0, 0x0($a0)
/* 3DE7C 8004D67C 03005114 */  bne        $v0, $s1, .L8004D68C
/* 3DE80 8004D680 00000000 */   nop
/* 3DE84 8004D684 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3DE88 8004D688 00000000 */   nop
.L8004D68C:
/* 3DE8C 8004D68C 21200002 */  addu       $a0, $s0, $zero
/* 3DE90 8004D690 F8FF8014 */  bnez       $a0, .L8004D674
/* 3DE94 8004D694 00000000 */   nop
.L8004D698:
/* 3DE98 8004D698 1800BF8F */  lw         $ra, 0x18($sp)
/* 3DE9C 8004D69C 1400B18F */  lw         $s1, 0x14($sp)
/* 3DEA0 8004D6A0 1000B08F */  lw         $s0, 0x10($sp)
/* 3DEA4 8004D6A4 0800E003 */  jr         $ra
/* 3DEA8 8004D6A8 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_EndInstanceEffects, . - FX_EndInstanceEffects
