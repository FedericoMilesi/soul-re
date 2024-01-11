.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_GetMatrices
/* 21A04 80031204 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 21A08 80031208 40210400 */  sll        $a0, $a0, 5
/* 21A0C 8003120C 0400658C */  lw         $a1, 0x4($v1)
/* 21A10 80031210 0800628C */  lw         $v0, 0x8($v1)
/* 21A14 80031214 2120A400 */  addu       $a0, $a1, $a0
/* 21A18 80031218 2B108200 */  sltu       $v0, $a0, $v0
/* 21A1C 8003121C 04004010 */  beqz       $v0, .L80031230
/* 21A20 80031220 21100000 */   addu      $v0, $zero, $zero
/* 21A24 80031224 040064AC */  sw         $a0, 0x4($v1)
/* 21A28 80031228 0800E003 */  jr         $ra
/* 21A2C 8003122C 2110A000 */   addu      $v0, $a1, $zero
.L80031230:
/* 21A30 80031230 0800E003 */  jr         $ra
/* 21A34 80031234 00000000 */   nop
.size GAMELOOP_GetMatrices, . - GAMELOOP_GetMatrices
