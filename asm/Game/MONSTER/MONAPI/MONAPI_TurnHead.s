.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_TurnHead
/* 6FA50 8007F250 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FA54 8007F254 1000BFAF */  sw         $ra, 0x10($sp)
/* 6FA58 8007F258 0000A384 */  lh         $v1, 0x0($a1)
/* 6FA5C 8007F25C 00000000 */  nop
/* 6FA60 8007F260 00FD6228 */  slti       $v0, $v1, -0x300
/* 6FA64 8007F264 04004014 */  bnez       $v0, .L8007F278
/* 6FA68 8007F268 00FD0224 */   addiu     $v0, $zero, -0x300
/* 6FA6C 8007F26C 01026228 */  slti       $v0, $v1, 0x201
/* 6FA70 8007F270 02004014 */  bnez       $v0, .L8007F27C
/* 6FA74 8007F274 00020224 */   addiu     $v0, $zero, 0x200
.L8007F278:
/* 6FA78 8007F278 0000A2A4 */  sh         $v0, 0x0($a1)
.L8007F27C:
/* 6FA7C 8007F27C 0000C384 */  lh         $v1, 0x0($a2)
/* 6FA80 8007F280 00000000 */  nop
/* 6FA84 8007F284 01046228 */  slti       $v0, $v1, 0x401
/* 6FA88 8007F288 03004014 */  bnez       $v0, .L8007F298
/* 6FA8C 8007F28C 00FC6228 */   slti      $v0, $v1, -0x400
/* 6FA90 8007F290 A8FC0108 */  j          .L8007F2A0
/* 6FA94 8007F294 00040224 */   addiu     $v0, $zero, 0x400
.L8007F298:
/* 6FA98 8007F298 02004010 */  beqz       $v0, .L8007F2A4
/* 6FA9C 8007F29C 00FC0224 */   addiu     $v0, $zero, -0x400
.L8007F2A0:
/* 6FAA0 8007F2A0 0000C2A4 */  sh         $v0, 0x0($a2)
.L8007F2A4:
/* 6FAA4 8007F2A4 0000A594 */  lhu        $a1, 0x0($a1)
/* 6FAA8 8007F2A8 0000C684 */  lh         $a2, 0x0($a2)
/* 6FAAC 8007F2AC 23280500 */  negu       $a1, $a1
/* 6FAB0 8007F2B0 002C0500 */  sll        $a1, $a1, 16
/* 6FAB4 8007F2B4 EB09020C */  jal        MON_LookInDirection
/* 6FAB8 8007F2B8 032C0500 */   sra       $a1, $a1, 16
/* 6FABC 8007F2BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 6FAC0 8007F2C0 00000000 */  nop
/* 6FAC4 8007F2C4 0800E003 */  jr         $ra
/* 6FAC8 8007F2C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONAPI_TurnHead, . - MONAPI_TurnHead
