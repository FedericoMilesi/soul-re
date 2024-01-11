.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Adjust_tilt
/* 75F8 80016DF8 03000224 */  addiu      $v0, $zero, 0x3
/* 75FC 80016DFC F80082A4 */  sh         $v0, 0xF8($a0)
/* 7600 80016E00 C4018284 */  lh         $v0, 0x1C4($a0)
/* 7604 80016E04 FF0FA530 */  andi       $a1, $a1, 0xFFF
/* 7608 80016E08 08004014 */  bnez       $v0, .L80016E2C
/* 760C 80016E0C 000485A4 */   sh        $a1, 0x400($a0)
/* 7610 80016E10 2110A000 */  addu       $v0, $a1, $zero
/* 7614 80016E14 FE0080A4 */  sh         $zero, 0xFE($a0)
/* 7618 80016E18 B20182A4 */  sh         $v0, 0x1B2($a0)
/* 761C 80016E1C A00182A4 */  sh         $v0, 0x1A0($a0)
/* 7620 80016E20 3C0182A4 */  sh         $v0, 0x13C($a0)
/* 7624 80016E24 BA0182A4 */  sh         $v0, 0x1BA($a0)
/* 7628 80016E28 B20482A4 */  sh         $v0, 0x4B2($a0)
.L80016E2C:
/* 762C 80016E2C 0800E003 */  jr         $ra
/* 7630 80016E30 00000000 */   nop
.size CAMERA_Adjust_tilt, . - CAMERA_Adjust_tilt
