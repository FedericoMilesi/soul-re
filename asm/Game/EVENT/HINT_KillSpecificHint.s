.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HINT_KillSpecificHint
/* 51604 80060E04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51608 80060E08 00240400 */  sll        $a0, $a0, 16
/* 5160C 80060E0C 1ACF8287 */  lh         $v0, %gp_rel(gHintSystem + 0x2)($gp)
/* 51610 80060E10 03240400 */  sra        $a0, $a0, 16
/* 51614 80060E14 03004414 */  bne        $v0, $a0, .L80060E24
/* 51618 80060E18 1000BFAF */   sw        $ra, 0x10($sp)
/* 5161C 80060E1C 6883010C */  jal        HINT_StopHint
/* 51620 80060E20 00000000 */   nop
.L80060E24:
/* 51624 80060E24 1000BF8F */  lw         $ra, 0x10($sp)
/* 51628 80060E28 00000000 */  nop
/* 5162C 80060E2C 0800E003 */  jr         $ra
/* 51630 80060E30 1800BD27 */   addiu     $sp, $sp, 0x18
.size HINT_KillSpecificHint, . - HINT_KillSpecificHint
