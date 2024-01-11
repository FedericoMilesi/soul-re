.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetIntroSpline
/* A6E70 800B6670 E0FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6E74 800B6674 E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6E78 800B6678 00000000 */  nop
/* A6E7C 800B667C 2B10A300 */  sltu       $v0, $a1, $v1
/* A6E80 800B6680 12004010 */  beqz       $v0, .L800B66CC
/* A6E84 800B6684 08000724 */   addiu     $a3, $zero, 0x8
/* A6E88 800B6688 21306000 */  addu       $a2, $v1, $zero
.L800B668C:
/* A6E8C 800B668C 0000A290 */  lbu        $v0, 0x0($a1)
/* A6E90 800B6690 00000000 */  nop
/* A6E94 800B6694 06004714 */  bne        $v0, $a3, .L800B66B0
/* A6E98 800B6698 00000000 */   nop
/* A6E9C 800B669C 0200A384 */  lh         $v1, 0x2($a1)
/* A6EA0 800B66A0 3C00828C */  lw         $v0, 0x3C($a0)
/* A6EA4 800B66A4 00000000 */  nop
/* A6EA8 800B66A8 0A006210 */  beq        $v1, $v0, .L800B66D4
/* A6EAC 800B66AC 2110A000 */   addu      $v0, $a1, $zero
.L800B66B0:
/* A6EB0 800B66B0 0100A290 */  lbu        $v0, 0x1($a1)
/* A6EB4 800B66B4 00000000 */  nop
/* A6EB8 800B66B8 80100200 */  sll        $v0, $v0, 2
/* A6EBC 800B66BC 2128A200 */  addu       $a1, $a1, $v0
/* A6EC0 800B66C0 2B10A600 */  sltu       $v0, $a1, $a2
/* A6EC4 800B66C4 F1FF4014 */  bnez       $v0, .L800B668C
/* A6EC8 800B66C8 00000000 */   nop
.L800B66CC:
/* A6ECC 800B66CC 0800E003 */  jr         $ra
/* A6ED0 800B66D0 21100000 */   addu      $v0, $zero, $zero
.L800B66D4:
/* A6ED4 800B66D4 0800E003 */  jr         $ra
/* A6ED8 800B66D8 00000000 */   nop
.size SAVE_GetIntroSpline, . - SAVE_GetIntroSpline
