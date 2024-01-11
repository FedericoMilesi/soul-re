.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel handle_line_type_action
/* 4168 80013968 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 416C 8001396C 1000BFAF */  sw         $ra, 0x10($sp)
/* 4170 80013970 4C00828C */  lw         $v0, 0x4C($a0)
/* 4174 80013974 00000000 */  nop
/* 4178 80013978 80004230 */  andi       $v0, $v0, 0x80
/* 417C 8001397C 05004010 */  beqz       $v0, .L80013994
/* 4180 80013980 00000000 */   nop
/* 4184 80013984 1000A28C */  lw         $v0, 0x10($a1)
/* 4188 80013988 00000000 */  nop
/* 418C 8001398C 09F84000 */  jalr       $v0
/* 4190 80013990 00000000 */   nop
.L80013994:
/* 4194 80013994 1000BF8F */  lw         $ra, 0x10($sp)
/* 4198 80013998 00000000 */  nop
/* 419C 8001399C 0800E003 */  jr         $ra
/* 41A0 800139A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size handle_line_type_action, . - handle_line_type_action
