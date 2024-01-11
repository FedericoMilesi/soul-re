.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_IdleEntry
/* 6DD60 8007D560 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6DD64 8007D564 1400BFAF */  sw         $ra, 0x14($sp)
/* 6DD68 8007D568 1000B0AF */  sw         $s0, 0x10($sp)
/* 6DD6C 8007D56C 6C01908C */  lw         $s0, 0x16C($a0)
/* 6DD70 8007D570 AF28020C */  jal        MON_IdleEntry
/* 6DD74 8007D574 00000000 */   nop
/* 6DD78 8007D578 0400028E */  lw         $v0, 0x4($s0)
/* 6DD7C 8007D57C FDFF0324 */  addiu      $v1, $zero, -0x3
/* 6DD80 8007D580 24104300 */  and        $v0, $v0, $v1
/* 6DD84 8007D584 FBFF0324 */  addiu      $v1, $zero, -0x5
/* 6DD88 8007D588 24104300 */  and        $v0, $v0, $v1
/* 6DD8C 8007D58C FEFF0324 */  addiu      $v1, $zero, -0x2
/* 6DD90 8007D590 24104300 */  and        $v0, $v0, $v1
/* 6DD94 8007D594 040002AE */  sw         $v0, 0x4($s0)
/* 6DD98 8007D598 1400BF8F */  lw         $ra, 0x14($sp)
/* 6DD9C 8007D59C 1000B08F */  lw         $s0, 0x10($sp)
/* 6DDA0 8007D5A0 0800E003 */  jr         $ra
/* 6DDA4 8007D5A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size HUMAN_IdleEntry, . - HUMAN_IdleEntry
