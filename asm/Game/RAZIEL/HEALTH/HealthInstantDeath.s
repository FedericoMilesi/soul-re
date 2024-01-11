.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HealthInstantDeath
/* 955E4 800A4DE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 955E8 800A4DE8 01000224 */  addiu      $v0, $zero, 0x1
/* 955EC 800A4DEC 1000BFAF */  sw         $ra, 0x10($sp)
/* 955F0 800A4DF0 D2BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 955F4 800A4DF4 9F95020C */  jal        razSpectralShift
/* 955F8 800A4DF8 00000000 */   nop
/* 955FC 800A4DFC C0FC848F */  lw         $a0, %gp_rel(gameTracker)($gp)
/* 95600 800A4E00 50C30234 */  ori        $v0, $zero, 0xC350
/* 95604 800A4E04 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 95608 800A4E08 4401828C */  lw         $v0, 0x144($a0)
/* 9560C 800A4E0C 0800033C */  lui        $v1, (0x80000 >> 16)
/* 95610 800A4E10 25104300 */  or         $v0, $v0, $v1
/* 95614 800A4E14 440182AC */  sw         $v0, 0x144($a0)
/* 95618 800A4E18 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 9561C 800A4E1C 00000000 */  nop
/* 95620 800A4E20 04008010 */  beqz       $a0, .L800A4E34
/* 95624 800A4E24 8000053C */   lui       $a1, (0x800105 >> 16)
/* 95628 800A4E28 0501A534 */  ori        $a1, $a1, (0x800105 & 0xFFFF)
/* 9562C 800A4E2C A1D1000C */  jal        INSTANCE_Post
/* 95630 800A4E30 21300000 */   addu      $a2, $zero, $zero
.L800A4E34:
/* 95634 800A4E34 C89E020C */  jal        razSetPlayerEventHistory
/* 95638 800A4E38 00800434 */   ori       $a0, $zero, 0x8000
/* 9563C 800A4E3C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 95640 800A4E40 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 95644 800A4E44 00804234 */  ori        $v0, $v0, 0x8000
/* 95648 800A4E48 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9564C 800A4E4C D493020C */  jal        razPlayUnderworldSounds
/* 95650 800A4E50 00000000 */   nop
/* 95654 800A4E54 1000BF8F */  lw         $ra, 0x10($sp)
/* 95658 800A4E58 00000000 */  nop
/* 9565C 800A4E5C 0800E003 */  jr         $ra
/* 95660 800A4E60 1800BD27 */   addiu     $sp, $sp, 0x18
.size HealthInstantDeath, . - HealthInstantDeath
