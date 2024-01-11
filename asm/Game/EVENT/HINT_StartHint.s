.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HINT_StartHint
/* 51554 80060D54 00140400 */  sll        $v0, $a0, 16
/* 51558 80060D58 03140200 */  sra        $v0, $v0, 16
/* 5155C 80060D5C 37004524 */  addiu      $a1, $v0, 0x37
/* 51560 80060D60 03000324 */  addiu      $v1, $zero, 0x3
/* 51564 80060D64 3600422C */  sltiu      $v0, $v0, 0x36
/* 51568 80060D68 18CF83A7 */  sh         $v1, %gp_rel(gHintSystem)($gp)
/* 5156C 80060D6C 1ACF84A7 */  sh         $a0, %gp_rel(gHintSystem + 0x2)($gp)
/* 51570 80060D70 02004014 */  bnez       $v0, .L80060D7C
/* 51574 80060D74 00000000 */   nop
/* 51578 80060D78 6C000524 */  addiu      $a1, $zero, 0x6C
.L80060D7C:
/* 5157C 80060D7C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 51580 80060D80 00F00334 */  ori        $v1, $zero, 0xF000
/* 51584 80060D84 1CCF85A7 */  sh         $a1, %gp_rel(gHintSystem + 0x4)($gp)
/* 51588 80060D88 20CF83AF */  sw         $v1, %gp_rel(gHintSystem + 0x8)($gp)
/* 5158C 80060D8C 3800428C */  lw         $v0, 0x38($v0)
/* 51590 80060D90 00000000 */  nop
/* 51594 80060D94 24CF82AF */  sw         $v0, %gp_rel(gHintSystem + 0xC)($gp)
/* 51598 80060D98 0800E003 */  jr         $ra
/* 5159C 80060D9C 00000000 */   nop
.size HINT_StartHint, . - HINT_StartHint
