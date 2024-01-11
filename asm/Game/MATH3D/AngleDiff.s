.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AngleDiff
/* 2A9F8 8003A1F8 2320A400 */  subu       $a0, $a1, $a0
/* 2A9FC 8003A1FC FF0F8430 */  andi       $a0, $a0, 0xFFF
/* 2AA00 8003A200 01088228 */  slti       $v0, $a0, 0x801
/* 2AA04 8003A204 02004014 */  bnez       $v0, .L8003A210
/* 2AA08 8003A208 21188000 */   addu      $v1, $a0, $zero
/* 2AA0C 8003A20C 00F08334 */  ori        $v1, $a0, 0xF000
.L8003A210:
/* 2AA10 8003A210 00140300 */  sll        $v0, $v1, 16
/* 2AA14 8003A214 0800E003 */  jr         $ra
/* 2AA18 8003A218 03140200 */   sra       $v0, $v0, 16
.size AngleDiff, . - AngleDiff
