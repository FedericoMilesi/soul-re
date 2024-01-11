.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimAlphaTable_GetValue
/* 8566C 80094E6C 21308000 */  addu       $a2, $a0, $zero
/* 85670 80094E70 1500C010 */  beqz       $a2, .L80094EC8
/* 85674 80094E74 2110A000 */   addu      $v0, $a1, $zero
/* 85678 80094E78 0000C494 */  lhu        $a0, 0x0($a2)
/* 8567C 80094E7C 00000000 */  nop
/* 85680 80094E80 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 85684 80094E84 18008200 */  mult       $a0, $v0
/* 85688 80094E88 12200000 */  mflo       $a0
/* 8568C 80094E8C 031B0400 */  sra        $v1, $a0, 12
/* 85690 80094E90 80100300 */  sll        $v0, $v1, 2
/* 85694 80094E94 2110C200 */  addu       $v0, $a2, $v0
/* 85698 80094E98 01006324 */  addiu      $v1, $v1, 0x1
/* 8569C 80094E9C 80180300 */  sll        $v1, $v1, 2
/* 856A0 80094EA0 2118C300 */  addu       $v1, $a2, $v1
/* 856A4 80094EA4 0400458C */  lw         $a1, 0x4($v0)
/* 856A8 80094EA8 0400628C */  lw         $v0, 0x4($v1)
/* 856AC 80094EAC FF0F8430 */  andi       $a0, $a0, 0xFFF
/* 856B0 80094EB0 23104500 */  subu       $v0, $v0, $a1
/* 856B4 80094EB4 18004400 */  mult       $v0, $a0
/* 856B8 80094EB8 12180000 */  mflo       $v1
/* 856BC 80094EBC 03130300 */  sra        $v0, $v1, 12
/* 856C0 80094EC0 0800E003 */  jr         $ra
/* 856C4 80094EC4 2110A200 */   addu      $v0, $a1, $v0
.L80094EC8:
/* 856C8 80094EC8 0800E003 */  jr         $ra
/* 856CC 80094ECC 00000000 */   nop
.size _G2AnimAlphaTable_GetValue, . - _G2AnimAlphaTable_GetValue
