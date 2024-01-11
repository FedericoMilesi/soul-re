.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_GetSectionWithSeg
/* 83858 80093058 00008390 */  lbu        $v1, 0x0($a0)
/* 8385C 8009305C 24008624 */  addiu      $a2, $a0, 0x24
/* 83860 80093060 40100300 */  sll        $v0, $v1, 1
/* 83864 80093064 21104300 */  addu       $v0, $v0, $v1
/* 83868 80093068 00110200 */  sll        $v0, $v0, 4
/* 8386C 8009306C 24004224 */  addiu      $v0, $v0, 0x24
/* 83870 80093070 21208200 */  addu       $a0, $a0, $v0
/* 83874 80093074 2B10C400 */  sltu       $v0, $a2, $a0
/* 83878 80093078 10004010 */  beqz       $v0, .L800930BC
/* 8387C 8009307C 21380000 */   addu      $a3, $zero, $zero
.L80093080:
/* 83880 80093080 0200C390 */  lbu        $v1, 0x2($a2)
/* 83884 80093084 0300C290 */  lbu        $v0, 0x3($a2)
/* 83888 80093088 00000000 */  nop
/* 8388C 8009308C 21106200 */  addu       $v0, $v1, $v0
/* 83890 80093090 2A18A300 */  slt        $v1, $a1, $v1
/* 83894 80093094 05006014 */  bnez       $v1, .L800930AC
/* 83898 80093098 2A10A200 */   slt       $v0, $a1, $v0
/* 8389C 8009309C 03004010 */  beqz       $v0, .L800930AC
/* 838A0 800930A0 00000000 */   nop
/* 838A4 800930A4 2F4C0208 */  j          .L800930BC
/* 838A8 800930A8 2138C000 */   addu      $a3, $a2, $zero
.L800930AC:
/* 838AC 800930AC 3000C624 */  addiu      $a2, $a2, 0x30
/* 838B0 800930B0 2B10C400 */  sltu       $v0, $a2, $a0
/* 838B4 800930B4 F2FF4014 */  bnez       $v0, .L80093080
/* 838B8 800930B8 00000000 */   nop
.L800930BC:
/* 838BC 800930BC 0800E003 */  jr         $ra
/* 838C0 800930C0 2110E000 */   addu      $v0, $a3, $zero
.size G2Anim_GetSectionWithSeg, . - G2Anim_GetSectionWithSeg
