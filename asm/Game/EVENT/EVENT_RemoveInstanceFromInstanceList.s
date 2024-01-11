.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_RemoveInstanceFromInstanceList
/* 58314 80067B14 21580000 */  addu       $t3, $zero, $zero
/* 58318 80067B18 01000C24 */  addiu      $t4, $zero, 0x1
/* 5831C 80067B1C 80190B00 */  sll        $v1, $t3, 6
.L80067B20:
/* 58320 80067B20 3CC78227 */  addiu      $v0, $gp, %gp_rel(StreamTracker)
/* 58324 80067B24 21286200 */  addu       $a1, $v1, $v0
/* 58328 80067B28 0400A384 */  lh         $v1, 0x4($a1)
/* 5832C 80067B2C 02000224 */  addiu      $v0, $zero, 0x2
/* 58330 80067B30 2C006214 */  bne        $v1, $v0, .L80067BE4
/* 58334 80067B34 00000000 */   nop
/* 58338 80067B38 0800A28C */  lw         $v0, 0x8($a1)
/* 5833C 80067B3C 00000000 */  nop
/* 58340 80067B40 DC004A8C */  lw         $t2, 0xDC($v0)
/* 58344 80067B44 00000000 */  nop
/* 58348 80067B48 26004011 */  beqz       $t2, .L80067BE4
/* 5834C 80067B4C 00000000 */   nop
/* 58350 80067B50 0000428D */  lw         $v0, 0x0($t2)
/* 58354 80067B54 00000000 */  nop
/* 58358 80067B58 22004018 */  blez       $v0, .L80067BE4
/* 5835C 80067B5C 21400000 */   addu      $t0, $zero, $zero
/* 58360 80067B60 21384001 */  addu       $a3, $t2, $zero
.L80067B64:
/* 58364 80067B64 0400E28C */  lw         $v0, 0x4($a3)
/* 58368 80067B68 00000000 */  nop
/* 5836C 80067B6C 02004384 */  lh         $v1, 0x2($v0)
/* 58370 80067B70 1000428C */  lw         $v0, 0x10($v0)
/* 58374 80067B74 16006018 */  blez       $v1, .L80067BD0
/* 58378 80067B78 21280000 */   addu      $a1, $zero, $zero
/* 5837C 80067B7C 2148E000 */  addu       $t1, $a3, $zero
/* 58380 80067B80 21304000 */  addu       $a2, $v0, $zero
.L80067B84:
/* 58384 80067B84 0000C38C */  lw         $v1, 0x0($a2)
/* 58388 80067B88 00000000 */  nop
/* 5838C 80067B8C 00006284 */  lh         $v0, 0x0($v1)
/* 58390 80067B90 00000000 */  nop
/* 58394 80067B94 07004C14 */  bne        $v0, $t4, .L80067BB4
/* 58398 80067B98 00000000 */   nop
/* 5839C 80067B9C 0C00628C */  lw         $v0, 0xC($v1)
/* 583A0 80067BA0 00000000 */  nop
/* 583A4 80067BA4 03004414 */  bne        $v0, $a0, .L80067BB4
/* 583A8 80067BA8 00000000 */   nop
/* 583AC 80067BAC F49E0108 */  j          .L80067BD0
/* 583B0 80067BB0 0C0060AC */   sw        $zero, 0xC($v1)
.L80067BB4:
/* 583B4 80067BB4 0400228D */  lw         $v0, 0x4($t1)
/* 583B8 80067BB8 00000000 */  nop
/* 583BC 80067BBC 02004284 */  lh         $v0, 0x2($v0)
/* 583C0 80067BC0 0100A524 */  addiu      $a1, $a1, 0x1
/* 583C4 80067BC4 2A10A200 */  slt        $v0, $a1, $v0
/* 583C8 80067BC8 EEFF4014 */  bnez       $v0, .L80067B84
/* 583CC 80067BCC 0400C624 */   addiu     $a2, $a2, 0x4
.L80067BD0:
/* 583D0 80067BD0 0000428D */  lw         $v0, 0x0($t2)
/* 583D4 80067BD4 01000825 */  addiu      $t0, $t0, 0x1
/* 583D8 80067BD8 2A100201 */  slt        $v0, $t0, $v0
/* 583DC 80067BDC E1FF4014 */  bnez       $v0, .L80067B64
/* 583E0 80067BE0 0400E724 */   addiu     $a3, $a3, 0x4
.L80067BE4:
/* 583E4 80067BE4 01006B25 */  addiu      $t3, $t3, 0x1
/* 583E8 80067BE8 10006229 */  slti       $v0, $t3, 0x10
/* 583EC 80067BEC CCFF4014 */  bnez       $v0, .L80067B20
/* 583F0 80067BF0 80190B00 */   sll       $v1, $t3, 6
/* 583F4 80067BF4 0800E003 */  jr         $ra
/* 583F8 80067BF8 00000000 */   nop
.size EVENT_RemoveInstanceFromInstanceList, . - EVENT_RemoveInstanceFromInstanceList
