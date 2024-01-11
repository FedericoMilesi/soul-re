.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoSignalAction
/* 545D4 80063DD4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 545D8 80063DD8 1800B0AF */  sw         $s0, 0x18($sp)
/* 545DC 80063DDC 21808000 */  addu       $s0, $a0, $zero
/* 545E0 80063DE0 01000224 */  addiu      $v0, $zero, 0x1
/* 545E4 80063DE4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 545E8 80063DE8 1400A2AF */  sw         $v0, 0x14($sp)
/* 545EC 80063DEC 0400028E */  lw         $v0, 0x4($s0)
/* 545F0 80063DF0 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 545F4 80063DF4 11004310 */  beq        $v0, $v1, .L80063E3C
/* 545F8 80063DF8 2120A000 */   addu      $a0, $a1, $zero
/* 545FC 80063DFC 1000A527 */  addiu      $a1, $sp, 0x10
/* 54600 80063E00 008E010C */  jal        EVENT_ParseOperand2
/* 54604 80063E04 1400A627 */   addiu     $a2, $sp, 0x14
/* 54608 80063E08 0400038E */  lw         $v1, 0x4($s0)
/* 5460C 80063E0C 1A000224 */  addiu      $v0, $zero, 0x1A
/* 54610 80063E10 0A006214 */  bne        $v1, $v0, .L80063E3C
/* 54614 80063E14 00000000 */   nop
/* 54618 80063E18 1400A28F */  lw         $v0, 0x14($sp)
/* 5461C 80063E1C 00000000 */  nop
/* 54620 80063E20 06004010 */  beqz       $v0, .L80063E3C
/* 54624 80063E24 21380000 */   addu      $a3, $zero, $zero
/* 54628 80063E28 0000028E */  lw         $v0, 0x0($s0)
/* 5462C 80063E2C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 54630 80063E30 0000468C */  lw         $a2, 0x0($v0)
/* 54634 80063E34 E378000C */  jal        COLLIDE_HandleSignal
/* 54638 80063E38 08004524 */   addiu     $a1, $v0, 0x8
.L80063E3C:
/* 5463C 80063E3C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 54640 80063E40 1800B08F */  lw         $s0, 0x18($sp)
/* 54644 80063E44 21100000 */  addu       $v0, $zero, $zero
/* 54648 80063E48 0800E003 */  jr         $ra
/* 5464C 80063E4C 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_DoSignalAction, . - EVENT_DoSignalAction
