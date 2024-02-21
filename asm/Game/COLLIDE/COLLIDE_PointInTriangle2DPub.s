.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_PointInTriangle2DPub
/* F2BC 8001EABC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* F2C0 8001EAC0 0D80023C */  lui        $v0, %hi(D_800D05D4)
/* F2C4 8001EAC4 2000BFAF */  sw         $ra, 0x20($sp)
/* F2C8 8001EAC8 D4054A24 */  addiu      $t2, $v0, %lo(D_800D05D4)
/* F2CC 8001EACC 03004389 */  lwl        $v1, 0x3($t2)
/* F2D0 8001EAD0 00004399 */  lwr        $v1, 0x0($t2)
/* F2D4 8001EAD4 07004889 */  lwl        $t0, 0x7($t2)
/* F2D8 8001EAD8 04004899 */  lwr        $t0, 0x4($t2)
/* F2DC 8001EADC 1B00A3AB */  swl        $v1, 0x1B($sp)
/* F2E0 8001EAE0 1800A3BB */  swr        $v1, 0x18($sp)
/* F2E4 8001EAE4 1F00A8AB */  swl        $t0, 0x1F($sp)
/* F2E8 8001EAE8 1C00A8BB */  swr        $t0, 0x1C($sp)
/* F2EC 8001EAEC 1800A227 */  addiu      $v0, $sp, 0x18
/* F2F0 8001EAF0 067A000C */  jal        COLLIDE_PointInTriangle
/* F2F4 8001EAF4 1000A2AF */   sw        $v0, 0x10($sp)
/* F2F8 8001EAF8 2000BF8F */  lw         $ra, 0x20($sp)
/* F2FC 8001EAFC 00000000 */  nop
/* F300 8001EB00 0800E003 */  jr         $ra
/* F304 8001EB04 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_PointInTriangle2DPub, . - COLLIDE_PointInTriangle2DPub
