.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetLooping
/* 80518 8008FD18 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8051C 8008FD1C 1800B2AF */  sw         $s2, 0x18($sp)
/* 80520 8008FD20 21908000 */  addu       $s2, $a0, $zero
/* 80524 8008FD24 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 80528 8008FD28 1400B1AF */  sw         $s1, 0x14($sp)
/* 8052C 8008FD2C 1000B0AF */  sw         $s0, 0x10($sp)
/* 80530 8008FD30 00004292 */  lbu        $v0, 0x0($s2)
/* 80534 8008FD34 00000000 */  nop
/* 80538 8008FD38 09004010 */  beqz       $v0, .L8008FD60
/* 8053C 8008FD3C 21800000 */   addu      $s0, $zero, $zero
/* 80540 8008FD40 24001124 */  addiu      $s1, $zero, 0x24
.L8008FD44:
/* 80544 8008FD44 5540020C */  jal        G2AnimSection_SetLooping
/* 80548 8008FD48 21205102 */   addu      $a0, $s2, $s1
/* 8054C 8008FD4C 00004292 */  lbu        $v0, 0x0($s2)
/* 80550 8008FD50 01001026 */  addiu      $s0, $s0, 0x1
/* 80554 8008FD54 2A100202 */  slt        $v0, $s0, $v0
/* 80558 8008FD58 FAFF4014 */  bnez       $v0, .L8008FD44
/* 8055C 8008FD5C 30003126 */   addiu     $s1, $s1, 0x30
.L8008FD60:
/* 80560 8008FD60 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 80564 8008FD64 1800B28F */  lw         $s2, 0x18($sp)
/* 80568 8008FD68 1400B18F */  lw         $s1, 0x14($sp)
/* 8056C 8008FD6C 1000B08F */  lw         $s0, 0x10($sp)
/* 80570 8008FD70 0800E003 */  jr         $ra
/* 80574 8008FD74 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_SetLooping, . - G2Anim_SetLooping
