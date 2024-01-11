.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetNoLooping
/* 80578 8008FD78 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8057C 8008FD7C 1800B2AF */  sw         $s2, 0x18($sp)
/* 80580 8008FD80 21908000 */  addu       $s2, $a0, $zero
/* 80584 8008FD84 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 80588 8008FD88 1400B1AF */  sw         $s1, 0x14($sp)
/* 8058C 8008FD8C 1000B0AF */  sw         $s0, 0x10($sp)
/* 80590 8008FD90 00004292 */  lbu        $v0, 0x0($s2)
/* 80594 8008FD94 00000000 */  nop
/* 80598 8008FD98 09004010 */  beqz       $v0, .L8008FDC0
/* 8059C 8008FD9C 21800000 */   addu      $s0, $zero, $zero
/* 805A0 8008FDA0 24001124 */  addiu      $s1, $zero, 0x24
.L8008FDA4:
/* 805A4 8008FDA4 7140020C */  jal        G2AnimSection_SetNoLooping
/* 805A8 8008FDA8 21205102 */   addu      $a0, $s2, $s1
/* 805AC 8008FDAC 00004292 */  lbu        $v0, 0x0($s2)
/* 805B0 8008FDB0 01001026 */  addiu      $s0, $s0, 0x1
/* 805B4 8008FDB4 2A100202 */  slt        $v0, $s0, $v0
/* 805B8 8008FDB8 FAFF4014 */  bnez       $v0, .L8008FDA4
/* 805BC 8008FDBC 30003126 */   addiu     $s1, $s1, 0x30
.L8008FDC0:
/* 805C0 8008FDC0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 805C4 8008FDC4 1800B28F */  lw         $s2, 0x18($sp)
/* 805C8 8008FDC8 1400B18F */  lw         $s1, 0x14($sp)
/* 805CC 8008FDCC 1000B08F */  lw         $s0, 0x10($sp)
/* 805D0 8008FDD0 0800E003 */  jr         $ra
/* 805D4 8008FDD4 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_SetNoLooping, . - G2Anim_SetNoLooping
