.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetSavedNextEvent
/* A6148 800B5948 0400A014 */  bnez       $a1, .L800B595C
/* A614C 800B594C 00000000 */   nop
/* A6150 800B5950 E0FD858F */  lw         $a1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6154 800B5954 5BD60208 */  j          .L800B596C
/* A6158 800B5958 00000000 */   nop
.L800B595C:
/* A615C 800B595C 0100A290 */  lbu        $v0, 0x1($a1)
/* A6160 800B5960 00000000 */  nop
/* A6164 800B5964 80100200 */  sll        $v0, $v0, 2
/* A6168 800B5968 2128A200 */  addu       $a1, $a1, $v0
.L800B596C:
/* A616C 800B596C E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6170 800B5970 00000000 */  nop
/* A6174 800B5974 2B10A300 */  sltu       $v0, $a1, $v1
/* A6178 800B5978 1A004010 */  beqz       $v0, .L800B59E4
/* A617C 800B597C 02000824 */   addiu     $t0, $zero, 0x2
/* A6180 800B5980 09000724 */  addiu      $a3, $zero, 0x9
/* A6184 800B5984 21306000 */  addu       $a2, $v1, $zero
.L800B5988:
/* A6188 800B5988 0000A390 */  lbu        $v1, 0x0($a1)
/* A618C 800B598C 00000000 */  nop
/* A6190 800B5990 05006814 */  bne        $v1, $t0, .L800B59A8
/* A6194 800B5994 00000000 */   nop
/* A6198 800B5998 0200A284 */  lh         $v0, 0x2($a1)
/* A619C 800B599C 00000000 */  nop
/* A61A0 800B59A0 07004410 */  beq        $v0, $a0, .L800B59C0
/* A61A4 800B59A4 00000000 */   nop
.L800B59A8:
/* A61A8 800B59A8 07006714 */  bne        $v1, $a3, .L800B59C8
/* A61AC 800B59AC 00000000 */   nop
/* A61B0 800B59B0 0200A284 */  lh         $v0, 0x2($a1)
/* A61B4 800B59B4 00000000 */  nop
/* A61B8 800B59B8 03004414 */  bne        $v0, $a0, .L800B59C8
/* A61BC 800B59BC 00000000 */   nop
.L800B59C0:
/* A61C0 800B59C0 0800E003 */  jr         $ra
/* A61C4 800B59C4 2110A000 */   addu      $v0, $a1, $zero
.L800B59C8:
/* A61C8 800B59C8 0100A290 */  lbu        $v0, 0x1($a1)
/* A61CC 800B59CC 00000000 */  nop
/* A61D0 800B59D0 80100200 */  sll        $v0, $v0, 2
/* A61D4 800B59D4 2128A200 */  addu       $a1, $a1, $v0
/* A61D8 800B59D8 2B10A600 */  sltu       $v0, $a1, $a2
/* A61DC 800B59DC EAFF4014 */  bnez       $v0, .L800B5988
/* A61E0 800B59E0 00000000 */   nop
.L800B59E4:
/* A61E4 800B59E4 0800E003 */  jr         $ra
/* A61E8 800B59E8 21100000 */   addu      $v0, $zero, $zero
.size SAVE_GetSavedNextEvent, . - SAVE_GetSavedNextEvent
