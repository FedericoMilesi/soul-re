.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel handle_line_type_action_with_line
/* 41A4 800139A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 41A8 800139A8 1000BFAF */  sw         $ra, 0x10($sp)
/* 41AC 800139AC 4C00838C */  lw         $v1, 0x4C($a0)
/* 41B0 800139B0 00000000 */  nop
/* 41B4 800139B4 80006230 */  andi       $v0, $v1, 0x80
/* 41B8 800139B8 08004014 */  bnez       $v0, .L800139DC
/* 41BC 800139BC 02000624 */   addiu     $a2, $zero, 0x2
/* 41C0 800139C0 04006230 */  andi       $v0, $v1, 0x4
/* 41C4 800139C4 05004014 */  bnez       $v0, .L800139DC
/* 41C8 800139C8 03000624 */   addiu     $a2, $zero, 0x3
/* 41CC 800139CC 08006230 */  andi       $v0, $v1, 0x8
/* 41D0 800139D0 02004010 */  beqz       $v0, .L800139DC
/* 41D4 800139D4 01000624 */   addiu     $a2, $zero, 0x1
/* 41D8 800139D8 04000624 */  addiu      $a2, $zero, 0x4
.L800139DC:
/* 41DC 800139DC 01000224 */  addiu      $v0, $zero, 0x1
/* 41E0 800139E0 0500C210 */  beq        $a2, $v0, .L800139F8
/* 41E4 800139E4 00000000 */   nop
/* 41E8 800139E8 1000A28C */  lw         $v0, 0x10($a1)
/* 41EC 800139EC 00000000 */  nop
/* 41F0 800139F0 09F84000 */  jalr       $v0
/* 41F4 800139F4 00000000 */   nop
.L800139F8:
/* 41F8 800139F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 41FC 800139FC 00000000 */  nop
/* 4200 80013A00 0800E003 */  jr         $ra
/* 4204 80013A04 1800BD27 */   addiu     $sp, $sp, 0x18
.size handle_line_type_action_with_line, . - handle_line_type_action_with_line
