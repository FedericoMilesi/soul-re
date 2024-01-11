.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_UpdateResetSignalArrayAndWaterMovement
/* 5138C 80060B8C 6CA4828F */  lw         $v0, %gp_rel(NumSignalsToReset)($gp)
/* 51390 80060B90 00000000 */  nop
/* 51394 80060B94 17004010 */  beqz       $v0, .L80060BF4
/* 51398 80060B98 2328A400 */   subu      $a1, $a1, $a0
/* 5139C 80060B9C 21400000 */  addu       $t0, $zero, $zero
/* 513A0 80060BA0 21488600 */  addu       $t1, $a0, $a2
/* 513A4 80060BA4 90CE8727 */  addiu      $a3, $gp, %gp_rel(ResetSignalArray)
.L80060BA8:
/* 513A8 80060BA8 0400E28C */  lw         $v0, 0x4($a3)
/* 513AC 80060BAC 00000000 */  nop
/* 513B0 80060BB0 0C004018 */  blez       $v0, .L80060BE4
/* 513B4 80060BB4 00000000 */   nop
/* 513B8 80060BB8 0000E38C */  lw         $v1, 0x0($a3)
/* 513BC 80060BBC 00000000 */  nop
/* 513C0 80060BC0 2B106400 */  sltu       $v0, $v1, $a0
/* 513C4 80060BC4 07004014 */  bnez       $v0, .L80060BE4
/* 513C8 80060BC8 2B102301 */   sltu      $v0, $t1, $v1
/* 513CC 80060BCC 05004014 */  bnez       $v0, .L80060BE4
/* 513D0 80060BD0 00000000 */   nop
/* 513D4 80060BD4 02006010 */  beqz       $v1, .L80060BE0
/* 513D8 80060BD8 21100000 */   addu      $v0, $zero, $zero
/* 513DC 80060BDC 21106500 */  addu       $v0, $v1, $a1
.L80060BE0:
/* 513E0 80060BE0 0000E2AC */  sw         $v0, 0x0($a3)
.L80060BE4:
/* 513E4 80060BE4 01000825 */  addiu      $t0, $t0, 0x1
/* 513E8 80060BE8 10000229 */  slti       $v0, $t0, 0x10
/* 513EC 80060BEC EEFF4014 */  bnez       $v0, .L80060BA8
/* 513F0 80060BF0 0800E724 */   addiu     $a3, $a3, 0x8
.L80060BF4:
/* 513F4 80060BF4 68A4828F */  lw         $v0, %gp_rel(WaterInUse)($gp)
/* 513F8 80060BF8 00000000 */  nop
/* 513FC 80060BFC 18004010 */  beqz       $v0, .L80060C60
/* 51400 80060C00 05000824 */   addiu     $t0, $zero, 0x5
/* 51404 80060C04 60CB8927 */  addiu      $t1, $gp, %gp_rel(WaterLevelArray)
/* 51408 80060C08 21308600 */  addu       $a2, $a0, $a2
/* 5140C 80060C0C 64CB8727 */  addiu      $a3, $gp, %gp_rel(WaterLevelArray + 0x4)
.L80060C10:
/* 51410 80060C10 0000228D */  lw         $v0, 0x0($t1)
/* 51414 80060C14 00000000 */  nop
/* 51418 80060C18 01004230 */  andi       $v0, $v0, 0x1
/* 5141C 80060C1C 0C004010 */  beqz       $v0, .L80060C50
/* 51420 80060C20 00000000 */   nop
/* 51424 80060C24 0000E38C */  lw         $v1, 0x0($a3)
/* 51428 80060C28 00000000 */  nop
/* 5142C 80060C2C 2B106400 */  sltu       $v0, $v1, $a0
/* 51430 80060C30 07004014 */  bnez       $v0, .L80060C50
/* 51434 80060C34 2B10C300 */   sltu      $v0, $a2, $v1
/* 51438 80060C38 05004014 */  bnez       $v0, .L80060C50
/* 5143C 80060C3C 00000000 */   nop
/* 51440 80060C40 02006010 */  beqz       $v1, .L80060C4C
/* 51444 80060C44 21100000 */   addu      $v0, $zero, $zero
/* 51448 80060C48 21106500 */  addu       $v0, $v1, $a1
.L80060C4C:
/* 5144C 80060C4C 0000E2AC */  sw         $v0, 0x0($a3)
.L80060C50:
/* 51450 80060C50 FFFF0825 */  addiu      $t0, $t0, -0x1
/* 51454 80060C54 1C00E724 */  addiu      $a3, $a3, 0x1C
/* 51458 80060C58 EDFF001D */  bgtz       $t0, .L80060C10
/* 5145C 80060C5C 1C002925 */   addiu     $t1, $t1, 0x1C
.L80060C60:
/* 51460 80060C60 0800E003 */  jr         $ra
/* 51464 80060C64 00000000 */   nop
.size EVENT_UpdateResetSignalArrayAndWaterMovement, . - EVENT_UpdateResetSignalArrayAndWaterMovement
