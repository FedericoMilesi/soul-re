.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_AttackEntry
/* 7DE98 8008D698 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7DE9C 8008D69C 1400BFAF */  sw         $ra, 0x14($sp)
/* 7DEA0 8008D6A0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7DEA4 8008D6A4 6C01908C */  lw         $s0, 0x16C($a0)
/* 7DEA8 8008D6A8 00000000 */  nop
/* 7DEAC 8008D6AC C400028E */  lw         $v0, 0xC4($s0)
/* 7DEB0 8008D6B0 00000000 */  nop
/* 7DEB4 8008D6B4 16004294 */  lhu        $v0, 0x16($v0)
/* 7DEB8 8008D6B8 00000000 */  nop
/* 7DEBC 8008D6BC 08004230 */  andi       $v0, $v0, 0x8
/* 7DEC0 8008D6C0 08004010 */  beqz       $v0, .L8008D6E4
/* 7DEC4 8008D6C4 1E000524 */   addiu     $a1, $zero, 0x1E
/* 7DEC8 8008D6C8 B6FF010C */  jal        MON_PlayAnim
/* 7DECC 8008D6CC 01000624 */   addiu     $a2, $zero, 0x1
/* 7DED0 8008D6D0 0400028E */  lw         $v0, 0x4($s0)
/* 7DED4 8008D6D4 00000000 */  nop
/* 7DED8 8008D6D8 04004234 */  ori        $v0, $v0, 0x4
/* 7DEDC 8008D6DC BB350208 */  j          .L8008D6EC
/* 7DEE0 8008D6E0 040002AE */   sw        $v0, 0x4($s0)
.L8008D6E4:
/* 7DEE4 8008D6E4 EE26020C */  jal        MON_AttackEntry
/* 7DEE8 8008D6E8 00000000 */   nop
.L8008D6EC:
/* 7DEEC 8008D6EC 1400BF8F */  lw         $ra, 0x14($sp)
/* 7DEF0 8008D6F0 1000B08F */  lw         $s0, 0x10($sp)
/* 7DEF4 8008D6F4 0800E003 */  jr         $ra
/* 7DEF8 8008D6F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SLUAGH_AttackEntry, . - SLUAGH_AttackEntry
