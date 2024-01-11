.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menuface_terminate
/* A9B24 800B9324 ECAA828F */  lw         $v0, %gp_rel(hack_initialized)($gp)
/* A9B28 800B9328 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A9B2C 800B932C 2000BFAF */  sw         $ra, 0x20($sp)
/* A9B30 800B9330 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A9B34 800B9334 1800B2AF */  sw         $s2, 0x18($sp)
/* A9B38 800B9338 1400B1AF */  sw         $s1, 0x14($sp)
/* A9B3C 800B933C 1D004010 */  beqz       $v0, .L800B93B4
/* A9B40 800B9340 1000B0AF */   sw        $s0, 0x10($sp)
/* A9B44 800B9344 21980000 */  addu       $s3, $zero, $zero
/* A9B48 800B9348 21906002 */  addu       $s2, $s3, $zero
/* A9B4C 800B934C 6CAA9127 */  addiu      $s1, $gp, %gp_rel(MenuFaces)
.L800B9350:
/* A9B50 800B9350 21800000 */  addu       $s0, $zero, $zero
.L800B9354:
/* A9B54 800B9354 0E002296 */  lhu        $v0, 0xE($s1)
/* A9B58 800B9358 00000000 */  nop
/* A9B5C 800B935C 07100202 */  srav       $v0, $v0, $s0
/* A9B60 800B9360 01004230 */  andi       $v0, $v0, 0x1
/* A9B64 800B9364 06004010 */  beqz       $v0, .L800B9380
/* A9B68 800B9368 00000000 */   nop
/* A9B6C 800B936C 21205002 */  addu       $a0, $s2, $s0
/* A9B70 800B9370 2000828F */  lw         $v0, %gp_rel(FaceButtons)($gp)
/* A9B74 800B9374 00210400 */  sll        $a0, $a0, 4
/* A9B78 800B9378 2AAC000C */  jal        DRAW_FreeButton
/* A9B7C 800B937C 21204400 */   addu      $a0, $v0, $a0
.L800B9380:
/* A9B80 800B9380 01001026 */  addiu      $s0, $s0, 0x1
/* A9B84 800B9384 0700022A */  slti       $v0, $s0, 0x7
/* A9B88 800B9388 F2FF4014 */  bnez       $v0, .L800B9354
/* A9B8C 800B938C 00000000 */   nop
/* A9B90 800B9390 07005226 */  addiu      $s2, $s2, 0x7
/* A9B94 800B9394 01007326 */  addiu      $s3, $s3, 0x1
/* A9B98 800B9398 0800622A */  slti       $v0, $s3, 0x8
/* A9B9C 800B939C ECFF4014 */  bnez       $v0, .L800B9350
/* A9BA0 800B93A0 10003126 */   addiu     $s1, $s1, 0x10
/* A9BA4 800B93A4 2000848F */  lw         $a0, %gp_rel(FaceButtons)($gp)
/* A9BA8 800B93A8 2641010C */  jal        MEMPACK_Free
/* A9BAC 800B93AC 00000000 */   nop
/* A9BB0 800B93B0 ECAA80AF */  sw         $zero, %gp_rel(hack_initialized)($gp)
.L800B93B4:
/* A9BB4 800B93B4 2000BF8F */  lw         $ra, 0x20($sp)
/* A9BB8 800B93B8 1C00B38F */  lw         $s3, 0x1C($sp)
/* A9BBC 800B93BC 1800B28F */  lw         $s2, 0x18($sp)
/* A9BC0 800B93C0 1400B18F */  lw         $s1, 0x14($sp)
/* A9BC4 800B93C4 1000B08F */  lw         $s0, 0x10($sp)
/* A9BC8 800B93C8 0800E003 */  jr         $ra
/* A9BCC 800B93CC 2800BD27 */   addiu     $sp, $sp, 0x28
.size menuface_terminate, . - menuface_terminate
