.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetSavedSmallIntro
/* A6E04 800B6604 E0FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6E08 800B6608 E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6E0C 800B660C 00000000 */  nop
/* A6E10 800B6610 2B10A300 */  sltu       $v0, $a1, $v1
/* A6E14 800B6614 12004010 */  beqz       $v0, .L800B6660
/* A6E18 800B6618 05000724 */   addiu     $a3, $zero, 0x5
/* A6E1C 800B661C 21306000 */  addu       $a2, $v1, $zero
.L800B6620:
/* A6E20 800B6620 0000A290 */  lbu        $v0, 0x0($a1)
/* A6E24 800B6624 00000000 */  nop
/* A6E28 800B6628 06004714 */  bne        $v0, $a3, .L800B6644
/* A6E2C 800B662C 00000000 */   nop
/* A6E30 800B6630 0200A384 */  lh         $v1, 0x2($a1)
/* A6E34 800B6634 3C00828C */  lw         $v0, 0x3C($a0)
/* A6E38 800B6638 00000000 */  nop
/* A6E3C 800B663C 0A006210 */  beq        $v1, $v0, .L800B6668
/* A6E40 800B6640 2110A000 */   addu      $v0, $a1, $zero
.L800B6644:
/* A6E44 800B6644 0100A290 */  lbu        $v0, 0x1($a1)
/* A6E48 800B6648 00000000 */  nop
/* A6E4C 800B664C 80100200 */  sll        $v0, $v0, 2
/* A6E50 800B6650 2128A200 */  addu       $a1, $a1, $v0
/* A6E54 800B6654 2B10A600 */  sltu       $v0, $a1, $a2
/* A6E58 800B6658 F1FF4014 */  bnez       $v0, .L800B6620
/* A6E5C 800B665C 00000000 */   nop
.L800B6660:
/* A6E60 800B6660 0800E003 */  jr         $ra
/* A6E64 800B6664 21100000 */   addu      $v0, $zero, $zero
.L800B6668:
/* A6E68 800B6668 0800E003 */  jr         $ra
/* A6E6C 800B666C 00000000 */   nop
.size SAVE_GetSavedSmallIntro, . - SAVE_GetSavedSmallIntro
