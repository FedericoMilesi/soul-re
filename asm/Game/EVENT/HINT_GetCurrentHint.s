.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HINT_GetCurrentHint
/* 51634 80060E34 18CF8297 */  lhu        $v0, %gp_rel(gHintSystem)($gp)
/* 51638 80060E38 00000000 */  nop
/* 5163C 80060E3C 01004230 */  andi       $v0, $v0, 0x1
/* 51640 80060E40 02004010 */  beqz       $v0, .L80060E4C
/* 51644 80060E44 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 51648 80060E48 1ACF8287 */  lh         $v0, %gp_rel(gHintSystem + 0x2)($gp)
.L80060E4C:
/* 5164C 80060E4C 0800E003 */  jr         $ra
/* 51650 80060E50 00000000 */   nop
.size HINT_GetCurrentHint, . - HINT_GetCurrentHint
