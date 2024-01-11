.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_IsUniqueIDDeadDead
/* A6CCC 800B64CC 21300000 */  addu       $a2, $zero, $zero
/* A6CD0 800B64D0 00208228 */  slti       $v0, $a0, 0x2000
/* A6CD4 800B64D4 26004010 */  beqz       $v0, .L800B6570
/* A6CD8 800B64D8 2138C000 */   addu      $a3, $a2, $zero
/* A6CDC 800B64DC E0FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6CE0 800B64E0 E4FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6CE4 800B64E4 00000000 */  nop
/* A6CE8 800B64E8 2B106500 */  sltu       $v0, $v1, $a1
/* A6CEC 800B64EC 0F004010 */  beqz       $v0, .L800B652C
/* A6CF0 800B64F0 00000000 */   nop
/* A6CF4 800B64F4 04000824 */  addiu      $t0, $zero, 0x4
.L800B64F8:
/* A6CF8 800B64F8 00006290 */  lbu        $v0, 0x0($v1)
/* A6CFC 800B64FC 00000000 */  nop
/* A6D00 800B6500 03004814 */  bne        $v0, $t0, .L800B6510
/* A6D04 800B6504 00000000 */   nop
/* A6D08 800B6508 4BD90208 */  j          .L800B652C
/* A6D0C 800B650C 21306000 */   addu      $a2, $v1, $zero
.L800B6510:
/* A6D10 800B6510 01006290 */  lbu        $v0, 0x1($v1)
/* A6D14 800B6514 00000000 */  nop
/* A6D18 800B6518 80100200 */  sll        $v0, $v0, 2
/* A6D1C 800B651C 21186200 */  addu       $v1, $v1, $v0
/* A6D20 800B6520 2B106500 */  sltu       $v0, $v1, $a1
/* A6D24 800B6524 F4FF4014 */  bnez       $v0, .L800B64F8
/* A6D28 800B6528 00000000 */   nop
.L800B652C:
/* A6D2C 800B652C 1000C010 */  beqz       $a2, .L800B6570
/* A6D30 800B6530 00000000 */   nop
/* A6D34 800B6534 02008104 */  bgez       $a0, .L800B6540
/* A6D38 800B6538 21108000 */   addu      $v0, $a0, $zero
/* A6D3C 800B653C 07008224 */  addiu      $v0, $a0, 0x7
.L800B6540:
/* A6D40 800B6540 C3280200 */  sra        $a1, $v0, 3
/* A6D44 800B6544 07008230 */  andi       $v0, $a0, 0x7
/* A6D48 800B6548 01000324 */  addiu      $v1, $zero, 0x1
/* A6D4C 800B654C 04184300 */  sllv       $v1, $v1, $v0
/* A6D50 800B6550 4003A228 */  slti       $v0, $a1, 0x340
/* A6D54 800B6554 06004010 */  beqz       $v0, .L800B6570
/* A6D58 800B6558 2110C500 */   addu      $v0, $a2, $a1
/* A6D5C 800B655C 02004290 */  lbu        $v0, 0x2($v0)
/* A6D60 800B6560 00000000 */  nop
/* A6D64 800B6564 24384300 */  and        $a3, $v0, $v1
/* A6D68 800B6568 2610E300 */  xor        $v0, $a3, $v1
/* A6D6C 800B656C 0100472C */  sltiu      $a3, $v0, 0x1
.L800B6570:
/* A6D70 800B6570 0800E003 */  jr         $ra
/* A6D74 800B6574 2110E000 */   addu      $v0, $a3, $zero
.size SAVE_IsUniqueIDDeadDead, . - SAVE_IsUniqueIDDeadDead
