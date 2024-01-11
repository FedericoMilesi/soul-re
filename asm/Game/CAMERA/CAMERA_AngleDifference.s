.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_AngleDifference
/* 6EF0 800166F0 FF0F8430 */  andi       $a0, $a0, 0xFFF
/* 6EF4 800166F4 21408000 */  addu       $t0, $a0, $zero
/* 6EF8 800166F8 FF0FA530 */  andi       $a1, $a1, 0xFFF
/* 6EFC 800166FC 2130A000 */  addu       $a2, $a1, $zero
/* 6F00 80016700 21188000 */  addu       $v1, $a0, $zero
/* 6F04 80016704 2310C300 */  subu       $v0, $a2, $v1
/* 6F08 80016708 01084228 */  slti       $v0, $v0, 0x801
/* 6F0C 8001670C 03004014 */  bnez       $v0, .L8001671C
/* 6F10 80016710 2138A000 */   addu      $a3, $a1, $zero
/* 6F14 80016714 CC590008 */  j          .L80016730
/* 6F18 80016718 00108834 */   ori       $t0, $a0, 0x1000
.L8001671C:
/* 6F1C 8001671C 23106600 */  subu       $v0, $v1, $a2
/* 6F20 80016720 01084228 */  slti       $v0, $v0, 0x801
/* 6F24 80016724 03004014 */  bnez       $v0, .L80016734
/* 6F28 80016728 2118E000 */   addu      $v1, $a3, $zero
/* 6F2C 8001672C 0010A734 */  ori        $a3, $a1, 0x1000
.L80016730:
/* 6F30 80016730 2118E000 */  addu       $v1, $a3, $zero
.L80016734:
/* 6F34 80016734 21306000 */  addu       $a2, $v1, $zero
/* 6F38 80016738 21280001 */  addu       $a1, $t0, $zero
/* 6F3C 8001673C 2A10C500 */  slt        $v0, $a2, $a1
/* 6F40 80016740 02004010 */  beqz       $v0, .L8001674C
/* 6F44 80016744 2A10A600 */   slt       $v0, $a1, $a2
/* 6F48 80016748 21180001 */  addu       $v1, $t0, $zero
.L8001674C:
/* 6F4C 8001674C 02004010 */  beqz       $v0, .L80016758
/* 6F50 80016750 2120E000 */   addu      $a0, $a3, $zero
/* 6F54 80016754 21200001 */  addu       $a0, $t0, $zero
.L80016758:
/* 6F58 80016758 23106400 */  subu       $v0, $v1, $a0
/* 6F5C 8001675C 00140200 */  sll        $v0, $v0, 16
/* 6F60 80016760 0800E003 */  jr         $ra
/* 6F64 80016764 03140200 */   sra       $v0, $v0, 16
.size CAMERA_AngleDifference, . - CAMERA_AngleDifference
