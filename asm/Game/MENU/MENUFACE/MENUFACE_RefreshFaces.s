.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MENUFACE_RefreshFaces
/* A9CF4 800B94F4 ECAA828F */  lw         $v0, %gp_rel(hack_initialized)($gp)
/* A9CF8 800B94F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A9CFC 800B94FC 2000BFAF */  sw         $ra, 0x20($sp)
/* A9D00 800B9500 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A9D04 800B9504 1800B2AF */  sw         $s2, 0x18($sp)
/* A9D08 800B9508 1400B1AF */  sw         $s1, 0x14($sp)
/* A9D0C 800B950C 1C004010 */  beqz       $v0, .L800B9580
/* A9D10 800B9510 1000B0AF */   sw        $s0, 0x10($sp)
/* A9D14 800B9514 21980000 */  addu       $s3, $zero, $zero
/* A9D18 800B9518 6CAA9227 */  addiu      $s2, $gp, %gp_rel(MenuFaces)
/* A9D1C 800B951C 6EAA9027 */  addiu      $s0, $gp, %gp_rel(MenuFaces + 0x2)
/* A9D20 800B9520 21886002 */  addu       $s1, $s3, $zero
.L800B9524:
/* A9D24 800B9524 06000486 */  lh         $a0, 0x6($s0)
/* A9D28 800B9528 04000392 */  lbu        $v1, 0x4($s0)
/* A9D2C 800B952C 00000000 */  nop
/* A9D30 800B9530 2A108300 */  slt        $v0, $a0, $v1
/* A9D34 800B9534 0C004014 */  bnez       $v0, .L800B9568
/* A9D38 800B9538 00000000 */   nop
/* A9D3C 800B953C 1A008300 */  div        $zero, $a0, $v1
/* A9D40 800B9540 12200000 */  mflo       $a0
/* A9D44 800B9544 2000828F */  lw         $v0, %gp_rel(FaceButtons)($gp)
/* A9D48 800B9548 9CBF878F */  lw         $a3, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* A9D4C 800B954C 00004586 */  lh         $a1, 0x0($s2)
/* A9D50 800B9550 00000686 */  lh         $a2, 0x0($s0)
/* A9D54 800B9554 0400E724 */  addiu      $a3, $a3, 0x4
/* A9D58 800B9558 21202402 */  addu       $a0, $s1, $a0
/* A9D5C 800B955C 00210400 */  sll        $a0, $a0, 4
/* A9D60 800B9560 68AB000C */  jal        DRAW_DrawButton
/* A9D64 800B9564 21204400 */   addu      $a0, $v0, $a0
.L800B9568:
/* A9D68 800B9568 07003126 */  addiu      $s1, $s1, 0x7
/* A9D6C 800B956C 01007326 */  addiu      $s3, $s3, 0x1
/* A9D70 800B9570 10001026 */  addiu      $s0, $s0, 0x10
/* A9D74 800B9574 0800622A */  slti       $v0, $s3, 0x8
/* A9D78 800B9578 EAFF4014 */  bnez       $v0, .L800B9524
/* A9D7C 800B957C 10005226 */   addiu     $s2, $s2, 0x10
.L800B9580:
/* A9D80 800B9580 2000BF8F */  lw         $ra, 0x20($sp)
/* A9D84 800B9584 1C00B38F */  lw         $s3, 0x1C($sp)
/* A9D88 800B9588 1800B28F */  lw         $s2, 0x18($sp)
/* A9D8C 800B958C 1400B18F */  lw         $s1, 0x14($sp)
/* A9D90 800B9590 1000B08F */  lw         $s0, 0x10($sp)
/* A9D94 800B9594 0800E003 */  jr         $ra
/* A9D98 800B9598 2800BD27 */   addiu     $sp, $sp, 0x28
.size MENUFACE_RefreshFaces, . - MENUFACE_RefreshFaces
