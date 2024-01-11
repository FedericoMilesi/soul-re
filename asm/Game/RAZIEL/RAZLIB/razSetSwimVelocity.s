.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetSwimVelocity
/* 9777C 800A6F7C FC01828C */  lw         $v0, 0x1FC($a0)
/* 97780 800A6F80 00000000 */  nop
/* 97784 800A6F84 1800A200 */  mult       $a1, $v0
/* 97788 800A6F88 840180AC */  sw         $zero, 0x184($a0)
/* 9778C 800A6F8C 800180AC */  sw         $zero, 0x180($a0)
/* 97790 800A6F90 780180AC */  sw         $zero, 0x178($a0)
/* 97794 800A6F94 12100000 */  mflo       $v0
/* 97798 800A6F98 02004104 */  bgez       $v0, .L800A6FA4
/* 9779C 800A6F9C 740180AC */   sw        $zero, 0x174($a0)
/* 977A0 800A6FA0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A6FA4:
/* 977A4 800A6FA4 03130200 */  sra        $v0, $v0, 12
/* 977A8 800A6FA8 92FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x562)($gp)
/* 977AC 800A6FAC 7C01828C */  lw         $v0, 0x17C($a0)
/* 977B0 800A6FB0 00000000 */  nop
/* 977B4 800A6FB4 2A10A200 */  slt        $v0, $a1, $v0
/* 977B8 800A6FB8 03004010 */  beqz       $v0, .L800A6FC8
/* 977BC 800A6FBC 23100600 */   negu      $v0, $a2
/* 977C0 800A6FC0 0800E003 */  jr         $ra
/* 977C4 800A6FC4 880182AC */   sw        $v0, 0x188($a0)
.L800A6FC8:
/* 977C8 800A6FC8 0800E003 */  jr         $ra
/* 977CC 800A6FCC 880186AC */   sw        $a2, 0x188($a0)
.size razSetSwimVelocity, . - razSetSwimVelocity
