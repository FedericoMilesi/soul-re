.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddSignalToReset
/* 514D0 80060CD0 6CA4828F */  lw         $v0, %gp_rel(NumSignalsToReset)($gp)
/* 514D4 80060CD4 00000000 */  nop
/* 514D8 80060CD8 10004228 */  slti       $v0, $v0, 0x10
/* 514DC 80060CDC 0C004010 */  beqz       $v0, .L80060D10
/* 514E0 80060CE0 21280000 */   addu      $a1, $zero, $zero
/* 514E4 80060CE4 01000624 */  addiu      $a2, $zero, 0x1
/* 514E8 80060CE8 90CE8327 */  addiu      $v1, $gp, %gp_rel(ResetSignalArray)
.L80060CEC:
/* 514EC 80060CEC 0400628C */  lw         $v0, 0x4($v1)
/* 514F0 80060CF0 00000000 */  nop
/* 514F4 80060CF4 08004014 */  bnez       $v0, .L80060D18
/* 514F8 80060CF8 0100A524 */   addiu     $a1, $a1, 0x1
/* 514FC 80060CFC 6CA4828F */  lw         $v0, %gp_rel(NumSignalsToReset)($gp)
/* 51500 80060D00 040066AC */  sw         $a2, 0x4($v1)
/* 51504 80060D04 000064AC */  sw         $a0, 0x0($v1)
/* 51508 80060D08 01004224 */  addiu      $v0, $v0, 0x1
/* 5150C 80060D0C 6CA482AF */  sw         $v0, %gp_rel(NumSignalsToReset)($gp)
.L80060D10:
/* 51510 80060D10 0800E003 */  jr         $ra
/* 51514 80060D14 00000000 */   nop
.L80060D18:
/* 51518 80060D18 1000A228 */  slti       $v0, $a1, 0x10
/* 5151C 80060D1C F3FF4014 */  bnez       $v0, .L80060CEC
/* 51520 80060D20 08006324 */   addiu     $v1, $v1, 0x8
/* 51524 80060D24 0800E003 */  jr         $ra
/* 51528 80060D28 00000000 */   nop
.size EVENT_AddSignalToReset, . - EVENT_AddSignalToReset
