.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateSwitchStateDataDefault
/* 63224 80072A24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 63228 80072A28 1400B1AF */  sw         $s1, 0x14($sp)
/* 6322C 80072A2C 21888000 */  addu       $s1, $a0, $zero
/* 63230 80072A30 1000B0AF */  sw         $s0, 0x10($sp)
/* 63234 80072A34 2180A000 */  addu       $s0, $a1, $zero
/* 63238 80072A38 C0101000 */  sll        $v0, $s0, 3
/* 6323C 80072A3C 21105000 */  addu       $v0, $v0, $s0
/* 63240 80072A40 C0100200 */  sll        $v0, $v0, 3
/* 63244 80072A44 23105000 */  subu       $v0, $v0, $s0
/* 63248 80072A48 80100200 */  sll        $v0, $v0, 2
/* 6324C 80072A4C 21102202 */  addu       $v0, $s1, $v0
/* 63250 80072A50 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 63254 80072A54 1800B2AF */  sw         $s2, 0x18($sp)
/* 63258 80072A58 0800528C */  lw         $s2, 0x8($v0)
/* 6325C 80072A5C C1CA010C */  jal        StateSwitchStateData
/* 63260 80072A60 00000000 */   nop
/* 63264 80072A64 21202002 */  addu       $a0, $s1, $zero
/* 63268 80072A68 21280002 */  addu       $a1, $s0, $zero
/* 6326C 80072A6C 09F84002 */  jalr       $s2
/* 63270 80072A70 21300000 */   addu      $a2, $zero, $zero
/* 63274 80072A74 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 63278 80072A78 1800B28F */  lw         $s2, 0x18($sp)
/* 6327C 80072A7C 1400B18F */  lw         $s1, 0x14($sp)
/* 63280 80072A80 1000B08F */  lw         $s0, 0x10($sp)
/* 63284 80072A84 0800E003 */  jr         $ra
/* 63288 80072A88 2000BD27 */   addiu     $sp, $sp, 0x20
.size StateSwitchStateDataDefault, . - StateSwitchStateDataDefault
