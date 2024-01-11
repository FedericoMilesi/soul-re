.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SwitchToKeylist
/* 806CC 8008FECC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 806D0 8008FED0 1800B2AF */  sw         $s2, 0x18($sp)
/* 806D4 8008FED4 21908000 */  addu       $s2, $a0, $zero
/* 806D8 8008FED8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 806DC 8008FEDC 2198A000 */  addu       $s3, $a1, $zero
/* 806E0 8008FEE0 2000B4AF */  sw         $s4, 0x20($sp)
/* 806E4 8008FEE4 21A0C000 */  addu       $s4, $a2, $zero
/* 806E8 8008FEE8 2400BFAF */  sw         $ra, 0x24($sp)
/* 806EC 8008FEEC 1400B1AF */  sw         $s1, 0x14($sp)
/* 806F0 8008FEF0 1000B0AF */  sw         $s0, 0x10($sp)
/* 806F4 8008FEF4 00004292 */  lbu        $v0, 0x0($s2)
/* 806F8 8008FEF8 00000000 */  nop
/* 806FC 8008FEFC 0B004010 */  beqz       $v0, .L8008FF2C
/* 80700 8008FF00 21800000 */   addu      $s0, $zero, $zero
/* 80704 8008FF04 24001124 */  addiu      $s1, $zero, 0x24
.L8008FF08:
/* 80708 8008FF08 21205102 */  addu       $a0, $s2, $s1
/* 8070C 8008FF0C 21286002 */  addu       $a1, $s3, $zero
/* 80710 8008FF10 8540020C */  jal        G2AnimSection_SwitchToKeylist
/* 80714 8008FF14 21308002 */   addu      $a2, $s4, $zero
/* 80718 8008FF18 00004292 */  lbu        $v0, 0x0($s2)
/* 8071C 8008FF1C 01001026 */  addiu      $s0, $s0, 0x1
/* 80720 8008FF20 2A100202 */  slt        $v0, $s0, $v0
/* 80724 8008FF24 F8FF4014 */  bnez       $v0, .L8008FF08
/* 80728 8008FF28 30003126 */   addiu     $s1, $s1, 0x30
.L8008FF2C:
/* 8072C 8008FF2C 2400BF8F */  lw         $ra, 0x24($sp)
/* 80730 8008FF30 2000B48F */  lw         $s4, 0x20($sp)
/* 80734 8008FF34 1C00B38F */  lw         $s3, 0x1C($sp)
/* 80738 8008FF38 1800B28F */  lw         $s2, 0x18($sp)
/* 8073C 8008FF3C 1400B18F */  lw         $s1, 0x14($sp)
/* 80740 8008FF40 1000B08F */  lw         $s0, 0x10($sp)
/* 80744 8008FF44 0800E003 */  jr         $ra
/* 80748 8008FF48 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_SwitchToKeylist, . - G2Anim_SwitchToKeylist
