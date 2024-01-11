.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_HasSavedIntro
/* A6424 800B5C24 E0FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6428 800B5C28 E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A642C 800B5C2C 00000000 */  nop
/* A6430 800B5C30 2B10A300 */  sltu       $v0, $a1, $v1
/* A6434 800B5C34 1D004010 */  beqz       $v0, .L800B5CAC
/* A6438 800B5C38 21380000 */   addu      $a3, $zero, $zero
/* A643C 800B5C3C 01000A24 */  addiu      $t2, $zero, 0x1
/* A6440 800B5C40 07000924 */  addiu      $t1, $zero, 0x7
/* A6444 800B5C44 21406000 */  addu       $t0, $v1, $zero
.L800B5C48:
/* A6448 800B5C48 0000A690 */  lbu        $a2, 0x0($a1)
/* A644C 800B5C4C 00000000 */  nop
/* A6450 800B5C50 0600CA14 */  bne        $a2, $t2, .L800B5C6C
/* A6454 800B5C54 00000000 */   nop
/* A6458 800B5C58 0C00A384 */  lh         $v1, 0xC($a1)
/* A645C 800B5C5C 1400828C */  lw         $v0, 0x14($a0)
/* A6460 800B5C60 00000000 */  nop
/* A6464 800B5C64 08006210 */  beq        $v1, $v0, .L800B5C88
/* A6468 800B5C68 00000000 */   nop
.L800B5C6C:
/* A646C 800B5C6C 0800C914 */  bne        $a2, $t1, .L800B5C90
/* A6470 800B5C70 00000000 */   nop
/* A6474 800B5C74 0800A384 */  lh         $v1, 0x8($a1)
/* A6478 800B5C78 1400828C */  lw         $v0, 0x14($a0)
/* A647C 800B5C7C 00000000 */  nop
/* A6480 800B5C80 03006214 */  bne        $v1, $v0, .L800B5C90
/* A6484 800B5C84 00000000 */   nop
.L800B5C88:
/* A6488 800B5C88 2BD70208 */  j          .L800B5CAC
/* A648C 800B5C8C 01000724 */   addiu     $a3, $zero, 0x1
.L800B5C90:
/* A6490 800B5C90 0100A290 */  lbu        $v0, 0x1($a1)
/* A6494 800B5C94 00000000 */  nop
/* A6498 800B5C98 80100200 */  sll        $v0, $v0, 2
/* A649C 800B5C9C 2128A200 */  addu       $a1, $a1, $v0
/* A64A0 800B5CA0 2B10A800 */  sltu       $v0, $a1, $t0
/* A64A4 800B5CA4 E8FF4014 */  bnez       $v0, .L800B5C48
/* A64A8 800B5CA8 00000000 */   nop
.L800B5CAC:
/* A64AC 800B5CAC 0800E003 */  jr         $ra
/* A64B0 800B5CB0 2110E000 */   addu      $v0, $a3, $zero
.size SAVE_HasSavedIntro, . - SAVE_HasSavedIntro
