.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessBurntMess
/* 7CDA8 8008C5A8 1000A38F */  lw         $v1, 0x10($sp)
/* 7CDAC 8008C5AC 00000000 */  nop
/* 7CDB0 8008C5B0 0400628C */  lw         $v0, 0x4($v1)
/* 7CDB4 8008C5B4 0C00688C */  lw         $t0, 0xC($v1)
/* 7CDB8 8008C5B8 2A10E200 */  slt        $v0, $a3, $v0
/* 7CDBC 8008C5BC 04004010 */  beqz       $v0, .L8008C5D0
/* 7CDC0 8008C5C0 00000000 */   nop
/* 7CDC4 8008C5C4 000065AC */  sw         $a1, 0x0($v1)
/* 7CDC8 8008C5C8 040067AC */  sw         $a3, 0x4($v1)
/* 7CDCC 8008C5CC 080066AC */  sw         $a2, 0x8($v1)
.L8008C5D0:
/* 7CDD0 8008C5D0 0000038D */  lw         $v1, 0x0($t0)
/* 7CDD4 8008C5D4 00000000 */  nop
/* 7CDD8 8008C5D8 2A10E300 */  slt        $v0, $a3, $v1
/* 7CDDC 8008C5DC 0A004010 */  beqz       $v0, .L8008C608
/* 7CDE0 8008C5E0 00130700 */   sll       $v0, $a3, 12
/* 7CDE4 8008C5E4 1A004300 */  div        $zero, $v0, $v1
/* 7CDE8 8008C5E8 12100000 */  mflo       $v0
/* 7CDEC 8008C5EC 00000000 */  nop
/* 7CDF0 8008C5F0 00140200 */  sll        $v0, $v0, 16
/* 7CDF4 8008C5F4 03150200 */  sra        $v0, $v0, 20
/* 7CDF8 8008C5F8 21304000 */  addu       $a2, $v0, $zero
/* 7CDFC 8008C5FC FF004228 */  slti       $v0, $v0, 0xFF
/* 7CE00 8008C600 02004014 */  bnez       $v0, .L8008C60C
/* 7CE04 8008C604 00000000 */   nop
.L8008C608:
/* 7CE08 8008C608 FE000624 */  addiu      $a2, $zero, 0xFE
.L8008C60C:
/* 7CE0C 8008C60C 9802828C */  lw         $v0, 0x298($a0)
/* 7CE10 8008C610 80180500 */  sll        $v1, $a1, 2
/* 7CE14 8008C614 21106200 */  addu       $v0, $v1, $v0
/* 7CE18 8008C618 000046A0 */  sb         $a2, 0x0($v0)
/* 7CE1C 8008C61C 9802828C */  lw         $v0, 0x298($a0)
/* 7CE20 8008C620 00000000 */  nop
/* 7CE24 8008C624 21106200 */  addu       $v0, $v1, $v0
/* 7CE28 8008C628 010046A0 */  sb         $a2, 0x1($v0)
/* 7CE2C 8008C62C 9802828C */  lw         $v0, 0x298($a0)
/* 7CE30 8008C630 00000000 */  nop
/* 7CE34 8008C634 21106200 */  addu       $v0, $v1, $v0
/* 7CE38 8008C638 020046A0 */  sb         $a2, 0x2($v0)
/* 7CE3C 8008C63C 9802828C */  lw         $v0, 0x298($a0)
/* 7CE40 8008C640 00000000 */  nop
/* 7CE44 8008C644 21186200 */  addu       $v1, $v1, $v0
/* 7CE48 8008C648 01000224 */  addiu      $v0, $zero, 0x1
/* 7CE4C 8008C64C 0800E003 */  jr         $ra
/* 7CE50 8008C650 030062A0 */   sb        $v0, 0x3($v1)
.size ProcessBurntMess, . - ProcessBurntMess
