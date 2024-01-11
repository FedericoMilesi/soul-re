.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimKeylist_GetDuration
/* 8074C 8008FF4C 04008294 */  lhu        $v0, 0x4($a0)
/* 80750 8008FF50 06008384 */  lh         $v1, 0x6($a0)
/* 80754 8008FF54 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 80758 8008FF58 18006200 */  mult       $v1, $v0
/* 8075C 8008FF5C 01008290 */  lbu        $v0, 0x1($a0)
/* 80760 8008FF60 12280000 */  mflo       $a1
/* 80764 8008FF64 21104500 */  addu       $v0, $v0, $a1
/* 80768 8008FF68 00140200 */  sll        $v0, $v0, 16
/* 8076C 8008FF6C 0800E003 */  jr         $ra
/* 80770 8008FF70 03140200 */   sra       $v0, $v0, 16
.size G2AnimKeylist_GetDuration, . - G2AnimKeylist_GetDuration
