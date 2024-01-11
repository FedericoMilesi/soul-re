.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_Free
/* 834D4 80092CD4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 834D8 80092CD8 2000B4AF */  sw         $s4, 0x20($sp)
/* 834DC 80092CDC 21A08000 */  addu       $s4, $a0, $zero
/* 834E0 80092CE0 2400BFAF */  sw         $ra, 0x24($sp)
/* 834E4 80092CE4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 834E8 80092CE8 1800B2AF */  sw         $s2, 0x18($sp)
/* 834EC 80092CEC 1400B1AF */  sw         $s1, 0x14($sp)
/* 834F0 80092CF0 1000B0AF */  sw         $s0, 0x10($sp)
/* 834F4 80092CF4 00008292 */  lbu        $v0, 0x0($s4)
/* 834F8 80092CF8 00000000 */  nop
/* 834FC 80092CFC 1C004010 */  beqz       $v0, .L80092D70
/* 83500 80092D00 21900000 */   addu      $s2, $zero, $zero
/* 83504 80092D04 24001324 */  addiu      $s3, $zero, 0x24
.L80092D08:
/* 83508 80092D08 21889302 */  addu       $s1, $s4, $s3
/* 8350C 80092D0C 1F40020C */  jal        G2AnimSection_IsInInterpolation
/* 83510 80092D10 21202002 */   addu      $a0, $s1, $zero
/* 83514 80092D14 06004010 */  beqz       $v0, .L80092D30
/* 83518 80092D18 00000000 */   nop
/* 8351C 80092D1C 2C00228E */  lw         $v0, 0x2C($s1)
/* 83520 80092D20 00000000 */  nop
/* 83524 80092D24 02004294 */  lhu        $v0, 0x2($v0)
/* 83528 80092D28 00000000 */  nop
/* 8352C 80092D2C 040022A6 */  sh         $v0, 0x4($s1)
.L80092D30:
/* 83530 80092D30 2800248E */  lw         $a0, 0x28($s1)
/* 83534 80092D34 8B53020C */  jal        _G2Anim_FreeChanStatusBlockList
/* 83538 80092D38 00000000 */   nop
/* 8353C 80092D3C 2C00308E */  lw         $s0, 0x2C($s1)
/* 83540 80092D40 00000000 */  nop
/* 83544 80092D44 05000012 */  beqz       $s0, .L80092D5C
/* 83548 80092D48 280020AE */   sw        $zero, 0x28($s1)
/* 8354C 80092D4C 0800048E */  lw         $a0, 0x8($s0)
/* 83550 80092D50 A94A020C */  jal        _G2Anim_FreeInterpStateBlockList
/* 83554 80092D54 00000000 */   nop
/* 83558 80092D58 080000AE */  sw         $zero, 0x8($s0)
.L80092D5C:
/* 8355C 80092D5C 00008292 */  lbu        $v0, 0x0($s4)
/* 83560 80092D60 01005226 */  addiu      $s2, $s2, 0x1
/* 83564 80092D64 2A104202 */  slt        $v0, $s2, $v0
/* 83568 80092D68 E7FF4014 */  bnez       $v0, .L80092D08
/* 8356C 80092D6C 30007326 */   addiu     $s3, $s3, 0x30
.L80092D70:
/* 83570 80092D70 2400BF8F */  lw         $ra, 0x24($sp)
/* 83574 80092D74 2000B48F */  lw         $s4, 0x20($sp)
/* 83578 80092D78 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8357C 80092D7C 1800B28F */  lw         $s2, 0x18($sp)
/* 83580 80092D80 1400B18F */  lw         $s1, 0x14($sp)
/* 83584 80092D84 1000B08F */  lw         $s0, 0x10($sp)
/* 83588 80092D88 0800E003 */  jr         $ra
/* 8358C 80092D8C 2800BD27 */   addiu     $sp, $sp, 0x28
.size G2Anim_Free, . - G2Anim_Free
