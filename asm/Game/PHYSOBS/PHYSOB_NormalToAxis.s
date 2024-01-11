.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_NormalToAxis
/* 613A4 80070BA4 00008384 */  lh         $v1, 0x0($a0)
/* 613A8 80070BA8 0000A684 */  lh         $a2, 0x0($a1)
/* 613AC 80070BAC 01046228 */  slti       $v0, $v1, 0x401
/* 613B0 80070BB0 04004014 */  bnez       $v0, .L80070BC4
/* 613B4 80070BB4 00FC6228 */   slti      $v0, $v1, -0x400
/* 613B8 80070BB8 01000224 */  addiu      $v0, $zero, 0x1
/* 613BC 80070BBC F6C20108 */  j          .L80070BD8
/* 613C0 80070BC0 000082A4 */   sh        $v0, 0x0($a0)
.L80070BC4:
/* 613C4 80070BC4 03004010 */  beqz       $v0, .L80070BD4
/* 613C8 80070BC8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 613CC 80070BCC F6C20108 */  j          .L80070BD8
/* 613D0 80070BD0 000082A4 */   sh        $v0, 0x0($a0)
.L80070BD4:
/* 613D4 80070BD4 000080A4 */  sh         $zero, 0x0($a0)
.L80070BD8:
/* 613D8 80070BD8 0104C228 */  slti       $v0, $a2, 0x401
/* 613DC 80070BDC 04004014 */  bnez       $v0, .L80070BF0
/* 613E0 80070BE0 00FCC228 */   slti      $v0, $a2, -0x400
/* 613E4 80070BE4 01000224 */  addiu      $v0, $zero, 0x1
/* 613E8 80070BE8 0800E003 */  jr         $ra
/* 613EC 80070BEC 0000A2A4 */   sh        $v0, 0x0($a1)
.L80070BF0:
/* 613F0 80070BF0 03004010 */  beqz       $v0, .L80070C00
/* 613F4 80070BF4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 613F8 80070BF8 0800E003 */  jr         $ra
/* 613FC 80070BFC 0000A2A4 */   sh        $v0, 0x0($a1)
.L80070C00:
/* 61400 80070C00 0800E003 */  jr         $ra
/* 61404 80070C04 0000A0A4 */   sh        $zero, 0x0($a1)
.size PHYSOB_NormalToAxis, . - PHYSOB_NormalToAxis
