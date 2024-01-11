.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetPaused
/* 805D8 8008FDD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 805DC 8008FDDC 1800B2AF */  sw         $s2, 0x18($sp)
/* 805E0 8008FDE0 21908000 */  addu       $s2, $a0, $zero
/* 805E4 8008FDE4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 805E8 8008FDE8 1400B1AF */  sw         $s1, 0x14($sp)
/* 805EC 8008FDEC 1000B0AF */  sw         $s0, 0x10($sp)
/* 805F0 8008FDF0 00004292 */  lbu        $v0, 0x0($s2)
/* 805F4 8008FDF4 00000000 */  nop
/* 805F8 8008FDF8 09004010 */  beqz       $v0, .L8008FE20
/* 805FC 8008FDFC 21800000 */   addu      $s0, $zero, $zero
/* 80600 8008FE00 24001124 */  addiu      $s1, $zero, 0x24
.L8008FE04:
/* 80604 8008FE04 7B40020C */  jal        G2AnimSection_SetPaused
/* 80608 8008FE08 21205102 */   addu      $a0, $s2, $s1
/* 8060C 8008FE0C 00004292 */  lbu        $v0, 0x0($s2)
/* 80610 8008FE10 01001026 */  addiu      $s0, $s0, 0x1
/* 80614 8008FE14 2A100202 */  slt        $v0, $s0, $v0
/* 80618 8008FE18 FAFF4014 */  bnez       $v0, .L8008FE04
/* 8061C 8008FE1C 30003126 */   addiu     $s1, $s1, 0x30
.L8008FE20:
/* 80620 8008FE20 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 80624 8008FE24 1800B28F */  lw         $s2, 0x18($sp)
/* 80628 8008FE28 1400B18F */  lw         $s1, 0x14($sp)
/* 8062C 8008FE2C 1000B08F */  lw         $s0, 0x10($sp)
/* 80630 8008FE30 0800E003 */  jr         $ra
/* 80634 8008FE34 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_SetPaused, . - G2Anim_SetPaused
