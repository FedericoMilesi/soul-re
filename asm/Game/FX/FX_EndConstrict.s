.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_EndConstrict
/* 38498 80047C98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3849C 80047C9C 12008010 */  beqz       $a0, .L80047CE8
/* 384A0 80047CA0 1000BFAF */   sw        $ra, 0x10($sp)
/* 384A4 80047CA4 01000224 */  addiu      $v0, $zero, 0x1
/* 384A8 80047CA8 6C9A82A7 */  sh         $v0, %gp_rel(FX_ConstrictStage)($gp)
/* 384AC 80047CAC 709A85AF */  sw         $a1, %gp_rel(FX_ConstrictInstance)($gp)
/* 384B0 80047CB0 0400A010 */  beqz       $a1, .L80047CC4
/* 384B4 80047CB4 5C00A224 */   addiu     $v0, $a1, 0x5C
/* 384B8 80047CB8 5C00A394 */  lhu        $v1, 0x5C($a1)
/* 384BC 80047CBC 341F0108 */  j          .L80047CD0
/* 384C0 80047CC0 00000000 */   nop
.L80047CC4:
/* 384C4 80047CC4 B8C3828F */  lw         $v0, %gp_rel(FX_ConstrictPositionPtr)($gp)
/* 384C8 80047CC8 00000000 */  nop
/* 384CC 80047CCC 00004394 */  lhu        $v1, 0x0($v0)
.L80047CD0:
/* 384D0 80047CD0 02004494 */  lhu        $a0, 0x2($v0)
/* 384D4 80047CD4 04004594 */  lhu        $a1, 0x4($v0)
/* 384D8 80047CD8 B0C38227 */  addiu      $v0, $gp, %gp_rel(FX_ConstrictPosition)
/* 384DC 80047CDC B0C383A7 */  sh         $v1, %gp_rel(FX_ConstrictPosition)($gp)
/* 384E0 80047CE0 020044A4 */  sh         $a0, 0x2($v0)
/* 384E4 80047CE4 040045A4 */  sh         $a1, 0x4($v0)
.L80047CE8:
/* 384E8 80047CE8 689A848F */  lw         $a0, %gp_rel(FX_ConstrictRibbon)($gp)
/* 384EC 80047CEC 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 384F0 80047CF0 00000000 */   nop
/* 384F4 80047CF4 1000BF8F */  lw         $ra, 0x10($sp)
/* 384F8 80047CF8 689A80AF */  sw         $zero, %gp_rel(FX_ConstrictRibbon)($gp)
/* 384FC 80047CFC 0800E003 */  jr         $ra
/* 38500 80047D00 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_EndConstrict, . - FX_EndConstrict
