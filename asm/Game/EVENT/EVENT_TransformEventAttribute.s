.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformEventAttribute
/* 53B00 80063300 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 53B04 80063304 03000224 */  addiu      $v0, $zero, 0x3
/* 53B08 80063308 1000BFAF */  sw         $ra, 0x10($sp)
/* 53B0C 8006330C 0400A88C */  lw         $t0, 0x4($a1)
/* 53B10 80063310 0600C210 */  beq        $a2, $v0, .L8006332C
/* 53B14 80063314 21180000 */   addu      $v1, $zero, $zero
/* 53B18 80063318 1A000224 */  addiu      $v0, $zero, 0x1A
/* 53B1C 8006331C 1200C210 */  beq        $a2, $v0, .L80063368
/* 53B20 80063320 00000000 */   nop
/* 53B24 80063324 E08C0108 */  j          .L80063380
/* 53B28 80063328 00000000 */   nop
.L8006332C:
/* 53B2C 8006332C 01000224 */  addiu      $v0, $zero, 0x1
/* 53B30 80063330 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53B34 80063334 0200E584 */  lh         $a1, 0x2($a3)
/* 53B38 80063338 00000000 */  nop
/* 53B3C 8006333C 0600A22C */  sltiu      $v0, $a1, 0x6
/* 53B40 80063340 0F004010 */  beqz       $v0, .L80063380
/* 53B44 80063344 40280500 */   sll       $a1, $a1, 1
/* 53B48 80063348 0600A524 */  addiu      $a1, $a1, 0x6
/* 53B4C 8006334C 0000828C */  lw         $v0, 0x0($a0)
/* 53B50 80063350 21280501 */  addu       $a1, $t0, $a1
/* 53B54 80063354 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53B58 80063358 6F88010C */  jal        EVENT_AddShortPointerToStack
/* 53B5C 8006335C 000082AC */   sw        $v0, 0x0($a0)
/* 53B60 80063360 E08C0108 */  j          .L80063380
/* 53B64 80063364 01000324 */   addiu     $v1, $zero, 0x1
.L80063368:
/* 53B68 80063368 05000291 */  lbu        $v0, 0x5($t0)
/* 53B6C 8006336C 00000000 */  nop
/* 53B70 80063370 03004014 */  bnez       $v0, .L80063380
/* 53B74 80063374 01000324 */   addiu     $v1, $zero, 0x1
/* 53B78 80063378 01000224 */  addiu      $v0, $zero, 0x1
/* 53B7C 8006337C 050002A1 */  sb         $v0, 0x5($t0)
.L80063380:
/* 53B80 80063380 1000BF8F */  lw         $ra, 0x10($sp)
/* 53B84 80063384 21106000 */  addu       $v0, $v1, $zero
/* 53B88 80063388 0800E003 */  jr         $ra
/* 53B8C 8006338C 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformEventAttribute, . - EVENT_TransformEventAttribute
