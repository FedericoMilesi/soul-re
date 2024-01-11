.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetSpeedAdjustment
/* 80638 8008FE38 00008290 */  lbu        $v0, 0x0($a0)
/* 8063C 8008FE3C 00000000 */  nop
/* 80640 8008FE40 08004010 */  beqz       $v0, .L8008FE64
/* 80644 8008FE44 21180000 */   addu      $v1, $zero, $zero
/* 80648 8008FE48 21308000 */  addu       $a2, $a0, $zero
.L8008FE4C:
/* 8064C 8008FE4C 3400C5AC */  sw         $a1, 0x34($a2)
/* 80650 8008FE50 00008290 */  lbu        $v0, 0x0($a0)
/* 80654 8008FE54 01006324 */  addiu      $v1, $v1, 0x1
/* 80658 8008FE58 2A106200 */  slt        $v0, $v1, $v0
/* 8065C 8008FE5C FBFF4014 */  bnez       $v0, .L8008FE4C
/* 80660 8008FE60 3000C624 */   addiu     $a2, $a2, 0x30
.L8008FE64:
/* 80664 8008FE64 0800E003 */  jr         $ra
/* 80668 8008FE68 00000000 */   nop
.size G2Anim_SetSpeedAdjustment, . - G2Anim_SetSpeedAdjustment
