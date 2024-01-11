.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_UpdateCheckSum
/* 27DC0 800375C0 B0BB838F */  lw         $v1, %gp_rel(loadStatus + 0x1C)($gp)
/* 27DC4 800375C4 01000224 */  addiu      $v0, $zero, 0x1
/* 27DC8 800375C8 0C006214 */  bne        $v1, $v0, .L800375FC
/* 27DCC 800375CC 21288000 */   addu      $a1, $a0, $zero
/* 27DD0 800375D0 0A00A010 */  beqz       $a1, .L800375FC
/* 27DD4 800375D4 FCFFA524 */   addiu     $a1, $a1, -0x4
.L800375D8:
/* 27DD8 800375D8 ECBB828F */  lw         $v0, %gp_rel(loadStatus + 0x58)($gp)
/* 27DDC 800375DC E8BB838F */  lw         $v1, %gp_rel(loadStatus + 0x54)($gp)
/* 27DE0 800375E0 0000448C */  lw         $a0, 0x0($v0)
/* 27DE4 800375E4 04004224 */  addiu      $v0, $v0, 0x4
/* 27DE8 800375E8 ECBB82AF */  sw         $v0, %gp_rel(loadStatus + 0x58)($gp)
/* 27DEC 800375EC 21186400 */  addu       $v1, $v1, $a0
/* 27DF0 800375F0 E8BB83AF */  sw         $v1, %gp_rel(loadStatus + 0x54)($gp)
/* 27DF4 800375F4 F8FFA014 */  bnez       $a1, .L800375D8
/* 27DF8 800375F8 FCFFA524 */   addiu     $a1, $a1, -0x4
.L800375FC:
/* 27DFC 800375FC 0800E003 */  jr         $ra
/* 27E00 80037600 00000000 */   nop
.size LOAD_UpdateCheckSum, . - LOAD_UpdateCheckSum
