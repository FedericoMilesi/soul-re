.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetDrawPage
/* 20B68 80030368 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 20B6C 8003036C A0BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 20B70 80030370 9CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 20B74 80030374 F8BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x30)($gp)
/* 20B78 80030378 1000BFAF */  sw         $ra, 0x10($sp)
/* 20B7C 8003037C A0BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x1D8)($gp)
/* 20B80 80030380 01000224 */  addiu      $v0, $zero, 0x1
/* 20B84 80030384 23104300 */  subu       $v0, $v0, $v1
/* 20B88 80030388 9CBF84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 20B8C 8003038C F8BD82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 20B90 80030390 DAE9020C */  jal        func_800BA768
/* 20B94 80030394 000C0524 */   addiu     $a1, $zero, 0xC00
/* 20B98 80030398 1000BF8F */  lw         $ra, 0x10($sp)
/* 20B9C 8003039C 00000000 */  nop
/* 20BA0 800303A0 0800E003 */  jr         $ra
/* 20BA4 800303A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size ResetDrawPage, . - ResetDrawPage
