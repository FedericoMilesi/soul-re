.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_SetDeadDeadBit
/* A6BB0 800B63B0 00208228 */  slti       $v0, $a0, 0x2000
/* A6BB4 800B63B4 2D004010 */  beqz       $v0, .L800B646C
/* A6BB8 800B63B8 21180000 */   addu      $v1, $zero, $zero
/* A6BBC 800B63BC E0FD868F */  lw         $a2, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6BC0 800B63C0 E4FD878F */  lw         $a3, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6BC4 800B63C4 00000000 */  nop
/* A6BC8 800B63C8 2B10C700 */  sltu       $v0, $a2, $a3
/* A6BCC 800B63CC 0D004010 */  beqz       $v0, .L800B6404
/* A6BD0 800B63D0 00000000 */   nop
/* A6BD4 800B63D4 04000824 */  addiu      $t0, $zero, 0x4
.L800B63D8:
/* A6BD8 800B63D8 0000C290 */  lbu        $v0, 0x0($a2)
/* A6BDC 800B63DC 00000000 */  nop
/* A6BE0 800B63E0 1C004810 */  beq        $v0, $t0, .L800B6454
/* A6BE4 800B63E4 00000000 */   nop
/* A6BE8 800B63E8 0100C290 */  lbu        $v0, 0x1($a2)
/* A6BEC 800B63EC 00000000 */  nop
/* A6BF0 800B63F0 80100200 */  sll        $v0, $v0, 2
/* A6BF4 800B63F4 2130C200 */  addu       $a2, $a2, $v0
/* A6BF8 800B63F8 2B10C700 */  sltu       $v0, $a2, $a3
/* A6BFC 800B63FC F6FF4014 */  bnez       $v0, .L800B63D8
/* A6C00 800B6400 00000000 */   nop
.L800B6404:
/* A6C04 800B6404 19006010 */  beqz       $v1, .L800B646C
/* A6C08 800B6408 00000000 */   nop
/* A6C0C 800B640C 02008104 */  bgez       $a0, .L800B6418
/* A6C10 800B6410 21108000 */   addu      $v0, $a0, $zero
/* A6C14 800B6414 07008224 */  addiu      $v0, $a0, 0x7
.L800B6418:
/* A6C18 800B6418 C3300200 */  sra        $a2, $v0, 3
/* A6C1C 800B641C 07008230 */  andi       $v0, $a0, 0x7
/* A6C20 800B6420 01000724 */  addiu      $a3, $zero, 0x1
/* A6C24 800B6424 04204700 */  sllv       $a0, $a3, $v0
/* A6C28 800B6428 4003C228 */  slti       $v0, $a2, 0x340
/* A6C2C 800B642C 0F004010 */  beqz       $v0, .L800B646C
/* A6C30 800B6430 00000000 */   nop
/* A6C34 800B6434 0900A714 */  bne        $a1, $a3, .L800B645C
/* A6C38 800B6438 21106600 */   addu      $v0, $v1, $a2
/* A6C3C 800B643C 21186600 */  addu       $v1, $v1, $a2
/* A6C40 800B6440 02006290 */  lbu        $v0, 0x2($v1)
/* A6C44 800B6444 00000000 */  nop
/* A6C48 800B6448 25104400 */  or         $v0, $v0, $a0
/* A6C4C 800B644C 0800E003 */  jr         $ra
/* A6C50 800B6450 020062A0 */   sb        $v0, 0x2($v1)
.L800B6454:
/* A6C54 800B6454 01D90208 */  j          .L800B6404
/* A6C58 800B6458 2118C000 */   addu      $v1, $a2, $zero
.L800B645C:
/* A6C5C 800B645C 02004390 */  lbu        $v1, 0x2($v0)
/* A6C60 800B6460 27200400 */  nor        $a0, $zero, $a0
/* A6C64 800B6464 24186400 */  and        $v1, $v1, $a0
/* A6C68 800B6468 020043A0 */  sb         $v1, 0x2($v0)
.L800B646C:
/* A6C6C 800B646C 0800E003 */  jr         $ra
/* A6C70 800B6470 00000000 */   nop
.size SAVE_SetDeadDeadBit, . - SAVE_SetDeadDeadBit
