.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_QueryEngagedInstance
/* 98404 800A7C04 01000224 */  addiu      $v0, $zero, 0x1
/* 98408 800A7C08 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 9840C 800A7C0C 04108200 */  sllv       $v0, $v0, $a0
/* 98410 800A7C10 24186200 */  and        $v1, $v1, $v0
/* 98414 800A7C14 03006014 */  bnez       $v1, .L800A7C24
/* 98418 800A7C18 C0100400 */   sll       $v0, $a0, 3
/* 9841C 800A7C1C 0800E003 */  jr         $ra
/* 98420 800A7C20 21100000 */   addu      $v0, $zero, $zero
.L800A7C24:
/* 98424 800A7C24 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 98428 800A7C28 00000000 */  nop
/* 9842C 800A7C2C 21104300 */  addu       $v0, $v0, $v1
/* 98430 800A7C30 0000428C */  lw         $v0, 0x0($v0)
/* 98434 800A7C34 0800E003 */  jr         $ra
/* 98438 800A7C38 00000000 */   nop
.size RAZIEL_QueryEngagedInstance, . - RAZIEL_QueryEngagedInstance
