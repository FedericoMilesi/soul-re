.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Instance_RebuildTransforms
/* 858A8 800950A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 858AC 800950AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 858B0 800950B0 1C00838C */  lw         $v1, 0x1C($a0)
/* 858B4 800950B4 00000000 */  nop
/* 858B8 800950B8 1000628C */  lw         $v0, 0x10($v1)
/* 858BC 800950BC 00000000 */  nop
/* 858C0 800950C0 0A004010 */  beqz       $v0, .L800950EC
/* 858C4 800950C4 00000000 */   nop
/* 858C8 800950C8 2C00628C */  lw         $v0, 0x2C($v1)
/* 858CC 800950CC 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 858D0 800950D0 24104300 */  and        $v0, $v0, $v1
/* 858D4 800950D4 05004014 */  bnez       $v0, .L800950EC
/* 858D8 800950D8 00000000 */   nop
/* 858DC 800950DC 4954020C */  jal        _G2Instance_RebuildAnimatedTransforms
/* 858E0 800950E0 00000000 */   nop
/* 858E4 800950E4 3D540208 */  j          .L800950F4
/* 858E8 800950E8 00000000 */   nop
.L800950EC:
/* 858EC 800950EC 9A55020C */  jal        _G2Instance_RebuildNonAnimatedTransforms
/* 858F0 800950F0 00000000 */   nop
.L800950F4:
/* 858F4 800950F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 858F8 800950F8 00000000 */  nop
/* 858FC 800950FC 0800E003 */  jr         $ra
/* 85900 80095100 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Instance_RebuildTransforms, . - G2Instance_RebuildTransforms
