.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel handle_line_type_menu
/* 4208 80013A08 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 420C 80013A0C 1400BFAF */  sw         $ra, 0x14($sp)
/* 4210 80013A10 1000B0AF */  sw         $s0, 0x10($sp)
/* 4214 80013A14 4C00828C */  lw         $v0, 0x4C($a0)
/* 4218 80013A18 00000000 */  nop
/* 421C 80013A1C 80004230 */  andi       $v0, $v0, 0x80
/* 4220 80013A20 15004010 */  beqz       $v0, .L80013A78
/* 4224 80013A24 2180A000 */   addu      $s0, $a1, $zero
/* 4228 80013A28 1400028E */  lw         $v0, 0x14($s0)
/* 422C 80013A2C 00000000 */  nop
/* 4230 80013A30 03004010 */  beqz       $v0, .L80013A40
/* 4234 80013A34 00000000 */   nop
/* 4238 80013A38 09F84000 */  jalr       $v0
/* 423C 80013A3C 00000000 */   nop
.L80013A40:
/* 4240 80013A40 BF4D000C */  jal        get_last_menu_line
/* 4244 80013A44 21200002 */   addu      $a0, $s0, $zero
/* 4248 80013A48 108A838F */  lw         $v1, %gp_rel(debugMenuChoice)($gp)
/* 424C 80013A4C 00000000 */  nop
/* 4250 80013A50 040043AC */  sw         $v1, 0x4($v0)
/* 4254 80013A54 0C8A828F */  lw         $v0, %gp_rel(currentMenu)($gp)
/* 4258 80013A58 1000048E */  lw         $a0, 0x10($s0)
/* 425C 80013A5C B08B82AF */  sw         $v0, %gp_rel(the_previous_menu)($gp)
/* 4260 80013A60 0C8A84AF */  sw         $a0, %gp_rel(currentMenu)($gp)
/* 4264 80013A64 BF4D000C */  jal        get_last_menu_line
/* 4268 80013A68 00000000 */   nop
/* 426C 80013A6C 0400428C */  lw         $v0, 0x4($v0)
/* 4270 80013A70 00000000 */  nop
/* 4274 80013A74 108A82AF */  sw         $v0, %gp_rel(debugMenuChoice)($gp)
.L80013A78:
/* 4278 80013A78 1400BF8F */  lw         $ra, 0x14($sp)
/* 427C 80013A7C 1000B08F */  lw         $s0, 0x10($sp)
/* 4280 80013A80 0800E003 */  jr         $ra
/* 4284 80013A84 1800BD27 */   addiu     $sp, $sp, 0x18
.size handle_line_type_menu, . - handle_line_type_menu
