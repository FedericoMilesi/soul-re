.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel memcpy
/* 69C08 80079408 2B00C010 */  beqz       $a2, .L800794B8
/* 69C0C 8007940C 21108000 */   addu      $v0, $a0, $zero
/* 69C10 80079410 25408500 */  or         $t0, $a0, $a1
/* 69C14 80079414 25400601 */  or         $t0, $t0, $a2
/* 69C18 80079418 03000831 */  andi       $t0, $t0, 0x3
/* 69C1C 8007941C 20000015 */  bnez       $t0, .L800794A0
/* 69C20 80079420 00000000 */   nop
.L80079424:
/* 69C24 80079424 0000A88C */  lw         $t0, 0x0($a1)
/* 69C28 80079428 0400A520 */  addi       $a1, $a1, 0x4 # handwritten instruction
/* 69C2C 8007942C 04008420 */  addi       $a0, $a0, 0x4 # handwritten instruction
/* 69C30 80079430 FCFFC620 */  addi       $a2, $a2, -0x4 # handwritten instruction
/* 69C34 80079434 1F00C930 */  andi       $t1, $a2, 0x1F
/* 69C38 80079438 FAFF2015 */  bnez       $t1, .L80079424
/* 69C3C 8007943C FCFF88AC */   sw        $t0, -0x4($a0)
/* 69C40 80079440 1D00C010 */  beqz       $a2, .L800794B8
/* 69C44 80079444 00000000 */   nop
.L80079448:
/* 69C48 80079448 0000A88C */  lw         $t0, 0x0($a1)
/* 69C4C 8007944C 0400A98C */  lw         $t1, 0x4($a1)
/* 69C50 80079450 0800AA8C */  lw         $t2, 0x8($a1)
/* 69C54 80079454 0C00AB8C */  lw         $t3, 0xC($a1)
/* 69C58 80079458 1000AC8C */  lw         $t4, 0x10($a1)
/* 69C5C 8007945C 1400AD8C */  lw         $t5, 0x14($a1)
/* 69C60 80079460 1800AE8C */  lw         $t6, 0x18($a1)
/* 69C64 80079464 1C00AF8C */  lw         $t7, 0x1C($a1)
/* 69C68 80079468 E0FFC620 */  addi       $a2, $a2, -0x20 # handwritten instruction
/* 69C6C 8007946C 2000A520 */  addi       $a1, $a1, 0x20 # handwritten instruction
/* 69C70 80079470 000088AC */  sw         $t0, 0x0($a0)
/* 69C74 80079474 040089AC */  sw         $t1, 0x4($a0)
/* 69C78 80079478 08008AAC */  sw         $t2, 0x8($a0)
/* 69C7C 8007947C 0C008BAC */  sw         $t3, 0xC($a0)
/* 69C80 80079480 10008CAC */  sw         $t4, 0x10($a0)
/* 69C84 80079484 14008DAC */  sw         $t5, 0x14($a0)
/* 69C88 80079488 18008EAC */  sw         $t6, 0x18($a0)
/* 69C8C 8007948C 1C008FAC */  sw         $t7, 0x1C($a0)
/* 69C90 80079490 EDFFC014 */  bnez       $a2, .L80079448
/* 69C94 80079494 20008420 */   addi      $a0, $a0, 0x20 # handwritten instruction
/* 69C98 80079498 0800E003 */  jr         $ra
/* 69C9C 8007949C 00000000 */   nop
.L800794A0:
/* 69CA0 800794A0 0000A890 */  lbu        $t0, 0x0($a1)
/* 69CA4 800794A4 0100A520 */  addi       $a1, $a1, 0x1 # handwritten instruction
/* 69CA8 800794A8 FFFFC620 */  addi       $a2, $a2, -0x1 # handwritten instruction
/* 69CAC 800794AC 01008420 */  addi       $a0, $a0, 0x1 # handwritten instruction
/* 69CB0 800794B0 FBFFC014 */  bnez       $a2, .L800794A0
/* 69CB4 800794B4 FFFF88A0 */   sb        $t0, -0x1($a0)
.L800794B8:
/* 69CB8 800794B8 0800E003 */  jr         $ra
/* 69CBC 800794BC 00000000 */   nop
.size memcpy, . - memcpy
