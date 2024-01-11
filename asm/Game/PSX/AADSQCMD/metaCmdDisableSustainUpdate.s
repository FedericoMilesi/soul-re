.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdDisableSustainUpdate
/* 46B00 80056300 01000324 */  addiu      $v1, $zero, 0x1
/* 46B04 80056304 3D05A290 */  lbu        $v0, 0x53D($a1)
/* 46B08 80056308 3805A48C */  lw         $a0, 0x538($a1)
/* 46B0C 8005630C 04184300 */  sllv       $v1, $v1, $v0
/* 46B10 80056310 4C058294 */  lhu        $v0, 0x54C($a0)
/* 46B14 80056314 27180300 */  nor        $v1, $zero, $v1
/* 46B18 80056318 24104300 */  and        $v0, $v0, $v1
/* 46B1C 8005631C 0800E003 */  jr         $ra
/* 46B20 80056320 4C0582A4 */   sh        $v0, 0x54C($a0)
.size metaCmdDisableSustainUpdate, . - metaCmdDisableSustainUpdate
