.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetUnpaused
/* 8066C 8008FE6C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 80670 8008FE70 1800B2AF */  sw         $s2, 0x18($sp)
/* 80674 8008FE74 21908000 */  addu       $s2, $a0, $zero
/* 80678 8008FE78 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8067C 8008FE7C 1400B1AF */  sw         $s1, 0x14($sp)
/* 80680 8008FE80 1000B0AF */  sw         $s0, 0x10($sp)
/* 80684 8008FE84 00004292 */  lbu        $v0, 0x0($s2)
/* 80688 8008FE88 00000000 */  nop
/* 8068C 8008FE8C 09004010 */  beqz       $v0, .L8008FEB4
/* 80690 8008FE90 21800000 */   addu      $s0, $zero, $zero
/* 80694 8008FE94 24001124 */  addiu      $s1, $zero, 0x24
.L8008FE98:
/* 80698 8008FE98 8040020C */  jal        G2AnimSection_SetUnpaused
/* 8069C 8008FE9C 21205102 */   addu      $a0, $s2, $s1
/* 806A0 8008FEA0 00004292 */  lbu        $v0, 0x0($s2)
/* 806A4 8008FEA4 01001026 */  addiu      $s0, $s0, 0x1
/* 806A8 8008FEA8 2A100202 */  slt        $v0, $s0, $v0
/* 806AC 8008FEAC FAFF4014 */  bnez       $v0, .L8008FE98
/* 806B0 8008FEB0 30003126 */   addiu     $s1, $s1, 0x30
.L8008FEB4:
/* 806B4 8008FEB4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 806B8 8008FEB8 1800B28F */  lw         $s2, 0x18($sp)
/* 806BC 8008FEBC 1400B18F */  lw         $s1, 0x14($sp)
/* 806C0 8008FEC0 1000B08F */  lw         $s0, 0x10($sp)
/* 806C4 8008FEC4 0800E003 */  jr         $ra
/* 806C8 8008FEC8 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_SetUnpaused, . - G2Anim_SetUnpaused
