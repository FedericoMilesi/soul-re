.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ResetAllOneTimeVariables
/* 51468 80060C68 6CA4828F */  lw         $v0, %gp_rel(NumSignalsToReset)($gp)
/* 5146C 80060C6C 00000000 */  nop
/* 51470 80060C70 15004010 */  beqz       $v0, .L80060CC8
/* 51474 80060C74 21300000 */   addu      $a2, $zero, $zero
/* 51478 80060C78 FEFF0724 */  addiu      $a3, $zero, -0x2
/* 5147C 80060C7C 90CE8527 */  addiu      $a1, $gp, %gp_rel(ResetSignalArray)
.L80060C80:
/* 51480 80060C80 0400A28C */  lw         $v0, 0x4($a1)
/* 51484 80060C84 00000000 */  nop
/* 51488 80060C88 0B004018 */  blez       $v0, .L80060CB8
/* 5148C 80060C8C FFFF4224 */   addiu     $v0, $v0, -0x1
/* 51490 80060C90 09004014 */  bnez       $v0, .L80060CB8
/* 51494 80060C94 0400A2AC */   sw        $v0, 0x4($a1)
/* 51498 80060C98 0000A28C */  lw         $v0, 0x0($a1)
/* 5149C 80060C9C 6CA4838F */  lw         $v1, %gp_rel(NumSignalsToReset)($gp)
/* 514A0 80060CA0 06004494 */  lhu        $a0, 0x6($v0)
/* 514A4 80060CA4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 514A8 80060CA8 6CA483AF */  sw         $v1, %gp_rel(NumSignalsToReset)($gp)
/* 514AC 80060CAC 24208700 */  and        $a0, $a0, $a3
/* 514B0 80060CB0 060044A4 */  sh         $a0, 0x6($v0)
/* 514B4 80060CB4 0400A0AC */  sw         $zero, 0x4($a1)
.L80060CB8:
/* 514B8 80060CB8 0100C624 */  addiu      $a2, $a2, 0x1
/* 514BC 80060CBC 1000C228 */  slti       $v0, $a2, 0x10
/* 514C0 80060CC0 EFFF4014 */  bnez       $v0, .L80060C80
/* 514C4 80060CC4 0800A524 */   addiu     $a1, $a1, 0x8
.L80060CC8:
/* 514C8 80060CC8 0800E003 */  jr         $ra
/* 514CC 80060CCC 00000000 */   nop
.size EVENT_ResetAllOneTimeVariables, . - EVENT_ResetAllOneTimeVariables
