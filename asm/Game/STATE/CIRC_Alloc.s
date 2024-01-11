.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CIRC_Alloc
/* 615B4 80070DB4 03008424 */  addiu      $a0, $a0, 0x3
/* 615B8 80070DB8 FCFF0224 */  addiu      $v0, $zero, -0x4
/* 615BC 80070DBC D4A4838F */  lw         $v1, %gp_rel(circWhere)($gp)
/* 615C0 80070DC0 24208200 */  and        $a0, $a0, $v0
/* 615C4 80070DC4 48E28627 */  addiu      $a2, $gp, %gp_rel(vramBlockList)
/* 615C8 80070DC8 21286400 */  addu       $a1, $v1, $a0
/* 615CC 80070DCC 2B10C500 */  sltu       $v0, $a2, $a1
/* 615D0 80070DD0 06004010 */  beqz       $v0, .L80070DEC
/* 615D4 80070DD4 21106000 */   addu      $v0, $v1, $zero
/* 615D8 80070DD8 00F0C324 */  addiu      $v1, $a2, -0x1000
/* 615DC 80070DDC 21108300 */  addu       $v0, $a0, $v1
/* 615E0 80070DE0 D4A482AF */  sw         $v0, %gp_rel(circWhere)($gp)
/* 615E4 80070DE4 0800E003 */  jr         $ra
/* 615E8 80070DE8 21106000 */   addu      $v0, $v1, $zero
.L80070DEC:
/* 615EC 80070DEC D4A485AF */  sw         $a1, %gp_rel(circWhere)($gp)
/* 615F0 80070DF0 0800E003 */  jr         $ra
/* 615F4 80070DF4 00000000 */   nop
.size CIRC_Alloc, . - CIRC_Alloc
