.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckSlope
/* 5EED8 8006E6D8 2310A600 */  subu       $v0, $a1, $a2
/* 5EEDC 8006E6DC 2A104400 */  slt        $v0, $v0, $a0
/* 5EEE0 8006E6E0 03004010 */  beqz       $v0, .L8006E6F0
/* 5EEE4 8006E6E4 21180000 */   addu      $v1, $zero, $zero
/* 5EEE8 8006E6E8 2110A600 */  addu       $v0, $a1, $a2
/* 5EEEC 8006E6EC 2A188200 */  slt        $v1, $a0, $v0
.L8006E6F0:
/* 5EEF0 8006E6F0 0800E003 */  jr         $ra
/* 5EEF4 8006E6F4 21106000 */   addu      $v0, $v1, $zero
.size CheckSlope, . - CheckSlope
