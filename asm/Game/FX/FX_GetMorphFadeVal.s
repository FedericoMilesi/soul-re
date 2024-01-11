.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetMorphFadeVal
/* 39A04 80049204 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 39A08 80049208 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 39A0C 8004920C D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 39A10 80049210 00130200 */  sll        $v0, $v0, 12
/* 39A14 80049214 18004300 */  mult       $v0, $v1
/* 39A18 80049218 C3170200 */  sra        $v0, $v0, 31
/* 39A1C 8004921C 10280000 */  mfhi       $a1
/* 39A20 80049220 83190500 */  sra        $v1, $a1, 6
/* 39A24 80049224 23206200 */  subu       $a0, $v1, $v0
/* 39A28 80049228 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 39A2C 8004922C 01000224 */  addiu      $v0, $zero, 0x1
/* 39A30 80049230 02006214 */  bne        $v1, $v0, .L8004923C
/* 39A34 80049234 00100224 */   addiu     $v0, $zero, 0x1000
/* 39A38 80049238 23204400 */  subu       $a0, $v0, $a0
.L8004923C:
/* 39A3C 8004923C 0800E003 */  jr         $ra
/* 39A40 80049240 21108000 */   addu      $v0, $a0, $zero
.size FX_GetMorphFadeVal, . - FX_GetMorphFadeVal
