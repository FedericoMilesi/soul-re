.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetAlphaTable
/* 8046C 8008FC6C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 80470 8008FC70 1800B2AF */  sw         $s2, 0x18($sp)
/* 80474 8008FC74 21908000 */  addu       $s2, $a0, $zero
/* 80478 8008FC78 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8047C 8008FC7C 2198A000 */  addu       $s3, $a1, $zero
/* 80480 8008FC80 2000BFAF */  sw         $ra, 0x20($sp)
/* 80484 8008FC84 1400B1AF */  sw         $s1, 0x14($sp)
/* 80488 8008FC88 1000B0AF */  sw         $s0, 0x10($sp)
/* 8048C 8008FC8C 00004292 */  lbu        $v0, 0x0($s2)
/* 80490 8008FC90 00000000 */  nop
/* 80494 8008FC94 0A004010 */  beqz       $v0, .L8008FCC0
/* 80498 8008FC98 21800000 */   addu      $s0, $zero, $zero
/* 8049C 8008FC9C 24001124 */  addiu      $s1, $zero, 0x24
.L8008FCA0:
/* 804A0 8008FCA0 21205102 */  addu       $a0, $s2, $s1
/* 804A4 8008FCA4 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 804A8 8008FCA8 21286002 */   addu      $a1, $s3, $zero
/* 804AC 8008FCAC 00004292 */  lbu        $v0, 0x0($s2)
/* 804B0 8008FCB0 01001026 */  addiu      $s0, $s0, 0x1
/* 804B4 8008FCB4 2A100202 */  slt        $v0, $s0, $v0
/* 804B8 8008FCB8 F9FF4014 */  bnez       $v0, .L8008FCA0
/* 804BC 8008FCBC 30003126 */   addiu     $s1, $s1, 0x30
.L8008FCC0:
/* 804C0 8008FCC0 2000BF8F */  lw         $ra, 0x20($sp)
/* 804C4 8008FCC4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 804C8 8008FCC8 1800B28F */  lw         $s2, 0x18($sp)
/* 804CC 8008FCCC 1400B18F */  lw         $s1, 0x14($sp)
/* 804D0 8008FCD0 1000B08F */  lw         $s0, 0x10($sp)
/* 804D4 8008FCD4 0800E003 */  jr         $ra
/* 804D8 8008FCD8 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_SetAlphaTable, . - G2Anim_SetAlphaTable
