.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_SetInteractiveMusic
/* 985E4 800A7DE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 985E8 800A7DE8 01000224 */  addiu      $v0, $zero, 0x1
/* 985EC 800A7DEC 1000B0AF */  sw         $s0, 0x10($sp)
/* 985F0 800A7DF0 04808200 */  sllv       $s0, $v0, $a0
/* 985F4 800A7DF4 0B00A010 */  beqz       $a1, .L800A7E24
/* 985F8 800A7DF8 1400BFAF */   sw        $ra, 0x14($sp)
/* 985FC 800A7DFC 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* 98600 800A7E00 00000000 */  nop
/* 98604 800A7E04 24105000 */  and        $v0, $v0, $s0
/* 98608 800A7E08 03004014 */  bnez       $v0, .L800A7E18
/* 9860C 800A7E0C 00000000 */   nop
/* 98610 800A7E10 3604010C */  jal        SOUND_SetMusicModifier
/* 98614 800A7E14 00000000 */   nop
.L800A7E18:
/* 98618 800A7E18 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* 9861C 800A7E1C 939F0208 */  j          .L800A7E4C
/* 98620 800A7E20 25105000 */   or        $v0, $v0, $s0
.L800A7E24:
/* 98624 800A7E24 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* 98628 800A7E28 00000000 */  nop
/* 9862C 800A7E2C 24105000 */  and        $v0, $v0, $s0
/* 98630 800A7E30 03004010 */  beqz       $v0, .L800A7E40
/* 98634 800A7E34 00000000 */   nop
/* 98638 800A7E38 6604010C */  jal        SOUND_ResetMusicModifier
/* 9863C 800A7E3C 00000000 */   nop
.L800A7E40:
/* 98640 800A7E40 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* 98644 800A7E44 27181000 */  nor        $v1, $zero, $s0
/* 98648 800A7E48 24104300 */  and        $v0, $v0, $v1
.L800A7E4C:
/* 9864C 800A7E4C 88FB82AF */  sw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* 98650 800A7E50 1400BF8F */  lw         $ra, 0x14($sp)
/* 98654 800A7E54 1000B08F */  lw         $s0, 0x10($sp)
/* 98658 800A7E58 0800E003 */  jr         $ra
/* 9865C 800A7E5C 1800BD27 */   addiu     $sp, $sp, 0x18
.size RAZIEL_SetInteractiveMusic, . - RAZIEL_SetInteractiveMusic
